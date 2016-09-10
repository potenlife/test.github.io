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
				<input type="text" class="form-control"  placeholder="关键字"  id="name"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findMsgEmailInfo">
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
							<%-- <div class="btn-group">
								<button id="deleteMsgEmailInfo" class="btn green trig-privbtn" privkey="deleteMsgEmailInfo">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is> --%>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-msgEmailInfo-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-msgEmailInfo-table .checkboxes"/>
					</th>
					<th>主题</th>
					<th>邮件来源</th>
					<th>邮件类型</th>
					<th>推送次数</th>
					<th>发送人邮箱</th>
					<th>发送人姓名</th>
					<th class="trig-th-time">创建时间	</th>
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
	var msgEmailInfo = {};
	msgEmailInfo.url = {};
	msgEmailInfo.url.add = 'message/msgEmailInfo_add.json';
	msgEmailInfo.url.update = 'message/msgEmailInfo_update.json';
	msgEmailInfo.url.del = 'message/msgEmailInfo_delete.json';
	msgEmailInfo.url.find = 'message/msgEmailInfo_findPageList.json';
	msgEmailInfo.url.findAccept = 'message/msgEmailInfo_findAcceptList.json';
	
	var tablerows = []; 
    var table = $('#trig-msgEmailInfo-table');
    // begin first table
    var ttable = new CLOUD.Datatable({
    		table : table, 
    		url : msgEmailInfo.url.find, 
    		columns : [
    				   { "data": null, "render": function(data, type, row, mete){
    					   tablerows[row.mei_emailInfoId] = row;
    						return '<input type="checkbox" class="checkboxes" value="'+row.mei_emailInfoId+'"/>';   
    				   }, orderable: false, className: "trig-checkbox" },
    		                 { "data": "mei_subject", "render":function(data,type,row,mete){
    		                	 return '<span class="row-details row-details-close" dataid="'+row.mei_emailInfoId+'"></span> ' + data ;    
    		                 }},
    		                 { "data": "mei_emailSource" },
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
    		                 { "data": "mei_sendNum" },
    		                 { "data": "mei_email" },
    		                 { "data": "mei_username" },
    		                 { "data": "mei_createTime" }
    		],
    		order: [[7,'desc']],
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
    	 sOut += '<tr><td><div class="trig-more-content">发送时间：</div></td><td>' + rowData.mei_sendTime + '</td></tr>';
    	 //0初始1成功2失败3禁发
    	 sOut += '<tr><td><div class="trig-more-content">发送状态：</div></td><td>' + (rowData.mei_success=='1' ? '成功' : rowData.mei_success =='2' ? '失败': rowData.mei_success =='3' ? '禁发' : '初始') + '</td></tr>';
    	 sOut += '<tr><td><div class="trig-more-content">用户ip：</div></td><td>' + rowData.mei_ip + '</td></tr>';
    	 $.post(msgEmailInfo.url.findAccept,"id=" + id, function(data){
				data = CLOUD.successHandle(data);
				var names = "";
				$.each(data,function(i,item){
					names+="邮箱："+item.mea_email
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
					+"接收类型："+(item.mea_acceptType=='to' ? '接收者' : item.mea_acceptType =='mc' ? '抄送者' : '密送者')
					names+="<br/>";
				});
				$('.myaccept').html(names);
			});
    	
		 sOut += '<tr><td><div class="trig-more-content">收件人：</div></td><td class="myaccept"></td></tr>';
    	 sOut += '<tr><td><div class="trig-more-content">内容：</div></td><td>' + rowData.mei_content + '</td></tr>';
         sOut += '</table>';
         return  sOut;
     });
    
    // 查询
    $("#findMsgEmailInfo").bind('click', function() {
    	ttable.query({ mei_content : $("#name").val()}); 
	});
    
	// 删除
	$("#deleteMsgEmailInfo").bind('click', function(){
		var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(msgEmailInfo.url.del, "ids=" + ids, function(data){
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