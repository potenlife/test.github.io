<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	// 绝对路径PATH
	String path = request.getContextPath(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main1" style="height:400px;"></div>
    <script src="<%=path %>/assets/admin/cloud/scripts/cloud-echarts.js"></script>
    <script type="text/javascript">
    	$(function(){
    		var data = '[{"name":"降水量","data":100,"categories":"1月"},{"name":"降水量","data":400,"categories":"2月"},{"name":"降水量","data":100,"categories":"3月"},{"name":"蒸发量","data":200,"categories":"1月"},{"name":"蒸发量","data":300,"categories":"2月"},{"name":"蒸发量","data":150,"categories":"3月"}]';
    		CLOUD.ECharts('main1', '统计', data, 'line');
    	})
    </script>
</body>
</html>