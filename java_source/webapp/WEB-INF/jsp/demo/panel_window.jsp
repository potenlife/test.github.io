<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoWindow"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoWindow"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 窗口
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
					<div class="form-body" >
						<div class="col-12">
							<button id="b1" class="btn green">窗口一</button>
							<button id="b2" class="btn green">窗口二</button>
							<button id="b3" class="btn green">窗口三</button>
							<button id="b4" class="btn green">窗口四</button>
						</div>	
					</div>	
				</form>
				<!-- END FORM-->
			</div>
		</div>
	</div>
</div>	

<div id="userEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">默认（760宽）</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userEditform">
	<input type="hidden" name="su_userId" id="su_userId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">用户名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入用户名" name="su_userName" id="su_userName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">密码</label>
								<div class="col-md-6">
										<input type="password" class="form-control" placeholder="密码" name="su_password" id="su_password">
								</div>
							</div>
							<c:is key="cloud.user.org" >
							<div class="form-group">
								<label class="col-md-3 control-label">组织机构</label>
								<div class="col-md-6">
										<select class="form-control" name="so_organizationId" id="so_organizationId" >
												<option value="">请选择</option> 
										</select>
								</div>
							</div>
							</c:is>
							<div class="form-group">
								<label class="col-md-3 control-label">姓名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入姓名" name="su_realName" id="su_realName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">性别</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="M" checked> 先生</label>
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="F" > 女士 </label>
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="U" > 未知 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">手机号码</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="su_mobile" id="su_mobile">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Email</label>
								<div class="col-md-6">
										<input type="email" class="form-control"  name="su_email" id="su_email">
										<c:is key="cloud.user.password" >
									<span class="help-block">
											用于找回密码</span>
											</c:is>
								</div>
							</div>
						</div>
					
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<%@include file="../inc/editbtn.jsp" %>  
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="modal2" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">960宽</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userEditform">
	<input type="hidden" name="su_userId" id="su_userId" /> 
	<div class="modal-body">
		<div class="row">
		
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue">保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="modal3" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960" data-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">960宽*500高</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userEditform">
	<input type="hidden" name="su_userId" id="su_userId" /> 
	<div class="modal-body">
		<div class="row">
		
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue">保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="modal4" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960" data-max-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">960宽*最大500高</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userEditform">
	<input type="hidden" name="su_userId" id="su_userId" /> 
	<div class="modal-body">
		<div class="row">
		
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue">保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>
		

<script>
	$(function(){
		$("#b1").bind('click', function(){
			$("#userEditModal").modal('show'); 
			return false;
		});
		
		$("#b2").bind('click', function(){
			$("#modal2").modal('show'); 
			return false;
		});
		
		$("#b3").bind('click', function(){
			$("#modal3").modal('show'); 
			return false;
		});
		
		$("#b4").bind('click', function(){
			$("#modal4").modal('show');  
			return false;
		});
	});
</script>