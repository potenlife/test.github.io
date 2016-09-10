
CLOUD.LOG.tablerows = []; 
CLOUD.LOG.table = $('#trig-log-table');
CLOUD.LOG.ttable = undefined;

CLOUD.LOG.openLogs = function(id) {
	CLOUD.LOG.tablerows = []; 
	if(CLOUD.LOG.ttable == undefined) {
		CLOUD.LOG.ttable = new CLOUD.Datatable({
				table : CLOUD.LOG.table, 
				url : CLOUD.PATH + '/log_findLogList.json', 
				columns : [
								{ "data": null, "render": function(data, type, row, mete){
										CLOUD.LOG.tablerows[row.sl_logId] = row;
										return '<input type="checkbox" class="checkboxes" value="'+row.sl_logId+'"/>';   
								},orderable: false, className: "trig-checkbox"},
				           		 { "data": "su_userName", "render":function(data,type,row,mete){
										return '<span class="row-details row-details-close" dataid="'+row.sl_logId+'"></span> '  + data; 
									}},
				                 { "data": "sl_logFunction" , "render": function(data, type, row, mete){
				                	 return data + (row.functionName ?  "(" + row.functionName + ")" : "");
				                 }},
				                 { "data": "sl_status","render":function(data,type,row,mete){
				                	 return data == 'N' ? '<span style="color:red">' + data + '</span>' : data;
				                 }  },
				                 { "data": "sl_createTime" }
				],
				order: [[4,'desc']],
				queryParams: {id : id}
				//trclick:false  
		});
		// 显示更多字段值
		CLOUD.LOG.ttable.initMore(function(id) {
			 var rowData = CLOUD.LOG.tablerows[id];
			 var sOut = '<div class="col-md-12"><table style="width:100%;">';   
			 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + rowData.sl_logId + '</td></tr>';
		    sOut += '<tr><td><div class="trig-more-content">用户姓名：</div></td><td>' + rowData.su_realName + '</td></tr>';
		    sOut += '<tr><td><div class="trig-more-content">调用方法：</div></td><td>' +rowData.sl_logMethod + '</td></tr>';  
		    sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' +rowData.sl_description + '</td></tr>';  
		    sOut += '<tr><td><div class="trig-more-content">数据：</div></td><td style="max-width:300px;word-break:break-all">' +rowData.sl_data + '</td></tr>';   
		    sOut += '</table></div>'; 
		    return  sOut;
		});
		
		// 比较
		$("#compareSysLog").bind('click', function(){
			var objs = CLOUD.LOG.ttable.getCheckbox();
			var rows = objs.size();
			if(!rows || rows != 2){
				CLOUD.messager.alert('请选择两条记录进行比较！'); 
				return false;
			}
			
			var rowData = CLOUD.LOG.tablerows[objs.get(0).value];
			var rowData2 = CLOUD.LOG.tablerows[objs.get(1).value];
			var jsondata = rowData.sl_data ? eval( "d=" + rowData.sl_data) : {};
			var jsondata2 = rowData2.sl_data ? eval( "d=" + rowData2.sl_data) : {};
			
			CLOUD.LOG.JsonDiff(jsondata, jsondata2);
		}); 
	} else {
		CLOUD.LOG.ttable.query({ id : id});
	}
	$("#sysLogModal").modal('show');
};

CLOUD.LOG.JsonDiff = function(jsondata, jsondata2) {
	// 是否JSON
	var jsonregx = new RegExp("^\{.+?}$");
	var isJsonObj = function(obj){
		var isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length; 
		return isjson;
	};
	var isJson = function(obj) {
		isjson = isJsonObj(obj) || jsonregx.test(obj);
		return isjson;
	}
	var html = '<table style="width:100%;border-right:1px solid #EFEFEF;border-bottom:1px solid #EFEFEF">';
	var tdobjs = [];
	var diff = function(name, jsondata, jsondata2) {
		if(!isJsonObj(jsondata)) {
			eval("jsondata = " + jsondata);
			try{
					eval("jsondata2 = " + jsondata2);
				}catch(e) {
					jsondata2 = {};
			}
		}
		for(var key in jsondata){  
			if(!isJson(jsondata[key])) {
				if(key != 'ADMIN_USER_ID') { // 当前操作员不必比较
					
					var val = jsondata[key] ? jsondata[key] : "";
					var val2 = jsondata2 && jsondata2[key] ?jsondata2[key] : "";
					var tdname = name.replace(".", "_");
					while(tdname.indexOf(".") > 0) {
						tdname = tdname.replace(".", "_");
					}
					tdobjs.push({id:"rdiff"+ tdname + key, text: val});
					tdobjs.push({id:"rdiff"+ tdname + key + "_d2", text: val2});
					html = html + "<tr "+ (val===val2? "" : "style='color:red'") + ">";
					html = html + "<td style='border-left:1px solid #EFEFEF;border-top:1px solid #EFEFEF'>" + name + key + "</td><td style='border-left:1px solid #EFEFEF;border-top:1px solid #EFEFEF' id='rdiff"+ tdname + key +"'></td>";
					html = html + "<td style='border-left:1px solid #EFEFEF;border-top:1px solid #EFEFEF'>" + (val===val2? "=":"<span style='color:red'>!=</span>") + "</td><td style='border-left:1px solid #EFEFEF;border-top:1px solid #EFEFEF' id='rdiff"+ tdname + key +"_d2'></td>"
					html = html + "<td style='border-left:1px solid #EFEFEF;border-top:1px solid #EFEFEF'>" + (val && val.toString().indexOf('\n')>0 ? "<a href='javascript:;' onclick=\"CLOUD.txtDiffByID('rdiff" + tdname + key + "', 'rdiff" + tdname+ key + "_d2');\">行对比</a>" : "&nbsp;") + "</td>";
					html = html + "</tr>";
				}
			} else {
				diff(name + key + ".", jsondata[key], jsondata2 ? jsondata2[key] : {});
			}
		}
	};
	
	diff("", jsondata, jsondata2);
	var html = html +  "</table>";
	$("#compareData").html(html);
	for (var int = 0; int < tdobjs.length; int++) {
		$("#" + tdobjs[int].id).get(0).appendChild(document.createTextNode(tdobjs[int].text));
	}
	$("#compareSysLogModal").modal('show');
};