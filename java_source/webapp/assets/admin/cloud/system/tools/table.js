$(function(){
	var sysTable = {};
	sysTable.url = {};
	sysTable.url.add = 'tools/table_add.json';
	sysTable.url.update = 'tools/table_update.json';
	sysTable.url.del = 'tools/table_delete.json';
	sysTable.url.dels = 'tools/table_deletes.json';
	sysTable.url.find = 'tools/table_findPageList.json';
	sysTable.url.updateJS = 'tools/table_updateJS.json';
	
	var tablerows = []; 
    var table = $('#trig-table-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysTable.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.st_tableId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.st_tableId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "st_tableName"},
    		                 { "data": "st_aliasName" },
    		                 { "data": "st_pageName" }, 
    		                 { "data": "st_createTime" }
    		],
    		order: [[4,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysTable")) { 
    	    		showUpdate();
    	    	}
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    // 查询
    $("#findSysTable").bind('click', function() {
    	ttable.query({ st_tableName : $("#systablename").val()}); 
	});
    
    // 高级查询
    CLOUD.search('sys_table', $("#findSysTable"), ttable);  
    
    // 新增浮层初始
    $("#addSysTable").bind('click', function(){
    	CLOUD.formreset($("#tableEditform"));
    	CLOUD.hidePrveNext();
    	$("#st_tableName").attr("readonly", false);
    	$("#tableEditModal").modal('show'); 
    });
    
    // 修改加载表单数据
    function showUpdate() {
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			CLOUD.showPrveNext(); 
			var id = ids.get(0).value;
			var data = tablerows[id];
			// 初始表单数据
			CLOUD.forminit($("#tableEditform"), data);
			$("#st_tableName").attr("readonly", true);
			$("#tableEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysTable").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    CLOUD.FormValidate("sys_table", "tableEditform",  function (form) {
		var _url = sysTable.url.add;
		var isadd = true;
		if($("#st_tableId").val()!='') {
			_url = sysTable.url.update; 
			isadd = false; 
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data){
			if(isadd == true) {
				CLOUD.formreset($("#tableEditform")); 
			}
			// 保存&关闭
			if(saveclose) {
				$("#tableEditModal").modal('hide'); 
			}
			CLOUD.updateSuccessAlert();
		});
		// 必须flase，阻止form submit
		return false;
	});
    
    $(".cloudsaveclose").bind('click', function(){
    	saveclose = true; 
    });
    
	// 编辑浮层关闭刷新列表数据
	$("#tableEditModal").on("hidden", function(){   
		ttable.reload();
		saveclose = false; 
	});
	
	// 生成JS
	$("#updateJS").bind('click', function(){
		CLOUD.progress();
		$.post(sysTable.url.updateJS,'', function(data){
			CLOUD.progressClose();
			data = CLOUD.successHandle(data);
			if(data.success==true) {
				CLOUD.messager.alert("生成成功");
			}
		});
	});
	
	// 删除
	$("#deleteSysTable").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysTable.url.del, "ids=" + ids, function(data){
				ttable.reload();
			});
		});
	});
	
	// 日志
	 $(".findSysLogs").bind('click', function(){
	    	var ids = ttable.getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	  }); 
	 
	 sysTable.column = {
				url : {
					find : 'tools/table_column_findPageList.json',
					add: 'tools/table_column_add.json',
					update: 'tools/table_column_update.json',
					addInit: 'tools/table_column_addInit.json',
					del: 'tools/table_column_delete.json'
				}
	 };
	 
	 // 表字段列表
	 var columntablerows = []; 
	 var columntable = $('#trig-table-column-table');
	 var valis = [];
	 $.getJSON(CLOUD.PATH+ '/dictionary_findByNoList.json?id=validator', '', function(data) {
		 for(var i=0;i<data.length;i++) {
			 valis.push({id:data[i].sd_dictionaryCode,text:data[i].sd_dictionaryName});
		 }
	 });
 	function getYesNo(value, name) {
		var yn = "<select name='" + name + "' class='form-control ' style='height:24px;padding:0px;'>";
		yn += "<option value='Y'" + (value=="Y"? " selected='selected'":"") + ">Y</option>";
		yn += "<option value='N'" + (value=="N"? " selected='selected'":"") + ">N</option>";
		yn += "</select>";
		return yn;
	}
	function editRow(id, nRow) {
		var jqTds = $('>td', nRow);
      	var rowData = columntablerows[id];
      	jqTds[3].innerHTML = '<input type="text" name="stc_pageName" class="form-control "  style="height:24px;padding:0px;" value="' + (rowData.stc_pageName?rowData.stc_pageName:'') + '">';
      	jqTds[5].innerHTML = getYesNo(rowData.stc_isPk, "stc_isPk");
      	jqTds[6].innerHTML =getYesNo(rowData.stc_isNull, "stc_isNull");
      	var vh = '<select name="stc_validator" class="form-control " style="height:24px;padding:0px;"><option value=""></option>';
      	for(var i=0;i<valis.length;i++) {
      		vh += "<option value='"+valis[i].id+"'" + (valis[i].id==rowData.stc_validator? " selected='selected'":"") + ">"+valis[i].text+"</option>";
      	}
      	vh += "</select>";	
      	jqTds[7].innerHTML = vh;
     	jqTds[8].innerHTML =getYesNo(rowData.stc_isUpdated, "stc_isUpdated");
      	jqTds[9].innerHTML = getYesNo(rowData.stc_isSearch, "stc_isSearch"); 
	}
		
	 // begin first table
	 var columnttable = undefined;
	 var tableid = '';
	 var tablename = '';
	 var updateids = [];
	 var udids = [];
	 var initb = false;
	 $("#findTableColumn").bind('click', function(){
		 var ids = ttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				initb = false;
				updateids = [];
				udids = [];
				tableid = ids.get(0).value;
				var rowData = tablerows[tableid];
				tablename = rowData.st_tableName;
				$("#tablename").text(tablename);
				 if(columnttable == undefined) {
					 columnttable = new CLOUD.Datatable({
					 		table : columntable, 
					 		url : sysTable.column.url.find, 
					 		columns : [
					 				   { "data": null, "render": function(data, type, row, mete){
					 					   columntablerows[row.stc_columnId] = row;
					 						return '<input type="checkbox" class="checkboxes" id="'+row.stc_columnId+'" value="'+row.stc_columnId+'"/>';   
					 				   }, orderable: false, className: "trig-checkbox" },
					 		                 { "data": "stc_columnName", orderable: false},
					 		                 { "data": "stc_aliasName" , orderable: false},
					 		                 { "data": "stc_pageName", orderable: false }, 
					 		                 { "data": "stc_columnType" , orderable: false},
					 		                 { "data": "stc_isPk", orderable: false },
					 		                 { "data": "stc_isNull" , orderable: false},
					 		                 { "data": "stc_validator", orderable: false},
					 		                 { "data": "stc_isUpdated", orderable: false },
					 		                 { "data": "stc_isSearch", orderable: false },
					 		                 { "data": "stc_createTime", orderable: false }
					 		],
					 		order: [[1,'asc']],
					 		queryParams: {
					 			stc_tableId:tableid
					 		},
					 		paging:false,
				    		dblclick : function() {   // 双击修改单行字段
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateSysTable")) { 
				    	    		var ids = columnttable.getCheckbox();   
				    	    		var id = ids.get(0).value;
				    	    		if(!updateids[id]) {
					    				var nRow = ids.parents('tr')[0];
					    				editRow(id, nRow);
					    				updateids[id] = id;
					    				udids.push(id);
				    	    		}
				    	    	}
				    		},
				    		init: function(data) {
				    			if(data.data.length>0) {
				    				initb = true;
				    			}else {
				    				initb = false;
				    			}
				    		}
					 });
				 } else {
					 columnttable.query({stc_tableId:tableid});
				 }
				 
				 $("#tableColumnEditModal").modal('show'); 
			}
	 });
	 
	 function addinit() {
		 CLOUD.trackPost(sysTable.column.url.addInit, "stc_tableId="+tableid +
				"&stc_tableName=" + tablename, function(data){
			columnttable.reload();
		});
	}
	 
	 // 初始加载
	 $("#addSysTableColumn").bind('click', function(){
			if(initb==true) {
				CLOUD.messager.confirm(CLOUD.TEXT.OTHER.RELOAD, CLOUD.TEXT.OTHER.COLUMN_EXIST_RELOAD, function(r){
					if(r) {
						addinit();
					}
				});
			} else {
				addinit();
			}
	 });
	 
	 // 加载未加载字段
	 $("#updateSysTableColumn").bind('click', function(){
		 CLOUD.trackPost(sysTable.column.url.add, "stc_tableId="+tableid +
					"&stc_tableName=" + tablename, function(data){
				columnttable.reload();
			});
	 }) ;
	 
	 // 字段修改保存
	 $("#columnsave").bind('click', function(){
		 $.each(udids, function(){
			var row = $("#" + this).parents('tr');
			var rowData = "stc_pageName=" + row.find("input[name='stc_pageName']").val();
			rowData += "&stc_isPk=" + row.find("select[name='stc_isPk']").val();
			rowData += "&stc_isNull=" + row.find("select[name='stc_isNull']").val();
			rowData += "&stc_validator=" + row.find("select[name='stc_validator']").val();
			rowData += "&stc_isUpdated=" + row.find("select[name='stc_isUpdated']").val();
			rowData += "&stc_isSearch=" + row.find("select[name='stc_isSearch']").val();
			rowData += "&stc_columnId=" + this;
			$.ajax({
				  type: 'POST',
				  url: sysTable.column.url.update,
				  data: rowData,
				  success:  function(data) {
						data = CLOUD.successHandle(data);
					},
					async: false
			});
			CLOUD.messager.alert('更新完成'); 
			columnttable.reload();
			updateids = [];
		 });
	 });
	 
	 // 删除字段
	 $("#deleteSysTableColumn").bind('click', function(){
		 var objs = columnttable.getCheckbox();
			var rows = objs.size();
			CLOUD.isDelSelectOne(rows,function(){
				var ids = "";
				objs.each(function(){
					ids += this.value + ",";
				});   
				CLOUD.trackPost(sysTable.column.url.del, "ids=" + ids, function(data){
					columnttable.reload();
				});
			});
	 });
    
	 // 刷新
	 $("#refreshSysTableColumn").bind('click', function(){
		 columnttable.reload();
	 });
});