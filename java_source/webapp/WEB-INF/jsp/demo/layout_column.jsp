<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoColumnLayout"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoColumnLayout"/>  
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 表单
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
					<!-- 这里规则几列，两列 col-md-6， 三列 col-md-4、共12-->
						<div class="col-md-6">
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
						
						<div class="form-group last">
							<label class="control-label col-md-3">数值3</label>
							<div class="col-md-9">
								<div id="spinner4">
									<div class="input-group" style="width:150px;">
										<div class="spinner-buttons input-group-btn">
											<button type="button" class="btn spinner-up blue">
											<i class="fa fa-plus"></i>
											</button>
										</div>
										<input type="text" class="spinner-input form-control" maxlength="3" readonly>
										<div class="spinner-buttons input-group-btn">
											<button type="button" class="btn spinner-down red">
											<i class="fa fa-minus"></i>
											</button>
										</div>
									</div>
								</div>
								<span class="help-block">
								跳步: 5 </span> 
							</div>
						</div>
						</div>	
						<div class="col-md-6">
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
							<label class="control-label col-md-3">数值</label>
							<div class="col-md-6">
								<div id="spinner1">
									<div class="input-group input-small">
										<input type="text" class="spinner-input form-control" maxlength="3" readonly>
										<div class="spinner-buttons input-group-btn btn-group-vertical">
											<button type="button" class="btn spinner-up btn-xs blue">
											<i class="fa fa-angle-up"></i>
											</button>
											<button type="button" class="btn spinner-down btn-xs blue">
											<i class="fa fa-angle-down"></i>
											</button>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-3">数值2</label>
							<div class="col-md-9">
								<div id="spinner3">
									<div class="input-group" style="width:150px;">
										<input type="text" class="spinner-input form-control" maxlength="3" readonly>
										<div class="spinner-buttons input-group-btn">
											<button type="button" class="btn spinner-up default">
											<i class="fa fa-angle-up"></i>
											</button>
											<button type="button" class="btn spinner-down default">
											<i class="fa fa-angle-down"></i>
											</button>
										</div>
									</div>
								</div>
								<span class="help-block">
								最大: 10 </span>
							</div>
						</div>
						</div>			
						
						<div class="form-group">
							<label class="col-md-offset-3 col-md-9" >
								<button id="uu12" class="btn green" type="submit">提交</button>
							</label>
						</div>	
					
					</div>
				</form>
				<!-- END FORM-->
			</div>
			
		</div>
	</div>
</div>	

<script>
	$(function(){
		
		$('#spinner1').spinner();
		$('#spinner3').spinner({value:0, min: 0, max: 10}); 
		$('#spinner4').spinner({value:0, step: 5, min: 0, max: 200});
		
		CLOUD.Validate('demoform', function(form){
			// 这里提交后台
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