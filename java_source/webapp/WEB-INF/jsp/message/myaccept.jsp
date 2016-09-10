<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
我的收件箱 <small></small>
</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li><i class="fa fa-home"></i><a href="javascript:gotourl('start');void(0);">首页</a>	<i class="fa fa-angle-right"></i>	</li>
		<li>
			<a href="#">我的收件箱</a>
		</li>
	</ul>
	<div class="page-toolbar">
		<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height grey-salt" data-placement="top" data-original-title="接收时间日期范围">
			<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<div class="trig-search">
		<form class="form form-inline " role="form" id="trig-search-form">
			<div class="form-group">
				<input type="text" class="form-control"  placeholder="关键字"  id="keywords" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findMessageInfo">
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
								<button id="updateMyMessageInfoAccept" class="btn green">标识为已读</button>
							</div>
							<div class="btn-group">
								<button id="deleteMyMessageInfoAccept" class="btn green">删除</button> 
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-myaccept-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-myaccept-table .checkboxes"/>
					</th>
					<th>发件人</th>
					<th class="hidden-xs">内容</th>
					<th>状态</th>
					<th class="trig-th-time">发送时间</th>
					<th class="hidden-xs trig-th-time">接收时间</th>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/message/myaccept.js"></script>