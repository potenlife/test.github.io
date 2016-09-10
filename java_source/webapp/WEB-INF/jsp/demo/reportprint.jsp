<%@ page contentType="text/html;charset=UTF-8" %>
<%
	Object pdfurl1 = request.getAttribute("pdfURL");
	String pdfurl = (String)pdfurl1; 
	String path = request.getContextPath()+pdfurl; 
%>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<div>
	<iframe id="print" src="<%=path%>" width="100%" height="100%" frameborder="0"></iframe>
</div>
