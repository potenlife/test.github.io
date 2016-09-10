<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormHtmlText"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormHtmlText"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 富文本输入框（CKEditor）
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
					<div class="form-body" >
							<div class="form-body">
									<div class="form-group last">
										<label class="control-label col-md-3">CKEditor</label>
										<div class="col-md-9">
											<textarea class="ckeditor form-control" name="editor1" rows="6"></textarea>
										</div>
									</div>
								</div>
					</div>
			</form>
		</div>
	</div>
</div>	
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace('editor1', { on: {
				change: function(evt){
					$("#" + evt.editor.name).val(evt.editor.getData());
				}
			}
		});
	});
</script>