$(function(){
	
	var data_recycle_bin = function () {
			// 访问URL定义
			var url = { 
					update : 'data_recycle_bin_recycleBin.json',
					del : 'data_recycle_bin_delete.json',
					delAll : 'data_recycle_bin_deleteAll.json',
					find : 'data_recycle_bin_findPageList.json'
			};
			// 变量定义
			// 列表数据
			var tablerows = [];
			// 表格
			var table = $('#trig-data_recycle_bin-table');
			var ttable = null;
		    
			// 列表初始
			var tableInit = function() {
				ttable = new CLOUD.Datatable({
			    		table : table, 
			    		url :  url.find, 
			    		columns : [
			    				   { "data": null, "render": function(data, type, row, mete){
			    					   tablerows[row.sdrb_dataRecycleBinId] = row;
			    					   // 第一列checkbox
			    						return '<input type="checkbox" class="checkboxes" value="'+row.sdrb_dataRecycleBinId+'"/>';   
			    				   }, orderable: false, className: "trig-checkbox" },
			    		                 { "data": "sdrb_dataName"},
			    		                 { "data": "sdrb_dataType" },
			    		                 { "data": "sdrb_createTime", "className":"hidden-xs" }
			    		],
			    		order: [[3,'desc']]
			    });
			};
			
			return {
				// 查询
				query : function() {
					ttable.query({ su_userName : $("#dataname").val()});
				},
				// 删除
				del : function() {
					var objs = ttable.getCheckbox();
					var rows = objs.size();
					CLOUD.isDelSelectOne(rows,function(){
						var ids = "";
						objs.each(function(){
							ids += this.value + ",";
						});   
						CLOUD.trackPost(url.del, "ids=" + ids, function(data){
							ttable.reload();
						});
					});
				},
				update : function() {
					var objs = ttable.getCheckbox();
					var rows = objs.size();
					if(CLOUD.isSelect(rows)) {
						var ids = "";
						objs.each(function(){
							ids += this.value + ",";
						});   
						CLOUD.trackPost(url.update, "ids=" + ids, function(data){
							ttable.reload();
						});
					}
				},
				delAll: function() {
					CLOUD.messager.confirm("确认清空？","确认清空？",function(r){
					//是否删除	
						if(r) {
							CLOUD.trackPost(url.delAll, function(data){
								ttable.reload();
							});
						}
					});
				},
				init : function() {
					tableInit();
				}
			};
	}(); // 定义并执行
	
	// 执行初始
	data_recycle_bin.init();
	
	$("#findSysDataRecycleBin").bind('click', function() {
		data_recycle_bin.query();
	});
	$("#updateSysDataRecycleBin").bind('click', function(){
		data_recycle_bin.update();
    });
    $("#deleteSysDataRecycleBin").bind('click', function(){
    	data_recycle_bin.del();
    });
    $("#deleteAllSysDataRecycleBin").bind('click', function() {
    	data_recycle_bin.delAll();
    })
});