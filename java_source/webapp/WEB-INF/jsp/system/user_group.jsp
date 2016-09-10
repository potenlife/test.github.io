<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>
<div class="trig-search">
		<form class="form form-inline " role="form" id="trig-search-form">
			<div class="form-group">
				<input type="text" class="form-control"  placeholder="名称"  id="sysusergroupname"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysUserGroup">
					<span class="fa fa-search"></span> 查询
				</button>
			</div>
		</form>
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="trig-table" >
			<div class="portlet-body trig-table-body" >
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addSysUserGroup" class="btn green trig-privbtn" privkey="addSysUserGroup" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysUserGroup" class="btn green trig-privbtn" privkey="updateSysUserGroup">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysUserGroup" class="btn green trig-privbtn" privkey="deleteSysUserGroup">删除</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn findSysUserGroupRole" privkey="findSysUserGroupRole">角色 </button>
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn findSysUserGroupUser" privkey="findSysUserGroupUser">用户</button>
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-user-group-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-user-group-table .checkboxes"/>
					</th>
					<th class="hidden-xs trig-th-id" >ID</th>  
					<th>名称</th>
					<th class="hidden-xs">描述</th>
					<th class="trig-th-time">创建时间	</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<div class="trig-bottom"></div>

<%--浮层操作 --%>
<div id="userGroupEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userGroupEditform">
	<input type="hidden" name="sug_groupId" id="sug_groupId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sug_groupName" id="sug_groupName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sug_description" id="sug_description"></textarea>
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

<div id="userGroupRoeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
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
									<select multiple="multiple" class="multi-select" id="usergrouproleselect"  > 
										
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
		<button type="button"  class="btn blue userrole-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue userrole-trig-next hidden-xs">下一个</button>
		<button type="button" class="btn blue trig-privbtn" id="userGroupRoelSaveBtn" privkey="addSysUserGroupRole">保存</button> 
	</div>
</div>

<div id="userGroupUserModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">用户</h4>
	</div>
	<div class="modal-body">
		<div class="row" > 
			<div class="col-md-12">
					<div class="table-toolbar notAnimate" >
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-4"> 
									<input type="hidden" id="user_group_user_id" class="form-control select2" > 
								</div>
								<div class="btn-group">
									<button id="addSysUserGroupUser" class="btn green trig-privbtn" privkey="addSysUserGroupUser" >新增</button> 
								</div>
								<div class="btn-group">
									<button id="deleteSysUserGroupUser" class="btn green trig-privbtn" privkey="addSysUserGroupUser">删除</button>
								</div>
							</div>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover" id="trig-user-group-user-table">
					<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-user-group-user-table .checkboxes"/> 
						</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>禁用</th>    
					</tr>
					</thead>
					<tbody>
					
					</tbody>
					</table> 
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button"  class="btn blue user-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue user-trig-next hidden-xs">下一个</button>
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/user_group.js"></script> 