<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormBaseHtmlText"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormBaseHtmlText"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i>  富文本输入框（HTML5）
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
					<div class="form-body" >
							<div class="form-group">
										<label class="control-label col-md-2">WYSIHTML5 Editor 1</label>
										<div class="col-md-10">
											<textarea class="wysihtml5 form-control" rows="6"></textarea>
										</div>
									</div>
					</div>
			</form>
		</div>
	</div>
</div>	
<script type="text/javascript">
	$(function(){
		$('.wysihtml5').wysihtml5({
            "stylesheets": [CLOUD.PATH + "/assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
        });
	});
</script>