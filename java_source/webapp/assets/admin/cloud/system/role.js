$(function(){
	var role = {};
	role.url = {};
	role.url.add = 'role_add.json';
	role.url.update = 'role_update.json';
	role.url.del = 'role_delete.json';
	role.url.find = 'role_findList.json';
	role.url.updatelocked = 'role_updateLocked.json';
	role.type = {};
	role.type.nz = '1';	//内置角色类型 3
	var tablerows = []; 
    var table = $('#trig-role-table');
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : role.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sr_roleId] = row;
    					   // 第一列checkbox
    						return '<input type="checkbox" class="checkboxes" value="'+row.sr_roleId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sr_roleName", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.sr_roleId+'"></span> ' + data ;  
    		                 } },
    		                 { "data": "sr_roleType", "render":function(data){
    		                	return  data == role.type.nz ? "系统" : "业务";  
    		                 }},
    		                 { "data": "sr_description", "className":"hidden-xs" }, // hidden-xs 小屏幕(手机端)隐藏
    		                 { "data": "sr_isLocked" , "render": function(value) {
    		                	 return CLOUD.getYesNoHtml(value);
    		                 }},
    		                 { "data": "sr_createTime" , "className":"hidden-xs"}  
    		],
    		order: [[5,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysRole")) {
    	    		showUpdate();
    	    	}
    		},
    		paging: false 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
 // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr  class="visible-xs"><td><div class="trig-more-content">描述：</div></td><td>' + rowData.sr_description + '</td></tr>';
        sOut += '<tr  class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sr_createTime + '</td></tr>';
        sOut += '</table>';
        return  sOut;
    });
    
    // 查询
    $("#findSysRole").bind('click', function() {
    	ttable.query({ sr_roleName : $("#srolename").val()});
	});
    // 高级查询
    CLOUD.search('sys_role', $("#findSysRole"), ttable); 
    
 // 新增浮层初始
    $("#addSysRole").bind('click', function(){
    	CLOUD.formreset($("#roleEditform"));
    	CLOUD.hidePrveNext();
    	$("#sr_isLocked").val('N'); 
    	$("#roleEditModal").modal('show');
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
			CLOUD.forminit($("#roleEditform"), data);
			$("#roleEditModal").modal('show');
			// 加记录锁
			getLock(data.sr_roleId);
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysRole").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_role", "roleEditform",  function (form) { 
			var _url = role.url.add;
			var isadd = true;
			if($("#sr_roleId").val()!='') {
				_url = role.url.update;
				isadd = false;
				
				if(tablerows[ $("#sr_roleId").val()].sr_roleType == role.type.nz) {
					CLOUD.messager.alert(tablerows[ $("#sr_roleId").val()].sr_roleName + '为系统内置角色，不能修改。'); 
					return false;
				}
			}
			CLOUD.trackPost(_url, $(form).serialize(), function(data){
				if(isadd == false) { 
					refreshLock();
				} else {
					CLOUD.formreset($("#roleEditform")); 
					$("#sr_isLocked").val('N'); 
				}
				if(saveclose) {
					$("#roleEditModal").modal('hide');   
				}
				CLOUD.updateSuccessAlert();
			}, function(data) {
				if($("#sr_roleId").val()!='') {
					refreshLock();
				}
			});
			return false;
    });
    
    $(".cloudsaveclose").bind('click', function(){
    	saveclose = true; 
    });
    
    // 编辑浮层关闭刷新列表数据
    $("#roleEditModal").on("hidden", function(){  
    	ttable.reload();
    	saveclose = false; 
    });
    
    // 删除
    $("#deleteSysRole").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			var isnz = false;
			objs.each(function(){
				ids += this.value + ",";
				if(tablerows[ this.value].sr_roleType == role.type.nz) {
					CLOUD.messager.alert(tablerows[ this.value].sr_roleName + '为系统内置角色，不能删除。'); 
					isnz = true;
					return false;
				}
			});   
			if(isnz==false) {
				CLOUD.trackPost(role.url.del, "ids=" + ids, function(data){ 
					ttable.reload();
				});
			}
		});
    });
    
    // 用户
    // 用户列表
    var userttable = undefined;
    var roleid = '';
    
    function setRoleUser() {
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			roleid = ids.get(0).value;
			if(userttable == undefined) {
				 userttable = new CLOUD.Datatable({
			    		table : $('#trig-role-user-table'), 
			    		url : 'user_role_findList.json', 
			    		columns : [
			    				   { "data": null, "render": function(data, type, row, mete){
			    					   // 第一列checkbox
			    						return '<input type="checkbox" class="checkboxes" value="'+row.sur_userRoleId+'"/>';   
			    				   }, orderable: false, className: "trig-checkbox" },
			    		                 { "data": "su_userName" },
			    		                 { "data": "su_realName"},  
			    		                 { "data": "su_isLockedOut" } 
			    		],
			    		order: [[1,'desc']],
			    		queryParams : {
			    			sur_roleId: roleid
			    		},
			    		paging:false,
			    		filter:true 
			    });
			} else {
				userttable.query({sur_roleId: roleid});
			}
			$("#roleUserModal").modal('show');   
		}
    }
    $(".findUserRole").bind('click', function(){ 
    	setRoleUser();
    });
    
      
    // 用户选择框
    $("#role_user_id").select2({
        minimumInputLength: 0,   
        multiple : true, 
        ajax: {  
            url: "user_role_findUser.json",
            dataType: 'json',
            data: function (term, page) {
                return {
                	sr_roleId: roleid,
                	su_userName: term, // search term
                	sort:'su_userName',
                	rows:10 
                };
            },
            results: function (data, page) { // parse the results into the format expected by Select2.
            	var datas = [];
            	for(var i=0;i<data.length;i++) {
            		datas.push({id:data[i].su_userId,text:data[i].su_userName});
            	}
                return {
                    results: datas 
                };
            }
        }
    });
    // 添加角色用户
    $("#addUserRole").bind('click', function(){
    	var uids = $("#role_user_id").val();
    	if(uids) {
    		CLOUD.trackPost('user_role_addUser.json','id='+roleid + "&ids=" + uids, function(data){
					userttable.reload(); 
					$("#role_user_id").select2('val', '');   
			});
    	}
    });
    // 删除角色用户
    $("#deleteUserRole").bind('click', function(){
    	var objs = userttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost('user_role_delete.json', "ids=" + ids, function(data){ 
				userttable.reload();
			});
		});
    });
    
    ttable.next('.user-trig-next', function(){
    	setRoleUser();
    });
    ttable.prev('.user-trig-prev', function(){
    	setRoleUser();
    }); 
    
    // 权限操作
    var tree_init = false; 
    // 内容列表
    var contentttable = undefined;
    // 字段列表
    var columntable = undefined;
    var rolecontent = {
    		url : {
    			find : 'role_content_findPageList.json',
    			add : 'role_content_add.json',
    			tree : 'role_content_findTree.json',
    			findNodePathName : 'role_content_findNodePathName.json',
    			del : 'role_content_delete.json'
    		}
    	};
    function setRolePriv() {
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			Pace.track(function() {
				roleid = ids.get(0).value;
		    	$.getJSON('role_privlege_def_findList.json', 'srpd_roleId=' + roleid, function(data){  
		    		if(tree_init == true) {
		    			$("#tree_role_priv").jstree(true).destroy();   
		    		}
		    		
		    		 // 权限树  
		    		$("#tree_role_priv").jstree({  
		    	        "core" : {
		    	            "themes" : {
		    	                "responsive": false
		    	            },
		    	            "data": data    
		    	        }, 
		    	        "types" : {
		    	            "default" : {
		    	                "icon" : "fa fa-folder icon-state-warning icon-lg" 
		    	            }
		    	        },
		    	        "plugins" : ["checkbox", "types"] //  "wholerow" 选中行满行变灰 
		    	    });
		    		// 通用权限树
		    		if(document.getElementById("rolemoduletree")) {
		    			if(tree_init == true) $("#rolemoduletree").jstree(true).destroy();   
			    		$.getJSON('role_function_findList.json', 'srf_roleId=' + roleid, function(data){  
			    			$("#rolemoduletree").jstree({  
				    	        "core" : {
				    	            "themes" : {
				    	                "responsive": false
				    	            },
				    	            "data": data    
				    	        }, 
				    	        "types" : {
				    	            "default" : {
				    	                "icon" : "fa fa-folder icon-state-warning icon-lg" 
				    	            }
				    	        },
				    	        "plugins" : ["checkbox", "types"] //  "wholerow" 选中行满行变灰 
				    	    });
			    		});
		    		}
		    		
		    		if(document.getElementById("trig-role-content-table")) {
		    			if(contentttable == undefined) {
			    			contentttable = new CLOUD.Datatable({
						    		table : $('#trig-role-content-table'), 
						    		url : 'role_content_findPageList.json', 
						    		columns : [
						    				   { "data": null, "render": function(data, type, row, mete){
						    					   // 第一列checkbox
						    						return '<input type="checkbox" class="checkboxes" value="'+row.src_roleContentId+'"/>';   
						    				   }, orderable: false, className: "trig-checkbox" },
						    		                 { "data": "spc_contentName" },
						    		                 { "data": "spc_nodePath", "render":function(value,type,row){
						    		                	 var name = value;
						    		                	 if(value) {
							    		 					$.ajax({async:false, url: rolecontent.url.findNodePathName, data:'id=' + value,success:function(data){
							    		 						data = CLOUD.successHandle(data);
							    		 						name = data.name;
							    		 					}}); 
						    		                	 }
						    		 					return (name ? name + "/" : "/") + row.spc_contentName;
						    		                 }},  
						    		                 { "data": "src_contentPrivlegeDef" },
						    		                 { "data": "src_isExtends" }
						    		],
						    		order: [[1,'desc']], 
						    		queryParams : {
						    			src_roleId: roleid
						    		},
						    		filter:true
						    });
		    			} else {
		    				contentttable.query({src_roleId: roleid});
		    			}
		    			
		    			if(document.getElementById("trig-role-column-table")) {
		    				if(columntable==undefined) { // 初始
		    					columntable = new CLOUD.Datatable({
						    		table : $('#trig-role-column-table'), 
						    		url : 'role_not_column_findPageList.json', 
						    		columns : [
						    				   { "data": null, "render": function(data, type, row, mete){
						    					   // 第一列checkbox
						    						return '<input type="checkbox" class="checkboxes" value="'+row.srnc_roleColumnId+'"/>';   
						    				   }, orderable: false, className: "trig-checkbox" },
						    		                 { "data": "srnc_tableName" },
						    		                 { "data": "srnc_columnName"},  
						    		                 { "data": "srnc_aliasName" }
						    		],
						    		order: [[1,'desc']], 
						    		queryParams : {
						    			srnc_roleId: roleid
						    		},
						    		filter:true
		    					});
		    				} else {
		    					columntable.query({srnc_roleId: roleid});
		    				}
		    			}
		    		}
		    		tree_init = true;
		    		$("#rolePrivModal").modal('show');  
		       }); 
			});
		}
    }
    $(".findRolePrivlegeDef").bind('click', function(){
    	setRolePriv();
    });
    
    ttable.next('.priv-trig-next', function(){
    	setRolePriv();
    });
    ttable.prev('.priv-trig-prev', function(){
    	setRolePriv();
    }); 
    
    var tabindex = '0';
    $("#privtabs a").bind('click', function(){
    	tabindex = $(this).attr("data-index");
    	if(tabindex=='0' || tabindex=='1') {
    		$("#rolePrivSaveBtn").show();
    	}else{
    		$("#rolePrivSaveBtn").hide();
    	}
    });
    
    $("#rolePrivSaveBtn").bind('click', function(){
    	Pace.track(function() {
    		// 权值
    		if(tabindex=="0") {
    			var ids = [];
    	    	var nodes = $("#tree_role_priv").jstree('get_checked', true);    
    	    	$.each(nodes, function(i,n){
    	    		ids.push(n.id); 
    	    	}); 
    			CLOUD.progress();
		    	$.post('role_privlege_def_add.json','type=0&id='+roleid+'&ids='+ids, function(data){
					data = CLOUD.successHandle(data);
					if(data.success==true) {
						ids = CLOUD.TreeUndetermined('tree_role_priv'); 
						$.post('role_privlege_def_add.json','type=1&id='+roleid+'&ids='+ids, function(data){ 
							CLOUD.progressClose();
							data = CLOUD.successHandle(data);
							if(data.success==true) {
								CLOUD.updateSuccessAlert();
							}
						});
					}
				});
    		} else if(tabindex=="1") { // 通用
    			CLOUD.progress();
    			var ids = [];
    	    	var nodes = $("#rolemoduletree").jstree('get_checked', true);  
    			$.each(nodes, function(i,n){
    	    		ids.push(n.id); 
    	    	}); 
    			$.post('role_function_add.json','id='+roleid+'&ids='+ids, function(data){
    				CLOUD.progressClose();
    				data = CLOUD.successHandle(data);
    				if(data.success==true) {
    					CLOUD.updateSuccessAlert();
    				}
    			});
    		}
    	});  
    });
    
    // 内容权限
    $("#deleteRoleContent").bind('click', function(){
    	var objs = contentttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(rolecontent.url.del, "ids=" + ids, function(data){ 
				contentttable.reload();
			});
		});
    });
    
    // 内容权限选择框初始
    CLOUD.dict.setSelectByNOAndCode('src_contentPrivlegeDef','CONTENT_PRIV');
    
    // 权限选择框
    $("#src_contentId").select2({
        minimumInputLength: 0,   
       // multiple : true, 
        ajax: {  
            url: rolecontent.url.tree,
            dataType: 'json',
            data: function (term, page) {
                return {
                	spc_contentName: term, 
                	rows:10 
                };
            },
            results: function (data, page) { 
            	var datas = [];
            	for(var i=0;i<data.length;i++) {
            		var name = data[i].spc_contentName;
            		if(data[i].nodePathName) {
            			name = name + "[" + data[i].nodePathName + "]";
            		}
            		datas.push({id:data[i].spc_contentId, text:name});
            	}
                return {
                    results: datas 
                };
            }
        }
    });
    // 添加内容权限
    $("#addRoleContent").bind('click', function(){
    	CLOUD.formreset($("#contentPrivAddform"));
    	$("#src_roleId").val(roleid);
    	$("#src_contentId").select2('val', '');   
    	$("#contentPrivAddModal").modal('show');
    });
    // 保存内容权限
    CLOUD.Validate('contentPrivAddform', function(form){
    	CLOUD.trackPost(rolecontent.url.add, $(form).serialize(), function(data){
    		contentttable.reload();
			$("#contentPrivAddModal").modal('hide');   
			CLOUD.updateSuccessAlert();
		});
    	return false;
    }, {
    	"src_contentId": 	{ required:true },
    	"src_contentPrivlegeDef": 	{ required:true }
    });
    
    // 字段权限
    // 字段添加框
    var sysTableColumn = [];
    $("#role_column_id").select2({
        minimumInputLength: 1,   
        placeholder: "请选择字段",
         ajax: {  
             url: 'role_not_column_findNotPageList.json',
             dataType: 'json',
             data: function (term, page) {
                 return {
                	 srnc_tableName: term, 
                 	srnc_roleId:roleid,
                 	rows:15 
                 };
             },
             results: function (data, page) {
             	var datas = [];
             	sysTableColumn = [];
             	for(var i=0;i<data.rows.length;i++) {
             		sysTableColumn[data.rows[i].stc_columnId] = data.rows[i];
             		datas.push({id:data.rows[i].stc_columnId,text:data.rows[i].stc_columnName + '('+data.rows[i].st_tableName+')'});
             	}
                 return {
                     results: datas 
                 };
             }
         }
     });
    
    // 新增
    $("#addRoleNotColumn").bind('click', function() {
    	var cid = $("#role_column_id").val();
    	if(cid) {
	    	var stc_aliasName = sysTableColumn[cid].stc_aliasName;
			var st_tableName = sysTableColumn[cid].st_tableName;
			var stc_columnName = sysTableColumn[cid].stc_columnName;
			CLOUD.trackPost('role_not_column_add.json','srnc_roleId='+roleid + "&srnc_tableName=" + st_tableName
					+ "&srnc_columnName="+stc_columnName+"&srnc_aliasName=" + stc_aliasName, 
					function(data){
					 $("#role_column_id").select2('val','');
					columntable.query({srnc_roleId: roleid});
			});
    	} else {
    		CLOUD.messager.alert('请选择字段'); 
    	}
    });
    
    $("#deleteRoleNotColumn").bind('click', function() {
    	var objs = columntable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost('role_not_column_delete.json', "ids=" + ids, function(data){ 
				columntable.reload();
			});
		});
    });
    
    // 禁用
    $(".LockedYes").bind('click', function(){ 
    	var ids = ttable.getCheckbox(); 
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var id = ids.get(0).value;
    		CLOUD.trackPost(role.url.updatelocked,'sr_isLocked=Y&sr_roleId=' + id,function(data){
    				CLOUD.updateSuccessAlert();
    				ttable.reload();
    		});
    	}
    }); 
    
    // 启用
    $(".LockedNo").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var id = ids.get(0).value;
    		CLOUD.trackPost(role.url.updatelocked,'sr_isLocked=N&sr_roleId=' + id,function(data){
    				CLOUD.updateSuccessAlert();
    				ttable.reload();
    		});
    	}
    });
    
    // 点击行选中时判断可更新的状态
    table.on('click', 'tbody tr', function (e) {
    	var c =  jQuery(".checkboxes", jQuery(this));
    	if(c.is(":checked")) {
    		var rowData = tablerows[c.val()];
    		if(CLOUD.isPrivlege("updateRoleLocked")){
				if(rowData.sr_isLocked=='Y'){
					$(".LockedYes").bind('click', disableLink);
					$(".LockedYes").attr('disabled', true);
					$(".LockedNo").unbind('click', disableLink);
					$(".LockedNo").attr('disabled', false);
				}else{
					$(".LockedYes").unbind('click', disableLink);
					$(".LockedYes").attr('disabled', false); 
					$(".LockedNo").bind('click', disableLink); 
					$(".LockedNo").attr('disabled', true); 
				}
			}
    	}
	});
    
    $(".findSysLogs").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var id = ids.get(0).value;
    		CLOUD.LOG.openLogs(id); 
    	}
    });
    
});