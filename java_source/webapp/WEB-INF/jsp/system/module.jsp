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
					<a href="javascript:;" class="reload" id="module_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="module_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9">
			<div class="portlet box blue-hoki" >
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>菜单列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="module_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addSysModule" class="btn green trig-privbtn" privkey="addSysModule" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysModule" class="btn green trig-privbtn" privkey="updateSysModule">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysModule" class="btn green trig-privbtn" privkey="deleteSysModule">删除</button> 
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
							<button class="btn green dropdown-toggle hidden-xs trig-privbtn" data-toggle="dropdown" privkey="moveSysModule">移动 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn moduleMove" > 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moduleUp" > 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moduleDown" > 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moduleTop" > 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moduleBottom" > 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moveSysModule" > 
									重置排序 </a>
								</li>
							</ul>
							</div>
							
						 <div class="btn-group  ">  
							<button class="btn green dropdown-toggle visible-xs" data-toggle="dropdown" >操作 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn moduleMove" privkey="moveSysModule"> 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moduleUp" privkey="moveSysModule"> 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moduleDown" privkey="moveSysModule"> 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moduleTop" privkey="moveSysModule"> 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moduleBottom" privkey="moveSysModule"> 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moveSysModule" privkey="moveSysModule"> 
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
				<table class="table table-striped table-bordered table-hover" id="trig-module-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-module-table .checkboxes"/>
					</th>
					<th>名称</th>
					<th>权限</th>
					<th>排序</th>
					<th>菜单</th>    
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
<div id="moduleEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="moduleEditform">
	<input type="hidden" name="sm_moduleId" id="sm_moduleId" />
    <input type="hidden" name="sm_parentModuleId" id="sm_parentModuleId" value="0"/>
    <input type="hidden" name="sm_moduleType" id="sm_moduleType" value="1"/>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sm_moduleName" id="sm_moduleName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">权值</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  placeholder="请输入权值" name="sm_modulePrivlegeDef" id="sm_modulePrivlegeDef">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">URL</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="sm_url" id="sm_url">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">叶子</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sm_isLeaf"  value="Y"  checked> 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sm_isLeaf"  value="N" > 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">菜单</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sm_isMenu"  value="Y"  checked> 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sm_isMenu"  value="N" > 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">加载类型</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sm_loadWay"  value="AJAX"  checked> AJAX </label>
										<label class="radio-inline">
										<input type="radio" name="sm_loadWay"  value="IFRAME" > IFRAME</label>
										<label class="radio-inline">
										<input type="radio" name="sm_loadWay"  value="SKIP" > SKIP</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图标</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="sm_icon" id="sm_icon">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sm_description" id="sm_description"></textarea>
								</div>
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

<div id="moduleRoeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
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
							<select multiple="multiple" class="multi-select" id="moduleroleselect"  > 
								
							</select> 
							</div> 
					</div>
				</div>
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue trig-privbtn" id="moduleRoelSaveBtn" privkey="addRolePrivlegeDef">保存</button> 
	</div>
</div>

<div id="moduleMoveModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">移动到</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body"> 
							<div class="form-group">
								<label class="col-md-4 control-label">将 <span id="movemodulename" style="color:red;"></span> 移动到父菜单</label>
								<div class="col-md-6">
										<input type="text" name="modulemoveselect" id="modulemoveselect"  class="form-control"/>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/module.js"></script>