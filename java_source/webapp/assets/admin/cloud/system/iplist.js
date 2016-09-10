$(function(){
	var sysIpList = {};
	sysIpList.url = {};
	sysIpList.url.add = 'iplist_add.json';
	sysIpList.url.update = 'iplist_update.json';
	sysIpList.url.del = 'iplist_delete.json';
	sysIpList.url.dels = 'iplist_deletes.json';
	sysIpList.url.find = 'iplist_findPageList.json';
	
	var tablerows = []; 
    var table = $('#trig-ip-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysIpList.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sil_listId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sil_listId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sil_ip"},
    		                 { "data": "sil_type", "render":function(value){
    		                	 if(value=='0') { 
    		 						return '白名单';
    		 					}else {
    		 						return '黑名单'; 
    		 					}
    		                 }},  
    		                 { "data": "sil_limitType", "render":function(value){
    		                	 if(value=='0') { 
     		 						return '前端';
     		 					}else if(value=='1') {
     		 						return '后端'; 
     		 					} else {
     		 						return '全部';
     		 					}
     		                 } }, 
    		                 { "data": "sil_createTime" }
    		],
    		order: [[4,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysIpList")) { 
    	    		showUpdate();
    	    	}
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    // 查询
    $("#findSysIpList").bind('click', function() {
    	ttable.query({ sil_ip : $("#sipname").val()}); 
	});
    
    // 高级查询
    CLOUD.search('sys_ip_list', $("#findSysIpList"), ttable);    
    
    // 新增浮层初始
    $("#addSysIpList").bind('click', function(){
    	CLOUD.formreset($("#ipEditform"));
    	CLOUD.hidePrveNext();
    	$("#ipEditModal").modal('show'); 
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
			CLOUD.forminit($("#ipEditform"), data);
			$("#ipEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysIpList").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    CLOUD.FormValidate("sys_ip_list", "ipEditform",  function (form) {
		var _url = sysIpList.url.add;
		var isadd = true;
		if($("#sil_listId").val()!='') {
			_url = sysIpList.url.update; 
			isadd = false; 
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data){
			if(isadd == true) {
				CLOUD.formreset($("#ipEditform")); 
			}
			// 保存&关闭
			if(saveclose) {
				$("#ipEditModal").modal('hide'); 
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
	$("#ipEditModal").on("hidden", function(){   
		ttable.reload();
		saveclose = false; 
	});
	
	// 删除
	$("#deleteSysIpList").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysIpList.url.del, "ids=" + ids, function(data){
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