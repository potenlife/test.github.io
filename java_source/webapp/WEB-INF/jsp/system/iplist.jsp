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
				<input type="text" class="form-control"  placeholder="IP"  id="sipname"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysIpList">
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
								<button id="addSysIpList" class="btn green trig-privbtn" privkey="addSysIpList" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysIpList" class="btn green trig-privbtn" privkey="updateSysIpList">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysIpList" class="btn green trig-privbtn" privkey="deleteSysIpList">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-ip-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-ip-table .checkboxes"/>
					</th>
					<th>IP</th>  
					<th>类型</th>
					<th>站点类型</th>
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
<div id="ipEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="ipEditform">
	<input type="hidden" name="sil_listId" id="sil_listId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">IP</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sil_ip" id="sil_ip">
									<span class="help-block">
											192.168.120.150 </span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sil_description" id="sil_description"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">类型</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sil_type"  value="1"  checked> 黑名单 </label>
										<label class="radio-inline">
										<input type="radio" name="sil_type"  value="0"  > 白名单</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">站点类型</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sil_limitType"  value="0"  > 前端 </label>
										<label class="radio-inline">
										<input type="radio" name="sil_limitType"  value="1"  checked> 后端</label>
										<label class="radio-inline">
										<input type="radio" name="sil_limitType"  value="-1"  > 全部</label>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/global/plugins/fuelux/js/spinner.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/global/plugins/jquery.input-ip-address-control-1.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/iplist.js"></script>