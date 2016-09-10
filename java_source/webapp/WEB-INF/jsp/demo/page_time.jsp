<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoTimePage"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoTimePage"/> 
	<div class="page-toolbar">
		<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height grey-salt" data-placement="top" data-original-title="数据日期范围">
			<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="trig-table"" >
			<div class="portlet-body trig-table-body" >
			
				<table class="table table-striped table-bordered table-hover" id="trig-user-table">
					<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-user-table .checkboxes"/> 
						</th>
						<th>用户名</th>
						<th>姓名</th>
						<th class="hidden-xs">EMAIL</th>
						<th class="hidden-xs">手机</th>    
						<th>禁用</th>
						<th class="hidden-xs trig-th-time">创建时间	</th> 
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
	    var table = $('#trig-user-table');
	    // begin first table
	    var ttable = new CLOUD.Datatable({
	    		table : table, 
	    		url : CLOUD.PATH + '/user_findPageList.json', 
	    		columns : [
	    				   { "data": null, "render": function(data, type, row, mete){
	    					   tablerows[row.su_userId] = row;
	    					   // 第一列checkbox
	    						return '<input type="checkbox" class="checkboxes" value="'+row.su_userId+'"/>';   
	    				   }, orderable: false, className: "trig-checkbox" },
	    		                 { "data": "su_userName", "render":function(data,type,row,mete){
	    		                	 return '<span class="row-details row-details-close" dataid="'+row.su_userId+'"></span> ' + data ;  
	    		                 } },
	    		                 { "data": "su_realName" },
	    		                 { "data": "su_email", "className":"hidden-xs" }, // hidden-xs 小屏幕(手机端)隐藏
	    		                 { "data": "su_mobile", "className":"hidden-xs" },
	    		                 { "data": "su_isLockedOut", "render": function(value) {
	    		                	 return CLOUD.getYesNoHtml(value);
	    		                 } },
	    		                 { "data": "su_createDate", "className":"hidden-xs" }
	    		],
	    		order: [[6,'desc']],
	    		dblclick : function() {  
	    			
	    		},
	    		filter: true 
	    });
	    
	     // 显示更多字段值
	     ttable.initMore(function(id) { 
	    	 var rowData = tablerows[id];
	    	 var sOut = '<table>';
	    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
	         sOut += '<tr><td><div class="trig-more-content">组织机构：</div></td><td>' + (rowData.so_organizationId ? orgs[rowData.so_organizationId] : '') + '</td></tr>';
	         sOut += '<tr><td><div class="trig-more-content">性别：</div></td><td>' + (rowData.su_sex=='M' ? '先生' : rowData.su_sex =='F' ? '女士' : '未知') + '</td></tr>';
	         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">EMAIL：</div></td><td>' + rowData.su_email + '</td></tr>';
	         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">手机：</div></td><td>' + rowData.su_mobile + '</td></tr>';
	         sOut += '<tr class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.su_createDate + '</td></tr>';
	         sOut += '</table>';
	         return  sOut;
	     });
	     
	     CLOUD.daterangepicker("dashboard-report-range", function(start, end){
	 		st = start.format("YYYY-MM-DD");
	 		et = end.format("YYYY-MM-DD");
	 		
	 	});
	});
</script>