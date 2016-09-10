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
				<input type="text" class="form-control"  placeholder="名称"  id="name"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findMsgSmsSend">
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
								<button id="addMsgSmsSend" class="btn green trig-privbtn" privkey="addMsgSmsSend" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateMsgSmsSend" class="btn green trig-privbtn" privkey="updateMsgSmsSend">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteMsgSmsSend" class="btn green trig-privbtn" privkey="deleteMsgSmsSend">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-msgSmsSend-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-msgSmsSend-table .checkboxes"/>
					</th>
					<th>名称</th>  
					<!-- TODO 这里添加显示列表 -->
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


<div id="msgSmsSendEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760" data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="msgSmsSendEditform">
	<!-- TODO 这里是主键ID -->
	<input type="hidden" name="id" id="id" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">名称</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入名称" name="name" id="name">
									</div>
								</div>
								<!-- TODO 这里写新增、修改表单元素 -->
							</div>
					</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<%@include file="../inc/editbtn.jsp" %>  
	</div>
	</form>
	<!-- END FORM-->
</div>

<script>
$(function(){
	CLOUD.LOADHTMLOrJs(function(){
		//对象定义
		var msgSmsSend = function () {
				// 访问URL定义
				var url = { 
						add : 'msgSmsSend_add.json',
						update : 'msgSmsSend_update.json',
						del : 'msgSmsSend_delete.json',
						find : 'msgSmsSend_findPageList.json'
				};
				// 变量定义
				// 列表数据
				var tablerows = [];
				// 表格
				var table = $('#trig-msgSmsSend-table');
				var ttable = null;
			    
				// 列表初始
				var tableInit = function() {
					ttable = new CLOUD.Datatable({
				    		table : table, 
				    		url : url.find, 
				    		columns : [
				    				   { "data": null, "render": function(data, type, row, mete){
										   //TODO 这里是ID列，这里修改...
				    					   tablerows[row.id] = row;
				    						return '<input type="checkbox" class="checkboxes" value="'+row.id+'"/>'; //TODO 这里是ID列，这里修改...  
				    				   }, orderable: false, className: "trig-checkbox" },
				    		                 { "data": "name", "render":function(data,type,row,mete){
				    		                	 return '<span class="row-details row-details-close" dataid="'+row.id+'"></span> ' + data ;  //TODO 这里显示更多，这里修改ID...  
				    		                 }},
				    		                 //TODO 这里添加显示列对应字段别名。。。
				    		                 { "data": "createTime" }
				    		],
				    		//TODO 这里设置排序列，从0开始。。。
	    					order: [[4,'desc']],
				    		dblclick : function() {   // 双击打开编辑浮层
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateMsgSmsSend")) { 
				    	    		updateOpen();
				    	    	}
				    		}
				    });
					
					// 显示更多字段值
					ttable.initMore(function(id) { 
				    	 var rowData = tablerows[id];
				    	 var sOut = '<table>';
				    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
				        //TODO 这里编写更多列显示。。。
				         sOut += '</table>';
				         return  sOut;
					});
				};
				
				var updateOpen = function() {
					var ids = ttable.getCheckbox();
					var rows = ids.size();
					// 是否选择单条记录
					if(CLOUD.isSelectOne(rows)) {
						CLOUD.showPrveNext(); 
						var id = ids.get(0).value;
						var data = tablerows[id];
						// 初始表单数据
						CLOUD.forminit($("#msgSmsSendEditform"), data);
						$("#msgSmsSendEditModal").modal('show');
					}
				};
				
				// 表单数据保存，新增/修改保存
				var formSaveInit = function() {
					// 表单选择数据初始
					//TODO ...
					
					// 是否点击保存&关闭
				    var saveclose = false;
					/*CLOUD.FormValidate("msg_sms_send", "msgSmsSendEditform",  function (form) { //TODO 工具->表管理设置规则
						var _url = url.add;
						var isadd = true;
						if($("#si_msgSmsSendId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#msgSmsSendEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#msgSmsSendEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					});*/
					
					CLOUD.Validate("msgSmsSendEditform",  function (form) { 
						var _url = url.add;
						var isadd = true;
						if($("#si_msgSmsSendId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#msgSmsSendEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#msgSmsSendEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					},{
					//TODO 这里添加验证规则
						name : {
							required : true
						}
					});
					
					// 点击保存关闭设置saveclose=true，保存时判断
				    $(".cloudsaveclose").bind('click', function(){
				    	CLOUD.SAVECLOSE = true; 
				    	saveclose = true;
				    });
				    
				    // 编辑浮层关闭刷新列表数据
				    $("#msgSmsSendEditModal").on("hidden", function(){   
						ttable.reload();
						saveclose = false; 
					});
				};
				
				return {
					// 查询
					query : function() {
						ttable.query({ name : $("#name").val()});  //TODO 查询字段这里修改
					},
					// 打开新增
					addWindowOpen : function() {
						CLOUD.formreset($("#msgSmsSendEditform"));
	    				CLOUD.hidePrveNext();
	    				$("#msgSmsSendEditModal").modal('show');
					},
					// 打开修改/编辑
					updateWindowOpen : function() {
						updateOpen();
					},
					// 删除
					del : function() {
						var objs = ttable.getCheckbox();
						var rows = objs.size();
						CLOUD.isDelSelectOne(rows,function(){
							var ids = "";
							objs.each(function(){
								ids += this.value + ",";
							});   
							CLOUD.trackPost(url.del, "ids=" + ids, function(data){
								ttable.reload();
							});
						});
					},
					init : function() {
						tableInit();
						
						ttable.next(); // 初始下一个按钮事件
					    ttable.prev(); // 初始上一个按钮事件
					    
					    // 高级查询
					    //CLOUD.search('msg_sms_send', $("#findMsgSmsSend"), ttable); //TODO ...
					    
					    formSaveInit();
					},
					getTable : function() {
						return ttable;
					},
					getTableRows : function() {
						return tablerows;
					}
				};
		}(); // 定义并执行
		
		// 执行初始
	    msgSmsSend.init();
	    
	    // 功能按钮事件绑定
	    // 查询
	    $("#findMsgSmsSend").bind('click', function() {
	    	msgSmsSend.query();
		});
	    $("#addMsgSmsSend").bind('click', function(){
	    	msgSmsSend.addWindowOpen();
	    });
	    $("#updateMsgSmsSend").bind('click', function(){
	    	msgSmsSend.updateWindowOpen();
	    });
	    $("#deleteMsgSmsSend").bind('click', function(){
	    	msgSmsSend.del();
	    });
	    
	    // 日志
	    $(".findSysLogs").bind('click', function(){
	    	var ids = msgSmsSend.getTable().getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	    });
    });
});
</script>