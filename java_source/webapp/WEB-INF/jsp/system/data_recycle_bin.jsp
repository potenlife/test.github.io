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
				<input type="number" class="form-control"  placeholder="名称"  id="dataname"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysDataRecycleBin">
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
								<button id="updateSysDataRecycleBin" class="btn green" >还原</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysDataRecycleBin" class="btn green">删除</button> 
							</div>
							<div class="btn-group">
								<button id="deleteAllSysDataRecycleBin" class="btn green">清空</button> 
							</div>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-data_recycle_bin-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-data_recycle_bin-table .checkboxes"/>
					</th>
					<th>名称</th>  
					<th>类型</th> 
					<th class="trig-th-time">时间</th>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/data_recycle_bin.js"></script>