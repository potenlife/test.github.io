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
				<input type="text" class="form-control"  placeholder="手机号"  id="name"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findMsgSmsInfo">
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
								<button id="addMsgSmsInfo" class="btn green trig-privbtn" privkey="addMsgSmsInfo" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateMsgSmsInfo" class="btn green trig-privbtn" privkey="updateMsgSmsInfo">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteMsgSmsInfo" class="btn green trig-privbtn" privkey="deleteMsgSmsInfo">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-msgSmsInfo-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-msgSmsInfo-table .checkboxes"/>
					</th>
					<th>手机号</th>
					<th>用户IP</th>
					<th>短信源</th>
					<th>发送时间</th>
					<th>推送次数</th>
					<th>发送结果</th>
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


<div id="msgSmsInfoEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760" data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="msgSmsInfoEditform">
	<input type="hidden" name="msi_infoId" id="msi_infoId" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">手机号</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入手机号" name="msi_mobile" id="msi_mobile">
									</div>
								</div>
							
								<div class="form-group">
									<label class="col-md-3 control-label">短信源</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入短信源" name="msi_smsSource" id="msi_smsSource">
									</div>
								</div>
							
								<div class="form-group" >
										<label class="col-md-3 control-label">发送时间</label>
										<div class="col-md-6">
											<div class="input-group date form_datetime">
												<input type="text" size="16" readonly class="form-control" name="msi_sendTime"  id="msi_sendTime">
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">内容</label>
									<div class="col-md-6">
										<textarea rows="5" class="form-control"  name="msi_content" id="msi_content" ></textarea>
									</div>
								</div>
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
		var msgSmsInfo = function () {
				// 访问URL定义
				var url = { 
						add : 'message/msgSmsInfo_add.json',
						update : 'message/msgSmsInfo_update.json',
						del : 'message/msgSmsInfo_delete.json',
						find : 'message/msgSmsInfo_findPageList.json'
				};
				// 变量定义
				// 列表数据
				var tablerows = [];
				// 表格
				var table = $('#trig-msgSmsInfo-table');
				var ttable = null;
			    
				// 列表初始
				var tableInit = function() {
					ttable = new CLOUD.Datatable({
				    		table : table, 
				    		url : url.find, 
				    		columns : [
				    				   { "data": null, "render": function(data, type, row, mete){
				    					   tablerows[row.msi_infoId] = row;
				    						return '<input type="checkbox" class="checkboxes" value="'+row.msi_infoId+'"/>';
				    				   }, orderable: false, className: "trig-checkbox" },
				    		                 { "data": "msi_mobile", "render":function(data,type,row,mete){
				    		                	 return '<span class="row-details row-details-close" dataid="'+row.msi_infoId+'"></span> ' + data ; 
				    		                 }},
				    		                 { "data": "msi_ip" },
				    		                 { "data": "msi_smsSource" },
				    		                 { "data": "msi_sendTime" },
				    		                 { "data": "msi_sendNum" },
				    		                 { "data": "msi_success", "render":function(data,type,row,mete){
				    		                	 return data=='0'?"初始 ":data=='1'?"成功 ": data=='2'?"失败 ":data=='3'?"禁用  ":""; 
				    		                 }},
				    		                 { "data": "msi_createTime" }
				    		],
	    					order: [[7,'desc']],
				    		dblclick : function() {   // 双击打开编辑浮层
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateMsgSmsInfo")) { 
				    	    		updateOpen();
				    	    	}
				    		}
				    });
					
					// 显示更多字段值
					ttable.initMore(function(id) { 
				    	 var rowData = tablerows[id];
				    	 var sOut = '<table>';
				    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
				    	 sOut += '<tr><td><div class="trig-more-content">创建人  ：</div></td><td>' + rowData.msi_createUserId + '</td></tr>';
				    	 sOut += '<tr><td><div class="trig-more-content">内容 ：</div></td><td>' + rowData.msi_content + '</td></tr>';
				    	 $.ajax({    		 
			    		     url:'message/msgSmsInfo_findList.json',
					       async: false ,
					    dataType: "json", 
					        type: "GET",  
					        data: "mss_infoId="+id, 
					     success:function(data){
					    	 //查找发送短信记录 
					    	 var length=data.length;
					  		 if(length>0){
					  			sOut += '<tr><td><div class="trig-more-content">短信记录 ：</div></td><td></td></tr>';
					  			for(var i=0;i<length;i++){
					  				sOut += '<tr><td><div class="trig-more-content">发送主:</div></td><td>'+data[i].mss_sendCompany+'</td></tr>';
					  				sOut += '<tr><td><div class="trig-more-content">发送时间 :</div></td><td>'+data[i].mss_sendTime+'</td></tr>';
					  				sOut += '<tr><td><div class="trig-more-content">发送结果 :</div></td><td>'+data[i].mss_result+'</td></tr>';
					  				sOut += '<tr><td><div class="trig-more-content"></div></td><td></td></tr>';
					  			}
					  		 }
					    	}
						}); 
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
						CLOUD.forminit($("#msgSmsInfoEditform"), data);
						$("#msgSmsInfoEditModal").modal('show');
					}
				};
				
				// 表单数据保存，新增/修改保存
				var formSaveInit = function() {
					// 表单选择数据初始
					// 是否点击保存&关闭
				    var saveclose = false;
					CLOUD.Validate("msgSmsInfoEditform",  function (form) { 
						var _url = url.add;
						var isadd = true;
						if($("#msi_infoId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#msgSmsInfoEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#msgSmsInfoEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					},{
						msi_mobile : {
							required : true
						},
						msi_content : {
							required : true
						}
					});
					
					// 点击保存关闭设置saveclose=true，保存时判断
				    $(".cloudsaveclose").bind('click', function(){
				    	CLOUD.SAVECLOSE = true; 
				    	saveclose = true;
				    });
				    
				    // 编辑浮层关闭刷新列表数据
				    $("#msgSmsInfoEditModal").on("hidden", function(){   
						ttable.reload();
						saveclose = false; 
					});
				};
				
				return {
					// 查询
					query : function() {
						ttable.query({ msi_mobile : $("#name").val()});  
					},
					// 打开新增
					addWindowOpen : function() {
						CLOUD.formreset($("#msgSmsInfoEditform"));
	    				CLOUD.hidePrveNext();
	    				$("#msgSmsInfoEditModal").modal('show');
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
	    msgSmsInfo.init();
	    
	    // 功能按钮事件绑定
	    // 查询
	    $("#findMsgSmsInfo").bind('click', function() {
	    	msgSmsInfo.query();
		});
	    $("#addMsgSmsInfo").bind('click', function(){
	    	msgSmsInfo.addWindowOpen();
	    });
	    $("#updateMsgSmsInfo").bind('click', function(){
	    	msgSmsInfo.updateWindowOpen();
	    });
	    $("#deleteMsgSmsInfo").bind('click', function(){
	    	msgSmsInfo.del();
	    });
	    
	    // 日志
	    $(".findSysLogs").bind('click', function(){
	    	var ids = msgSmsInfo.getTable().getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	    });

	 	//发送时间 
	    var handleDatetimePicker = function () {
	        $(".form_datetime").datetimepicker({
	            autoclose: true,
	            isRTL: Metronic.isRTL(),
	            format: "yyyy-mm-dd hh:ii:ss",
	            pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left")
	        });
	    }
        handleDatetimePicker();
    });
});
</script>