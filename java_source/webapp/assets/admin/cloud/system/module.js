$(function(){
	var sysModule = {};
	sysModule.url = {};
	sysModule.url.add = 'module_add.json';
	sysModule.url.update = 'module_update.json';
	sysModule.url.del = 'module_delete.json';
	sysModule.url.dels = 'module_deletes.json';
	sysModule.url.find = 'module_findList.json';
	sysModule.url.tree = 'module_findTree.json';
	sysModule.url.move = 'module_move.json';
	sysModule.url.moveMenu = 'module_moveMenu.json';
	sysModule.url.sorts = 'module_updateSorts.json';
	sysModule.url.updateSort = 'module_updateSort.json';
	// 左菜单树
	$('#module_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return sysModule.url.tree;
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
        "plugins" : [ "dnd", "state", "types" ]
    });
	var movesortno = 3;
	var pid = "0"; 
	var tablerows = []; 
    var table = $('#trig-module-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : sysModule.url.find, 
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.sm_moduleId] = row;
						return '<input type="checkbox" class="checkboxes" value="'+row.sm_moduleId+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "sm_moduleName", "render":function(data,type,row,mete){
		                	 return '<span class="row-details row-details-close" dataid="'+row.sm_moduleId+'"></span> ' + data;
		                 }, "orderable": false },
		                 { "data": "sm_modulePrivlegeDef" , "orderable": false },
		                 { "data": "sm_sortNo", "orderable": false},  
		                 { "data": "sm_isMenu" , "orderable": false }
		],
		queryParams:{ sm_parentModuleId: pid },
		order: [[3,'asc']], 
		dblclick : function() {   // 双击打开编辑浮层
			// 是否有修改权限
	    	if(CLOUD.isPrivlege("updateSysModule")) {
	    		showUpdate();
	    	}
		} ,
		dnd: {	// 拖动排序
			sort:movesortno,
			onDrop: function(id, previd, nextid){
	 			var moveid = previd;
	 			if(!previd) {
	 				moveid = nextid;
	 			}
	 			var rowData = tablerows[id];
	 			var moveData = tablerows[moveid];
	 			if(rowData.sm_sortNo > moveData.sm_sortNo) {
	 				moveid = nextid;
	 			}
	 			if(moveid)
		 			CLOUD.trackPost(sysModule.url.move,'id=' + id + '&moveId=' + moveid, function(data){
							ttable.reload();
							refreshtree();
					});
			}
		}
    });;
    
    $('#module_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	if(pid=='#') pid="0";
    	ttable.query({sm_parentModuleId: pid});   
        return false;
    });
    
    // 移动&修改排序
    $( "#module_tree" ).on('move_node.jstree', function(e, data){
    	if(data.parent == '#') {
    		return false;
    	}
        CLOUD.trackPost(sysModule.url.updateSort, {
        	sm_moduleId:data.node.id,
        	sm_parentModuleId:data.parent,
        	sm_sortNo: data.position+1
        }, function(data){
			ttable.reload();
		});
     });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    $("#module_tree_reload").bind('click', function(){ 
    	$('#module_tree').jstree('refresh_node', {id: '0'});   
    });
    
    function refreshtree() {
    	$('#module_tree').jstree('refresh_node', {id: pid}); 
    }
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">URL：</div></td><td>' + rowData.sm_url + '</td></tr>';   
        sOut += '<tr><td><div class="trig-more-content">叶子：</div></td><td>' + rowData.sm_isLeaf + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">图标：</div></td><td>' + (rowData.sm_icon ? rowData.sm_icon : '') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">加载类型：</div></td><td>' + rowData.sm_loadWay + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' + rowData.sm_description + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sm_createTime + '</td></tr>'; 
        sOut += '</table>';
        return  sOut;
    });
    
    $("#module_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    // 新增
    $("#addSysModule").bind('click',function(){
    	CLOUD.formreset($("#moduleEditform"));
    	CLOUD.hidePrveNext();
    	$("#sm_parentModuleId").val(pid);
    	$("#moduleEditModal").modal('show');
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
			CLOUD.forminit($("#moduleEditform"), data);
			$("#moduleEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysModule").bind('click', function(){
    	showUpdate();
    });
    
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_module", "moduleEditform",  function (form) {
			var _url = sysModule.url.add;
			var isadd = true;
			if($("#sm_moduleId").val()!='') {
				_url = sysModule.url.update;
				isadd = false;
			}
			CLOUD.trackPost(_url, $(form).serialize(), function(data){
				//ttable.reload();
				if(isadd == true) {
					CLOUD.formreset($("#moduleEditform")); 
					$("#sm_parentModuleId").val(pid);
				}
				if(saveclose) {
					$("#moduleEditModal").modal('hide');  
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
    $("#moduleEditModal").on('hidden', function(){
    	ttable.reload();
    	saveclose = false;
    });
    
    // 删除
    $("#deleteSysModule").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysModule.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
 // 角色
    var rolelist = false;
    // 当前选择module ID
    var moduleid = '';
    function setModuleRole(opts) { 
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			moduleid = ids.get(0).value;
			var def = tablerows[moduleid].sm_modulePrivlegeDef;
			$.getJSON("role_privlege_def_role.json", "id="+def, function(data){
				$('#moduleroleselect').multiSelect('deselect_all');  
    			for(var i=0;i<data.rows.length;i++) {
    				$('#moduleroleselect').multiSelect('select', data.rows[i].sr_roleId);      
    			}
    			$("#moduleRoeModal").modal('show'); 
    		});
		}
    }
    
    $(".findRolePrivlegeDef").bind('click', function(){
    	// 是否初始
    	var opts = $("#moduleroleselect").get(0).options;
    	if(rolelist==false) {
    		$.getJSON("role_privlege_def_otherRole.json", "", function(data){ 
    			for(var i=0;i<data.rows.length;i++) {
    				opts.add(new Option(data.rows[i].sr_roleName, data.rows[i].sr_roleId));  
    			}
    			$('#moduleroleselect').multiSelect();  
    			setModuleRole(opts); 
    		});
    		rolelist = true;
    	}else { 
    		setModuleRole(opts);
    	}
    	
    });
    // 角色保存
    $("#moduleRoelSaveBtn").bind('click', function(data){
    	var def = tablerows[moduleid].sm_modulePrivlegeDef;
    	$.post('role_privlege_def_deletes.json','srpd_rolePrivlegeDef=' + def ,function(data) { 
    		var roles = $("#moduleroleselect").val();
			if(roles) {
				$.post('role_privlege_def_addOne.json', 'type=0&id='+def+'&ids=' + roles, function(data2){  
					data2 = CLOUD.successHandle(data2);
					if(data2.success) {
						CLOUD.updateSuccessAlert(); 
						$("#moduleRoeModal").modal('hide');  
					}
				});
			}else {
				CLOUD.updateSuccessAlert();
				$("#moduleRoeModal").modal('hide'); 
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
    $(".moveSysModule").bind('click', function(){
    	CLOUD.trackPost(sysModule.url.sorts,"id=" + pid, function(data){
				refreshtree();
				ttable.reload(); 
		});
    });
    
    // 移动
    CLOUD.move({
    	url: sysModule.url.move,
    	ttable:ttable,
    	sort:movesortno,
    	obj:{
    		table: table,
    		up:$(".moduleUp"),
    		down:$(".moduleDown"),
    		top:$(".moduleTop"),
    		bottom:$(".moduleBottom")
    	}
    }, function(){
    	refreshtree();
    });
    
    // 移动到...
    var searchm = '';
    $("#modulemoveselect").select2({
        minimumInputLength: 1,   
        placeholder: "请选择父菜单",
         ajax: {  
             url: 'module_findList.json',
             dataType: 'json',
             data: function (term, page) {
            	 searchm = term;
                 return {
                	sm_moduleName: term, 
                 	rows:10
                 };
             },
             results: function (data, page) {
             	var datas = [];
             	if('ROOT'.indexOf(searchm)>-1) {
             		datas.push({id:'0',text:'ROOT'});
             	}
             	for(var i=0;i<data.data.length;i++) {
             		datas.push({id:data.data[i].sm_moduleId,text:data.data[i].sm_moduleName});
             	}
                 return {
                     results: datas 
                 };
             }
         }
     });
    
    
    $(".moduleMove").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var rowDate =  tablerows[ids.val()];
    		$("#movemodulename").text(rowDate.sm_moduleName);
    		$("#moduleMoveModal").modal('show');
    	}
    });
     
    $("#moveSave").bind('click', function(){
    	var ids = ttable.getCheckbox();
    	var selfid = ids.val();
    	var moveId = $("#modulemoveselect").val();
    	if(moveId) {
	    	if(selfid==moveId || moveId==tablerows[selfid].sm_parentModuleId) {
				CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.SORT.NOTMOVE);
				return false;
			}
	    	$.post(sysModule.url.moveMenu,'id=' + selfid + "&moveId=" + moveId,function(data){
				data = CLOUD.successHandle(data);
				if(data.success==true) {
					ttable.reload();
					$('#module_tree').jstree('refresh_node', {id: '0'});   
					$("#modulemoveselect").select2('val','');
					$("#moduleMoveModal").modal('hide'); 
				}
			});
    	}
    });
    
});