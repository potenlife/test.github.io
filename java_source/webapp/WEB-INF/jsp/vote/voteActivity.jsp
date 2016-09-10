<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="t" uri="/cloud-tags"%>
<style>
.checkbox-inline{
	margin-left:5px !important;
	padding-left:0px !important;
}
.va_group{
	width:80%;
	margin:5px auto 5px auto;
	border-top:1px solid;
	height:1px;
	
}
</style>
<h3 class="page-title">
	<t:mi />
</h3>
<div class="page-bar">
	<t:navi />
</div>

<div class="cloud-search" style="margin-bottom:10px;">
		<form class="form form-inline " role="form" id="cloud-search-form">
			<div class="form-group">
				<!-- TODO 这里写查询条件 -->
				活动名称：<input type="text" class="form-control"  placeholder="活动名称"  id="name"/>
				活动时间：<div class="input-group date form_datetime" data-date="">
							<input type="text" size="16" readonly class="form-control">
							<span class="input-group-btn">
							<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
							</span>
							<span class="input-group-btn">
							<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
				/ <div class="input-group date form_datetime" data-date="">
							<input type="text" size="16" readonly class="form-control">
							<span class="input-group-btn">
							<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
							</span>
							<span class="input-group-btn">
							<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
							</span>
						</div>
				</div>
				<div class="form-group" style="margin-top: 10px;">
				活动状态：<select style="width:179px" class="form-control" id="search_status">
							<option value="">--全部--</option>
							<option value="1">未开始</option>
							<option value="2">进行中</option>
							<option value="3">已结束</option>
						</select>
						<button type="submit" class="btn green " onclick="return false;" id="findVoteActivity">
							<span class="fa fa-search"></span> 查询
						</button>
				</div>
		</form>
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="cloud-table" >
			<div class="portlet-body cloud-table-body" >
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addVoteActivity" class="btn green cloud-privbtn" privkey="addVoteActivity" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateVoteActivity" class="btn green cloud-privbtn" privkey="updateVoteActivity">编辑</button>
							</div>
							<div class="btn-group">
								<button id="deleteVoteActivity" class="btn green cloud-privbtn" privkey="deleteVoteActivity">删除</button> 
							</div>
							<t:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green cloud-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</t:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="cloud-voteActivity-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#cloud-voteActivity-table .checkboxes"/>
					</th>
					<!-- TODO 这里添加显示列表 -->
					<th>活动名称</th>  
					<th>活动时间</th> 
					<th>状态</th>  
					<th>分组</th>  
					<th>操作</th>					
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
<div class="cloud-bottom"></div>


