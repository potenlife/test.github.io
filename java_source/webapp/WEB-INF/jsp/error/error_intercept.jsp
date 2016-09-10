<%@ page contentType="text/html;charset=UTF-8" %><%com.cloud.poten.result.Result rs = (com.cloud.poten.result.Result)request.getAttribute("rs");
	int errorCode = rs.getErrorCode();
	String msg = rs.getMessage() == null ? "" : rs.getMessage();%>
<div>
	<%=errorCode %>：<span id="msg">系统错误，请重试！</span>
</div>
<script type="text/javascript">
<!--
		msg = '<%=msg%>';
		if(<%=errorCode %> == -2) {
			location.href = '<%=request.getContextPath()%>/login.htm';
		}
		if(msg!='') {
			document.getElementById("msg").innerHTML = msg;
		} else {
			if(CLOUD.ERRORCODES) {
				document.getElementById("msg").innerHTML = CLOUD.ERRORCODES[<%=errorCode %>]; 
			}
		}
//-->
</script>
