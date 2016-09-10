$(function(){
	var sysErrorCode = {};
	sysErrorCode.url = {};
	sysErrorCode.url.add = 'error_code_add.json';
	sysErrorCode.url.update = 'error_code_update.json';
	sysErrorCode.url.del = 'error_code_delete.json';
	sysErrorCode.url.find = 'error_code_findPageList.json';
	sysErrorCode.url.updateJS = 'error_code_updateJS.json';
	
	var tablerows = []; 
    var table = $('#trig-error-code-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysErrorCode.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sec_codeId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sec_codeId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sec_codeId"},
    		                 { "data": "sec_msg" }, 
    		                 { "data": "sec_createTime" }
    		],
    		order: [[1,'asc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			// 是否有修改权限
    	    	if(CLOUD.isPrivlege("updateSysErrorCode")) { 
    	    		showUpdate();
    	    	}
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    // 查询
    $("#findSysErrorCode").bind('click', function() {
    	ttable.query({ sec_codeId : $("#errorcode").val()}); 
	});
    
    // 高级查询
    CLOUD.search('sys_error_code', $("#findSysErrorCode"), ttable);  
    
    // 新增浮层初始
    $("#addSysErrorCode").bind('click', function(){
    	CLOUD.formreset($("#errorCodeEditform"));
    	CLOUD.hidePrveNext();
    	$("#sec_codeId").attr('readonly', false);
    	$("#errorCodeEditModal").modal('show'); 
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
			CLOUD.forminit($("#errorCodeEditform"), data);
			$("#isupdate").val('Y');
			$("#sec_codeId").attr('readonly', true);
			$("#errorCodeEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysErrorCode").bind('click', function(){
    	showUpdate();
    });
    // 是否点击保存&关闭
    var saveclose = false;
    CLOUD.FormValidate("sys_error_code", "errorCodeEditform",  function (form) {
		var _url = sysErrorCode.url.add;
		var isadd = true;
		if($("#isupdate").val()!='') {
			_url = sysErrorCode.url.update; 
			isadd = false; 
		}
		CLOUD.trackPost(_url, $(form).serialize(), function(data){
			if(isadd == true) {
				CLOUD.formreset($("#errorCodeEditform")); 
			}
			// 保存&关闭
			if(saveclose) {
				$("#errorCodeEditModal").modal('hide'); 
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
	$("#errorCodeEditModal").on("hidden", function(){   
		ttable.reload();
		saveclose = false; 
	});
	
	// 删除
	$("#deleteSysErrorCode").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysErrorCode.url.del, "ids=" + ids, function(data){
				ttable.reload();
			});
		});
	});
	
	// 生成JS
	$("#updateSysErrorCodeJS").bind('click', function(){
			CLOUD.progress();
			$.post(sysErrorCode.url.updateJS,'', function(data){
				CLOUD.progressClose();
				data = CLOUD.successHandle(data);
				if(data.success==true) {
					CLOUD.messager.alert("生成成功");
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
    
});