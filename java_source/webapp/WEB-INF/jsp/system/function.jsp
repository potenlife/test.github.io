<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
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
								<button id="addSysFunction" class="btn green trig-privbtn" privkey="addSysFunction" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysFunction" class="btn green trig-privbtn" privkey="updateSysFunction">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysFunction" class="btn green trig-privbtn" privkey="deleteSysFunction">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-function-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-function-table .checkboxes"/>
					</th>
					<th class="hidden-xs trig-th-id" >ID</th>  
					<th>名称</th>
					<th>权值前缀</th>
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
<div id="functionEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="functionEditform">
	<input type="hidden" name="sf_sysFunctionId" id="sf_sysFunctionId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sf_functionName" id="sf_functionName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">权值</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入权值"  name="sf_functionPrivDef" id="sf_functionPrivDef" >
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/function.js"></script>