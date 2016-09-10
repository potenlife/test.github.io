<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoUser"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoUser"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 用户选择
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" class="form-horizontal">
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-3 control-label">单选</label>
							<div class="col-md-4">
								<input type="text" class="form-control select2"   id="u1">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">多选</label>
							<div class="col-md-4">
									<input type="text" class="form-control select2"  id="u2">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-offset-3 col-md-9" >
								<button id="uu12" class="btn green" type="button">获取用户ID</button>
							</label>
							
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">默认选中</label>
							<div class="col-md-4">
									<input type="text" class="form-control select2"  id="u3">
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
		var u = CLOUD.UserSelect('u1');
		var us = CLOUD.UserSelect('u2', true);
		var u3 = CLOUD.UserSelect('u3', true);
		$("#uu12").on('click', function(){
			alert('单选：' + u.getVal() + '\n多选：' + us.getVal());
			return false;
		});
		u3.setVal('admin');
	});
</script>