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
				<input type="text" class="form-control"  placeholder="用户名"  id="susername"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysUser">
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
						<%-- 第三方登录不可修改，需设置 --%>
							<c:is key="cloud.user.add"  >
							<div class="btn-group">
								<button id="addSysUser" class="btn green trig-privbtn" privkey="addSysUser" >新增</button> 
							</div>
							</c:is>
							<div class="btn-group">
								<button id="updateSysUser" class="btn green trig-privbtn" privkey="updateSysUser">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysUser" class="btn green trig-privbtn" privkey="deleteSysUser">删除</button> 
							</div>
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs findUserRole" privkey="findUserRole">角色 </button>
							</div>
							<c:is key="cloud.user.privlege"  >
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs findSysUserPrivlegeDef" privkey="findSysUserPrivlegeDef">权限设置</button>
							</div>
							</c:is>
							<div class="btn-group">
								<button class="btn green hidden-xs viewSysUserPrivlegeDef" >权限查看</button>
							</div>
							<c:is key="cloud.user.group"  >
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs findUserGroup" privkey="findSysUser">用户组</button>
							</div>
							</c:is>
							<div class="btn-group">
								<button class="btn green trig-privbtn hidden-xs LockedNo"  disabled  privkey="updateUserLocked">启用</button>
							</div>
							<div class="btn-group ">   
								<button class="btn green trig-privbtn hidden-xs LockedYes"  disabled privkey="updateUserLocked">禁用</button>    
							</div>
							<c:is key="cloud.user.add"  >
							<div class="btn-group">
								<button  class="btn green trig-privbtn hidden-xs updatePassword" privkey="updatePassword">重置密码</button>
							</div>
							</c:is>
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
									角色 </a>
								</li>
								<c:is key="cloud.user.privlege">
								<li>
									<a href="javascript:;" class="btn trig-privbtn findSysUserPrivlegeDef" privkey="findSysUserPrivlegeDef"> 
									权限设置 </a>
								</li>
								</c:is> 
								<li>
									<a href="javascript:;" class="btn viewSysUserPrivlegeDef" >权限查看</a>
								</li>
								<c:is key="cloud.user.group"   >
								<li>
									<a href="javascript:;" class="btn trig-privbtn findUserGroup" privkey="findSysUser"> 
									用户组 </a>
								</li>
								</c:is> 
								<li>
									<a href="javascript:;" class="btn trig-privbtn LockedNo" privkey="updateUserLocked"> 
									启用 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn trig-privbtn LockedYes" privkey="updateUserLocked"> 
									禁用</a>
								</li>
								 <li>
									<a href="javascript:;" class="btn trig-privbtn updatePassword" privkey="updatePassword">  
									重置密码</a>
								</li>
							</ul>
							</div>
							
							<div class="btn-group hidden-xs hidden-sm">  
							<button class="btn green dropdown-toggle trig-privbtn" data-toggle="dropdown" privkey="exportSysUser">导出 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right" id="exportSysUser"> 
								
							</ul>
							</div>
							
						</div>
						 
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-user-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-user-table .checkboxes"/> 
					</th>
					<th>用户名</th>
					<th>姓名</th>
					<th class="hidden-xs">EMAIL</th>
					<th class="hidden-xs">手机</th>    
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
<div id="userEditModal" class="modal fade modal-scroll trig-edit-modal trig-edit-lock-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="userEditform">
	<input type="hidden" name="su_userId" id="su_userId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">用户名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入用户名" name="su_userName" id="su_userName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">密码</label>
								<div class="col-md-6">
										<input type="password" class="form-control" placeholder="密码" name="su_password" id="su_password">
								</div>
							</div>
							<c:is key="cloud.user.org"   >
							<div class="form-group">
								<label class="col-md-3 control-label">组织机构</label>
								<div class="col-md-6">
										<select class="form-control" name="su_organizationId" id="su_organizationId" >
												<option value="">请选择</option> 
										</select>
								</div>
							</div>
							</c:is>
							<div class="form-group">
								<label class="col-md-3 control-label">姓名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入姓名" name="su_realName" id="su_realName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">性别</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="M" checked> 先生</label>
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="F" > 女士 </label>
										<label class="radio-inline">
										<input type="radio" name="su_sex"  value="U" > 未知 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">手机号码</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="su_mobile" id="su_mobile">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Email</label>
								<div class="col-md-6">
										<input type="email" class="form-control"  name="su_email" id="su_email">
										<c:is key="cloud.user.password"   >
									<span class="help-block">
											用于找回密码</span>
											</c:is>
								</div>
							</div>
							<%-- 
							<div class="form-group">
								<label class="col-md-3 control-label">电话号码</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sue_phone" id="sue_phone">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">地址</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="sue_address" id="sue_address">
								</div>
							</div>
							--%>
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

<div id="roeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
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
									<select multiple="multiple" class="multi-select" id="roleselect"  > 
										
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
		<button type="button" class="btn blue trig-privbtn" id="roelSaveBtn" privkey="addUserRole">保存</button> 
	</div>
</div>
 
<div id="privModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  data-height="500">  
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">权限设置</h4>
	</div>
	<div class="modal-body" >  
		<div class="row" > 
			<div class="portlet-body"> 
				<div id="tree_priv" class="tree-demo">  
				</div>
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue trig-privbtn" id="privSaveBtn" privkey="addSysUserPrivlegeDef">保存</button> 
	</div>
</div>

<div id="viewPrivModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  data-height="500">  
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">权限查看</h4>
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
							<div id="view_tree_priv" class="tree-demo">  
							</div>
						</div>	
						<c:is key="cloud.privlege.curd"  >
						<div class="tab-pane" id="priv_tab_2">
							<div id="viewmoduletree" class="tree-demo">     
								
							</div>
						</div>
						</c:is>
						<c:is key="cloud.privlege.content"   >
						<div class="tab-pane" id="priv_tab_3">
							<table class="table table-striped table-bordered table-hover" id="trig-view-content-table">
							<thead>
							<tr>
								<th class="table-checkbox">
									<input type="checkbox" class="group-checkable" data-set="#trig-view-content-table .checkboxes"/> 
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
									<table class="table table-striped table-bordered table-hover" id="trig-view-column-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-view-column-table .checkboxes"/> 
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
		<button type="button"  class="btn blue privview-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue privview-trig-next hidden-xs">下一个</button>
	</div>
</div>

<div id="pwdModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">重置密码</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="pwdform">
	<input type="hidden" name="su_userId" id="su_userId2" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">用户名</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="su_userName" id="su_userName2"  readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">新密码</label>
								<div class="col-md-6">
										<input type="password" class="form-control" placeholder="新密码" name="su_password" id="su_password2">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">确认密码</label>
								<div class="col-md-6">
										<input type="password" class="form-control" placeholder="确认密码" name="su_password3" id="su_password3">
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


<div id="userGroupModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"> 
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">用户组</h4>
	</div>
	<div class="modal-body">
		<div class="row" > 
			<div class="portlet-body form"> 
				<div class="form-body">
					<div class="form-group">
							<label class="control-label col-md-2"></label>
							<div class="col-md-8">
							<select multiple="multiple" class="multi-select" id="userGropuselect"  > 
								
							</select> 
							</div> 
					</div>
				</div>
			</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button"  class="btn blue usergroup-trig-prev hidden-xs">上一个</button>
		<button type="button"  class="btn blue usergroup-trig-next hidden-xs">下一个</button>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/user.js"></script> 