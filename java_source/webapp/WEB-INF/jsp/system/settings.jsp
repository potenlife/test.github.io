<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
			<div class="portlet-body " >
				<table class="table table-striped table-bordered table-hover" id="trig-settings-table">
				<thead>
				<tr>
					<th>名称</th>  
					<th>值</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
			</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<script type="text/javascript">
<!--
$(function(){
	new CLOUD.Datatable({
		table : $("#trig-settings-table"), 
		url : 'settings_findList.json', 
		paging:false,
		columns : [
		                 { "data": "name", orderable: false},
		                 { "data": "value" , orderable: false}
		],
		order: [[0,'asc']]
	});
});
//-->
</script>

