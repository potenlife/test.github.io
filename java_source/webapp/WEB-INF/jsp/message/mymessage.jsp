<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
我的消息<small></small>
</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li><i class="fa fa-home"></i><a href="javascript:gotourl('start');void(0);">首页</a>	<i class="fa fa-angle-right"></i>	</li>
		<li>
			<a href="#">我的消息</a>
		</li>
	</ul>
	<div class="page-toolbar">
		<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height grey-salt" data-placement="top" data-original-title="时间日期范围">
			<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<div class="row inbox">
	<!-- <div class="col-md-2">
		<ul class="inbox-nav margin-bottom-10">
			<li class="accept active">
				<a class="btn" href="javascript:;" data-title="Accept">
				 我的收件箱</a>
				<b></b>
			</li>
			<li class="sent">
				<a class="btn" href="javascript:;" data-title="Sent">
				我的发件箱 </a>
				<b></b>
			</li>
			<li class="group">
				<a class="btn" href="javascript:;" data-title="Group">
				我的组消息 </a>
				<b></b>
			</li>
		</ul>
	</div> -->
	<div class="col-md-12" id="acceptbox">
		<div class="inbox-header">
			<h1 class="pull-left">我的收件箱</h1>
			<form class="form-inline pull-right" role="form" id="trig-search-form">
				<div class="input-group input-medium">
					<input type="text" class="form-control" placeholder="关键字" id="keywords" >
					<span class="input-group-btn">
					<button type="submit" class="btn green"  id="findMessageInfo"><i class="fa fa-search"></i></button>
					</span>
				</div>
			</form>
		</div>
		<div class="inbox-content portlet-body trig-table-body">
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
			<table class="table table-striped table-advance table-hover" id="trig-myaccept-table">
				<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-myaccept-table .checkboxes"/>
						</th>
						<th>发件人</th>
						<th>内容</th>
						<th class="hidden-xs trig-th-time">接收时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<!-- 我的发件箱 -->
	<div class="col-md-10" id="mysend" style="display:none">
		<div class="inbox-header">
			<h1 class="pull-left">我的发件箱</h1>
			<form class="form-inline pull-right" role="form" id="trig-search-form1">
				<div class="input-group input-medium">
					<input type="text" class="form-control" placeholder="关键字" id="keywords1" >
					<span class="input-group-btn">
					<button type="submit" class="btn green"  id="findMessageInfo1"><i class="fa fa-search"></i></button>
					</span>
				</div>
			</form>
		</div>
		<div class="inbox-content portlet-body trig-table-body">
			<div class="table-toolbar" >
				<div class="row">
					<div class="col-md-12">
						<div class="btn-group">
							<button id="deleteMysendInfoAccept" class="btn green">删除</button> 
						</div>
					</div>
				</div>
			</div>
			<table class="table table-striped table-advance table-hover" id="trig-mysend-table">
				<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-mysend-table .checkboxes"/>
						</th>
						<th>收件人</th>
						<th>内容</th>
						<th class="hidden-xs trig-th-time">发送时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<!-- 我的组消息 -->
	<div class="col-md-10" id="mygroup" style="display:none">
		<div class="inbox-header">
			<h1 class="pull-left">我的组消息</h1>
			<form class="form-inline pull-right" role="form" id="trig-search-form2">
				<div class="input-group input-medium">
					<input type="text" class="form-control" placeholder="关键字" id="keywords2" >
					<span class="input-group-btn">
					<button type="submit" class="btn green"  id="findMessageInfo2"><i class="fa fa-search"></i></button>
					</span>
				</div>
			</form>
		</div>
		<div class="inbox-content portlet-body trig-table-body">
			<div class="table-toolbar" >
				<div class="row">
					<div class="col-md-12">
						<div class="btn-group">
							<button id="updateMygroupInfoAccept" class="btn green">标识为已读</button>
						</div>
						<div class="btn-group">
							<button id="deleteMyGroup" class="btn green">删除</button> 
						</div>
					</div>
				</div>
			</div>
			<table class="table table-striped table-advance table-hover" id="trig-mygroup-table">
				<thead>
					<tr>
						<th class="table-checkbox">
							<input type="checkbox" class="group-checkable" data-set="#trig-mygroup-table .checkboxes"/>
						</th>
						<th>组名</th>
						<th>发件人</th>
						<th>内容</th>
						<th class="hidden-xs trig-th-time">发送时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>
<div class="trig-bottom"></div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/message/mymessage.js"></script>
<link href="<%=request.getContextPath()%>/assets/global/css/inbox.css" rel="stylesheet" type="text/css"/>