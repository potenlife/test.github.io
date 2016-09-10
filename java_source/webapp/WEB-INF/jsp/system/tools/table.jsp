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
				<input type="text" class="form-control"  placeholder="表名"  id="systablename"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysTable">
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
								<button id="addSysTable" class="btn green trig-privbtn" privkey="addSysTable" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysTable" class="btn green trig-privbtn" privkey="updateSysTable">修改</button>
							</div>
							<div class="btn-group">
								<button id="findTableColumn" class="btn green" >字段</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysTable" class="btn green trig-privbtn" privkey="deleteSysTable">删除</button> 
							</div>
							<div class="btn-group">
								<button id="updateJS" class="btn green trig-privbtn" privkey="updateSysTable">生成JS</button>
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-table-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-table-table .checkboxes"/>
					</th>
					<th>表名</th>  
					<th>别名</th>
					<th>页面名称</th>
					<th class="trig-th-time">创建时间</th>
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
<div id="tableEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="tableEditform">
	<input type="hidden" name="st_tableId" id="st_tableId" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">表名</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入表名" name="st_tableName" id="st_tableName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">别名</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="st_aliasName" id="st_aliasName"  placeholder="请输入别名" >
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">页面名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="st_pageName" id="st_pageName"  placeholder="请输入页面名称" >
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<%@include file="../../inc/editbtn.jsp" %>   
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="tableColumnEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="1260" data-max-height="500px" data-min-height="500px">  
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title" id="tablename">字段编辑</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
					<div class="table-toolbar notAnimate" > 
							<div class="btn-group">
								<button id="addSysTableColumn" class="btn green trig-privbtn" privkey="updateSysTable" >初始加载</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysTableColumn" class="btn green trig-privbtn" privkey="updateSysTable" >加载未加载列</button> 
							</div>
							<div class="btn-group">
								<button id="deleteSysTableColumn" class="btn green trig-privbtn" privkey="deleteSysTable" >删除</button> 
							</div>
							<div class="btn-group">
								<button id="refreshSysTableColumn" class="btn green"  >刷新</button> 
							</div>
					</div>
					<table class="table table-striped table-bordered table-hover" id="trig-table-column-table">
					<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-table-column-table .checkboxes"/>
						</th>
						<th>字段名</th>  
						<th>别名</th>
						<th>页面名称</th>
						<th>页类型</th>
						<th>主键</th>
						<th>可空</th>
						<th>验证规则</th>
						<th>更新</th>
						<th>查询</th>
						<th>创建时间</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
					</table>
				</div>	
			</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue"  id="columnsave">保存</button>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/tools/table.js"></script>