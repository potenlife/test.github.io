<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoQrcode"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoQrcode"/> 
</div>

<div class="row">
	<div class="col-md-12">
			<div class="col-md-6">
			tools/qrcode_encode.htm?size=200&text=test<br/>
			<img src="tools/qrcode_encode.htm?size=200&text=test" />	
			</div>
			<div class="col-md-6">
			tools/qrcode_encode.htm?size=200&text=test&color=ff0000<br/>
			<img src="tools/qrcode_encode.htm?size=200&text=test&color=ff0000" />	 
			</div>		
	</div>
</div>

