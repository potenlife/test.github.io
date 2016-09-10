$(function(){
	var resource = {}; 
	resource.url = {
		tree:'tools/resource_tree.json',
		list:'tools/resource_findList.json',
		download:'tools/resource_download.json',
		upload:'tools/resource_upload.json',
		uploads:'tools/resource_uploadZip.json',
		uploadconfirm:'tools/resource_uploadconfirm.json',
		del:'tools/resource_delete.json',
		delAll:'tools/resource_deleteAll.json',
		create:'tools/resource_createDir.json',
		backup:'tools/resource_backup.json',
		copy:'tools/resource_copy.json'
	};
	
	// 复制文件，多个逗号隔开
	resource.copyids = "";
	// 复制文件夹ID
	resource.copydirid = "";
	// 复制类型，copy 复制 cut 剪切
	resource.copytype = "copy";
	
	var pid = "/"; 
	// 左菜单树
	$('#resource_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return resource.url.tree;
                },
                'data' : function (node) {
                  return { 'id' : node.id }; 
                }
            }
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "plugins" : [ "state", "types" ]
    });
	// 刷新树
	$("#resource_tree_reload").bind('click', function(){ 
    	$('#resource_tree').jstree('refresh_node', {id: '/'});   
    });
	
	var tablerows = []; 
    var table = $('#trig-resource-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : resource.url.list, 
		filter: true,
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.name] = row;
						return '<input type="checkbox" class="checkboxes" value="'+row.name+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "name", "render":function(data,type,row,mete){
		                	 var c = '';
		                	 if (resource.copyids.indexOf(data+",")>-1 && resource.copydirid == pid){
		     					if(resource.copytype == 'cut') {
		     						c = 'color:red;';
		     					} else {
		     						c = 'color:blue;';
		     					}
		     				}
		                	 return '<span class="row-details row-details-close visible-xs" dataid="'+row.name+'"></span> ' 
		                	 + (c ? "<span style='"+c+"'>" + data + "</span>" : data);
		                 } },
		                 { "data": "updateTime" },
		                 { "data": "type" , "className" : "hidden-xs", "render":function(value, type, row) {
		                	 return "<img src='assets/admin/cloud/fileicon/"+row.typeIcon+"' /> " + value;
		                 }},
		                 { "data": "size" , "className" : "hidden-xs"}
		],
		queryParams:{ id: pid },
		order: [[1,'asc']]
    });
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
        sOut += '<tr><td><div class="trig-more-content">类型：</div></td><td>' + rowData.type + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">大小：</div></td><td>' + rowData.size + '</td></tr>'; 
        sOut += '</table>';
        return  sOut;
    });
    
    $('#resource_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	if(pid=='#') pid="/";
    	ttable.query({id: pid});   
        return false;
    });
    
    $("#resource_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    function refreshtree() {
    	$('#resource_tree').jstree('refresh_node', {id: pid}); 
    }
    // 打开创建文件夹
    $("#createResourceManage").bind('click', function(){
    	$("#createDir").val('');
    	$("#id").val(pid);
    	$("#createModal").modal('show');
    });
    // 创建文件夹
    CLOUD.Validate('createform', function(form){
    	CLOUD.trackPost(resource.url.create, $(form).serialize(), function(data){
				refreshtree();
				ttable.reload(); 
				$("#createModal").modal('hide');
				CLOUD.messager.alert("创建成功");
    	});
    	return false;
    }, {
    	fileName : {
    		required : true
    	}
    });
    
    // 复制
    $(".copyResourceManage").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(rows > 0) {
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});  
			resource.copyids = ids;
			resource.copydirid = pid;
			resource.copytype = 'copy';
			ttable.reload(); 
		} else {
			CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE);
		}
    });
    // 剪切
    $(".cutResourceManage").bind('click', function() {
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(rows > 0) {
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});  
			resource.copyids = ids;
			resource.copydirid = pid;
			resource.copytype = 'cut';
			ttable.reload(); 
		} else {
			CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE);
		}
    });
    // 粘贴
    $(".pasteResourceManage").bind('click', function(){
    	if(resource.copyids == ""){
			CLOUD.messager.alert("没有粘贴的文件");
			return false;
		}
    	CLOUD.progress();
		$.post(rCLOUD.trackPoste.url.copy,"fileName=" + resource.copyids + "&id=" + pid +"&copydir=" + resource.copydirid
				+ "&copytype=" + resource.copytype, function(data){
			data = CLOUD.successHandle(data);
			if(data.success==true) {
				resource.copyids = "";
				ttable.reload(); 
				refreshtree();
				$('#resource_tree').jstree('refresh_node', {id: resource.copydirid}); 
			}
			CLOUD.progressClose();
		});
    });
    // 上传文件
    var temf = ""; // 上传文件存在，临时文件
    $("#uploadResourceManage").bind('click', function(){
    	$("#uploadModal").modal('show');
    });
    // 上传提交
    CLOUD.Validate('uploadform', function(form){
    	var _url = resource.url.upload;
		if(temf == $("#uploadfile").val()) {
			_url = resource.url.uploadconfirm;
		}
		upload(_url);
    	return false;
    }, {
    	uploadfile : {
    		required : true
    	}
    });
    function upload(_url, zip) {
		CLOUD.progress();
		_url += "?id=" + pid + "&" + CLOUD.Contants.CSRF_PARA + "=" + getCookie(CLOUD.Contants.CSRF_COOKIE);
		var ffv = zip ? $("#zipfile").val() : $("#uploadfile").val();
		$.ajaxFileUpload({  
			url: _url,  
			secureuri: false,  
			fileElementId: zip ? 'zipfile' : 'uploadfile',  
			dataType: 'json',  
		   beforeSend: function() { 
				//$("#loading").show();  
		   },  
			complete: function() {
			   //$("#loading").hide();  
			},  
			success: function(data, status) { 
				CLOUD.progressClose();
				//data = $.parseJSON(data);
				if(data.success==true) {
					if(zip) {
						$("#uploadsModal").modal('hide');
					}else{
						$("#uploadModal").modal('hide');
					}
					ttable.reload(); 
					CLOUD.messager.alert("上传成功");
				}else {
					if(data.errorCode==10003) {
						CLOUD.messager.alert("文件已存在，请重新选择并覆盖上传。");
						temf = ffv;
					}else{
						CLOUD.successHandle(data);
					}
				}
			},  
			error: function(data, status, e) {  
					alert(e);  
					CLOUD.progressClose();
				}  
		});
	}
    
    // 批量上传，上传zip
    $("#uploadsResourceManage").bind('click', function(){
    	$("#uploadsModal").modal('show');
    });
    CLOUD.Validate('uploadsform', function(form){
    	var _url = resource.url.uploads;
		upload(_url, true);
    	return false;
    }, {
    	zipfile : {
    		required : true
    	}
    });
    
    $("#downloadResourceManage").bind('click', function(){
    	var objs = ttable.getCheckbox();
    	var rows = objs.size();
		if(CLOUD.isSelectOne(rows)) {
			var id = objs.get(0).value ;
			var rowData = tablerows[id];
			if(rowData.type!='Folder') {
				document.getElementById("uploadiframe").src = resource.url.download + "?id=" + pid + "&fileName=" + id+ "&" + CLOUD.Contants.CSRF_PARA + "=" + getCookie(CLOUD.Contants.CSRF_COOKIE);
			} else {
				CLOUD.messager.alert("下载错误，文件夹还不能下载。");
			}
		}
    });
    
    // 删除
    $("#deleteResourceManage").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(resource.url.del, "fileName=" + ids+"&id=" + pid, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    // 级联删除
    $("#deleteAllResourceManage").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(resource.url.delAll, "fileName=" + ids+"&id=" + pid, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    $("#backupResourceManage").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(rows>0) {
			CLOUD.messager.confirm('备份','确认备份？', function(r) {	
				if(r) {
					var ids = "";
					objs.each(function(){
						ids += this.value + ",";
					});   
					CLOUD.trackPost(resource.url.backup, "fileName=" + ids+"&id=" + pid, function(data) {
						CLOUD.messager.alert("备份成功，WEB-INF/backup/file 下载备份。");
					});
				}
			});
		} else {
			CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE);
		}
    });
    
    // 日志 
    $(".findSysLogs").bind('click', function(){
    	CLOUD.LOG.openLogs(pid);  
    }); 
    
});