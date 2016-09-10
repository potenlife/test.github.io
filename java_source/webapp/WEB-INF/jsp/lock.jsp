<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%><%@taglib prefix="s" uri="/struts-tags"%><%
	// 绝对路径PATH
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title><c:text key="PUBLIC.SYSTEMNAME"/></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="Cloud1" name="description"/>
<meta content="Cloud User" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="assets/admin/pages/css/lock2.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-toastr/toastr.min.css"/>
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
<div class="page-lock">
	<div class="page-logo">
		<img src="assets/admin/layout/img/logo.png" alt="" /> 
	</div>
	<div class="page-body">
		<img class="page-lock-img" src="assets/admin/pages/media/profile/male.png" alt=""> 
		<div class="page-lock-info">
			<h1><s:property value="lockUser.su_userName"/></h1>
			<span class="email">
			<s:property value="lockUser.su_email"/> </span>
			<span class="locked">
			锁定 </span>
			<form class="form-inline" action="index.htm" id="form1">
			<input name="logintype" value="1" type="hidden" />
				<div class="input-group input-medium">
					<input type="password" name="password" id="password" class="form-control" placeholder="Password">
					<span class="input-group-btn">
					<button type="submit" class="btn blue icn-only" onclick="doSubmit();return false;"><i class="m-icon-swapright m-icon-white"></i></button>
					</span>
				</div>
				<!-- /input-group -->
				<div class="relogin">
					<a href="login.htm">
					不是<s:property value="lockUser.su_userName"/> ? </a>
				</div>
			</form>
		</div>
	</div>
	<div class="page-footer-custom">
		 <c:text key="PUBLIC.CLOUDCOMP"/> 
	</div>
</div>

<div class="modal fade" id="ajax-modal-loading" tabindex="-1" role="basic" aria-hidden="true">
		<img src="assets/global/img/ajax-modal-loading.gif" alt="" class="loading">
</div> 

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>

<script src="<%=path%>/assets/admin/cloud/scripts/cloud.js" type="text/javascript" ></script>
<script type="text/javascript">
	CLOUD.PATH = '<%=path%>';
	CLOUD.STATICPATH = '<%=path%>';
	CLOUD.UPLOADPATH = '<%=path%>';
</script>

<!-- END PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/lock.js"></script>

<script src="assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/admin/cloud/locale/errorcode_zh_CN.js"></script>
<script type="text/javascript" src="assets/admin/cloud/locale/textreources_zh_CN.js"></script>
 <%-- 消息声音提示,HTML5 --%>
 <%@include file="inc/sound.jsp" %>
 
<script>
jQuery(document).ready(function() {    
   Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
   Lock.init();
   $.get('islogin.json');
  
   <s:if test='lockUser.su_userAvatar!=null'> 
   		var ua = '<s:property value="lockUser.su_userAvatar"/>';  
   		if(ua)
   		$(".page-lock-img").attr('src', CLOUD.UPLOADPATH + ua);  
   </s:if>
});

function doSubmit() {
	if($("#password").val()=='') return false;
	$('#ajax-modal-loading').modal({
		backdrop : 'static'
	});
	$.post('lock_login_submit.json',$("#form1").serialize(),function(data){
		data = CLOUD.successHandle(data);
		if(data.success==true) {
			var hash = getCookie('hash');
			if(hash) { 
				window.open('index.htm#' + hash,'_self'); 
			} else {
				window.open('index.htm','_self'); 
			}
			//window.open('index.htm','_self'); 
			subrun = false;
		}else{
			subrun = false;
			$('#ajax-modal-loading').modal('hide');
		}
	});
}
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>