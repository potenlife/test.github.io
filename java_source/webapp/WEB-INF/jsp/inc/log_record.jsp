<%@ page contentType="text/html;charset=UTF-8" %>
<div id="sysLogModal" class="modal fade modal-scroll" tabindex="-1" data-width="960" data-height="500">    
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button> 
		<h4 class="modal-title">日志</h4>
	</div>
	<div class="modal-body">
		<div class="row">
				<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover" id="trig-log-table">
						<thead>
						<tr>
							<th class="table-checkbox">
								<input type="checkbox" class="group-checkable" data-set="#trig-log-table .checkboxes"/>
							</th>
							<th>用户名</th>
							<th>操作</th>
							<th>状态</th>    
							<th>创建时间	</th>
						</tr>
						</thead>
						<tbody>
						
						</tbody>
						</table> 
				</div> 
		</div>	
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button id="compareSysLog" class="btn green" >比较</button> 
	</div>
</div>

<div id="compareSysLogModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960"  data-height="500" data-max-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">比较</h4>
	</div>
	<!-- BEGIN FORM-->
	<div class="modal-body">
		<div class="row">
				<div	class="col-md-12" id="compareData">
				
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
	</div>
</div>

<div id="diffmodal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960"  data-height="500" data-max-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">数据对比</h4>
	</div>
	<!-- BEGIN FORM-->
	<div class="modal-body">
		<div class="row">
				<div	class="col-md-12" id="diffoutput">
				
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
	</div>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/inc/log_record.js"></script>		