$(function(){
	var sysFunctionlog = {};
	sysFunctionlog.url = {};
	sysFunctionlog.url.get = 'function_log_find.json';
	sysFunctionlog.url.del = 'function_log_delete.json';
	sysFunctionlog.url.find = 'function_log_findPageList.json';
	sysFunctionlog.url.dels = 'function_log_deletes.json';
	
	var st = '';
	var et = '';
	var ttable = undefined;
	// 日期选择
	CLOUD.daterangepicker("dashboard-report-range", function(start, end){
		st = start.format("YYYY-MM-DD");
		et = end.format("YYYY-MM-DD");
		if(ttable) {
			var un = $('#sfl_username').val();
	    	ttable.query({ 
	    		su_userName: un,
				startTime: st,
				endTime: et 
				});
		}
	});
	
	var tablerows = []; 
    var table = $('#trig-function-log-table');
    // begin first table
    ttable = new CLOUD.Datatable({
    		table : table, 
    		url : sysFunctionlog.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sfl_functionLogId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sfl_functionLogId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "su_userName", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.sfl_functionLogId+'"></span> ' + data;
    		                 } },
    		                 { "data": "su_realName", "className" : "hidden-xs"},  
    		                 { "data": "sfl_logModule" , "render": function(data, type, row, mete){
    		                	 return data + (row.moduleName ?  "(" + row.moduleName + ")" : "");
    		                 }}, 
    		                 { "data": "sfl_logFunction" , "render": function(data, type, row, mete){
			                	 return data + (row.functionName ?  "(" + row.functionName + ")" : "");
			                 }},
    		                 { "data": "sfl_status" , "className" : "hidden-xs"},
    		                 { "data": "sfl_createTime" , "className" : "hidden-xs"}
    		],
    		queryParams:{
    			startTime: st,
    			endTime: et 
    		},
    		order: [[6,'desc']]
    });

    // 查询
    $("#findSysFunctionLog").bind('click', function() {
		var un = $('#sfl_username').val();
    	ttable.query({ 
    		su_userName: un,
			startTime: st,
			endTime2: et
			}); 
	});
    
    // 高级查询
    CLOUD.search('sys_function_log', $("#findSysFunctionLog"), ttable);  
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">姓名：</div></td><td>' + (rowData.su_realName ? rowData.su_realName:'') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">方法：</div></td><td>' + rowData.sfl_logMethod + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">成功状态：</div></td><td>' + rowData.sfl_status + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sfl_createTime + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">IP：</div></td><td>' + rowData.sfl_ip + '</td></tr>';
        sOut += '</table>';
        return  sOut;
    });
    
    // 删除
    $("#deleteSysFunctionLog").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(sysFunctionlog.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    $("#deletesSysFunctionLog").bind('click', function(){
    	CLOUD.isDels(function(){
			var un = $('#sfl_username').val();
			st = st?st:'';et = et?et:'';un = un?un:'';
			var para = "startTime=" + st + "&endTime2=" + et + "&su_userName=" + un;
			CLOUD.trackPost(sysFunctionlog.url.dels,para,function(data){
					ttable.reload();
			});
		});
    });
    
});