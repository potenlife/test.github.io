<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="s" uri="/struts-tags"%><%@taglib prefix="c" uri="/cloud-tags"%>
 <%@page import="com.cloud.util.Resources"%>
 <%@page import="com.cloud.poten.web.CloudSysProperty"%>
 <%@ page import="com.cloud.poten.system.SysConstants" %><%
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
<%-- 进度条 
<script src="<%=path%>/assets/global/plugins/pace/pace.min.js" type="text/javascript"></script>
<link href="<%=path%>/assets/global/plugins/pace/themes/pace-theme-minimal.css" rel="stylesheet" type="text/css"/> --%>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<%=path%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-select/bootstrap-select.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/jstree/dist/themes/default/style.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>

<link href="<%=path%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-datetimepicker/css/datetimepicker.css"/>

<!-- 二维码 -->
<link href="<%=path%>/assets/global/plugins/ion.rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/ion.rangeslider/css/ion.rangeSlider.Metronic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css"/>
<!-- 对比 -->
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/difflib/diffview.css"/>

<!-- HTML EDIT -->
<link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"/>

<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="<%=path%>/assets/global/css/components.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="<%=path%>/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="/ico/cloud.ico"/>
<%-- jquery tooltip 在浮层上显示--%>
<style type="text/css">
.tooltip {
	z-index : 99999; 
}
</style>
<!--  codemirror 代码编辑器 -->
<link href="assets/admin/codemirror/lib/codemirror.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="assets/admin/codemirror/addon/display/fullscreen.css">
<link rel="stylesheet" href="assets/admin/codemirror/theme/night.css">
<link rel="stylesheet" href="assets/admin/codemirror/addon/dialog/dialog.css">
<link rel="stylesheet" href="assets/admin/codemirror/addon/search/matchesonscrollbar.css">
<style type="text/css">
      .CodeMirror {border-top: 1px solid #888; border-bottom: 1px solid #888; height:340px}
</style>
<script src="assets/admin/codemirror/lib/codemirror.js"></script>
<script src="assets/admin/codemirror/addon/edit/closebrackets.js"></script>
<script src="assets/admin/codemirror/addon/edit/closetag.js"></script>
<script src="assets/admin/codemirror/addon/fold/xml-fold.js"></script>
<script src="assets/admin/codemirror/mode/xml/xml.js"></script>
<script src="assets/admin/codemirror/mode/javascript/javascript.js"></script>
<script src="assets/admin/codemirror/mode/css/css.js"></script>
<script src="assets/admin/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="assets/admin/codemirror/addon/display/fullscreen.js"></script>
<script src="assets/admin/codemirror/addon/dialog/dialog.js"></script>
<script src="assets/admin/codemirror/addon/search/searchcursor.js"></script>
<script src="assets/admin/codemirror/addon/search/search.js"></script>
<script src="assets/admin/codemirror/addon/scroll/annotatescrollbar.js"></script>
<script src="assets/admin/codemirror/addon/search/matchesonscrollbar.js"></script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-full-width">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<img src="assets/admin/layout/img/logo.png" alt="" /> 
		</div>
		<!-- END LOGO -->
		<!-- BEGIN HORIZANTAL MENU -->
		<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
		<!-- DOC: This is desktop version of the horizontal menu. The mobile version is defined(duplicated) sidebar menu below. So the horizontal menu has 2 seperate versions -->
		<div class="hor-menu hor-menu-light hidden-sm hidden-xs">
			<ul class="nav navbar-nav">
				<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
				<li class="classic-menu-dropdown active start">
					<a href="work.htm" class="ajaxify start" >
					首页 <span class="selected">
					</span>
					</a>
				</li>
				<s:action name="index_horizontalLeft"  executeResult="false" /> 
			</ul>
		</div>
		<!-- END HORIZANTAL MENU -->
		<!-- BEGIN HEADER SEARCH BOX -->
		<form class="search-form"  onsubmit="fullsearch2();return false;">
			<c:is key="cloud.fullsearch"  >
			<c:privlege key="findSysFullSearch"> 
			<div class="input-group">
				<input type="text" class="form-control" placeholder="搜索..."  id="topSearchKey2" >
				<span class="input-group-btn">
				<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
				</span>
			</div>
			</c:privlege>
			</c:is>
		</form>
		<!-- END HEADER SEARCH BOX -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<c:is key="cloud.message">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar" style="display:none">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<i class="icon-bell"></i>
					<span class="badge badge-default sysinfocount " >
					0 </span>
					</a>
					<ul class="dropdown-menu">
						<li class="external">
							<h3>您有 <span class="bold sysinfocount">0</span> 条新提醒</h3>
							<a href="javascript:;" onclick="gotohrefurl('message/myinfo_accept_init.htm');">查看所有</a>
						</li>
						<li>
							<ul class="dropdown-menu-list scroller" style="height: 250px;" id="sysinfocountHTML" data-handle-color="#637283">
								
							</ul>
						</li>
					</ul>
				</li>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar" style="display:none">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<i class="icon-envelope-open"></i>
					<span class="badge badge-default userinfocount" >
					0 </span>
					</a>
					<ul class="dropdown-menu">
						<li class="external">
							<h3>您有 <span class="bold userinfocount">0</span> 条新消息</h3>
							<a href="javascript:;" onclick="gotohrefurl('message/myinfo_accept_init.htm');" >查看所有</a>
						</li>
						<li>
							<ul class="dropdown-menu-list scroller" style="height: 275px;" id="userinfocountHTML" data-handle-color="#637283">
								
							</ul>
						</li>
					</ul>
				</li>
				<!-- END INBOX DROPDOWN -->
				</c:is>
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<li class="dropdown dropdown-user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt=""  id="useravatar" class="img-circle" src="<%=path%>/assets/admin/layout/img/male.png"/>
					<span class="username username-hide-on-mobile">
					username </span>  
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#profile" onclick="gotohrefurl('userinfo_init.htm');" >
							<i class="icon-user"></i> 个人中心 </a>
						</li>
						<%--
						<li>
							<a href="page_calendar.html">
							<i class="icon-calendar"></i> 我的日程 </a>
						</li>
						<li>
							<a href="#">
							<i class="icon-rocket"></i> 我的任务 <span class="badge badge-success">
							7 </span>
							</a>
						</li> --%>
						<c:is key="cloud.message">
						<li>
							<a href="#mymessage" onclick="gotohrefurl('message/myinfo_accept_init.htm');" >
							<i class="icon-envelope-open"></i> 我的消息 <span class="badge badge-danger" id="infocount" >
							0 </span>
							</a>
						</li>
						</c:is>
						<c:is key="cloud.email">
							<li>
								<a href="#myemail" onclick="gotohrefurl('message/myemailinfo_init.htm');" >
								<i class="icon-envelope-open"></i> 我的邮箱<span class="badge badge-danger" id="emailinfocount" >
								0 </span>
								</a>
							</li>
						</c:is>   
						<li class="divider">
						</li>
						<li>
							<a href="lock.htm">
							<i class="icon-lock"></i> 锁定 </a>
						</li>
						<li>
							<a href="javascript:logout();">
							<i class="icon-key"></i> 退出 </a>
						</li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
				<c:is key="cloud.message">
				<!-- BEGIN QUICK SIDEBAR TOGGLER -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a href="javascript:;" class="dropdown-toggle">
					<i class="icon-logout"></i>
					</a>
				</li>
				<!-- END QUICK SIDEBAR TOGGLER -->
				</c:is>  
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<!-- BEGIN HORIZONTAL RESPONSIVE MENU -->
		<div class="page-sidebar navbar-collapse collapse">
			<ul class="page-sidebar-menu" data-slide-speed="200" data-auto-scroll="true">
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search sidebar-search-bordered"  onsubmit="fullsearch();return false;">
						<c:is key="cloud.fullsearch"  >
						<c:privlege key="findSysFullSearch"> 
						<a href="javascript:;" class="remove">
						<i class="icon-close"></i>
						</a>
						<div class="input-group">
							<input type="text" class="form-control"  id="topSearchKey" placeholder="搜索...">
							<span class="input-group-btn">
							<button class="btn submit"><i class="icon-magnifier"></i></button>
							</span>
						</div>
						</c:privlege>
						</c:is>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start">
					<a class="ajaxify start" href="work.htm">
					<i class="fa fa-home"></i>
					<span class="title">
					首页 </span>
					<span class="selected">
					</span>
					</a>
				</li>
				<s:action name="index_mleft"  executeResult="false" />
			</ul>
		</div>
		<!-- END HORIZONTAL RESPONSIVE MENU -->
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN BACK -->
			<div class="theme-panel"  id="trig-back" style="display:none">  
		 		<div class="toggler" style="background:url(assets/global/img/syncfusion-icons.png)  -2px 38px "></div>     
			</div>
			<!-- END BACK --> 
			<div class="page-content-body">
				<!-- HERE WILL BE LOADED AN AJAX CONTENT -->
			</div>
		</div>
		<!-- BEGIN CONTENT -->
	</div>
	<!-- END CONTENT -->
	<a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-close"></i></a>
	<c:is key="cloud.message">  
	<!-- BEGIN QUICK SIDEBAR -->
	<a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-close"></i></a>
	
	<!-- END QUICK SIDEBAR -->
	</c:is> 
	<!-- END QUICK SIDEBAR -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
	<div class="page-footer-inner">
		 <c:text key="PUBLIC.CLOUDCOMP"/>  
	</div>
	<div class="scroll-to-top">
		<i class="icon-arrow-up"></i>
	</div>
</div>
<!-- END FOOTER -->

<div class="modal" id="ajax-modal-loading" tabindex="-1" role="dialog"  aria-labelledby="remoteModalLabel"  data-keyboard='false' aria-hidden="true" style="z-index:99999">  
        <div class="modal-body">
			<div class="row" style="text-align: center">
	        	<img src="<%=path%>/assets/global/img/ajax-modal-loading.gif" alt="" class="loading">  
	        </div>
        </div> 
</div>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=path%>/assets/global/plugins/respond.min.js"></script>
<script src="<%=path%>/assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="<%=path%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=path%>/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="<%=path%>/assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="<%=path%>/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/select2/select2_locale_zh-CN.js"></script> 
<script type="text/javascript" src="<%=path%>/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>  
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-validation/js/localization/messages_zh.js" type="text/javascript"></script> 
<script src="<%=path%>/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=path%>/assets/global/plugins/fuelux/js/spinner.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>   
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="<%=path%>/assets/global/plugins/ion.rangeslider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
<script src="<%=path%>/assets/global/plugins/jquery.tablednd.min.js"></script>

<!-- HTML EDIT -->
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script> 

<script type="text/javascript" src="<%=path%>/assets/global/plugins/difflib/difflib.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/difflib/diffview.js"></script> 

<script src="<%=path%>/assets/admin/cloud/scripts/cloud.js" type="text/javascript" ></script>
<script type="text/javascript">
	CLOUD.PATH = '<%=path%>';
	CLOUD.STATICPATH = '<%=path%>';
	CLOUD.UPLOADPATH = '<%=CloudSysProperty.getUploadPath()%>';
</script>

<script src="<%=path%>/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>

<script type="text/javascript" src="<%=path%>/assets/admin/cloud/locale/errorcode_zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/locale/textreources_zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/cloud-validate.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/cloud-sys.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/cloud-lock.js"></script> 
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/cloud-inc.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/inc/resource_upload.js"></script> 

<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/cloud-sqledit.js"></script>
<script src="<%=path%>/assets/admin/cloud/scripts/swfobject.js"></script>
<script src="<%=path%>/assets/admin/cloud/scripts/highcharts.js"></script>
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/scripts/ajaxfileupload.js"></script>
<!-- echarts 图表 -->
<script src="<%=path%>/assets/global/plugins/echarts/echarts.js"></script>
<script src="<%=path%>/assets/admin/cloud/scripts/cloud-echarts.js"></script>

<!-- CMS -->
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/cms/trig-cms.js"></script>  
<script type="text/javascript"src="<%=path%>/assets/admin/ckeditor/ckeditor.js"></script> 

<!-- 首页的js文件 -->
<script type="text/javascript" src="<%=path%>/assets/admin/cloud/system/index.js"></script>
 <%-- 消息声音提示,HTML5 --%>
 <%@include file="inc/sound.jsp" %>
  <c:is key="cloud.log.open">  
 <%@include file="inc/log_record.jsp" %>
 </c:is>
 <c:is key="cloud.advancedsearch"  > 
 <%@include file="inc/search.jsp" %>
 </c:is>
 <%@include file="inc/resource_upload.jsp" %> 
  <%--系统公共功能操作,字典添加等 --%>
  <%@include file="inc/system.jsp" %> 
 <script type="text/javascript">
function logout() {
	$.getJSON('logout.json','',function(data){
		location.href = 'login.htm';
	});
}
function getQueryString() {
	var url = location.href;
	if(url.indexOf("#")>-1) {
		return url.substr(url.indexOf("#") + 1);
	}
	return null;
}

function gotourl(p) {
	if(p=='profile') { // 个人中心
		gotohrefurl('userinfo_init.htm');
	} else if(p=='mymessage') { // 我的收件箱 
		gotohrefurl('message/myinfo_accept_init.htm'); 
	} else {
		$('.page-sidebar .ajaxify.' + p).click(); // load the content for the dashboard page. 
	}
}

function gotohrefurl(url) {
	Metronic.scrollTop();
    var pageContentBody = $('.page-content .page-content-body');
    Metronic.startPageLoading();
    if (Metronic.getViewPort().width < 992 && $('.page-sidebar').hasClass("in")) { // close the menu on mobile view while laoding a page 
        $('.page-header .responsive-toggler').click();
    }
    $.ajax({
        type: "GET",
        cache: false,
        url: url,
        dataType: "html",
        success: function (res) {
            
            pageContentBody.html(res);
            Layout.fixContentHeight(); // fix content height
            Metronic.initAjax(); // initialize core stuff
            CLOUD.init();	// page init
            CLOUD.initPrivleg(); 	// 权限验证
            Metronic.stopPageLoading();
            //pushBackUrl( {type:'href', url:url} ); 
            
        },
        error: function (xhr, ajaxOptions, thrownError) {
            pageContentBody.html('<h4>Could not load the requested content.</h4>');
            Metronic.stopPageLoading();
        }
    });
}

function fullsearch() {
	var s = $("#topSearchKey").val();
	if(s!='' && $.trim(s)!='') {
		gotohrefurl('full_search_init.htm?key=' + encodeURIComponent(s));   
	} 
}

jQuery(document).ready(function() {    
	CLOUD.settings.org = <%=Resources.getResources().getBoolean(SysConstants.IS_USER_ORG)%>;
	CLOUD.settings.advancedsearch = <%=Resources.getResources().getBoolean(SysConstants.IS_ADVANCEDSEARCH)%>;
	CLOUD.settings.lock = <%=Resources.getResources().getBoolean(SysConstants.IS_LOCK)%>;
	CLOUD.settings.message = <%=Resources.getResources().getBoolean(SysConstants.IS_MESSAGE)%>;
	CLOUD.settings.group = <%=Resources.getResources().getBoolean(SysConstants.IS_USER_GROUP)%>;
	CLOUD.settings.priv = {
			'fun' : <%=Resources.getResources().getBoolean(SysConstants.IS_PRIVLEGE_FUNCTION)%>,
			'content' : <%=Resources.getResources().getBoolean(SysConstants.IS_PRIVLEGE_CONTENT)%>
	};
	CLOUD.settings.dataRecycleBin = <%=Resources.getResources().getBoolean("trig.findSysDataRecycleBin")%>;
	
   	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout 
	
	// 登录判断
	$.post('islogin.json', '' , function(data) { 
		data = $.parseJSON(data);
		if(data.success==false) {// 未登录
			location.href = 'login.htm';
		} else {
			// 权限初始
		   setRolePriv(data); 
		   CLOUD.User = data.data;
		   CLOUD.UserDef = data.def;
		   CLOUD.initUserDef(data.def);
		   $(".username").text(CLOUD.getUserName(data.data));
		   // top menu 头像
		   $("#useravatar").attr('src', CLOUD.getUserAvatar(CLOUD.User));
		  
		   var p = getQueryString(); 
		   if(!p) {
			   p = "start";
		   }
		   gotourl(p);
		   <c:is key="cloud.message">
		   // TM 组织机构/部门
		   if(CLOUD.settings.org) {
			   if(data.data.su_organizationId) {
				   $(".msgorg").show();
				   $(".msgorg").attr('data-id', data.data.su_organizationId);     
				   $.getJSON('organization_find.json','id=' + data.data.su_organizationId, function(data2){ 
					   $("#msgorgname").text(data2.data.so_organizationName);    
				   });
			   } else {
				   $(".msgorg").hide(); 
			   }
		   }
		   // 消息
		   CLOUD.index.findMyinfoAcceptList();
		   
		   // 用户LIST
		   $.getJSON("user_select.json", '', function(data){
			   var h = '';
			   for(var i=0;i<data.length;i++) {
				   	h += '<li class="media" data-id="'+data[i].su_userId+'"	data-type="user">';
					h += '<img class="media-object" src="'+CLOUD.getUserAvatar(data[i])+'" alt="">';
					h += '<div class="media-body">';
					h += '<h4 class="media-heading">'+data[i].su_userName +'('+data[i].su_realName+')'+'</h4>'; 
					h += '<div class="media-heading-sub">';
					h += '</div>';
					h += '</div>';
					h += '</li>';
			   }
			   $("#triguserlist").append(h); 
			   if(!CLOUD.settings.group) {
				   QuickSidebar.init(); 
			   }
		   });
		   
			// 用户组LIST
			CLOUD.UserGroup = '';
			if(CLOUD.settings.group) {
			   $.getJSON("user_group_findUserList.json", '', function(data){
				   var h = '';
				   for(var i=0;i<data.length;i++) {
					   	h += '<li class="media" data-id="'+data[i].sug_groupId+'"	data-type="group">';
						h += '<img class="media-object" src="assets/admin/layout/img/male.png" alt="">';
						h += '<div class="media-body">';
						h += '<h4 class="media-heading">'+ data[i].sug_groupName +'</h4>'; 
						h += '<div class="media-heading-sub">';
						h += '</div>';
						h += '</div>';
						h += '</li>';
						CLOUD.UserGroup += data[i].sug_groupName +',';
				   }
				   $("#msggrouplist").append(h); 
				   QuickSidebar.init(); // init quick sidebar
			   });
			}
		   </c:is>
		}
	 });
 	
});

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>