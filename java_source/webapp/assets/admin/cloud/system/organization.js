$(function(){
	var pid = "2"; //组织结构顶级ID，系统分配
	var organization = {};
	organization.url = {};
	organization.url.add = 'organization_add.json';
	organization.url.update = 'organization_update.json';
	organization.url.del = 'organization_delete.json';
	organization.url.find = 'organization_findList.json';
	organization.url.tree = 'organization_findTree.json';
	organization.url.moveSort = 'organization_moveSort.json';
	organization.url.move = 'organization_move.json';
	organization.url.sorts = 'organization_updateSorts.json';
	organization.url.updateSort = 'organization_updateSort.json';
	var movesortno = 3;
	
	$('#org_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return organization.url.tree;
                },
                'data' : function (node) {
                  return { 'id' : node&&node.id!='#'?node.id:'' };
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

    var tablerows = []; 
    var table = $('#trig-organization-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : organization.url.find, 
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.so_organizationId] = row;
					   // 第一列checkbox
						return '<input type="checkbox" class="checkboxes" value="'+row.so_organizationId+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "so_organizationName", "render":function(data,type,row,mete){
		                	 return '<span class="row-details row-details-close" dataid="'+row.so_organizationId+'"></span> ' + data;
		                 } },
		                 { "data": "so_organizationNo" },
		                 { "data": "so_sortNo"},  
		                 { "data": "so_state" , "render": function(value) {
		                	 return CLOUD.getYesNoHtml(value);
		                 }}
		],
		order: [[3,'asc']], 
		queryParams:{ cid: pid },
		dblclick : function() {   // 双击打开编辑浮层
			// 是否有修改权限
	    	if(CLOUD.isPrivlege("updateSysOrganization")) {
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
	 			if(rowData.so_sortNo > moveData.so_sortNo) {
	 				moveid = nextid;
	 			}
	 			if(moveid)
		 			CLOUD.trackPost(organization.url.moveSort,'id=' + id + '&moveId=' + moveid, function(data){
							ttable.reload();
							refreshtree();
					});
			}
		} 
    });
    
    $('#org_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	ttable.query({cid: pid});   
        return false;
    });
    
    // 移动&修改排序
    $( "#org_tree" ).on('move_node.jstree', function(e, data){
    	if(data.parent == '#') {
    		return false;
    	}
        CLOUD.trackPost(organization.url.updateSort, {
        	so_organizationId:data.node.id,
        	so_parentOrganizationId:data.parent,
        	so_sortNo: data.position+1
        }, function(data){
			ttable.reload();
		});
     });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    $("#org_tree_reload").bind('click', function(){ 
    	$('#org_tree').jstree('refresh_node', {id: '2'});   
    });
    
    function refreshtree() {
    	$('#org_tree').jstree('refresh_node', {id: pid}); 
    }

    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">类别：</div></td><td>' + (rowData.so_type ? $("option[value='" + rowData.so_type + "']").text() : '') + '</td></tr>';   
        sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' + rowData.so_description + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.so_createTime + '</td></tr>'; 
        sOut += '</table>';
        return  sOut;
    });
    
    $("#org_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    // 编辑
    // 初始类别选择框 
    CLOUD.dict.setSelectByNO('so_type','ORGANIZATION_TYPE'); 
    // 新增
    $("#addSysOrganization").bind('click',function(){
    	CLOUD.formreset($("#orgEditform"));
    	CLOUD.hidePrveNext();
    	$("#so_parentOrganizationId").val(pid);
    	$("#orgEditModal").modal('show');
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
			CLOUD.forminit($("#orgEditform"), data);
			$("#orgEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysOrganization").bind('click', function(){
    	showUpdate();
    });
    
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_organization", "orgEditform",  function (form) {
			var _url = organization.url.add;
			var isadd = true;
			if($("#so_organizationId").val()!='') {
				_url = organization.url.update;
				isadd = false;
			}
			CLOUD.trackPost(_url, $(form).serialize(), function(data){
				//ttable.reload();
				if(isadd == true) {
					CLOUD.formreset($("#orgEditform")); 
					$("#so_parentOrganizationId").val(pid);
				}
				if(saveclose) {
					$("#orgEditModal").modal('hide');  
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
    $("#orgEditModal").on('hidden', function(){
    	ttable.reload();
    	saveclose = false;
    });
    
    // 删除
    $("#deleteSysOrganization").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(organization.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    // 角色
    var roleMultiSelect = null;
    // 当前选择ORG ID
    var orgid = '';
    function setOrgRole(opts) { 
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			orgid = ids.get(0).value;
			$.getJSON("organization_role_findList.json", "sor_organizationId="+orgid, function(data){
				var datas = [];
    			for(var i=0;i<data.rows.length;i++) {
    				datas.push({id:data.rows[i].sor_roleId, name:data.rows[i].sr_roleName});      
    			}
    			roleMultiSelect.select(datas);
    			$("#orgRoeModal").modal('show'); 
    		});
		}
    }
    
    $(".findSysOrganizationRole").bind('click', function(){
    	// 是否初始
    	if(roleMultiSelect != null) {
    		setOrgRole(); 
    	} else {
			$.getJSON("organization_role_findRole.json", "", function(data){ 
				var datas = [];
				for(var i=0;i<data.rows.length;i++) {
					datas.push({id: data.rows[i].sr_roleId, name: data.rows[i].sr_roleName});
				}
				roleMultiSelect = new CLOUD.multiSelect('orgroleselect', datas);  
				setOrgRole(); 
			});
    	}
    });
    // 角色保存
    $("#orgRoelSaveBtn").bind('click', function(data){
    	$.post('organization_role_deletes.json','sor_organizationId=' + orgid ,function(data) { 
    		var roles = roleMultiSelect.val();
			if(roles) {
				$.post('organization_role_addRole.json', 'id='+orgid+'&ids=' + roles, function(data2){  
					data2 = CLOUD.successHandle(data2);
					if(data2.success) {
						CLOUD.updateSuccessAlert(); 
						$("#orgRoeModal").modal('hide');  
					}
				});
			}else {
				CLOUD.updateSuccessAlert();
				$("#orgRoeModal").modal('hide'); 
			}
    	});
    });
    // 角色查询
    $("#findSysRole").bind('click', function() {
    	var name = $("#srolename").val();
    	roleMultiSelect.query(name);
    });
    
    ttable.next('.role-trig-next', function(){
    	setOrgRole();
    }); 
    ttable.prev('.role-trig-prev', function(){
    	setOrgRole();
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
    $(".moveSysOrganization").bind('click', function(){
    	CLOUD.trackPost(organization.url.sorts,"id=" + pid, function(data){
				refreshtree();
				ttable.reload(); 
		});
    });
    
    // 移动
    CLOUD.move({
    	url: organization.url.moveSort,
    	ttable:ttable,
    	sort:movesortno,
    	obj:{
    		table: table,
    		up:$(".orgUp"),
    		down:$(".orgDown"),
    		top:$(".orgTop"),
    		bottom:$(".orgBottom")
    	}
    }, function(){
    	refreshtree();
    });
    // 移动到...
    $(".orgMove").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		
			// 初始组织机构
			$.getJSON('organization_findSelectList.json', '', function(data) {
		 		var o = $("#orgmoveselect").get(0).options;
		 		o.length = 1;  
		 		for(var i=0;i<data.length;i++) {
		 			o.add(new Option(data[i].so_organizationName, data[i].so_organizationId));
		 			
		 		}
			});
    			 
    		$("#moveorganizationname").text( tablerows[ids.get(0).value].so_organizationName); 
    		$("#orgMoveModal").modal('show');
    	}
    });
     
    $("#moveSave").bind('click', function(){
    	var ids = ttable.getCheckbox();
    	var selfid = ids.val();
    	var moveId = $("#orgmoveselect").val();
    	if(moveId) {
	    	if(selfid==moveId) {
				CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.SORT.NOTMOVE);
				return false;
			}
	    	CLOUD.trackPost(organization.url.move,'id=' + selfid + "&moveId=" + moveId,function(data){
					ttable.reload();
					$('#org_tree').jstree('refresh_node', {id: '2'});   
					$("#orgmoveselect").val('');
					$("#orgMoveModal").modal('hide'); 
			});
    	}
    });
    
});