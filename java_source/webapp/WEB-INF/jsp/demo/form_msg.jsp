<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormMsg"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormMsg"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 消息
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
					<div class="form-body" >
						<div class="col-12">
							<button id="b1" class="btn green">提示</button>
							<button id="b2" class="btn green">成功</button>
							<button id="b3" class="btn green">错误</button>
							<button id="b4" class="btn green">确认</button>
						</div>	
					</div>
			</form>
		</div>
	</div>
</div>	
<script type="text/javascript">
	$(function(){
		$("#b1").bind('click', function(){
			CLOUD.messager.alert('请选择');
			return false;
		});
		$("#b2").bind('click', function(){
			CLOUD.messager.alertSuccess('保存成功');
			return false;
		});
		$("#b3").bind('click', function(){
			CLOUD.messager.alertError('提交失败');
			return false;
		});
		$("#b4").bind('click', function(){
			CLOUD.messager.confirm('删除', '是否删除', function(r){
				if(r)
					CLOUD.messager.alertSuccess('删除成功');
				else
					CLOUD.messager.alert('取消'); 
			});
			return false;
		});
	});
</script>