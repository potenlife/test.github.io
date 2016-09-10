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
					<i class="fa fa-users"></i>组织机构
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="org_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="org_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9">
			<div class="portlet box blue-hoki" >
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>组织机构列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="org_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addSysOrganization" class="btn green trig-privbtn" privkey="addSysOrganization" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysOrganization" class="btn green trig-privbtn" privkey="updateSysOrganization">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysOrganization" class="btn green trig-privbtn" privkey="deleteSysOrganization">删除</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn findSysOrganizationRole hidden-xs" privkey="findSysOrganizationRole">角色 </button>
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div>
							</c:is>
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle hidden-xs trig-privbtn" data-toggle="dropdown" privkey="moveSysOrganization">移动 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgMove" privkey="moveSysOrganization"> 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgUp" privkey="moveSysOrganization"> 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgDown" privkey="moveSysOrganization"> 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgTop" privkey="moveSysOrganization"> 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgBottom" privkey="moveSysOrganization"> 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moveSysOrganization" privkey="moveSysOrganization"> 
									重置排序 </a>
								</li>
							</ul>
							</div>
							
						 <div class="btn-group  ">  
							<button class="btn green dropdown-toggle visible-xs" data-toggle="dropdown" >操作 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgMove" privkey="moveSysOrganization"> 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgUp" privkey="moveSysOrganization"> 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgDown" privkey="moveSysOrganization"> 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgTop" privkey="moveSysOrganization"> 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn orgBottom" privkey="moveSysOrganization"> 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn moveSysOrganization" privkey="moveSysOrganization"> 
									重置排序 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn findSysOrganizationRole" privkey="findSysOrganizationRole"> 
									角色 </a>
								</li>
							</ul>
							</div>
							
						</div>
						 
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-organization-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-organization-table .checkboxes"/>
					</th>
					<th>名称</th>
					<th>编号</th>
					<th>排序</th>
					<th>禁用</th>    
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
<div id="orgEditModal" class="modal fade modal-scroll" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="orgEditform">
	<input type="hidden" name="so_organizationId" id="so_organizationId" />
	<input type="hidden" name="so_parentOrganizationId" id="so_parentOrganizationId" value="2"/>  
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="so_organizationName" id="so_organizationName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">编号</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="so_organizationNo" id="so_organizationNo">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">类别</label>
								<div class="col-md-6">
										<select class="form-control" name="so_type" id="so_type" > 
												<option value="">请选择</option> 
										</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">禁用</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="so_state"  value="Y" > 是 </label>
										<label class="radio-inline">
										<input type="radio" name="so_state"  value="N" checked> 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="so_description" id="so_description"></textarea>
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

<div id="orgRoeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">角色</h4>
	</div>
	<div class="modal-body">
		<div class="row" > 
			<div class="portlet-body form"> 
				<div class="form-body">
					<div class="form-group">
							<label class="control-label col-md-2"></label>
							<div class="col-md-8">
								<form class="form form-inline " role="form" id="trig-role-search-form">
									<div class="form-group">
										<input type="text" class="form-control"  placeholder="角色"  id="srolename"/>
									</div>
									<div class="form-group">
										<button type="submit" class="btn green " onclick="return false;" id="findSysRole">
											<span class="fa fa-search"></span> 查询
										</button>
									</div>
								</form>
								<div style="padding-top:10px">
									<select multiple="multiple" class="multi-select" id="orgroleselect"  > 
										
									</select> 
								</div>
							</div> 
					</div>
				</div>
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button"  class="btn blue role-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue role-trig-next hidden-xs">下一个</button>
		<button type="button" class="btn blue trig-privbtn" id="orgRoelSaveBtn" privkey="addSysOrganizationRole">保存</button> 
	</div>
</div>

<div id="orgMoveModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">移动到</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body"> 
							<div class="form-group">
								<label class="col-md-4 control-label">将 <span id="moveorganizationname" style="color:red;"></span> 移动到父组织</label>
								<div class="col-md-6">
										<select class="form-control"  name="orgmoveselect" id="orgmoveselect" >
											<option value="">请选择</option> 
										</select>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/organization.js"></script>