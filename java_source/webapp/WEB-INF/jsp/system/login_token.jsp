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
				<input type="text" class="form-control"  placeholder="用户名"  id="slt_username"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysLoginToken">
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
								<button id="deleteSysLoginToken" class="btn green trig-privbtn" privkey="deleteSysLoginToken">删除</button> 
							</div>
							<div class="btn-group">
								<button id="deletesSysLoginToken" class="btn green trig-privbtn" privkey="deletesSysLoginToken">删除查询</button> 
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-login-token-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-login-token-table .checkboxes"/>
					</th>
					<th>用户名</th>  
					<th>姓名</th>
					<th class="trig-th-time">登录时间</th>
					<th class="trig-th-time">退出时间</th>
					<th>登录IP	</th>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/login_token.js"></script>