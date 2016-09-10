<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoAjaxHttp"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoAjaxHttp"/>  
</div>

<div class="row">
	<div class="col-md-12">
			<div class="btn-group col-md-4">
				<input type="text"  id="http" class="form-control" placeholder="URL"  value="http://www.baidu.com"/>	
			</div>
			<div class="btn-group">
				<button id="httpbtn" class="btn green"  >Ajax 远程HTTP地址</button> 
			</div>
			
			<div id="htmltext"></div>
	</div>
</div>

<script>
	$(function(){
		$("#httpbtn").bind('click', function() {
			$.post("tools/open.json", "url=" + $("#http").val(), function(data){
				$("#htmltext").text(data);
			});
		});
	});
</script>