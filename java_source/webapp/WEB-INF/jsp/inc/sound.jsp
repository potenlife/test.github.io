<%@ page contentType="text/html;charset=UTF-8" %>
<%-- 消息声音提示,HTML5 --%>
 <div style="display:none;"> 
 <audio controls="controls"  id="ohoh_mp3">
  	<source src="<%=request.getContextPath() %>/assets/admin/cloud/sound/ohoh.mp3" type="audio/mpeg">
  </audio>  
  <audio controls="controls"  id="ding_mp3">
  	<source src="<%=request.getContextPath() %>/assets/admin/cloud/sound/ding.mp3" type="audio/mpeg">
  </audio> 
</div>  