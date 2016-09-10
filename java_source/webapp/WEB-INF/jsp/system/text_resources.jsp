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
					<i class="fa icon-folder"></i>类型
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="text_resources_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="text_resources_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9">
			<div class="portlet box blue-hoki" >
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>文本列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="text_resources_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addTextResources" class="btn green trig-privbtn" privkey="addTextResources" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateTextResources" class="btn green trig-privbtn" privkey="updateTextResources">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteTextResources" class="btn green trig-privbtn" privkey="deleteTextResources">删除</button>  
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div>
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-text-resources-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-text-resources-table .checkboxes"/>
					</th>
					<th>标识</th>
					<th>文本</th>
					<th class="trig-th-time">创建时间</th>
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
<div id="textResourcesEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="textResourcesEditform">
	<input type="hidden" name="str_resourcesId" id="str_resourcesId" />
	<input type="hidden" name="sd_dictionaryId" id="sd_dictionaryId" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">标识</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入标识" name="str_resourcesNo" id="str_resourcesNo">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">文本</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  placeholder="请输入文本" name="str_resourcesName" id="str_resourcesName">
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/text_resources.js"></script>