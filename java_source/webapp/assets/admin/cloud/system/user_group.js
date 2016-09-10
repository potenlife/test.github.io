$(function(){
	var sysUserGroup = {};
	sysUserGroup.url = {};
	sysUserGroup.url.add = 'user_group_add.json';
	sysUserGroup.url.update = 'user_group_update.json';
	sysUserGroup.url.del = 'user_group_delete.json';
	sysUserGroup.url.find = 'user_group_findPageList.json';
	
	var tablerows = []; 
    var table = $('#trig-user-group-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysUserGroup.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sug_groupId] = row;
    					   // 第一列checkbox
    						return '<input type="checkbox" class="checkboxes" value="'+row.sug_groupId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sug_groupId", "className":"hidden-xs" },
    		                 { "data": "sug_groupName"},  
    		                 { "data": "sug_description", "className":"hidden-xs" }, // hidden-xs 小屏幕(手机端)隐藏
    		                 { "data": "sug_createTime" }
    		],
    		order: [[4,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysUserGroup")) { 
    	    		showUpdate();
    	    	}
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    // 查询
    $("#findSysUserGroup").bind('click', function() {
    	ttable.query({ sug_groupName : $("#sysusergroupname").val()}); 
	});
    // 高级查询
    CLOUD.search('sys_user_group', $("#findSysUserGroup"), ttable); 
    
    // 新增浮层初始
    $("#addSysUserGroup").bind('click', function(){
    	CLOUD.formreset($("#userGroupEditform"));
    	CLOUD.hidePrveNext();
    	$("#userGroupEditModal").modal('show'); 
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
			CLOUD.forminit($("#userGroupEditform"), data);
			$("#userGroupEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysUserGroup").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    CLOUD.FormValidate("sys_user_group", "userGroupEditform",  function (form) {
		var _url = sysUserGroup.url.add;
		var isadd = true;
		if($("#sug_groupId").val()!='') {
			_url = sysUserGroup.url.update; 
			isadd = false; 
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data){
			if(isadd == true) {
				CLOUD.formreset($("#userGroupEditform")); 
			}
			// 保存&关闭
			if(saveclose) {
				$("#userGroupEditModal").modal('hide'); 
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
	$("#userGroupEditModal").on("hidden", function(){  
		ttable.reload();
		saveclose = false; 
	});
	
	// 删除
	$("#deleteSysUserGroup").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysUserGroup.url.del, "ids=" + ids, function(data){
				ttable.reload();
			});
		});
	});
	
	// 角色
	var roleMultiSelect = null;
    // 当前选择USER GROUP ID
    var groupid = '';
    
    function setGroupRole() { 
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			groupid = ids.get(0).value;
			$.getJSON("user_group_role_findList.json", "id="+groupid, function(data){
				var datas = [];
    			for(var i=0;i<data.length;i++) {
    				datas.push({id:data[i].sr_roleId, name:data[i].sr_roleName});      
    			}
    			roleMultiSelect.select(datas);
    			$("#userGroupRoeModal").modal('show'); 
    		});
		}
    }
    
    $(".findSysUserGroupRole").bind('click', function(){
    	// 是否初始
    	if(roleMultiSelect==null) {
    		$.getJSON("organization_role_findRole.json", "", function(data){ 
    			var datas = [];
    			for(var i=0;i<data.rows.length;i++) {
    				datas.push({name:data.rows[i].sr_roleName, id:data.rows[i].sr_roleId});  
    			}
    			roleMultiSelect = new CLOUD.multiSelect('usergrouproleselect', datas);
    			setGroupRole(); 
    		});
    	}else { 
    		setGroupRole();
    	}
    });
    // 角色保存
    $("#userGroupRoelSaveBtn").bind('click', function(data){ 
    	$.post('user_group_role_deletes.json','sugr_groupId=' + groupid ,function(data) { 
    		var roles = roleMultiSelect.val();
			if(roles) {
				CLOUD.trackPost('user_group_role_add.json', 'id='+groupid+'&ids=' + roles, function(data2){  
						CLOUD.updateSuccessAlert(); 
						$("#userGroupRoeModal").modal('hide');   
				});
			}else {
				CLOUD.updateSuccessAlert();
				$("#userGroupRoeModal").modal('hide');   
			}
    	});
    });
    
    $("#findSysRole").bind("click", function(){
    	roleMultiSelect.query($("#srolename").val());
    });
    
    ttable.next('.userrole-trig-next', function(){
    	setGroupRole();
    });
    ttable.prev('.userrole-trig-prev', function(){
    	setGroupRole();
    }); 
    
    // 用户
    // 用户列表
    var userttable = undefined;
    
    function setGroupUser() {
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			groupid = ids.get(0).value;
			if(userttable == undefined) {
				 userttable = new CLOUD.Datatable({
			    		table : $('#trig-user-group-user-table'), 
			    		url : 'user_group_user_findList.json', 
			    		columns : [
			    				   { "data": null, "render": function(data, type, row, mete){
			    					   // 第一列checkbox
			    						return '<input type="checkbox" class="checkboxes" value="'+row.sugu_groupUserId+'"/>';   
			    				   }, orderable: false, className: "trig-checkbox" },
			    		                 { "data": "su_userName" },
			    		                 { "data": "su_realName"},  
			    		                 { "data": "su_isLockedOut" } 
			    		],
			    		order: [[1,'desc']],
			    		queryParams : {
			    			id: groupid
			    		},
			    		paging:false,
			    		filter:true 
			    });
			} else {
				userttable.query({id: groupid});
			}
			
			
			$("#userGroupUserModal").modal('show');   
		}
    }
    
    $(".findSysUserGroupUser").bind('click', function(){ 
    	setGroupUser();
    });
    
      
    // 用户选择框
    $("#user_group_user_id").select2({
        minimumInputLength: 0,   
        multiple : true, 
        ajax: {  
            url: "user_group_user_findUser.json",
            dataType: 'json',
            data: function (term, page) {
                return {
                	id: groupid,
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
    // 添加组用户
    $("#addSysUserGroupUser").bind('click', function(){
    	var uids = $("#user_group_user_id").val();
    	if(uids) {
    		CLOUD.trackPost('user_group_user_add.json','id='+groupid + "&ids=" + uids, function(data){
					userttable.reload(); 
					$("#user_group_user_id").select2('val', '');   
			});
    	}
    });
    // 删除组用户
    $("#deleteSysUserGroupUser").bind('click', function(){
    	var objs = userttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost('user_group_user_delete.json', "ids=" + ids, function(data){ 
				userttable.reload();
			});
		});
    });
    
    ttable.next('.user-trig-next', function(){
    	setGroupUser();
    });
    ttable.prev('.user-trig-prev', function(){
    	setGroupUser();
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
    
});