<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<link href="assets/admin/pages/css/login-page.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="assets/global/css/components.css" rel="stylesheet" type="text/css"/>
<link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-toastr/toastr.min.css"/>
<link rel="shortcut icon" href="ico/cloud.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<div class="logo ">
	<img src="assets/admin/layout/img/logo.png" alt="" />
</div>
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="login-form" action="index.htm"  id="form1"  method="post">
		<input type="hidden" name="codeid" id="codeid"/>
		<h3 class="form-title">登录</h3>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>请输入用户名和密码</span>
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">用户名</label>
			<div class="input-icon">
				<i class="fa fa-user input_i"></i>
				<input class="form-control placeholder-no-fix input_height" type="text" autocomplete="off" placeholder="用户名" name="username" tabindex="1"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">密码</label>
			<div class="input-icon">
				<i class="fa fa-lock input_i"></i>
				<input class="form-control placeholder-no-fix input_height" type="password" autocomplete="off" placeholder="密码" name="password"  id="password" tabindex="2" value=""/> 
			</div>
		</div>
		<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">验证码</label>
				<div class="input-group input-icon">
					
					<i class="fa fa-qrcode input_i"></i>
					<input type="text" class="form-control placeholder-no-fix input_height" placeholder="验证码" name="code" id="code" tabindex="3"/>
					<span class="input-group-btn">
						<a href="#" onclick="coderandom();return false;"> <img src="assets/admin/cloud/img/loading.gif"  class="valid_img_size" id="codeimg" border="0" /></a>  
					</span>
				</div>
			</div>
			
		<div class="form-group">
			<%--<label class="checkbox">
			<input type="checkbox" name="remember" value="1"/> Remember me </label>--%>
			<button type="submit" class="btn blue pull-right btn-circle login_btn">
			登录 <i class="m-icon-swapright m-icon-white"></i> 
			</button> 
		</div>
		<div class="login-options">
		
		</div>
		<div class="forget-password">
		<c:is key="cloud.user.password"  >
			<h4>忘记密码 ?</h4>
			<p>
				 没关系， 点击 <a href="javascript:;" id="forget-password">
				这里 </a>
				重置您的密码
			</p>
		</div>
		</c:is>
		<div class="create-account">
			 
		</div>
	</form>
	<!-- END LOGIN FORM -->
	<c:is key="cloud.user.password"  >
	<!-- BEGIN FORGOT PASSWORD FORM -->
	<form class="forget-form"  action="index.htm" method="post">
		<h3>忘记密码 ?</h3>
		<p>
			 请输入您的电子邮箱地址重置密码
		</p>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="su_email"/>
			</div>
		</div>
		<div class="form-actions">
			<button type="button" id="back-btn" class="btn">
			<i class="m-icon-swapleft"></i> 返回 </button>
			<button type="submit" class="btn blue pull-right">
			提交 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
	</form>
	<!-- END FORGOT PASSWORD FORM -->
	</c:is>
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright" > 
	 <c:text key="PUBLIC.CLOUDCOMP"/> 
	 <div class="hidden-xs">推荐使用Google Chrome或IE9（及以上）浏览器访问本系统</div>
</div>
<!-- END COPYRIGHT -->

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
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
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
<script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script src="assets/admin/cloud/scripts/cloud.js" type="text/javascript" ></script>
<script type="text/javascript">CLOUD.PATH = '<%=request.getContextPath()%>';</script>  

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script src="assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- begin CLOUD scripts -->
<script type="text/javascript" src="assets/admin/cloud/locale/errorcode_zh_CN.js"></script>
<script type="text/javascript" src="assets/admin/cloud/locale/tablecolumn_zh_CN.js"></script>
<script type="text/javascript" src="assets/admin/cloud/locale/textreources_zh_CN.js"></script>
<!-- end CLOUD scripts -->
 <%@include file="inc/sound.jsp" %>
<script>
jQuery(document).ready(function() {     
Metronic.init(); // init metronic core components
Layout.init(); // init current layout
QuickSidebar.init(); // init quick sidebar
  Login.init(); 
       // init background slide images
       $.backstretch([
        "assets/admin/pages/media/bg/1.jpg",
        "assets/admin/pages/media/bg/2.jpg",
        "assets/admin/pages/media/bg/3.jpg",
        "assets/admin/pages/media/bg/4.jpg"
        ], {
          fade: 1000,
          duration: 8000
    }
    );
       // cookie 是否禁用，CLOUD系统需要cookie支持
       if(navigator.cookieEnabled) {
    	   coderandom();
       } else {
    	   CLOUD.messager.alert('cookie 被禁用，此系统需要可以获取并设置cookie。'); 
       }
       
});



function doSubmit() {
	$('#ajax-modal-loading').modal({
		backdrop : 'static'
	});
	$.post('login_submit.json',$("#form1").serialize(),function(data){
		data = CLOUD.successHandle(data);
		if(data.success==true) {
			var backurl = '<%=request.getParameter("backurl") == null ? "" : request.getParameter("backurl")%>';
			if(backurl) {
				backurl += backurl.indexOf('?') > -1 ? '&' : '?';
				backurl += 'token=' + data.token;	
				window.open(backurl,'_self'); 
			} else {
				var hash = '';//getCookie('hash');
				var indexurl = 'index.htm';
				if(data.def && data.def.sud_navigation=='top') {
					indexurl = 'index_horizontal.htm';
				}
				if(hash) { 
					window.open(indexurl + '#' + hash,'_self'); 
				} else {
					window.open(indexurl,'_self'); 
				}
			}
			subrun = false;
		}else{
			coderandom();
			subrun = false;
			$('#ajax-modal-loading').modal('hide');
		}
	});
}

// 密码找回
function doForgetSub() {
	$('#ajax-modal-loading').modal({
		backdrop : 'static'
	});
	$.post('login_forget.json',$(".forget-form").serialize(),function(data){
		data = CLOUD.successHandle(data);
		if(data.success==true) {
			CLOUD.messager.alert('密码邮件已发送，请登录邮箱查看密码并返回登录。'); 
		}
		$('#ajax-modal-loading').modal('hide');
	});
}

function coderandom() {
	$.post('verificationCode_random.json','num=4',function(data){
		data = CLOUD.successHandle(data);
		if(data.success==true) {
			$("#codeid").val(data.codeid);
			$("#code").val("");
			$("#codeimg").attr("src", "verificationCode_img.htm?height=34&num=4&&codeid=" + data.codeid + "&" + CLOUD.Contants.CSRF_PARA + "=" + $.cookie(CLOUD.Contants.CSRF_COOKIE));
		}
	});
}
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>