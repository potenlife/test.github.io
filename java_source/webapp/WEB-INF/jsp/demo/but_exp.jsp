<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoExpBut"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoExpBut"/>  
</div>

<div class="row">
	<div class="col-md-12">
		<div class="btn-group hidden-xs hidden-sm">  
			<button class="btn green dropdown-toggle " data-toggle="dropdown" >导出 <i class="fa fa-angle-down"></i></button>
				<ul class="dropdown-menu pull-right" id="exportSysUser"> 
					
				</ul>
			</div>
			
			<div class="btn-group">
				<button id="expcsv" class="btn green"  >导出CSV</button> 
			</div>
	</div>
</div>

<script>
	$(function(){
		// 需导出的列表表格，导出会以此表格对象的查询为条件。
		var ttable = null;
		CLOUD.initexpHTML('exportSysUser', 'user_export.htm', ttable);
		
		$("#expcsv").bind("click", function(){
			CLOUD.expdata(1, 'user_export.htm', ttable, 0);
		});
	});
</script>