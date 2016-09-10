<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<link href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css"/> 
<link href="assets/admin/pages/css/profile.css" rel="stylesheet" type="text/css"/> 
<h3 class="page-title">
个人中心 <small></small>
</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascript:gotourl('start');void(0);">首页</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="javascript:;">个人中心</a>
		</li>
	</ul>
</div>

<div class="row profile">
	<div class="col-md-12">
		<!--BEGIN TABS-->
		<div class="tabbable tabbable-custom tabbable-full-width">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#tab_1_1" data-toggle="tab">
					视图 </a>
				</li>
				<li>
					<a href="#tab_1_3" data-toggle="tab" id="puser">
					用户 </a>
				</li>
				<li>
					<a href="#tab_1_6" data-toggle="tab">
					帮助 </a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1_1">
					<div class="row">
						<div class="col-md-3">
							<ul class="list-unstyled profile-nav">
								<li >
									<img src="assets/admin/pages/img/user_default.gif"  class="img-responsive" alt="" style="width:247px"/>    
								</li>
								
							</ul>
						</div>
						<div class="col-md-9">
							<div class="row">
								<div class="col-md-8 profile-info">
									<h1 id="username"></h1>
									<p>姓名：<span id="realname"></span></p>
									<p>性别：<span id="sex"></span></p>
									<c:is key="cloud.user.org"  >
									<p>组织机构：<span id="organization_name"></span></p>
									</c:is>
									<p>手机号码：<span id="mobile"></span></p>
									<p>角色： <span id="trigroles"></span></p>
									<p>用户组： <span id="triggroups"></span></p>
									<p>上次登录时间：<span id="last_login_date"></span></p>
								</div>
								<!--end col-md-8-->
								
							</div>
							<!--end row-->
							<div class="tabbable tabbable-custom tabbable-custom-profile">
								<ul class="nav nav-tabs">
									<li class="active">
										<a href="#tab_1_11" data-toggle="tab">
										最近登录 </a>
									</li>
									<c:is key="cloud.message">
									<li>
										<a href="#tab_1_22" data-toggle="tab">
										最新消息 </a>
									</li>
									</c:is>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_1_11">
										<div class="portlet-body">
											<table class="table table-striped table-bordered table-advance table-hover" id="user_login_table">
											<thead>
											<tr>
												<th>
													登录时间
												</th>
												<th class="hidden-xs">
													退出时间
												</th>
												<th>
													IP
												</th>
												<th>
													类型
												</th>
											</tr>
											</thead>
											<tbody>
											
											</tbody>
											</table>
										</div>
									</div>
									<!--tab-pane-->
									<c:is key="cloud.message">
									<div class="tab-pane" id="tab_1_22">
										<div class="tab-pane active" id="tab_1_1_1">
											<div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible1="1">
												<ul class="feeds">
													
												</ul>
											</div>
										</div>
									</div>
									<!--tab-pane-->
									</c:is>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--tab_1_2-->
				<div class="tab-pane" id="tab_1_3">
					<div class="row profile-account">
						<div class="col-md-3">
							<ul class="ver-inline-menu tabbable margin-bottom-10">
								<li class="active">
									<a data-toggle="tab" href="#tab_1-1">
									<i class="fa fa-cog"></i> 个人信息 </a>
									<span class="after">
									</span>
								</li>
								<li>
									<a data-toggle="tab" href="#tab_2-2">
									<i class="fa fa-picture-o"></i> 修改头像 </a>
								</li>
								<c:is key="cloud.user.add"  >
								<li>
									<a data-toggle="tab" href="#tab_3-3">
									<i class="fa fa-lock"></i> 修改密码 </a>
								</li>
								</c:is>
								<li>
									<a data-toggle="tab" href="#tab_4-4" id="setting">
									<i class="fa fa-eye"></i> 设置 </a>
								</li>
							</ul>
						</div>
						<div class="col-md-9">
							<div class="tab-content">
								<div id="tab_1-1" class="tab-pane active">
									<form role="form" action="#" id="userform">
									<input type="hidden" name="su_userId" id="su_userId" /> 
									<input type="hidden" name="su_password" id="su_password" /> 
									<input type="hidden" name="so_organizationId" id="so_organizationId" /> 
										<div class="form-group">
											<label class="control-label">用户名</label>
											<input type="text"  name="su_userName" id="su_userName"  readonly class="form-control" />
										</div>
										<c:is key="cloud.user.org"   >
										<div class="form-group">
											<label class="control-label">组织机构</label>
											<input type="text"  name="so_organizationName" id="so_organizationName"  readonly class="form-control" />
										</div>
										</c:is>
										<div class="form-group">
											<label class="control-label">姓名</label>
											<input type="text" name="su_realName" id="su_realName"  class="form-control"/>
										</div>
										<div class="form-group">
											<label class="control-label">性别</label>
											<div class="radio-list">
												<label class="radio-inline">
												<input type="radio" name="su_sex"  value="M" checked> 先生</label>
												<label class="radio-inline">
												<input type="radio" name="su_sex"  value="F" > 女士 </label>
												<label class="radio-inline">
												<input type="radio" name="su_sex"  value="U" > 未知 </label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label">手机号码</label>
											<input type="text" class="form-control"  name="su_mobile" id="su_mobile">
										</div>
										<div class="form-group">
											<label class="control-label">EMAIL</label>
											<input type="email" class="form-control"  name="su_email" id="su_email">
										</div>
										<div class="margiv-top-10">
											<button type="submit" class="btn blue">提交</button>
											<a href="javascript:;"  id="userreset" class="btn default">取消 </a>
										</div>
									</form>
								</div>
								<div id="tab_2-2" class="tab-pane">
									<p>
									</p>
									<form action="#" role="form" id="photoform">
										<div class="form-group">
											<div class="fileinput fileinput-new" data-provides="fileinput">
												<div class="fileinput-new thumbnail" style="width: 200px; height: 200px;">
													<img id="old_user_avatar" src="assets/admin/pages/img/user_default.gif" alt=""/>
												</div>
												<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 200px;">
													<img src="assets/admin/pages/img/user_default.gif" alt=""/>
												</div>
												<div>
													<span class="btn default btn-file">
													<span class="fileinput-new">
													选择图片 </span>
													<span class="fileinput-exists">
													取消 </span>
													<input type="file" name="uploadfile" id="su_userAvatar"> 
													</span>
													<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
													移除 </a>
												</div>
											</div>
											<div class="clearfix margin-top-10">
												<span class="label label-danger">
												说明！ </span>
												<span>
												支持GIF,JPG,JPGE,PNG图片格式。 </span>
											</div>
										</div>
										<div class="margin-top-10">
											<button type="button" class="btn blue" id="user_avatar_submit">提交</button>
										</div>
									</form>
								</div>
								<div id="tab_3-3" class="tab-pane">
									<form action="#" id="pwdform">
										<div class="form-group">
											<label class="control-label">原密码</label>
											<input type="password" name="su_password" id="su_password"  class="form-control"/>
										</div>
										<div class="form-group">
											<label class="control-label">新密码</label>
											<input type="password" name="su_password1" id="su_password1"  class="form-control"/>
										</div>
										<div class="form-group">
											<label class="control-label">确认新密码</label>
											<input type="password"  name="su_password2" id="su_password2"  class="form-control"/>
										</div>
										<div class="margin-top-10">
											<button type="submit" class="btn blue">提交</button>
											<a href="javascript:;" class="btn default"  onclick='document.getElementById("pwdform").reset();'>
											取消 </a>
										</div>
									</form>
								</div>
								<div id="tab_4-4" class="tab-pane">
										<div class="row">
											<form action="#" id="userdefform" class="form-horizontal">
											<input type="hidden" name="sud_defId" id="sud_defId" />
		    								<input type="hidden" name="sud_style" id="sud_style" />
		    								
		    									<div class="form-group">
													<label class="col-md-2  control-label">导航位置</label>
													<div class="col-md-6">
														<select name="sud_navigation" id="sud_navigation"  class="form-control">
															<option value="">请选择</option>
															<option value="top">上边</option>
															<option value="left">左边</option>
															<option value="right">右边</option> 	
														</select>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-md-2  control-label">分页默认大小</label>
													<div class="col-md-6">
														<select name="sud_pagesize" id="sud_pagesize"  class="form-control">
															<option value="">请选择</option>
														</select>
													</div>
												</div>
											
												<div class="form-group">
													<label class="col-md-2 control-label">风格</label>
													<div class="col-md-6 defstyle"> 
														<ul>
															<li style="background:#333438;width:37px;height:37px;border:solid 1px #707070;float:left;margin:0 4px;cursor:pointer;list-style:none;" data-style="default" >
															</li>
															<li style="background:#2D5F8B;width:37px;height:37px;border:solid 1px #707070;float:left;margin:0 4px;cursor:pointer;list-style:none;" data-style="blue" >
															</li>
															<li style="background:#697380;width:37px;height:37px;border:solid 1px #707070;float:left;margin:0 4px;cursor:pointer;list-style:none;" data-style="grey" >
															</li>
															<li style="background:#F9FAFD;width:37px;height:37px;border:solid 1px #707070;float:left;margin:0 4px;cursor:pointer;list-style:none;" data-style="light" >
															</li>
														</ul>
														<div style="clear: both;"></div> 
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">提示声</label>
													<div class="col-md-6">
														<div class="radio-list">
															<label class="radio-inline">
															<input type="radio" name="sud_sound"  value="Y" checked> 打开</label>
															<label class="radio-inline">
															<input type="radio" name="sud_sound"  value="N" > 关闭 </label>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">提示消息位置</label>
													<div class="col-md-6">
														<div class="radio-list">
															<label class="radio-inline">
															<input type="radio" name="sud_msgLocation"  value="toast-top-right" checked> 右上</label>
															<label class="radio-inline">
															<input type="radio" name="sud_msgLocation"  value="toast-bottom-right" > 右下 </label>
															<label class="radio-inline">
															<input type="radio" name="sud_msgLocation"  value="toast-top-left" > 左上 </label>
															<label class="radio-inline">
															<input type="radio" name="sud_msgLocation"  value="toast-bottom-left" > 左下 </label>
														</div>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-md-2 control-label">HTML在线编辑器</label>
													<div class="col-md-6">
														<div class="radio-list">
															<label class="radio-inline">
															<input type="radio" name="sud_editorType"  value="ueditor" checked> UEditor</label>
															<label class="radio-inline">
															<input type="radio" name="sud_editorType"  value="ckeditor" > CKEditor </label>
															<label class="radio-inline">
															<input type="radio" name="sud_editorType"  value="textarea" > Textarea </label>
														</div>
													</div>
												</div>
												<!--end profile-settings-->
												<div class="margin-top-10" style="padding-left:50px"> 
													<button type="submit" class="btn blue">提交</button>
													<a href="javascript:;" class="btn default" id="userdefreset">
													取消 </a>
												</div>
											</form>
									</div>
								</div>
							</div>
						</div>
						<!--end col-md-9-->
					</div>
				</div>
				<!--end tab-pane-->
				<div class="tab-pane" id="tab_1_6">
					<div class="row">
						<div class="col-md-3">
							<ul class="ver-inline-menu tabbable margin-bottom-10">
								<li class="active">
									<a data-toggle="tab" href="#tab_1">
									<i class="fa fa-briefcase"></i> 系统管理 </a>
									<span class="after">
									</span>
								</li>
								<li>
									<a data-toggle="tab" href="#tab_2">
									<i class="fa fa-group"></i> 用户 </a>
								</li>
								
							</ul>
						</div>
						<div class="col-md-9">
							<div class="tab-content">
								<div id="tab_1" class="tab-pane active">
									<div id="accordion1" class="panel-group">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_1">
												1. 需要创建新用户 ? </a>
												</h4>
											</div>
											<div id="accordion1_1" class="panel-collapse collapse in">
												<div class="panel-body">
													 系统管理 -> 权限管理 -> 用户，创建新用户。
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_2">
												2. 给用户设置权限 ? </a>
												</h4>
											</div>
											<div id="accordion1_2" class="panel-collapse collapse">
												<div class="panel-body">
													 系统管理 -> 权限管理 -> 角色，将用户添加到需要相应权限的角色中。
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<div id="tab_2" class="tab-pane">
									<div id="accordion2" class="panel-group">
										<div class="panel panel-warning">
											<div class="panel-heading">
												<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_1">
												1. 修改密码 ? </a>
												</h4>
											</div>
											<div id="accordion2_1" class="panel-collapse collapse in">
												<div class="panel-body">
													<p>
														 点击头部用户名，进入个人中心 ->用户，即可修改密码。
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
				<!--end tab-pane-->
			</div>
		</div>
		<!--END TABS-->
	</div>
</div>
<script type="text/javascript">
<!--
function setting() {
	$("#puser").click();
	$("#setting").click();
}
//-->
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/profile.js"></script>