<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoChartColumn"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoChartColumn"/>  
</div>

<div class="row">
	<div class="col-md-12">
		<div id="container" style="min-width: 758px; height: 400px; margin: 0 auto"></div>
	</div>
</div>

<script>
	$(function(){
		// DatatableResult<LinkedHashMap> 结果集
		$.post("tools/sqltools_findList.json?sql=select sex, count(*) cc from sys_user group by sex",'rows=0', function(data){
			data = $.parseJSON(data);
			if(data.data.length>0) {
				$("#sqlChartModal").modal('show');
				CLOUD.Chart('container', '用户称谓统计', data, 'bar');
			} else {
				CLOUD.messager.alert("没有数据");
			}
		});
	});
</script>