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
				<!-- TODO 这里写查询条件 -->
				<input type="text" class="form-control"  placeholder="关键字"  id="name"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findMsgEmailOpen">
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
								<button id="deleteMsgEmailOpen" class="btn green trig-privbtn" privkey="deleteMsgEmailOpen">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-msgEmailOpen-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-msgEmailOpen-table .checkboxes"/>
					</th>
					<th>主题</th>
					<th>邮件类型</th>
					<th>邮箱来源</th>
					<th>IP</th>  
					<th class="trig-th-time">打开时间	</th>
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
<script>
$(function(){
	var msgEmailOpen = {};
	msgEmailOpen.url = {};
	msgEmailOpen.url.add = 'message/msgEmailOpen_add.json';
	msgEmailOpen.url.update = 'message/msgEmailOpen_update.json';
	msgEmailOpen.url.del = 'message/msgEmailOpen_delete.json';
	msgEmailOpen.url.find = 'message/msgEmailOpen_findPageList.json';
	
	var tablerows = []; 
    var table = $('#trig-msgEmailOpen-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : msgEmailOpen.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
						   //TODO 这里是ID列，这里修改...
    					   tablerows[row.meo_openId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.meo_openId+'"/>'; //TODO 这里是ID列，这里修改...  
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "mei_subject", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.meo_openId+'"></span> ' + data ;  //TODO 这里显示更多，这里修改ID...  
    		                 }},
    		                 { "data": "mei_emailType","render":function(data,type,mete){
    		                	 //0 普通 1 紧急 2 定时
    		                	 if(data == 1){
    		                		 return "紧急"
    		                	 }else if(data==2){
    		                		 return "定时"
    		                	 }else{
    		                		 return "普通"
    		                	 }
    		                 }},
    		                 { "data": "meo_emailSource" },
    		                 { "data": "meo_ip" },
    		                 { "data": "meo_openTime" }
    		],
			//TODO 这里设置排序列，从0开始。。。
    		order: [[5,'desc']],
    		dblclick : function() {   // 双击打开编辑浮层
    			
    		} 
    });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
     // 显示更多字段值
     ttable.initMore(function(id) { 
    	 var rowData = tablerows[id];
    	 var sOut = '<table>';
    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
    	 sOut += '<tr><td><div class="trig-more-content">邮件内容：</div></td><td>' + rowData.mei_content + '</td></tr>';
    	 sOut += '<tr><td><div class="trig-more-content">发件人：</div></td><td>' + rowData.mei_email + '</td></tr>';
        //TODO 这里编写更多列显示。。。
         sOut += '</table>';
         return  sOut;
     });
    
    // 查询
    $("#findMsgEmailOpen").bind('click', function() {
		//TODO 这里写查询条件...
    	ttable.query({ mei_content : $("#name").val()}); 
	});
    
    
	
	// 删除
	$("#deleteMsgEmailOpen").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(msgEmailOpen.url.del, "ids=" + ids, function(data){
				ttable.reload();
			});
		});
	});
	
	// 日志
	 $(".findSysLogs").bind('click', function(){
	    	var ids = ttable.getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	  }); 
    
});
</script>