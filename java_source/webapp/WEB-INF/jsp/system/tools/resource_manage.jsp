<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-3">
		<div class="portlet blue-hoki box" > 
			<div class="portlet-title">
				<div class="caption">
					<i class="fa icon-folder"></i>文件夹
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="resource_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="resource_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9">
			<div class="portlet box blue-hoki" >  
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>文件列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="resource_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="createResourceManage" class="btn green trig-privbtn" privkey="uploadResourceManage" >创建文件夹</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn copyResourceManage hidden-xs hidden-sm" privkey="copyResourceManage">复制</button>
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn cutResourceManage hidden-xs hidden-sm" privkey="copyResourceManage">剪切</button> 
							</div> 
							<div class="btn-group">
								<button class="btn green trig-privbtn pasteResourceManage hidden-xs hidden-sm" privkey="copyResourceManage">粘贴</button> 
							</div>
							<div class="btn-group">
								<button id="uploadResourceManage" class="btn green trig-privbtn" privkey="uploadResourceManage" >上传</button> 
							</div>
							<div class="btn-group">
								<button id="deleteResourceManage" class="btn green trig-privbtn" privkey="deleteResourceManage" >删除</button> 
							</div>
							
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle" data-toggle="dropdown" >操作 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn copyResourceManage hidden-xs hidden-sm" privkey="copyResourceManage"> 
									复制 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn cutResourceManage hidden-xs hidden-sm" privkey="copyResourceManage"> 
									剪切</a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn pasteResourceManage hidden-xs hidden-sm" privkey="copyResourceManage"> 
									粘贴 </a>
								</li>
								<li>
									<a id="uploadsResourceManage" href="javascript:;" class="btn trig-privbtn" privkey="uploadResourceManage"> 
									批量上传 </a>
								</li>
								<li>
									<a id="downloadResourceManage" href="javascript:;" class="btn trig-privbtn hidden-xs" privkey="downloadResourceManage"> 
									下载 </a>
								</li>
								<li>
									<a id="deleteAllResourceManage" href="javascript:;" class="btn trig-privbtn" privkey="deleteAllResourceManage"> 
									级联删除 </a>
								</li>
								<li>
									<a id="backupResourceManage" href="javascript:;" class="btn trig-privbtn" privkey="backupResourceManage"> 
									备份</a>
								</li>
								<c:is key="cloud.log.open">
								 <li>
									<a href="javascript:;" class="btn trig-privbtn hidden-xs findSysLogs" privkey="findSysLogs">  
									日志</a>
								</li>
								</c:is>
							</ul>
							</div>
							
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-resource-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-resource-table .checkboxes"/>  
					</th>
					<th>名称</th>
					<th>修改时间</th>
					<th class="hidden-xs">类型</th>
					<th class="hidden-xs">大小</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
		</div>
		</div>
	</div>
</div>

<%--  浮层  --%>
<div id="createModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">创建文件夹</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="createform">
	<input type="hidden" name="id" id="id" value="/"/>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称"  name="fileName" id="createDir" >
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" >保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="uploadModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">上传</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="uploadform">
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">文件</label>
								<div class="col-md-6">
									<input type="file" class="form-control" placeholder="请选择文件"  name="uploadfile" id="uploadfile" >
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

<div id="uploadsModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">批量上传</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="uploadsform">
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">文件(ZIP)</label>
								<div class="col-md-6">
									<input type="file" class="form-control" placeholder="请选择文件"  name="zipfile"  id="zipfile">
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
<iframe src="" style="display:none;" id="uploadiframe"></iframe>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/tools/resource_manage.js"></script>