$(function() {
	/**
	 * 类定义，相对于JAVA Service 业务定义，对于相关业务为一个类，主要以表区分
	 */
	// 用户基本操作定义
	var user = function () {
			// 访问URL定义
			var url = { 
					add : 'user_add.json',
					update : 'user_update.json',
					del : 'user_delete.json',
					find : 'user_findPageList.json',
					updatelocked : 'user_updateLocked.json',
					orgselect : 'organization_findSelectList.json'	
			};
			// 变量定义
			// 用户选择组枳机构数据列表
			var orgs = [];
			// 列表数据
			var tablerows = [];
			// 表格
			var table = $('#trig-user-table');
			var ttable = null;
		    
			// 列表初始
			var tableInit = function() {
				ttable = new CLOUD.Datatable({
			    		table : table, 
			    		url :  url.find, 
			    		columns : [
			    				   { "data": null, "render": function(data, type, row, mete){
			    					   tablerows[row.su_userId] = row;
			    					   // 第一列checkbox
			    						return '<input type="checkbox" class="checkboxes" value="'+row.su_userId+'"/>';   
			    				   }, orderable: false, className: "trig-checkbox" },
			    		                 { "data": "su_userName", "render":function(data,type,row,mete){
			    		                	 return '<span class="row-details row-details-close" dataid="'+row.su_userId+'"></span> ' + data ;  
			    		                 } },
			    		                 { "data": "su_realName" },
			    		                 { "data": "su_email", "className":"hidden-xs" }, // hidden-xs 小屏幕(手机端)隐藏
			    		                 { "data": "su_mobile", "className":"hidden-xs" },
			    		                 { "data": "su_isLockedOut", "render": function(value) {
			    		                	 return CLOUD.getYesNoHtml(value);
			    		                 } },
			    		                 { "data": "su_createDate", "className":"hidden-xs" }
			    		],
			    		order: [[6,'desc']],
			    		dblclick : function() {   // 双击打开编辑浮层
			    			// 是否有修改权限
			    	    	if(CLOUD.isPrivlege("updateSysUser")) {
			    	    		updateOpen();
			    	    	}
			    		},
			    		filter: true 
			    });
				
				// 显示更多字段值
				ttable.initMore(function(id) { 
			    	 var rowData = tablerows[id];
			    	 var sOut = '<table>';
			    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
			    	 if(CLOUD.settings.org) {
			    		 sOut += '<tr><td><div class="trig-more-content">组织机构：</div></td><td>' + (rowData.su_organizationId ? orgs[rowData.su_organizationId] : '') + '</td></tr>';
			    	 }
			         sOut += '<tr><td><div class="trig-more-content">性别：</div></td><td>' + (rowData.su_sex=='M' ? '先生' : rowData.su_sex =='F' ? '女士' : '未知') + '</td></tr>';
			         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">EMAIL：</div></td><td>' + rowData.su_email + '</td></tr>';
			         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">手机：</div></td><td>' + rowData.su_mobile + '</td></tr>';
			         
			         //sOut += '<tr><td><div class="trig-more-content">电话：</div></td><td>' + (rowData.sue_phone ? rowData.sue_phone : '') + '</td></tr>';
			         //sOut += '<tr><td><div class="trig-more-content">地址：</div></td><td>' + (rowData.sue_address ? rowData.sue_address : '') + '</td></tr>';
			         
			         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.su_createDate + '</td></tr>';
			         sOut += '</table>';
			         return  sOut;
				});
			};
			
			var updateOpen = function() {
				var ids = ttable.getCheckbox();
				var rows = ids.size();
				// 是否选择单条记录
				if(CLOUD.isSelectOne(rows)) {
					CLOUD.showPrveNext(); 
					var id = ids.get(0).value;
					var data = tablerows[id];
					// 初始表单数据
					CLOUD.forminit($("#userEditform"), data);
					$("#su_userName").attr('readonly','readonly');
					$("#su_password").attr('readonly','readonly');
					$("#userEditModal").modal('show');
					// 加记录锁
					getLock(data.su_userId);
				}
			};
			
			// 表单数据保存，新增/修改保存
			var formSaveInit = function() {
				
				// 表单选择数据初始
				if(CLOUD.settings.org) {
					// 初始组织机构
					/*$.getJSON(url.orgselect, '', function(data) {
				 		var o = $("#su_organizationId").get(0).options;
				 		o.length = 1;  
				 		for(var i=0;i<data.length;i++) {
				 			o.add(new Option(data[i].so_organizationName, data[i].so_organizationId));
				 			orgs[data[i].so_organizationId] = data[i].so_organizationName;
				 		}
					}); */
					CLOUD.OrgSelect('su_organizationId', '', '', orgs);
				}
				
				// 是否点击保存&关闭
			    var saveclose = false;
				CLOUD.FormValidate("sys_user", "userEditform",  function (form) {
						var _url = url.add;
						var isadd = true;
						// 表单ID不为空即当前操作为修改数据，新增注意清空此项
						if($("#su_userId").val()!='') {
							_url = url.update;
							isadd = false;
						}
						// AJAX提交
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == false) { 
								refreshLock();
							} else {
								CLOUD.formreset($("#userEditform")); 
							}
							// 点击保存&关闭，关闭编辑浮层
							if(saveclose) { 
								$("#userEditModal").modal('hide');   
							} else {
								if(isadd == false) { // 更新用户信息，使上个数据切换正确
									var dd = tablerows[data.data.su_userId];
									for(var key in data.data) {  
										var val = data.data[key];
										if(val) eval("dd."+key+" = data.data['" + key + "'];") ; 
									}
									tablerows[data.data.su_userId] = dd;
								}
							}
							CLOUD.updateSuccessAlert();
						},
						// 执行完回调函数
						function(data) {
							if($("#su_userId").val()!='') {
								refreshLock();
							}
						});
						// 必须flase，阻止form submit
						return false;
			    });
				
				// 点击保存关闭设置saveclose=true，保存时判断
			    $(".cloudsaveclose").bind('click', function(){
			    	CLOUD.SAVECLOSE = true; 
			    	saveclose = true;
			    });
			    
			    // 编辑浮层关闭刷新列表数据
			    $("#userEditModal").on("hidden", function(){  
			    	ttable.reload();
			    	saveclose = false; 
			    });
			};
			
			// 禁用操作行判断
			var lockedInit = function() {
				// 点击行选中时判断可更新的状态
			    table.on('click', 'tbody tr', function (e) {
			    	var c =  jQuery(".checkboxes", jQuery(this));
			    	if(c.is(":checked")) {
			    		var rowData = tablerows[c.val()];
			    		if(CLOUD.isPrivlege("updateUserLocked")){
							if(rowData.su_isLockedOut=='Y'){
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
			};
			
			return {
				// 查询
				query : function() {
					ttable.query({ su_userName : $("#susername").val()});
				},
				// 打开新增
				addOpen : function() {
					CLOUD.formreset($("#userEditform"));
			    	CLOUD.hidePrveNext();
					$("#su_userName").attr('readonly',false);
					$("#su_password").attr('readonly',false);
			    	$("#userEditModal").modal('show');
				},
				// 打开修改/编辑
				updateOpen : function() {
					updateOpen();
				},
				// 删除
				del : function() {
					var objs = ttable.getCheckbox();
					var rows = objs.size();
					CLOUD.isDelSelectOne(rows,function(){
						var ids = "";
						objs.each(function(){
							ids += this.value + ",";
						});   
						CLOUD.trackPost(url.del, "ids=" + ids, function(data){
							ttable.reload();
						});
					});
				},
				// 禁用
				lockedYes : function() {
					var ids = ttable.getCheckbox(); 
					var rows = ids.size();
			    	if(CLOUD.isSelectOne(rows)) {
			    		var id = ids.get(0).value;
						var rowData = tablerows[id];
			    		var uid = rowData.su_userId;
			    		CLOUD.trackPost(url.updatelocked,'su_isLockedOut=Y&su_userId=' + uid,function(data){
			    				CLOUD.updateSuccessAlert();
			    				ttable.reload();
			    		});
			    	}
				},
				// 启用
				lockedNo : function() {
					var ids = ttable.getCheckbox();  
					var rows = ids.size();
			    	if(CLOUD.isSelectOne(rows)) {
			    		var id = ids.get(0).value;
						var rowData = tablerows[id];
			    		var uid = rowData.su_userId;
			    		CLOUD.trackPost(url.updatelocked,'su_isLockedOut=N&su_userId=' + uid,function(data){
			    				CLOUD.updateSuccessAlert();
			    				ttable.reload();
			    		});
			    	}
				},
				init : function() {
					tableInit();
					
					ttable.next(); // 初始下一个按钮事件
				    ttable.prev(); // 初始上一个按钮事件
				    
				    // 导出
				    CLOUD.initexpHTML('exportSysUser', 'user_export.htm', ttable);
				    
				    // 高级查询
				    CLOUD.search('sys_user', $("#findSysUser"), ttable);
				    
				    formSaveInit();
				    lockedInit();
				},
				getTable : function() {
					return ttable;
				},
				getTableRows : function() {
					return tablerows;
				}
			};
	}(); // 定义并执行
	
	//用户密码
	var userpwd = function(ttable, tablerows){
		var url = {
				updatepwd : 'user_updatePassword.json'
		};
		return {
			// 打开密码修改窗口
			windowOpen : function() {
				var ids = ttable.getCheckbox();  
				var rows = ids.size();
		    	if(CLOUD.isSelectOne(rows)) {
		    		var id = ids.get(0).value;
					var rowData = tablerows[id];
					CLOUD.formreset($("#pwdform"));
					$("#su_userId2").val(rowData.su_userId); 
					$("#su_userName2").val(rowData.su_userName);
					$("#pwdModal").modal('show');   
		    	}
			}, 
			init : function() {
				CLOUD.Validate('pwdform', function(){
			    	CLOUD.trackPost(url.updatepwd, $("#pwdform").serialize(), function(data){
			    			CLOUD.updateSuccessAlert();
			    			$("#pwdModal").modal('hide');  
			    	});
			    	return false; 
			    }, {
			    	su_password : {
			    		required : true
			    	}, 
			    	su_password3 : {
			    		required : true,
			    		equalTo : '#su_password2' 
			    	}
			    });
			}
		}
	}; 
	
	// 角色
	var userrole = function(ttable) {
		var url = {
				findRole : 'user_role_findRole.json',
				del : 'user_role_deletes.json',
				add : 'user_role_addRole.json'
		};
	    // 当前选择USER ID
	    var uid = '';
	    // 角色多选
	    var roleMultiSelect = null;
	    
	    var setUserRole = function() { 
	    	var ids = ttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				uid = ids.get(0).value;
				$.getJSON("user_role_findList.json", "sur_userId="+uid, function(data){
					var datas = [];
	    			for(var i=0;i<data.data.length;i++) {
	    				datas.push({id:data.data[i].sur_roleId, name:data.data[i].sr_roleName});   
	    			}
	    			roleMultiSelect.select(datas);
	    			$("#roeModal").modal('show'); 
	    		});
			}
	    };
	    
	    ttable.next('.userrole-trig-next', function(){
	    	setUserRole();
	    }); // 初始下一个按钮事件
	    ttable.prev('.userrole-trig-prev', function(){
	    	setUserRole();
	    }); // 初始上一个按钮事件
	    
	    return {
	    	windowOpen : function() {
	        	// 如果已初始，直接赋值选择
	        	if(roleMultiSelect!=null) {
	        		setUserRole();
	        	} else {
	        		var ids = ttable.getCheckbox();
	    			var rows = ids.size();
	        		if(CLOUD.isSelectOne(rows)) {
	        			uid = ids.get(0).value;
		        		$.getJSON(url.findRole, "", function(data){
		        			var datas = [];
		        			for(var i=0;i<data.rows.length;i++) {
		        				datas.push({name:data.rows[i].sr_roleName, id:data.rows[i].sr_roleId});
		        			}
	        				$.getJSON("user_role_findList.json", "sur_userId="+uid, function(data){
	        					var initdatas = [];
	        	    			for(var i=0;i<data.data.length;i++) {
	        	    				initdatas.push({id:data.data[i].sur_roleId, name: data.data[i].sr_roleName});   
	        	    			}
	        	    			roleMultiSelect = new CLOUD.multiSelect('roleselect', datas, initdatas);
	        	    			$("#roeModal").modal('show'); 
	        	    		});
	        			});
	        		}
	        	}
	    	},
	    	query: function(name) {
	    		roleMultiSelect.query(name);
	    	},
	    	save : function() {
	    		$.post(url.del,'sur_userId=' + uid ,function(data) { 
	        		var roles = roleMultiSelect.val();
	    			if(roles) {
	    				CLOUD.trackPost(url.add, 'id='+uid+'&ids=' + roles, function(data2){ 
	    						CLOUD.updateSuccessAlert(); 
	    						$("#roeModal").modal('hide');  
	    				});
	    			}else {
	    				CLOUD.updateSuccessAlert();
	    				$("#roeModal").modal('hide'); 
	    			}
	        	});
	    	}
	    }
	};
	
	// 用户设置权限
	var usersetpriv = function(ttable) {
		var url = {
			find : 'user_privlege_def_findList.json',
			add : 'user_privlege_def_add.json'
		};
		var tree_init = false; 
		
		return {
			find : function() {
				var ids = ttable.getCheckbox();
				var rows = ids.size();
				// 是否选择单条记录
				if(CLOUD.isSelectOne(rows)) {
					uid = ids.get(0).value;
			    	$.getJSON(url.find, 'supd_userId=' + uid, function(data){  
			    		if(tree_init == true) {
			    			$("#tree_priv").jstree(true).destroy();   
			    		}
			    		tree_init = true;
			    		 // 权限树  
			    		$("#tree_priv").jstree({  
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
			    		$("#privModal").modal('show');  
			       }); 
				}
			},
			save : function() {
				var ids = [];
		    	var nodes = $("#tree_priv").jstree('get_checked', true);    
		    	$.each(nodes, function(i,n){
		    		ids.push(n.id); 
		    	}); 
		    	Pace.track(function() {
		    		CLOUD.progress();
			    	$.post(url.add,'type=0&id='+uid+'&ids='+ids, function(data){
						data = CLOUD.successHandle(data);
						if(data.success==true) {
							ids = CLOUD.TreeUndetermined('tree_priv'); 
							$.post(url.add,'type=1&id='+uid+'&ids='+ids, function(data){ 
								CLOUD.progressClose();
								data = CLOUD.successHandle(data);
								if(data.success==true) {
									CLOUD.updateSuccessAlert();
									$("#privModal").modal('hide');  
								}
							});
						}
					});
		    	}); 
			}
		};
	}; 
	
	// 查看权限
	var userviewpriv = new function() {
		var url = {
				priv_view : 'user_privlege_def_view.json',
				fun_view : 'user_privlege_def_viewFunction.json',
				con_view : 'user_privlege_def_viewContent.json',
				column_view : 'user_privlege_def_viewColumn.json'
		};
		// 权限树是否初始
		var tree_init = false; 
	    // 内容列表
	    var contentttable = undefined;
	    // 字段列表
	    var columntable = undefined;
	    // 用户ID
	    var uid = undefined;
	    
	    function viewOpen(ttable) {
		    var ids = ttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				Pace.track(function() {
					uid = ids.get(0).value;
			    	$.getJSON(url.priv_view, 'id=' + uid, function(data){  
			    		if(tree_init == true) {
			    			$("#view_tree_priv").jstree(true).destroy();   
			    		}
			    		
			    		 // 权限树  
			    		$("#view_tree_priv").jstree({  
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
			    		// 通用权限树，先判断是否启用通用权限
			    		if(document.getElementById("viewmoduletree")) {
			    			if(tree_init == true) $("#viewmoduletree").jstree(true).destroy();   
				    		$.getJSON(url.fun_view, 'id=' + uid, function(data){  
				    			$("#viewmoduletree").jstree({  
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
			    		
			    		// 内容权限，是否启用内容权限 
			    		if(document.getElementById("trig-view-content-table")) {
			    			if(contentttable == undefined) {
				    			contentttable = new CLOUD.Datatable({
							    		table : $('#trig-view-content-table'), 
							    		url : url.con_view, 
							    		columns : [
							    				   { "data": null, "render": function(data, type, row, mete){
							    					   // 第一列checkbox
							    						return '<input type="checkbox" class="checkboxes" value="'+row.src_roleContentId+'"/>';   
							    				   }, orderable: false, className: "trig-checkbox" },
							    		                 { "data": "spc_contentName" },
							    		                 { "data": "spc_nodePath", "render":function(value,type,row){
							    		                	 var name = value;
							    		                	 if(value) {
								    		 					$.ajax({async:false, url: 'role_content_findNodePathName.json', data:'id=' + value,success:function(data){
								    		 						data = CLOUD.successHandle(data);
								    		 						name = data.name;
								    		 					}}); 
							    		                	 }
							    		 					return name + "/" + row.spc_contentName;
							    		                 }},  
							    		                 { "data": "src_contentPrivlegeDef" },
							    		                 { "data": "src_isExtends" }
							    		],
							    		order: [[1,'desc']], 
							    		queryParams : {
							    			id: uid
							    		},
							    		filter:true
							    });
			    			} else {
			    				contentttable.query({id: uid});
			    			}
			    			
			    			// 字段权限，是否启用
			    			if(document.getElementById("trig-view-column-table")) {
			    				if(columntable==undefined) { // 初始
			    					columntable = new CLOUD.Datatable({
							    		table : $('#trig-view-column-table'), 
							    		url : url.column_view, 
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
							    			id: uid
							    		},
							    		filter:true
			    					});
			    				} else {
			    					columntable.query({id: uid});
			    				}
			    			}
			    		}
			    		tree_init = true;
			    		$("#viewPrivModal").modal('show');  
			       }); 
				});
			}
	    };
	    return {
	    	init : function(ttable) {
	    		ttable.next('.privview-trig-next', function(){
	    			viewOpen(ttable)
	    	    }); // 初始下一个按钮事件
	    	    ttable.prev('.privview-trig-prev', function(){
	    	    	viewOpen(ttable)
	    	    }); // 初始上一个按钮事件
	    	},
	    	view : function(ttable) {
	    		viewOpen(ttable)
	    	}
	    };
	}();
	
	// 用户组
	var usergroup = function(ttable) {
		var url = {
				find : 'user_group_findPageList.json'
		}
		// 用户组
	    var usergrouplist = false;
	    var uid = '';
	    function setUserGroup(opts) { 
	    	var ids = ttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				// 当前选择USER ID
				uid = ids.get(0).value;
				$.getJSON("user_group_findUserList.json", 'id=' + uid, function(data){
					$('#userGropuselect').multiSelect('deselect_all'); 
	    			for(var i=0;i<data.length;i++) {
	    				$('#userGropuselect').multiSelect('select', data[i].sug_groupId);   
	    			}
	    			$("#userGroupModal").modal('show'); 
	    		});
			}
	    }
	    
	    ttable.next('.usergroup-trig-next', function(){
	    	var opts = $("#userGropuselect").get(0).options;
	    	setUserGroup(opts); 
	    }); // 初始下一个按钮事件
	    ttable.prev('.usergroup-trig-prev', function(){
	    	var opts = $("#userGropuselect").get(0).options;
	    	setUserGroup(opts); 
	    }); // 初始上一个按钮事件
	    
	    return {
	    	find : function() {
	    		// 是否初始
	        	var opts = $("#userGropuselect").get(0).options;
	        	if(usergrouplist==false) {
	        		$.getJSON(url.find, "rows=0", function(data){
	        			for(var i=0;i<data.data.length;i++) {
	        				opts.add(new Option(data.data[i].sug_groupName, data.data[i].sug_groupId)); 
	        			}
	        			$('#userGropuselect').multiSelect(); 
	        			setUserGroup(opts); 
	        		});
	        		usergrouplist = true;
	        	}else {
	        		setUserGroup(opts);
	        	}
	    	}
	    };
	};
	
	// 执行初始
    user.init();
    
    // 功能按钮事件绑定
    // 查询
    $("#findSysUser").bind('click', function() {
    	user.query();
	});
    $("#addSysUser").bind('click', function(){
    	user.addOpen();
    });
    $("#updateSysUser").bind('click', function(){
    	user.updateOpen();
    });
    $("#deleteSysUser").bind('click', function(){
    	user.del();
    });
    $(".LockedYes").bind('click', function(){ 
    	user.lockedYes();
    });
    $(".LockedNo").bind('click', function(){
    	user.lockedNo();
    });
    
    // 密码修改
    var userpwd = new userpwd(user.getTable(), user.getTableRows());
    userpwd.init();
    $(".updatePassword").bind('click', function(){
    	userpwd.windowOpen();
    });
    
    // 角色编辑
    var userrole = new userrole(user.getTable());
    $(".findUserRole").bind('click', function(){
    	userrole.windowOpen();
    });
    // 角色保存
    $("#roelSaveBtn").bind('click', function(data){
    	userrole.save();
    });
    // 角色查询
    $("#findSysRole").bind('click', function(data){
    	userrole.query($("#srolename").val());
    });
    
    // 设置权限
    var usersetpriv = new usersetpriv(user.getTable());
    $(".findSysUserPrivlegeDef").bind('click', function(){
    	usersetpriv.find();
    });
    $("#privSaveBtn").bind('click', function(){
    	usersetpriv.save();
    });
    
    // 权限查看
    userviewpriv.init(user.getTable());
    $(".viewSysUserPrivlegeDef").bind('click', function(){
    	userviewpriv.view(user.getTable());
    });
    
    // 用户组查看
    var usergroup = new usergroup(user.getTable());
    $(".findUserGroup").bind('click', function(){
    	usergroup.find();
    });
    
    // 日志
    $(".findSysLogs").bind('click', function(){
    	var ids = user.getTable().getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var id = ids.get(0).value;
    		CLOUD.LOG.openLogs(id); 
    	}
    });
});