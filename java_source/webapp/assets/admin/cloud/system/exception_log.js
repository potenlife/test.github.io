$(function(){
	var sysExceptionLog = {};
	sysExceptionLog.url = {};
	sysExceptionLog.url.get = 'exception_log_find.json';
	sysExceptionLog.url.del = 'exception_log_delete.json';
	sysExceptionLog.url.find = 'exception_log_findPageList.json';
	sysExceptionLog.url.dels = 'exception_log_deletes.json';
	
	var st = '';
	var et = '';
	var ttable = undefined;
	// 日期选择
	CLOUD.daterangepicker("dashboard-report-range", function(start, end){
		st = start.format("YYYY-MM-DD");
		et = end.format("YYYY-MM-DD");
		if(ttable) {
			var un = $('#sel_className_q').val();
	    	ttable.query({ 
	    		sel_className: un,
				startTime: st,
				endTime: et
				});
		}
	});
	
	var tablerows = []; 
    var table = $('#trig-exception-log-table');
    // begin first table
    ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysExceptionLog.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sel_exceptionId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sel_exceptionId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sel_className", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.sel_exceptionId+'"></span> ' + data;
    		                 } },
    		                 { "data": "sel_methodName" , "className" : "hidden-xs"},
    		                 { "data": "sel_createTime" , "className" : "hidden-xs"}
    		],
    		queryParams:{
    			startTime: st,
    			endTime: et
    		},
    		order: [[3,'desc']]
    });

    // 查询
    $("#findSysExceptionLog").bind('click', function() {
		var un = $('#sel_className_q').val();
    	ttable.query({ 
    		sel_className: un,
			startTime: st,
			endTime2: et
			}); 
	});
    
    // 高级查询
    CLOUD.search('sys_exception_log', $("#findSysExceptionLog"), ttable);  
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">方法：</div></td><td>' + (rowData.sel_methodName ? rowData.sel_methodName : '') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">异常：</div></td><td>' + rowData.sel_exceptionInfo + '</td></tr>';
        sOut += '<tr ><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sel_createTime + '</td></tr>';
        
        sOut += '</table>';
        return  sOut;
    });
    
    // 删除
    $("#deleteSysExceptionLog").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysExceptionLog.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    $("#deletesSysExceptionLog").bind('click', function(){
    	CLOUD.isDels(function(){
			var un = $('#sel_className_q').val();
			st = st?st:'';et = et?et:'';un = un?un:'';
			var para = "startTime=" + st + "&endTime2=" + et + "&sel_className=" + un;
			CLOUD.trackPost(sysExceptionLog.url.dels,para,function(data){
					ttable.reload();
			});
			
		});
    });
    
});