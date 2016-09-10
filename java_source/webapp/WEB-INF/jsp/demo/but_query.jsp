<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoQueryBut"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoQueryBut"/>  
</div>

<div class="row">
	<div class="col-md-12">
		<div id="dd"></div>
	</div>
</div>

<script>
$(function() {
	// 查询的表格对象，高级查询就是对表格对象增加更多的自定义查询条件
	var ttable = null;
	// $("#dd") 高级查询按钮跟随在哪个ID元素后面
	CLOUD.search('sys_user', $("#dd"), ttable); 
});
</script>