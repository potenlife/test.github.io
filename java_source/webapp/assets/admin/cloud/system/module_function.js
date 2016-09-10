$(function(){
	var modulefunction = {};
	modulefunction.url = {};
	modulefunction.url.add = 'module_function_add.json';
	modulefunction.url.update = 'module_function_update.json';
	modulefunction.url.del = 'module_function_delete.json';
	modulefunction.url.find = 'module_function_findList.json';
	modulefunction.url.tree = 'module_findTree.json';
	modulefunction.url.move = 'module_function_move.json';
	modulefunction.url.sorts = 'module_function_updateSorts.json';
	
	// 左菜单树
	$('#module_function_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return modulefunction.url.tree;
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
        "plugins" : ["state", "types" ]
    });
	
	var pid = "0"; 
	var tablerows = []; 
    var table = $('#trig-module-function-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : modulefunction.url.find, 
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.smf_functionId] = row;
						return '<input type="checkbox" class="checkboxes" value="'+row.smf_functionId+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "smf_functionName", "render":function(data,type,row,mete){
		                	 return '<span class="row-details row-details-close" dataid="'+row.smf_functionId+'"></span> ' + data;
		                 }, "orderable": false },
		                 { "data": "smf_functionPrivDef" , "orderable": false },
		                 { "data": "smf_sortNo", "orderable": false}
		],
		queryParams:{ id: pid },
		order: [[3,'asc']], 
		dblclick : function() {   // 双击打开编辑浮层
			// 是否有修改权限
	    	if(CLOUD.isPrivlege("updateSysModuleFunction")) {
	    		showUpdate();
	    	}
		} 
    });;
    
    $('#module_function_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	if(pid=='#') pid="0";
    	ttable.query({id: pid});   
        return false;
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    $("#module_function_tree_reload").bind('click', function(){ 
    	$('#module_function_tree').jstree('refresh_node', {id: '0'});   
    });
    
    function refreshtree() {
    	$('#module_function_tree').jstree('refresh_node', {id: pid}); 
    }
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' + rowData.smf_description + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.smf_createTime + '</td></tr>'; 
        sOut += '</table>';
        return  sOut;
    });
    
    $("#module_function_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    // 新增
    $("#addSysModuleFunction").bind('click',function(){
    	CLOUD.formreset($("#module_functionEditform"));
    	CLOUD.hidePrveNext();
    	$("#smf_moduleId").val(pid);
    	$("#module_functionEditModal").modal('show');
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
			CLOUD.forminit($("#module_functionEditform"), data);
			$("#module_functionEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysModuleFunction").bind('click', function(){
    	showUpdate();
    });
    
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_module_function", "module_functionEditform",  function (form) {
			var _url = modulefunction.url.add;
			var isadd = true;
			if($("#smf_functionId").val()!='') {
				_url = modulefunction.url.update;
				isadd = false;
			}
			CLOUD.trackPost(_url, $(form).serialize(), function(data){
				//ttable.reload();
				if(isadd == true) {
					CLOUD.formreset($("#module_functionEditform")); 
					$("#smf_moduleId").val(pid);
				}
				if(saveclose) {
					$("#module_functionEditModal").modal('hide');  
				} 
				refreshtree();
				CLOUD.updateSuccessAlert(); 
			});
			return false;
    });
    $(".cloudsaveclose").bind('click', function(){
    	saveclose = true; 
    }); 
    // 关闭编辑浮层刷新列表 
    $("#module_functionEditModal").on('hidden', function(){
    	ttable.reload();
    	saveclose = false;
    });
    
    // 删除
    $("#deleteSysModuleFunction").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(modulefunction.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    // 角色
    var rolelist = false;
    // 当前选择module ID
    var module_functionid = '';
    function setModuleFunctionRole(opts) { 
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			module_functionid = ids.get(0).value;
			var def = tablerows[module_functionid].smf_functionPrivDef;
			$.getJSON("role_privlege_def_role.json", "id="+def, function(data){
				$('#module_functionroleselect').multiSelect('deselect_all');  
    			for(var i=0;i<data.rows.length;i++) {
    				$('#module_functionroleselect').multiSelect('select', data.rows[i].sr_roleId);      
    			}
    			$("#module_functionRoeModal").modal('show'); 
    		});
		}
    }
    
    $(".findRolePrivlegeDef").bind('click', function(){
    	// 是否初始
    	var opts = $("#module_functionroleselect").get(0).options;
    	if(rolelist==false) {
    		$.getJSON("role_privlege_def_otherRole.json", "", function(data){ 
    			for(var i=0;i<data.rows.length;i++) {
    				opts.add(new Option(data.rows[i].sr_roleName, data.rows[i].sr_roleId));  
    			}
    			$('#module_functionroleselect').multiSelect();  
    			setModuleFunctionRole(opts); 
    		});
    		rolelist = true;
    	}else { 
    		setModuleFunctionRole(opts);
    	}
    	
    });
    // 角色保存
    $("#module_functionRoelSaveBtn").bind('click', function(data){
    	var def = tablerows[module_functionid].smf_functionPrivDef;
    	$.post('role_privlege_def_deletes.json','srpd_rolePrivlegeDef=' + def ,function(data) { 
    		var roles = $("#module_functionroleselect").val();
			if(roles) {
				$.post('role_privlege_def_addOne.json', 'type=0&id='+def+'&ids=' + roles, function(data2){  
					data2 = CLOUD.successHandle(data2);
					if(data2.success) {
						CLOUD.updateSuccessAlert(); 
						$("#module_functionRoeModal").modal('hide');  
					}
				});
			}else {
				CLOUD.updateSuccessAlert();
				$("#module_functionRoeModal").modal('hide'); 
			}
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
    
    // 重置排序
    $(".moveSysModuleFunction").bind('click', function(){
    	CLOUD.trackPost(modulefunction.url.sorts,"id=" + pid, function(data){
				refreshtree();
				ttable.reload(); 
		});
    });
    
    // 移动
    CLOUD.move({
    	url: modulefunction.url.move,
    	ttable:ttable,
    	sort:3,
    	obj:{
    		table: table,
    		up:$(".module_functionUp"),
    		down:$(".module_functionDown"),
    		top:$(".module_functionTop"),
    		bottom:$(".module_functionBottom")
    	}
    }, function(){
    	refreshtree();
    });
    
});