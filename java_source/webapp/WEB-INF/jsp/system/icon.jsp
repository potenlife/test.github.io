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
				<input type="text" class="form-control"  placeholder="名称"  id="siconname"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysIcon">
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
								<button id="addSysIcon" class="btn green trig-privbtn" privkey="addSysIcon" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysIcon" class="btn green trig-privbtn" privkey="updateSysIcon">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysIcon" class="btn green trig-privbtn" privkey="deleteSysIcon">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-icon-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-icon-table .checkboxes"/>
					</th>
					<th>class 名称</th>  
					<th>图标文件</th>
					<th>类型</th>
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
<div id="iconEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="iconEditform">
	<input type="hidden" name="si_iconId" id="si_iconId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">class 名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="si_className" id="si_className">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">图标文件</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="si_iconPath" id="si_iconPath" >
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/icon.js"></script>