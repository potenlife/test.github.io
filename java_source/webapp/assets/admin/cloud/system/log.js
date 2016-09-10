$(function(){
	var syslog = {};
	syslog.url = {};
	syslog.url.get = 'log_find.json';
	syslog.url.del = 'log_delete.json';
	syslog.url.find = 'log_findPageList.json';
	syslog.url.dels = 'log_deletes.json';
	
	var st = '';
	var et = '';
	var ttable = undefined;
	// 日期选择
	CLOUD.daterangepicker("dashboard-report-range", function(start, end){
		st = start.format("YYYY-MM-DD");
		et = end.format("YYYY-MM-DD");
		if(ttable) {
			var un = $('#sl_username').val();
	    	ttable.query({ 
	    		su_userName: un,
				startTime: st,
				endTime: et
				});
		}
	});
	
	var tablerows = []; 
    var table = $('#trig-log-table');
    // begin first table
    ttable = new CLOUD.Datatable({
    		table : table, 
    		url : syslog.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sl_logId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sl_logId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "su_userName", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.sl_logId+'"></span> ' + data;
    		                 } },
    		                 { "data": "su_realName", "className" : "hidden-xs"},  
    		                 { "data": "sl_logFunction" , "render": function(data, type, row, mete){
			                	 return data + (row.functionName ?  "(" + row.functionName + ")" : "");
			                 }},
    		                 { "data": "sl_status" , "className" : "hidden-xs"},
    		                 { "data": "sl_createTime" , "className" : "hidden-xs"}
    		],
    		queryParams:{
    			startTime: st,
    			endTime: et
    		},
    		order: [[5,'desc']]
    });

    // 查询
    $("#findSysLog").bind('click', function() {
		var un = $('#sl_username').val();
    	ttable.query({ 
    		su_userName: un,
			startTime: st,
			endTime2: et
			}); 
	});
    
    // 高级查询
    CLOUD.search('sys_log', $("#findSysLog"), ttable);  
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
   	sOut += '<tr><td><div class="trig-more-content">记录ID：</div></td><td>' + rowData.sl_recordId + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">姓名：</div></td><td>' + (rowData.su_realName ? rowData.su_realName:'') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' + (rowData.sl_description ? rowData.sl_description : '') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">提交数据：</div></td><td>' + rowData.sl_data + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">成功状态：</div></td><td>' + rowData.sfl_status + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sfl_createTime + '</td></tr>';
        
        sOut += '</table>';
        return  sOut;
    });
    
    // 删除
    $("#deleteSysLog").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(syslog.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    $("#deletesSysLog").bind('click', function(){
    	CLOUD.isDels(function(){
			var un = $('#sl_username').val();
			st = st?st:'';et = et?et:'';un = un?un:'';
			var para = "startTime=" + st + "&endTime2=" + et + "&su_userName=" + un;
			CLOUD.trackPost(syslog.url.dels,para,function(data){
					ttable.reload();
			});
			
		});
    });
    
});