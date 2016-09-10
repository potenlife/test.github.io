<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="trig-table" >
			<div class="portlet-body trig-table-body" >
				<table class="table table-striped table-bordered table-hover" id="trig-cache-table">
				<thead>
				<tr>
					<th>缓存ID</th>
					<th>大小</th>  
					<th style="width:200px">操作</th>
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
<div id="cacheRemoveModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">清除key</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="cacheRemoveform">
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">ID</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="id" id="cacheid" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">key</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入key" name="key" id="key">
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" >保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/tools/cache.js"></script>