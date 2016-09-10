<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%> 
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
	<div class="page-toolbar">
		<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height grey-salt" data-placement="top" data-original-title="数据日期范围">
			<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<div class="trig-search">
		<form class="form form-inline " role="form" id="trig-search-form">
			<div class="form-group">
				<input type="text" class="form-control"  placeholder="用户名"  id="sl_username"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysLog">
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
								<button id="deleteSysLog" class="btn green trig-privbtn" privkey="deleteSysLog">删除</button> 
							</div>
							<div class="btn-group">
								<button id="deletesSysLog" class="btn green trig-privbtn" privkey="deletesSysLog">删除查询</button> 
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-log-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-log-table .checkboxes"/>
					</th>
					<th>用户名</th>  
					<th class="hidden-xs">姓名</th>
					<th>操作</th>
					<th class="hidden-xs">状态</th>
					<th class="hidden-xs trig-th-time">创建时间</th>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/log.js"></script>