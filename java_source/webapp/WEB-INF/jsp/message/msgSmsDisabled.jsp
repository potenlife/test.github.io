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
				<button type="submit" class="btn green " onclick="return false;" id="findMsgSmsDisabled">
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
								<button id="addMsgSmsDisabled" class="btn green trig-privbtn" privkey="addMsgSmsDisabled" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateMsgSmsDisabled" class="btn green trig-privbtn" privkey="updateMsgSmsDisabled">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteMsgSmsDisabled" class="btn green trig-privbtn" privkey="deleteMsgSmsDisabled">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-msgSmsDisabled-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-msgSmsDisabled-table .checkboxes"/>
					</th>
					<th>禁用手机</th> 
					<th>禁用IP</th> 
					<th>禁用原因</th>
					<th>创建人</th>  
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


<div id="msgSmsDisabledEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760" data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="msgSmsDisabledEditform">
	<input type="hidden" name="msd_disabledId" id="msd_disabledId" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">禁用手机号</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入手机号" name="msd_mobile" id="msd_mobile">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">禁用IP</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入用户IP" name="msd_ip" id="msd_ip">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">内容</label>
									<div class="col-md-6">
										<textarea rows="5" class="form-control"  name="msd_note" id="msd_note" ></textarea>
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
		var msgSmsDisabled = function () {
				// 访问URL定义
				var url = { 
						add : 'message/msgSmsDisabled_add.json',
						update : 'message/msgSmsDisabled_update.json',
						del : 'message/msgSmsDisabled_delete.json',
						find : 'message/msgSmsDisabled_findPageList.json'
				};
				// 变量定义
				// 列表数据
				var tablerows = [];
				// 表格
				var table = $('#trig-msgSmsDisabled-table');
				var ttable = null;
			    
				// 列表初始
				var tableInit = function() {
					ttable = new CLOUD.Datatable({
				    		table : table, 
				    		url : url.find, 
				    		columns : [
				    				   { "data": null, "render": function(data, type, row, mete){
				    					   tablerows[row.msd_disabledId] = row;
				    						return '<input type="checkbox" class="checkboxes" value="'+row.msd_disabledId+'"/>'; 
				    				   }, orderable: false, className: "trig-checkbox" },
				    		                 { "data": "msd_mobile", "render":function(data,type,row,mete){
				    		                	 return '<span class="row-details row-details-close" dataid="'+row.msd_disabledId+'"></span> ' + data ;  
				    		                 }},
				    		                 { "data": "msd_ip" },
				    		                 { "data": "msd_note" },
				    		                 { "data": "msd_createUserId" },
				    		                 { "data": "msd_createTime" }
				    		],
	    					order: [[5,'desc']],
				    		dblclick : function() {   // 双击打开编辑浮层
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateMsgSmsDisabled")) { 
				    	    		updateOpen();
				    	    	}
				    		}
				    });
					
					// 显示更多字段值
					ttable.initMore(function(id) { 
				    	 var rowData = tablerows[id];
				    	 var sOut = '<table>';
				    	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
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
						CLOUD.forminit($("#msgSmsDisabledEditform"), data);
						$("#msgSmsDisabledEditModal").modal('show');
					}
				};
				
				// 表单数据保存，新增/修改保存
				var formSaveInit = function() {
					// 是否点击保存&关闭
				    var saveclose = false;
					CLOUD.Validate("msgSmsDisabledEditform",  function (form) { 
						var _url = url.add;
						var isadd = true;
						if($("#msd_disabledId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#msgSmsDisabledEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#msgSmsDisabledEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					},{
						msd_mobile : {
							mobile : true
						},
						msd_ip : {
							ip : true
						}
					});
					
					// 点击保存关闭设置saveclose=true，保存时判断
				    $(".cloudsaveclose").bind('click', function(){
				    	CLOUD.SAVECLOSE = true; 
				    	saveclose = true;
				    });
				    
				    // 编辑浮层关闭刷新列表数据
				    $("#msgSmsDisabledEditModal").on("hidden", function(){   
						ttable.reload();
						saveclose = false; 
					});
				};
				
				return {
					// 查询
					query : function() {
						ttable.query({ msd_mobile : $("#name").val()});  
					},
					// 打开新增
					addWindowOpen : function() {
						CLOUD.formreset($("#msgSmsDisabledEditform"));
	    				CLOUD.hidePrveNext();
	    				$("#msgSmsDisabledEditModal").modal('show');
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
	    msgSmsDisabled.init();
	    
	    // 功能按钮事件绑定
	    // 查询
	    $("#findMsgSmsDisabled").bind('click', function() {
	    	msgSmsDisabled.query();
		});
	    $("#addMsgSmsDisabled").bind('click', function(){
	    	msgSmsDisabled.addWindowOpen();
	    });
	    $("#updateMsgSmsDisabled").bind('click', function(){
	    	msgSmsDisabled.updateWindowOpen();
	    });
	    $("#deleteMsgSmsDisabled").bind('click', function(){
	    	msgSmsDisabled.del();
	    });
	    
	    // 日志
	    $(".findSysLogs").bind('click', function(){
	    	var ids = msgSmsDisabled.getTable().getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	    });
    });
});
</script>