<div id="voteActivityEditModal" class="modal fade modal-scroll cloud-edit-modal" tabindex="-1" data-width="760" data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="voteActivityEditform">
	<!-- TODO 这里是主键ID -->
	<input type="hidden" name="id" id="id" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">活动名称</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入活动名称" name="va_name" id="va_name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">活动时间从</label>
									<div class="col-md-6">
										<div class="input-group date form_datetime" data-date="">
											<input type="text" size="16" readonly name="va_startTime" id="va_startTime" class="form-control">
											<span class="input-group-btn">
											<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
											</span>
											<span class="input-group-btn">
											<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">至</label>
									<div class="col-md-6">
										<div class="input-group date form_datetime" data-date="">
											<input type="text" size="16" readonly id="va_endTime" name="va_endTime" class="form-control">
											<span class="input-group-btn">
											<button class="btn default date-reset" type="button"><i class="fa fa-times"></i></button>
											</span>
											<span class="input-group-btn">
											<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">页面选择</label>
									<div class="col-md-6">
										<a class="btn green"><i class="fa fa-plus"></i></a>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">排序方式</label>
									<div class="col-md-6">
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="va_orderType"  value="asc" checked>正序</label>
											<label class="radio-inline">
											<input type="radio" name="va_orderType"  value="desc" > 倒序 </label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">排序字段</label>
									<div class="col-md-6">
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="va_orderField"  value="code" checked>编号</label>
											<label class="radio-inline">
											<input type="radio" name="va_orderField"  value="ticknum" > 得票数 </label>
											<label class="radio-inline">
											<input type="radio" name="va_orderField"  value="attendtime" >参加时间</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">投票次数</label>
									<div class="col-md-6">
										<div class="radio-list">
											<label class="radio-inline">
												每人<input type="radio" name="va_voteUserType"  value="1" checked>次
												<input type="text" style="width:4em;" id="va_voteCount_1" name="va_voteCount_1"/>
											</label>
											<label class="radio-inline">
												每天/人<input type="radio" name="va_voteUserType"  value="2" checked>次
												<input type="text" style="width:4em;"  id="va_voteCount_2" name="va_voteCount_2"/>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">参与者可被投票次数</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="每人/次" name="va_partCount" id="va_partCount">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">防作弊规则</label>
									<div class="col-md-6">
										<div class="checkbox-list">
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="cookie" > Cookie</label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="ip" > IP</label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="session" > Session </label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="vcode" > 验证码 </label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="phone" > 手机号 </label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="idcard" > 身份证号 </label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_cheat"  value="email" > 邮箱 </label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">得票统计</label>
									<div class="col-md-6">
										<div class="radio-list">
											<label class="radio-inline">
											<input type="radio" name="va_gainTicketStat"  value="1" checked>百分比</label>
											<label class="radio-inline">
											<input type="radio" name="va_gainTicketStat"  value="2" > 得票数</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">报名内容选项</label>
									<div class="col-md-6">
										<div class="checkbox-list">
											<label class="checkbox-inline">
											<input type="checkbox" name="va_apply"  value="phone" > 手机号</label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_apply"  value="email" > 邮箱</label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_apply"  value="name" > 姓名 </label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_apply"  value="address" > 通讯地址</label>
											<label class="checkbox-inline">
											<input type="checkbox" name="va_apply"  value="idcard" >身份证号</label>
										</div>
									</div>
								</div>
								<div class="form-group" style="margin-bottom:0px">
									<div class="col-md-3" style="text-align: right;">
										组编号
									</div>
									<div class="col-md-2" style="margin-left:20px;">
										组名
									</div>
								</div>
								<div class="form-group">
									<div class="form-group" style="margin:0px;">
										<div class="va_group"></div>
										<label class="col-md-3 control-label">1</label>
										<div class="col-md-6">
											<input type="text" class="form-control" placeholder="组" name="va_group_1" id="va_group_1">
										</div>
									</div>
									<div class="form-group" style="margin:0px;">
										<div class="va_group"></div>
										<label class="col-md-3 control-label">2</label>
										<div class="col-md-6">
											<input type="text" class="form-control" placeholder="组" name="va_group_1" id="va_group_1">
										</div>
									</div>
									<div class="form-group" style="margin:0px;">
										<div class="va_group"></div>
										<label class="col-md-3 control-label">3</label>
										<div class="col-md-6">
											<input type="text" class="form-control" placeholder="组" name="va_group_1" id="va_group_1">
										</div>
									</div>
									<div class="form-group" style="margin:0px;">
										<div class="va_group"></div>
										<div class="col-md-12" style="text-align: right;padding-right:80px;">
											<a class="btn green"><i class="fa fa-plus"></i>添加组</a>
										</div>
										
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
		 if (jQuery().datepicker) {
           
        }
		 
		$(".form_datetime").datetimepicker({
            autoclose: true,
            isRTL: Metronic.isRTL(),
            format: "yyyy-mm-dd hh:ii",
            pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left")
        });
		
		//对象定义
		var voteActivity = function () {
				// 访问URL定义
				var url = { 
						add : 'vote/voteActivity_add.json',
						update : 'vote/voteActivity_update.json',
						del : 'vote/voteActivity_delete.json',
						find : 'vote/voteActivity_findPageList.json'
				};
				// 变量定义
				// 列表数据
				var tablerows = [];
				// 表格
				var table = $('#cloud-voteActivity-table');
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
				    				   }, orderable: false, className: "cloud-checkbox" },
				    		                 { "data": "va_name", "render":function(data,type,row,mete){
				    		                	 return '<span class="row-details row-details-close" dataid="'+row.id+'"></span> ' + data ;  //TODO 这里显示更多，这里修改ID...  
				    		                 }},
				    		                 { "data": "va_startTime", "render": function(data, type, row, mete){
						    						return row.va_startTime+"至"+row.va_endTime; //时间
						    				   } 
				    		                 },
				    		                 { "data": null, "render": function(data, type, row, mete){
						    						return "--"; 
						    				   }
				    		                 },
				    		                 { "data": "va_createTime" },
				    		                 //TODO 这里添加显示列对应字段别名。。。
				    		                 { "data": null, "render": function(data, type, row, mete){
						    						return "复制链接"; 
						    				   }
				    		                 }
				    		],
				    		//TODO 这里设置排序列，从0开始。。。
	    					order: [[0,'desc']],
				    		dblclick : function() {   // 双击打开编辑浮层
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateVoteActivity")) { 
				    	    		updateOpen();
				    	    	}
				    		}
				    });
					
					// 显示更多字段值
					ttable.initMore(function(id) { 
				    	 var rowData = tablerows[id];
				    	 var sOut = '<table>';
				    	 sOut += '<tr><td><div class="cloud-more-content">ID：</div></td><td>' + id + '</td></tr>';
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
						CLOUD.forminit($("#voteActivityEditform"), data);
						$("#voteActivityEditModal").modal('show');
					}
				};
				
				// 表单数据保存，新增/修改保存
				var formSaveInit = function() {
					// 表单选择数据初始
					//TODO ...
					
					// 是否点击保存&关闭
				    var saveclose = false;
					/*CLOUD.FormValidate("vote_activity", "voteActivityEditform",  function (form) { //TODO 工具->表管理设置规则
						var _url = url.add;
						var isadd = true;
						if($("#si_voteActivityId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#voteActivityEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#voteActivityEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					});*/
					
					CLOUD.Validate("voteActivityEditform",  function (form) { 
						var _url = url.add;
						var isadd = true;
						if($("#si_voteActivityId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#voteActivityEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#voteActivityEditModal").modal('hide'); 
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
				    $("#voteActivityEditModal").on("hidden", function(){   
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
						CLOUD.formreset($("#voteActivityEditform"));
	    				CLOUD.hidePrveNext();
	    				$("#voteActivityEditModal").modal('show');
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
					    //CLOUD.search('vote_activity', $("#findVoteActivity"), ttable); //TODO ...
					    
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
	    voteActivity.init();
	    
	    // 功能按钮事件绑定
	    // 查询
	    $("#findVoteActivity").bind('click', function() {
	    	voteActivity.query();
		});
	    $("#addVoteActivity").bind('click', function(){
	    	voteActivity.addWindowOpen();
	    });
	    $("#updateVoteActivity").bind('click', function(){
	    	voteActivity.updateWindowOpen();
	    });
	    $("#deleteVoteActivity").bind('click', function(){
	    	voteActivity.del();
	    });
	    
	    // 日志
	    $(".findSysLogs").bind('click', function(){
	    	var ids = voteActivity.getTable().getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	    });
    });
});
</script>