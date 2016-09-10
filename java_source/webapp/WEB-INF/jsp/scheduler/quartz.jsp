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
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="updateQuartzJobCron" class="btn green trig-privbtn" privkey="updateSchedulerQuartzJob">修改时间表达式</button> 
							</div>
							<div class="btn-group">
								<button id="pauseQuartzScheduler" class="btn green trig-privbtn" privkey="updateSchedulerQuartzJob" >暂停</button> 
							</div>
							<div class="btn-group">
								<button id="resumeQuartzScheduler" class="btn green trig-privbtn" privkey="updateSchedulerQuartzJob" >恢复</button> 
							</div>
							<div class="btn-group">
								<button id="deleteQuartzScheduler" class="btn green trig-privbtn" privkey="updateSchedulerQuartzJob">删除</button>
							</div>
							<div class="btn-group">
								<button id="executeQuartzScheduler" class="btn green trig-privbtn" privkey="updateSchedulerQuartzJob">运行</button> 
							</div>
							
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-quartz-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-quartz-table .checkboxes"/>
					</th>
					<th>任务名称</th>  
					<th>任务组</th>
					<th>时间表达式</th>
					<th>数据状态</th>
					<th>任务状态</th>
					<th class="hidden-xs">运行中</th>
					<th class="trig-th-time hidden-xs">创建时间</th>
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
<div id="schedulerQuartzEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">修改时间表达式</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="schedulerQuartzEditform">
	<input type="hidden" name="sqj_jobId" id="sqj_jobId" /> 
	<input type="hidden" name="sqj_triggerName" id="sqj_triggerName" />
	<input type="hidden" name="sqj_triggerGroup" id="sqj_triggerGroup" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">任务名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sqj_jobName" id="sqj_jobName" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">任务组</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sqj_jobGroup" id="sqj_jobGroup" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">时间表达式</label>
								<div class="col-md-6">
									<input type="text" class="form-control"  name="sqj_cronExpression" id="sqj_cronExpression" >
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue">保存</button> 
	</div>
	</form>
	<!-- END FORM-->
</div>

<script>
$(function() {
	var quartz = {};
	quartz.url = {};
	quartz.url.execute = 'scheduler/quartz_execute.json';
	quartz.url.pause = 'scheduler/quartz_pause.json';
	quartz.url.resume = 'scheduler/quartz_resume.json';
	quartz.url.update = 'scheduler/quartz_updateCron.json';
	quartz.url.del = 'scheduler/quartz_delete.json';
	quartz.url.find = 'scheduler/quartz_findList.json';
	
	var tablerows = []; 
    var table = $('#trig-quartz-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : quartz.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.sqj_jobId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+(row.sqj_jobId)+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "sqj_jobName" , "render": function(value, type, row) {
    		                	return  '<span class="row-details row-details-close" dataid="'+row.sqj_jobId+'"></span> ' + value; 
    		                 }}, 
    		                 { "data": "sqj_jobGroup"},  
    		                 { "data": "sqj_cronExpression", orderable: false }, 
    		                 { "data": "sqj_state", "render":function(value){
    		                	 if(value=='1') { // 运行中
      		 						return '正常';
      		 					}else {
      		 						return '停止';
      		 					}}}, 
    		                 { "data": "job_state" }, 
    		                 { "data": "job_type" , orderable: false, "render":function(value){
    		                	 if(value=='1') { // 运行中
     		 						return 'Y';
     		 					}else {
     		 						return 'N';
     		 					}
     		                 } , orderable: false},
     		                { "data": "sqj_createTime" }
    		],
    		order: [[7,'desc']],
    		paging:false
    });
    
 	// 显示更多字段值
    ttable.initMore(function(id) { 
   	 	var rowData = tablerows[id];
   	 	var sOut = '<table>';
   	 	sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
   		sOut += '<tr><td><div class="trig-more-content">触发器名称：</div></td><td>' + rowData.sqj_triggerName + '</td></tr>';
   		sOut += '<tr><td><div class="trig-more-content">触发器组：</div></td><td>' + rowData.sqj_triggerGroup + '</td></tr>';
   		sOut += '<tr><td><div class="trig-more-content">Spring Service名称：</div></td><td>' + rowData.sqj_serviceName + '</td></tr>';
   		sOut += '<tr><td><div class="trig-more-content">执行方法：</div></td><td>' + rowData.sqj_serviceMethod + '</td></tr>';
   		sOut += '<tr><td><div class="trig-more-content">方法参数：</div></td><td>' + rowData.sqj_data + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">描述：</div></td><td>' + rowData.sqj_desciption + '</td></tr>';
        sOut += '<tr  class="visible-xs"><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sqj_createTime + '</td></tr>';
        sOut += '</table>';
        return  sOut;
    });
 	
 	// 打开修改时间表达式
    $("#updateQuartzJobCron").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(CLOUD.isSelectOne(rows)) {
			var rowdata = tablerows[objs.val()];
			CLOUD.forminit($("#schedulerQuartzEditform"), rowdata);
			$("#schedulerQuartzEditModal").modal('show');
		}
    });
 	
    CLOUD.Validate('schedulerQuartzEditform', function(form){
    	
    	CLOUD.trackPost(quartz.url.update, $(form).serialize(), function(data){
    		$("#schedulerQuartzEditModal").modal('hide');
    		ttable.reload();
			CLOUD.updateSuccessAlert();
		});
    	
		return false;
	}, {
		// 验证规则
		sqj_cronExpression : { 
			required : true
		}
	});
 	
    $("#pauseQuartzScheduler").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(CLOUD.isSelectOne(rows)) {
			var rowdata = tablerows[objs.val()];
			var jobstate = rowdata.job_state;
			if(jobstate && jobstate == 'NORMAL') {
				CLOUD.trackPost(quartz.url.pause, rowdata, function(data){
					ttable.reload();
					CLOUD.messager.alert("已暂停");
				});
			} else {
				CLOUD.messager.alert("此任务状态不可操作");
			}
			
		}
    }); 
    
    $("#resumeQuartzScheduler").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(CLOUD.isSelectOne(rows)) {
			var rowdata = tablerows[objs.val()];
			var jobstate = rowdata.job_state;
			if(jobstate == undefined || (jobstate && jobstate == 'PAUSED')) {
				CLOUD.trackPost(quartz.url.resume, rowdata, function(data){
					ttable.reload();
					CLOUD.messager.alert("已恢复");
				});
			} else {
				CLOUD.messager.alert("此任务状态不可操作");
			}
		}
    });
    
 	// 运行
    $("#executeQuartzScheduler").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		if(CLOUD.isSelectOne(rows)) {
			var rowdata = tablerows[objs.val()];
			var jobstate = rowdata.job_state;
			if(jobstate && jobstate == 'NORMAL') {
				CLOUD.trackPost(quartz.url.execute, rowdata, function(data){
					ttable.reload();
					CLOUD.messager.alert("启动运行");
				});
			} else {
				CLOUD.messager.alert("此任务状态不可操作");
			}
		}
    });
 	
 	// 删除
 	$("#deleteQuartzScheduler").bind('click', function() {
 		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(quartz.url.del, "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
			});
		});
 	});
});
</script>