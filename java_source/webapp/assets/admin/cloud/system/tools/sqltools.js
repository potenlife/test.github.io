function sqltoolsexp(type) {
	$("#sqlexptype").val(type);
	var sql = $("#expsql").val();
	if(sql!="") {
		$("#frcs").attr('name', CLOUD.Contants.CSRF_PARA);
		$("#frcs").val(getCookie(CLOUD.Contants.CSRF_COOKIE));
		document.getElementById("expform").submit();
	}else{
		CLOUD.messager.alert("请输入SQL并正确执行");
	}
}


$(function() {
	var sqltools = {}; 
	sqltools.row = {};
	sqltools.url = {
		list:'tools/sqltools_findList.json',
		tables:'tools/sqltools_findTableList.json',
		sqllist:'tools/sqltools_findSqlList.json',
		sqlsharelist: 'tools/sqltools_findSqlList.json?t=1',
		add:'tools/sqltools_add.json',
		update:'tools/sqltools_update.json',
		del:'tools/sqltools_delete.json',
		updateSQL:'tools/sqltools_updateSQL.json',
		backup:'tools/sqltools_backup.json'
	};
	
	// 左菜单树
	$('#sql_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return sqltools.url.tables;
                },
                'data' : function (node) {
                  return { 'id' : node.id }; 
                }
            }
        },
        "plugins" : [ "state", "types" ]
    });
	
	function setTreeText(id) {
		var leng = id.length - 7;
		var name = id.substr(0, leng); //replace('_anchor', '');
		SQLContentEditor.insert(name);
	}
	// 初始事件，绑定双击赋值
	$('#sql_tree').on('loaded.jstree', function(e,data) { 
    	$(".jstree-anchor").on('dblclick', function(){
    		setTreeText(this.id);
    	}) ;
        return false;
    });
	// 打开事件，绑定双击赋值
	$("#sql_tree").on('open_node.jstree', function() {
		$(".jstree-anchor").on('dblclick', function(){
			setTreeText(this.id);
    	}) ;
	});
	
	// 新建
	$("#createSql").bind('click', function(){
		$("#sst_sqlId").val('');
		$("#sqltools_sql").val('');
		$("#expsql").val('');
		SQLContentEditor.clear();
		$("#sqlEditform").get(0).reset();
	});
	$("#openSqlList").bind('click', function(){
		$("#sqlSelectModal").modal('show'); 
	});
	// 备份
	$("#backupSql").bind('click', function(){
		CLOUD.messager.confirm('备份？','确认备份？', function(r) {
			if(r) {
				CLOUD.trackPost(sqltools.url.backup, '', function(data) {
					CLOUD.messager.alert("备份成功");
				});
			}
		});
	});
	// 恢复
	$("#exceuteScriptSql").bind('click', function(){
		
		$("#exceuteScriptSqlModal").modal('show');
	});
	$("#sqlfile_fb").bind('click', function(){
		CLOUD.UPLOAD.open('sqlfile', CLOUD.FILETYPE_FILE, '/WEB-INF/backup/sql');
	});
	var sf = new CLOUD.FileSelect('/WEB-INF/backup/sql', 'sqlfile');
	$("#sqlfile_select").bind('click', function(){
			sf.open();
	});
	
	$("#exceuteScriptSqlbtn").bind('click', function(){
		CLOUD.messager.confirm('恢复？','确认恢复？', function(r) {
			if(r) {
				var id = $("#sqlfile").val();
				CLOUD.trackPost(sqltools.url.recover, 'id=' + id, function(data) {
					CLOUD.messager.alert("恢复成功");
					$("#sqlfile").val('');
				});
			}
		});
	});
	
	// 初始SQL编辑器
	SQLContentEditor.initialize(DB_TYPE, "sqltools_sql");
	
	// 保存
	$("#saveSql").bind('click', function(){
		var sql = $("#expsql").val();
		if(sql!="") {
			$("#sst_sqlStr").val(sql);
			$("#sqlEditModal").modal('show');
		}else{
			CLOUD.messager.alert("请输入SQL并正确执行");
		}
	});
	
	CLOUD.Validate('sqlEditform', function(form){
		var id = $("#sst_sqlId").val();
		var _url = sqltools.url.add;
		if(id!='') {
			_url = sqltools.url.update;
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data) {
			// 新增后，再保存为修改。
			$("#sst_sqlId").val(data.data.sst_sqlId);
			$("#sqlEditModal").modal('hide');
			CLOUD.updateSuccessAlert(); 
		});
		return false;
    }, {
    	sst_sqlName : {
    		required : true
    	}
    });
	
	var tablerows = []; 
    var table = $('#trig-sql-table');
    var ttable = undefined;
    var ttableinit = false;
	// 执行SQL
	$("#excetueSql").bind('click',function(){
		var sql = SQLContentEditor.getContents();
		if(sql=="") {
			CLOUD.messager.alert("请输入SQL执行");
			return false;
		}
		if($.trim(sql).toUpperCase().StartWith('SELECT')) {
			tablerows = [];
			$.post(sqltools.url.list, 'rows=1&sql=' + sql, function(data){
				data = $.parseJSON(data);
				if(data.success==false) {// 失败
					CLOUD.successHandle(data);
					$("#expsql").val("");
				}else{
					// 表头
					var tableheader = "";
					// 表格字段
					var columnsdata = [];
					
					if(data.data.length>0) {
						var row = data.data[0];
						sqltools.row = row;
						var i=0;
						var k = 0;
						for(var key in row){
							//if(i<3) {
								tableheader += "<th>"+key+"</th>";
								if(i==0) { //第一列
									columnsdata.push({ data:key, "render": function(data, type, row, mete){ 
											k++;
										   tablerows["id" + k] = row; 
										   return '<span class="row-details row-details-close" dataid="id'+k+'"></span>' + data;
									}, "orderable" : false});
								} else {
									columnsdata.push({ data:key , "orderable" : false});
								}
							//}  
							i++;
						}
						// 设置表头
						$("#sql_header").html(tableheader);
						if(ttable) {
							ttable.getTable().fnDestroy();
							//ttable.getTable().fnDraw(); 
						} 
						// 生成数据列表
						ttable = new CLOUD.Datatable({
							table : table, 
							url : sqltools.url.list, 
							columns : columnsdata,
							queryParams: {sql: sql },
							trclick : false,
							tablesetting: {
								"ordering" : false
							}
						});
						if(ttableinit==false) {
							// 显示更多字段值
						    ttable.initMore(function(id) { 
						   	 	var rowData = tablerows[id];
						   	 	var sOut = '<table>';
						   	 	for(var key in sqltools.row){
						   	 		sOut += '<tr><td><div class="trig-more-content">'+ key +'：</div></td><td>' + eval('rowData["'+key+'"]') + '</td></tr>';
						   	 	}
						        sOut += '</table>';
						        return  sOut;
						    });
						    ttableinit = true;
						}
					} else {
						$("#sql_header").html('');
						if(ttable) {
							ttable.getTable().fnDestroy();
						} 
						$("#trig-sql-table tbody tr").remove();
						CLOUD.messager.alert("没有查找到数据");
					}
					$("#expsql").val(sql);
				}
			});
		} else {
			$.post(sqltools.url.updateSQL, 'sql=' + sql, function(data) {
				data = $.parseJSON(data);
				if(data.success==false) {// 失败
					CLOUD.successHandle(data);
					$("#expsql").val("");
				} else {
					$("#expsql").val(sql);
					CLOUD.messager.alert("更新行数：" + data.num);
				}
			});
		}
	});
	
	var sqltablerows = [];
	var pttable = new CLOUD.Datatable({
		table : $("#trig-pro-sql-table"), 
		url : sqltools.url.sqllist, 
		columns : [
		           { "data": null, "render": function(data, type, row, mete){ 
		        	   sqltablerows[row.sst_sqlId] = row;
		        	   	return '<input type="checkbox" class="checkboxes" value="'+row.sst_sqlId+'"/>';   
		           	}, orderable: false, className: "trig-checkbox"},
		            { "data": "sst_sqlName" },
		            { "data": "sst_sqlStr" },
		            { "data": "sst_createTime" }
		],
		order: [[3,'desc']], 
		filter : true
	});
	
	var sttable = new CLOUD.Datatable({
		table : $("#trig-share-sql-table"), 
		url : sqltools.url.sqlsharelist, 
		columns : [
		           { "data": null, "render": function(data, type, row, mete){ 
		        	   sqltablerows[row.sst_sqlId] = row;
		        	   	return '<input type="checkbox" class="checkboxes" value="'+row.sst_sqlId+'"/>';   
		           	}, orderable: false, className: "trig-checkbox"},
		            { "data": "sst_sqlName" },
		            { "data": "sst_sqlStr" },
		            { "data": "sst_createTime" }
		],
		order: [[3,'desc']], 
		filter : true
	});
	$("#sqlselectbtn").bind('click', function(){
		var index = $("#sqltabs .active a").attr("data-index");
		if(index=='0') {
			var ids = pttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				var rowdata = sqltablerows[ids.val()];
				$("#sqltools_sql").val(rowdata.sst_sqlStr);
				SQLContentEditor.setSQL(rowdata.sst_sqlStr);
				$("#expsql").val('');
				CLOUD.forminit($("#sqlEditform"), rowdata);
				$("#sqlSelectModal").modal('hide');
			}
		} else {
			var ids = sttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				var rowdata = sqltablerows[ids.val()];
				$("#sqltools_sql").val(rowdata.sst_sqlStr);
				SQLContentEditor.setSQL(rowdata.sst_sqlStr);
				$("#expsql").val('');
				CLOUD.forminit($("#sqlEditform"), rowdata);
				// 分享的不能修改
				$("#sst_sqlId").val('');
				$("#sqlSelectModal").modal('hide');
			}
		}
	});
	
	$("#deleteSqlTools").bind('click', function() {
		var objs = pttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sqltools.url.del, "ids=" + ids, function(data){
				pttable.reload();
			});
		});
	});
	
	function container(type) {
		var sql = $("#expsql").val();
		if(sql!="") {
			$.post(sqltools.url.list + "?sql=" + sql,'rows=0', function(data){
				data = $.parseJSON(data);
				if(data.data.length>0) {
					$("#sqlChartModal").modal('show');
					CLOUD.Chart('container', $("#sst_sqlName").val(), data, type);
				} else {
					CLOUD.messager.alert("没有数据");
				}
			});
		}else{
			CLOUD.messager.alert("请输入SQL并正确执行");
		}
	}
	
	$(".sqlcontainer").bind('click', function(){
		var type = $(this).attr('data-type');
		container(type);
	});
});

