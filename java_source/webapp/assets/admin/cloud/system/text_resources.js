$(function(){
	var sysTextResources = {};
	sysTextResources.url = {};
	sysTextResources.url.add = 'text_resources_add.json';
	sysTextResources.url.update = 'text_resources_update.json';
	sysTextResources.url.del = 'text_resources_delete.json';
	sysTextResources.url.dels = 'text_resources_deletes.json';
	sysTextResources.url.find = 'text_resources_findList.json';
	sysTextResources.url.tree = 'text_resources_findTree.json';
	
	var pid = ""; 
	// 左菜单树
	$('#text_resources_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return sysTextResources.url.tree;
                },
                'data' : function (node) {
                  return { 'id' : node&&node.id!='#'?node.id:''}; 
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
    var table = $('#trig-text-resources-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : sysTextResources.url.find, 
		filter: true,
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.str_resourcesId] = row;
						return '<input type="checkbox" class="checkboxes" value="'+row.str_resourcesId+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "str_resourcesNo" },
		                 { "data": "str_resourcesName" },
		                 { "data": "str_createTime" }
		],
		order: [[1,'asc']], 
		dblclick : function() {   // 双击打开编辑浮层
			// 是否有修改权限
	    	if(CLOUD.isPrivlege("updateTextResources")) {
	    		showUpdate();
	    	}
		} 
    });
    
    $('#text_resources_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	ttable.query({sd_dictionaryId: pid});   
        return false;
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    $("#text_resources_tree_reload").bind('click', function(){ 
    	$('#text_resources_tree').jstree('refresh_node', {id: ''});   
    });
    
    function refreshtree() {
    	$('#text_resources_tree').jstree('refresh_node', {id: pid}); 
    }
    
    $("#text_resources_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    // 新增
    $("#addTextResources").bind('click',function(){
		if(pid=='' || pid=='0') {
			CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.SELECT_PLEASE);
			return ;
		}
    	CLOUD.formreset($("#textResourcesEditform"));
    	CLOUD.hidePrveNext();
    	$("#sd_dictionaryId").val(pid);
    	$("#textResourcesEditModal").modal('show');
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
			CLOUD.forminit($("#textResourcesEditform"), data);
			$("#textResourcesEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateTextResources").bind('click', function(){
    	showUpdate();
    });
    
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_text_resources", "textResourcesEditform",  function (form) {
			var _url = sysTextResources.url.add;
			var isadd = true;
			if($("#str_resourcesId").val()!='') {
				_url = sysTextResources.url.update;
				isadd = false;
			}
			CLOUD.trackPost(_url, $(form).serialize(), function(data){
				//ttable.reload();
				if(isadd == true) {
					CLOUD.formreset($("#textResourcesEditform"),  {}); 
				}
				if(saveclose) {
					$("#textResourcesEditModal").modal('hide');  
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
    $("#textResourcesEditModal").on('hidden', function(){
    	ttable.reload();
    	saveclose = false;
    });
    
    // 删除
    $("#deleteTextResources").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysTextResources.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
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
    
});