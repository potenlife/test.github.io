$(function(){
	var sysIcon = {};
	sysIcon.url = {};
	sysIcon.url.add = 'icon_add.json';
	sysIcon.url.update = 'icon_update.json';
	sysIcon.url.del = 'icon_delete.json';
	sysIcon.url.dels = 'icon_deletes.json';
	sysIcon.url.find = 'icon_findPageList.json';
	
	var tablerows = []; 
    var table = $('#trig-icon-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysIcon.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.si_iconId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.si_iconId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "si_className"},
    		                 { "data": "si_iconPath", "render":function(value){
    		                	 if(value=='1') { //系统
    		 						return CLOUD.TEXT.OTHER.typesys;
    		 					}else {
    		 						return CLOUD.TEXT.OTHER.typeuser; //自定义
    		 					}
    		                 }},  
    		                 { "data": "si_iconType" }, 
    		                 { "data": "si_createTime" }
    		],
    		order: [[4,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysIcon")) { 
    	    		showUpdate();
    	    	}
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    // 查询
    $("#findSysIcon").bind('click', function() {
    	ttable.query({ si_className : $("#siconname").val()}); 
	});
    
    // 高级查询
    CLOUD.search('sys_icon', $("#findSysIcon"), ttable);  
    
    // 新增浮层初始
    $("#addSysIcon").bind('click', function(){
    	CLOUD.formreset($("#iconEditform"));
    	CLOUD.hidePrveNext();
    	$("#iconEditModal").modal('show'); 
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
			CLOUD.forminit($("#iconEditform"), data);
			$("#iconEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysIcon").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    CLOUD.FormValidate("sys_icon", "iconEditform",  function (form) {
		var _url = sysIcon.url.add;
		var isadd = true;
		if($("#si_iconId").val()!='') {
			_url = sysIcon.url.update; 
			isadd = false; 
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data){
			if(isadd == true) {
				CLOUD.formreset($("#iconEditform")); 
			}
			// 保存&关闭
			if(saveclose) {
				$("#iconEditModal").modal('hide'); 
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
	$("#iconEditModal").on("hidden", function(){   
		ttable.reload();
		saveclose = false; 
	});
	
	// 删除
	$("#deleteSysIcon").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysIcon.url.del, "ids=" + ids, function(data){
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
    
});