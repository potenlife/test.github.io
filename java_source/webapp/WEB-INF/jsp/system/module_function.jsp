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
					<i class="fa icon-folder"></i>菜单
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="module_function_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="module_function_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9">
			<div class="portlet box blue-hoki" >
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>功能列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="module_function_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addSysModuleFunction" class="btn green trig-privbtn" privkey="addSysModuleFunction" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysModuleFunction" class="btn green trig-privbtn" privkey="updateSysModuleFunction">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysModuleFunction" class="btn green trig-privbtn" privkey="deleteSysModuleFunction">删除</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn findRolePrivlegeDef hidden-xs" privkey="findRolePrivlegeDef">角色 </button>
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div>
							</c:is>
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle hidden-xs trig-privbtn" data-toggle="dropdown" privkey="moveSysModuleFunction">移动 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn module_functionMove" > 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn module_functionUp" > 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn module_functionDown" > 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn module_functionTop" > 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn module_functionBottom" > 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moveSysModuleFunction" > 
									重置排序 </a>
								</li>
							</ul>
							</div>
							
						 <div class="btn-group  ">  
							<button class="btn green dropdown-toggle visible-xs" data-toggle="dropdown" >操作 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn module_functionMove" privkey="moveSysModuleFunction"> 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn module_functionUp" privkey="moveSysModuleFunction"> 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn module_functionDown" privkey="moveSysModuleFunction"> 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn module_functionTop" privkey="moveSysModuleFunction"> 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn module_functionBottom" privkey="moveSysModuleFunction"> 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moveSysModuleFunction" privkey="moveSysModuleFunction"> 
									重置排序 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn findRolePrivlegeDef" privkey="findRolePrivlegeDef"> 
									角色 </a>
								</li>
							</ul>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-module-function-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-module-function-table .checkboxes"/>
					</th>
					<th>名称</th>
					<th>权限</th>
					<th>排序</th>
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
<div id="module_functionEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="module_functionEditform">
	<input type="hidden" name="smf_functionId" id="smf_functionId" />
	 <input type="hidden" name="smf_moduleId" id="smf_moduleId" value="0"/>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="smf_functionName" id="smf_functionName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">权值</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  placeholder="请输入权值" name="smf_functionPrivDef" id="smf_functionPrivDef">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="smf_description" id="smf_description"></textarea>
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

<div id="module_functionRoeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">角色</h4>
	</div>
	<div class="modal-body">
		<div class="row" > 
			<div class="portlet-body form"> 
				<div class="form-body">
					<div class="form-group">
							<label class="control-label col-md-3"></label>
							<div class="col-md-9">
							<select multiple="multiple" class="multi-select" id="module_functionroleselect"  > 
								
							</select> 
							</div> 
					</div>
				</div>
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue trig-privbtn" id="module_functionRoelSaveBtn" privkey="addRolePrivlegeDef">保存</button> 
	</div>
</div>

<div id="module_functionMoveModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">移动到</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body"> 
							<div class="form-group">
								<label class="col-md-4 control-label">将 <span id="movemodule_functionname" style="color:red;"></span> 移动到父菜单</label>
								<div class="col-md-6">
										<input type="text" name="module_functionmoveselect" id="module_functionmoveselect"  class="form-control"/>
								</div>
							</div>
					</div>
				</div>	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue" id="moveSave">移动</button>
	</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/module_function.js"></script>