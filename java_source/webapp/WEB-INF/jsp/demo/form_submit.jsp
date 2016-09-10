<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormSubmit"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormSubmit"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 表单提交
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
						<div class="form-group">
							<label class="col-md-3 control-label">组织机构</label>
							<div class="col-md-6">
									<select class="form-control" name="demo_organizationId"  id="demo_organizationId" >
											<option value="">请选择</option> 
											<option>研发</option>
											<option>项目</option>
											<option>移动</option>
									</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">姓名</label>
							<div class="col-md-6">
								<input type="text" class="form-control" placeholder="请输入姓名" name="demo_realName" id="demo_realName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">性别</label>
							<div class="col-md-6">
								<div class="radio-list">
									<label class="radio-inline">
									<input type="radio" name="demo_sex"  value="M" checked> 先生</label>
									<label class="radio-inline">
									<input type="radio" name="demo_sex"  value="F" > 女士 </label>
									<label class="radio-inline">
									<input type="radio" name="demo_sex"  value="U" > 未知 </label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">年龄</label>
							<div class="col-md-6">
									<input type="text" class="form-control"  name="demo_age" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">身份证</label>
							<div class="col-md-6">
									<input type="text" class="form-control"  name="demo_card" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">手机号码</label>
							<div class="col-md-6">
								<input type="text" class="form-control"  name="demo_mobile" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Email</label>
							<div class="col-md-6">
									<input type="email" class="form-control"  name="demo_email" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">角色</label>
							<div class="col-md-6">
								<div class="checkbox-list">
									<label class="checkbox-inline">
									<input type="checkbox" name="demo_role"  value="M" > admin</label>
									<label class="checkbox-inline">
									<input type="checkbox" name="demo_sex"  value="F" > test</label>
									<label class="checkbox-inline">
									<input type="checkbox" name="demo_sex"  value="U" > guset </label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-offset-3 col-md-9" >
								<button id="uu12" class="btn green" type="submit">提交</button>
							</label>
						</div>	
				</form>
				<!-- END FORM-->
			</div>
		</div>
	</div>
</div>	

<script>
	$(function(){
		CLOUD.Validate('demoform', function(form){
			// 这里Ajax异步提交到后台
			CLOUD.trackPost('user_findPageList.json', $(form).serialize(), function(data){
				CLOUD.updateSuccessAlert();
			});
			return false;
		}, {
			// 验证规则
			demo_organizationId : { 
				required : true
			} ,
			demo_realName : {
				required : true
			},
			demo_age : {
				digits : true,
				range: [20, 80]
			},
			demo_card : {
				cardNo : true
			},
			demo_mobile : {
				mobile : true
			},
			demo_email : {
				email : true
			}
		});
		
	});
</script>