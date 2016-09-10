$(function(){
	var loginToken = {};
	loginToken.url = {};
	loginToken.url.get = 'login_token_find.json';
	loginToken.url.del = 'login_token_delete.json';
	loginToken.url.find = 'login_token_findPageList.json';
	loginToken.url.dels = 'login_token_deletes.json';
	
	var st = '';
	var et = '';
	var ttable = undefined;
	// 日期选择
	CLOUD.daterangepicker("dashboard-report-range", function(start, end){
		st = start.format("YYYY-MM-DD");
		et = end.format("YYYY-MM-DD");
		if(ttable) {
			var un = $('#slt_username').val();
	    	ttable.query({ 
	    		su_userName: un,
				startTime: st,
				endTime2: et
				});
		}
	});
	
	var tablerows = []; 
    var table = $('#trig-login-token-table');
    // begin first table
    ttable = new CLOUD.Datatable({
    		table : table, 
    		url : loginToken.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.slt_tokenId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.slt_tokenId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "su_userName", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.slt_tokenId+'"></span> ' + data;
    		                 } },
    		                 { "data": "su_realName"},  
    		                 { "data": "slt_loginTime" }, 
    		                 { "data": "slt_endTime" },
    		                 { "data": "slt_loginIp" }
    		],
    		queryParams:{
    			startTime: st,
    			endTime2: et 
    		},
    		order: [[3,'desc']]
    });

    // 查询
    $("#findSysLoginToken").bind('click', function() {
		var un = $('#slt_username').val();
    	ttable.query({ 
    		su_userName: un,
			startTime: st,
			endTime2: et
			}); 
	});
    
    // 高级查询
    CLOUD.search('sys_login_token', $("#findSysLoginToken"), ttable);  
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var typestr = '';
   	if (rowData.slt_loginType == '1') {
   		typestr = CLOUD.TEXT.LOGIN.type1;
   	} else if(rowData.slt_loginType== '2') {
   		typestr = CLOUD.TEXT.LOGIN.type2;
	}
	else {
		typestr = CLOUD.TEXT.LOGIN.type0;
	}
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">经纬：</div></td><td>' + (rowData.slt_loginLngLat ? rowData.slt_loginLngLat:'') + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">站点：</div></td><td>' + rowData.slt_loginPoint + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">类型：</div></td><td>' + typestr + '</td></tr>';
        sOut += '</table>';
        return  sOut;
    });
    
    // 删除
    $("#deleteSysLoginToken").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(loginToken.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
    });
    
    $("#deletesSysLoginToken").bind('click', function(){
    	CLOUD.isDels(function(){
			var un = $('#slt_username').val();
			st = st?st:'';et = et?et:'';un = un?un:'';
			var para = "startTime=" + st + "&endTime2=" + et + "&su_userName=" + un;
			CLOUD.trackPost(loginToken.url.dels,para,function(data){
					ttable.reload();
			});
			
		});
    });
    
});