<%@ page contentType="text/html;charset=UTF-8" %>
<div id="publicUploadModal" class="modal fade modal-scroll" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">文件上传</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="publicUploadform">
	<input type="hidden" name="id" 	value="/uploadfiles"/>
    <input type="hidden" name="uploadType"  value="0"/>
    <input type="hidden" name="uploadID"  />
    <input type="hidden" name="watermarkImg"  />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">文件</label>
								<div class="col-md-6">
									<input type="file" class="form-control" placeholder="请选择文件"  name="uploadfile" id="publicuploadfile" >
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" >上传</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="publicUploadCreateModal" class="modal fade modal-scroll" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">创建文件夹</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="publicUploadCreateform">
	<input type="hidden" name="id"   value="/"/>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称"  name="fileName" >
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" >新建</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="publicUploadViewModal" class="modal fade modal-scroll" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">查看</h4>
	</div>
	<!-- BEGIN FORM-->
	<input type="hidden" name="id"   value="/"/>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">文件</label>
								<div class="col-md-6" id="uploadfileviewid">
									
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
	</div>
	<!-- END FORM-->
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/inc/resource_upload.js"></script>