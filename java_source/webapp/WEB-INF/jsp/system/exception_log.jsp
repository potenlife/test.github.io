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
				<input type="text" class="form-control"  placeholder="类名"  id="sel_className_q"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysExceptionLog">
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
								<button id="deleteSysExceptionLog" class="btn green trig-privbtn" privkey="deleteSysExceptionLog">删除</button> 
							</div>
							<div class="btn-group">
								<button id="deletesSysExceptionLog" class="btn green trig-privbtn" privkey="deletesSysExceptionLog">删除查询</button> 
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-exception-log-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-exception-log-table .checkboxes"/>
					</th>
					<th>类名</th>  
					<th class="hidden-xs">方法名</th>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/exception_log.js"></script>