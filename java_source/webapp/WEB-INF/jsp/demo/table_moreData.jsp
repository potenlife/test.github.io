<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoTableMoreData"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoTableMoreData"/> 
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="trig-table"" >
			<div class="portlet-body trig-table-body" >
			
				<table class="table table-striped table-bordered table-hover" id="trig-function-log-table">
					<thead>
					<tr>
						<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-function-log-table .checkboxes"/>
					</th>
					<th>用户名</th>  
					<th class="hidden-xs">姓名</th>
					<th>功能</th>
					<th>操作</th>
					<th class="hidden-xs">方法</th>
					<th class="hidden-xs">状态</th>
					<th class="hidden-xs trig-th-time">创建时间</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<div class="trig-bottom"></div> 

<script>
	$(function(){
		var tablerows = []; 
	    var table = $('#trig-function-log-table');
	    // begin first table
	    var ttable = new CLOUD.Datatable({
	    	table : table, 
    		url :  CLOUD.PATH + '/function_log_findPageList.json', 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sfl_functionLogId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.sfl_functionLogId+'"/>';   
    				   }, "orderable": false, "className": "trig-checkbox" },
    		                 { "data": "su_userName", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.sfl_functionLogId+'"></span> ' + data;
    		                 } },
    		                 { "data": "su_realName", "className" : "hidden-xs"},  
    		                 { "data": "sfl_logModule" }, 
    		                 { "data": "sfl_logFunction" },
    		                 { "data": "sfl_logMethod" , "className" : "hidden-xs"},
    		                 { "data": "sfl_status" , "className" : "hidden-xs"},
    		                 { "data": "sfl_createTime" , "className" : "hidden-xs"}
    		],
    		order: [[7,'desc']]
	    });
	    
	 // 显示更多字段值
	    ttable.initMore(function(id) { 
	   	 var rowData = tablerows[id];
	   	 var sOut = '<table>';
	   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
	        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">姓名：</div></td><td>' + (rowData.su_realName ? rowData.su_realName:'') + '</td></tr>';
	        //sOut += '<tr class="visible-xs"><td><div class="trig-more-content">站点：</div></td><td>' + (rowData.name ? rowData.name : '') + '</td></tr>';
	        sOut += '<tr><td><div class="trig-more-content">方法：</div></td><td>' + rowData.sfl_logMethod + '</td></tr>';
	        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">成功状态：</div></td><td>' + rowData.sfl_status + '</td></tr>';
	        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sfl_createTime + '</td></tr>';
	        sOut += '<tr><td><div class="trig-more-content">IP：</div></td><td>' + rowData.sfl_ip + '</td></tr>';
	        sOut += '</table>';
	        return  sOut;
	    });
	    
	});
</script>