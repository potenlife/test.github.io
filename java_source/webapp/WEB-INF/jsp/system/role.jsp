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
				<input type="text" class="form-control"  placeholder="名称"  id="srolename"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysRole">
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
								<button id="addSysRole" class="btn green trig-privbtn" privkey="addSysRole" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysRole" class="btn green trig-privbtn" privkey="updateSysRole">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysRole" class="btn green trig-privbtn" privkey="deleteSysRole">删除</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs findUserRole" privkey="findUserRole">用户 </button>
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs findRolePrivlegeDef" privkey="findRolePrivlegeDef">权限</button>
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs LockedNo"  disabled  privkey="updateRoleLocked">启用</button>
							</div>
							<div class="btn-group ">   
								<button class="btn green trig-privbtn hidden-xs LockedYes"  disabled privkey="updateRoleLocked">禁用</button>    
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div>
							</c:is>
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle visible-xs" data-toggle="dropdown" >操作 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn findUserRole" privkey="findUserRole"> 
									用户 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn findRolePrivlegeDef" privkey="findRolePrivlegeDef"> 
									权限 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn LockedNo" privkey="updateUserLocked"> 
									启用 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn LockedYes" privkey="updateUserLocked"> 
									禁用</a>
								</li>
							</ul>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-role-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-role-table .checkboxes"/> 
					</th>
					<th>名称</th>
					<th>类别</th>
					<th class="hidden-xs">描述</th>
					<th>禁用</th>
					<th class="hidden-xs trig-th-time">创建时间	</th>
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
<div id="roleEditModal" class="modal fade modal-scroll trig-edit-modal trig-edit-lock-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="roleEditform">
	<input type="hidden" name="sr_roleId" id="sr_roleId" /> 
	<input type="hidden" name="sr_isLocked"  id="sr_isLocked" value="N"/> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sr_roleName" id="sr_roleName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sr_description" id="sr_description"></textarea>
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

<div id="roleUserModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
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
									<input type="hidden" id="role_user_id" class="form-control select2" > 
								</div>
								<div class="btn-group">
									<button id="addUserRole" class="btn green trig-privbtn" privkey="addUserRole" >新增</button> 
								</div>
								<div class="btn-group">
									<button id="deleteUserRole" class="btn green trig-privbtn" privkey="addUserRole">删除</button>
								</div>
							</div>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover" id="trig-role-user-table">
					<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-role-user-table .checkboxes"/> 
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

<div id="rolePrivModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960"  data-height="500">  
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">权限</h4>
	</div>
	<div class="modal-body" >  
		<div class="row portlet box"  > 
			<div class="portlet-body"> 
				<div class="tabbable-custom ">
					<ul class="nav nav-tabs" id="privtabs">
						<li class="active">
							<a href="#priv_tab_1" data-toggle="tab"  data-index="0">
							权限</a>
						</li>
						<c:is key="cloud.privlege.curd"  >
						<li>
							<a href="#priv_tab_2" data-toggle="tab"  data-index="1">
							通用权限</a>
						</li>
						</c:is>
						<c:is key="cloud.privlege.content"  >
						<li>
							<a href="#priv_tab_3" data-toggle="tab"  data-index="2"> 
							内容权限</a>
						</li>
						</c:is>
						<c:is key="cloud.privlege.data"  >
						<li>
							<a href="#priv_tab_4" data-toggle="tab"  data-index="3">
							字段权限</a>
						</li>
						</c:is>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="priv_tab_1">
							<div id="tree_role_priv" class="tree-demo">  
							</div>
						</div>	
						<c:is key="cloud.privlege.curd"  >
						<div class="tab-pane" id="priv_tab_2">
							<div id="rolemoduletree" class="tree-demo">     
							</div>
						</div>
						</c:is>
						<c:is key="cloud.privlege.content"   >
						<div class="tab-pane" id="priv_tab_3">
							<div class="table-toolbar notAnimate" >
								<div class="row">
									<div class="col-md-12">
										<div class="btn-group">
											<button id="addRoleContent" class="btn green trig-privbtn" privkey="addRolePrivlegeDef" >新增</button> 
										</div>
										<div class="btn-group">
											<button id="deleteRoleContent" class="btn green trig-privbtn" privkey="addRolePrivlegeDef">删除</button>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-striped table-bordered table-hover" id="trig-role-content-table">
							<thead>
							<tr>
								<th class="table-checkbox">
									<input type="checkbox" class="group-checkable" data-set="#trig-role-content-table .checkboxes"/> 
								</th>
								<th>名称</th>
								<th>路径</th>
								<th>权限</th>
								<th>继承</th>    
							</tr>
							</thead>
							<tbody>
							
							</tbody>
							</table>
						</div>
						</c:is>
						<c:is key="cloud.privlege.data"  >
						<div class="tab-pane" id="priv_tab_4">
							<div class="row">
								<div class="col-md-12">
									<div class="table-toolbar notAnimate" >
										<div class="row">
											<div class="col-md-12">
												<div class="col-md-4"> 
													<input type="hidden" id="role_column_id" class="form-control select2" > 
												</div>
												<div class="btn-group">
													<button id="addRoleNotColumn" class="btn green trig-privbtn" privkey="addRolePrivlegeDef" >新增</button> 
												</div>
												<div class="btn-group">
													<button id="deleteRoleNotColumn" class="btn green trig-privbtn" privkey="addRolePrivlegeDef">删除</button>
												</div>
											</div>
										</div>
									</div>
									<table class="table table-striped table-bordered table-hover" id="trig-role-column-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-role-column-table .checkboxes"/> 
										</th>
										<th>表名</th>
										<th>列名</th>
										<th>别名</th>    
									</tr>
									</thead>
									<tbody>
									
									</tbody>
									</table> 
								</div> 
							</div>
						</div>
						</c:is>
					</div>
				</div>	
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button"  class="btn blue priv-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue priv-trig-next hidden-xs">下一个</button>
		<button type="button" class="btn blue trig-privbtn" id="rolePrivSaveBtn" privkey="addRolePrivlegeDef">保存</button> 
	</div>
</div>

<div id="contentPrivAddModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">新增内容权限</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="contentPrivAddform">
	<input type="hidden" name="src_roleId" id="src_roleId" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-2 control-label">名称</label>
								<div class="col-md-8">
									<input type="text" class="form-control"  name="src_contentId" id="src_contentId"  >
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">权限</label>
								<div class="col-md-8">
									<select id="src_contentPrivlegeDef" name="src_contentPrivlegeDef" class="form-control">
										<option value="">请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">继承</label>
								<div class="col-md-8">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="src_isExtends"  value="Y" checked> 是</label>
										<label class="radio-inline">
										<input type="radio" name="src_isExtends"  value="N" > 否 </label>
									</div>
								</div>
							</div>
					</div>
				</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue">保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/role.js"></script>