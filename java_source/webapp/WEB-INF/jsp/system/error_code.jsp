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
				<input type="number" class="form-control"  placeholder="代码"  id="errorcode"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysErrorCode">
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
								<button id="addSysErrorCode" class="btn green trig-privbtn" privkey="addSysErrorCode" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysErrorCode" class="btn green trig-privbtn" privkey="updateSysErrorCode">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysErrorCode" class="btn green trig-privbtn" privkey="deleteSysErrorCode">删除</button> 
							</div>
							
							<div class="btn-group">
								<button id="updateSysErrorCodeJS" class="btn green trig-privbtn" privkey="updateSysErrorCode">生成JS</button>
							</div>
							
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-error-code-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-error-code-table .checkboxes"/>
					</th>
					<th>代码</th>  
					<th>消息</th>
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
<div id="errorCodeEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="errorCodeEditform">
	<input type="hidden" id="isupdate" name="isupdate" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">代码</label>
								<div class="col-md-6">
									<input type="number" class="form-control" placeholder="请输入代码" name="sec_codeId" id="sec_codeId">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">消息</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sec_msg" id="sec_msg" >
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
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/error_code.js"></script>