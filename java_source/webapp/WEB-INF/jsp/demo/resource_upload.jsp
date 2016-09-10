<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%> 
<h3 class="page-title">
	<c:mi key="findDemoFileUpload"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFileUpload"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 文件上传
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
							<label class="col-md-3 control-label">图片</label>
							<div class="col-md-4">
								<div class="input-group input-medium ">
								<input type="text" class="form-control" placeholder="请上传图片" readonly="readonly"  id="f1">
								<span class="input-group-btn"  > 
												<button class="btn green" type="button" id="fb1">上传</button>  
												</span>
								</div>
								<span class="help-block">
								.gif|.jpg|.jpeg|.png|.bmp. </span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">视频</label>
							<div class="col-md-4">
								<div class="input-group input-medium ">
									<input type="text" class="form-control" placeholder="请上传视频" readonly="readonly" id="f2">
									<span class="input-group-btn"  > 
												<button class="btn green" type="button" id="fb2">上传</button>  
												</span>
								</div>
								<span class="help-block">
										.swf|.flv|.mp4|.mpg. </span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">文件</label>
							<div class="col-md-4">
								<div class="input-group input-medium ">
									<input type="text" class="form-control" placeholder="请上传文件" readonly="readonly" id="f3">
									<span class="input-group-btn"  > 
												<button class="btn green" type="button" id="fb3">上传</button>  
												</span>
								</div>
								<span class="help-block">
								.doc|.docx|.wps|.txt|.xls|.xlsx|.csv|.ppt|.pptx|.pdf.</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">创建文件夹</label>
							<div class="col-md-4">
								<div class="input-group input-medium ">
									<input type="text" class="form-control" placeholder="文件夹路径" readonly="readonly" id="f4">
									<span class="input-group-btn"  > 
												<button class="btn green" type="button" id="fb4">创建</button>  
												</span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">上传</label>
							<div class="col-md-3">
								<select  class="form-control input-medium"  id="uploadType"> 
									<option value="">请选择类型</option>
									<option value="1">图片</option>
									<option value="3">视频</option>
									<option value="2">文件</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control" placeholder="请输入上传路径,从/开始"  id="filepath">
							</div>
							<div class="col-md-4">
								<div class="input-group input-medium ">
									<input type="text" class="form-control" placeholder="请上传文件" readonly="readonly" id="f5">
										<span class="input-group-btn"  > 
												<button class="btn green" type="button" id="fb5">upload</button>  
												</span>
								</div>
							</div>
						</div>
					</div>	
				</form>
				<!-- END FORM-->
			</div>
		</div>
	</div>
</div>	

<script id="script">
	$(function(){
		$("#fb1").on('click', function(){
			CLOUD.UPLOAD.openImg('f1');
		});
		$("#fb2").on('click', function(){
			CLOUD.UPLOAD.openVideo('f2');
		});
		$("#fb3").on('click', function(){
			CLOUD.UPLOAD.openFile('f3');
		});
		$("#fb4").on('click', function(){
			CLOUD.UPLOAD.openDir('f4');
		});
		$("#fb5").on('click', function(){
			var uploadType = $("#uploadType").val();
			var id = $("#filepath").val();
			if(uploadType == '' || id=='') {
				return false;
			}
			CLOUD.UPLOAD.open('f5', uploadType, id);
		});
	});
</script>