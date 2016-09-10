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
				<input type="text" class="form-control"  placeholder="名称"  id="wname"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysWork">
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
								<button id="addSysWork" class="btn green trig-privbtn" privkey="addSysWork" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysWork" class="btn green trig-privbtn" privkey="updateSysWork">修改</button>
							</div>
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle trig-privbtn" data-toggle="dropdown" privkey="moveSysWork">移动 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn workUp" > 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn workDown" > 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn workTop" > 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn workBottom" > 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moveSysWork" > 
									重置排序 </a>
								</li>
							</ul>
							</div>
							<div class="btn-group">
								<button id="deleteSysWork" class="btn green trig-privbtn" privkey="deleteSysWork">删除</button> 
							</div>
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div> 
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-sysWork-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-sysWork-table .checkboxes"/>
					</th>
					<th>名称</th>  
					<th>排序</th>
					<th>禁用</th>
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


<div id="sysWorkEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760" data-max-height="500px">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="sysWorkEditform">
	<input type="hidden" name="sw_workId" id="sw_workId" />
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet-body form">
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">名称</label>
									<div class="col-md-6">
										<input type="text" class="form-control" placeholder="请输入名称" name="sw_workName" id="sw_workName">
									</div>
								</div>
								<div class="form-group">
								<label class="col-md-3 control-label">禁用</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sw_state"  value="Y"  > 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sw_state"  value="N"  checked> 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">内容</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sw_content" id="sw_content"></textarea>
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
		var sysWork = function () {
				// 访问URL定义
				var url = { 
						add : 'work_add.json',
						update : 'work_update.json',
						del : 'work_delete.json',
						find : 'work_findPageList.json',
						move : 'work_move.json',
						sorts : 'work_updateSorts.json'
				};
				// 变量定义
				// 列表数据
				var tablerows = [];
				// 表格
				var table = $('#trig-sysWork-table');
				var ttable = null;
			    var movesortno = 2;
				// 列表初始
				var tableInit = function() {
					ttable = new CLOUD.Datatable({
				    		table : table, 
				    		url : url.find, 
				    		columns : [
				    				   { "data": null, "render": function(data, type, row, mete){
				    					   tablerows[row.sw_workId] = row;
				    						return '<input type="checkbox" class="checkboxes" value="'+row.sw_workId+'"/>';   
				    				   }, orderable: false, className: "trig-checkbox" },
				    		                 { "data": "sw_workName", "render":function(data,type,row,mete){
				    		                	 return '<span class="row-details row-details-close" dataid="'+row.sw_workId+'"></span> ' + data ;    
				    		                 }},
				    		                 { "data": "sw_sortNo" },
				    		                 { "data": "sw_state","render": function(value) {
				    		                	 return CLOUD.getYesNoHtml(value);
				    		                 } },
				    		                 { "data": "sw_createTime" }
				    		],
	    					order: [[4,'desc']],
				    		dblclick : function() {   // 双击打开编辑浮层
				    			// 是否有修改权限
				    	    	if(CLOUD.isPrivlege("updateSysWork")) { 
				    	    		updateOpen();
				    	    	}
				    		},
				    		dnd: {	// 拖动排序
				    			sort:movesortno,
				    			onDrop: function(id, previd, nextid){
				    	 			var moveid = previd;
				    	 			if(!previd) {
				    	 				moveid = nextid;
				    	 			}
				    	 			var rowData = tablerows[id];
				    	 			var moveData = tablerows[moveid];
				    	 			if(rowData.cr_sortNo > moveData.cr_sortNo) {
				    	 				moveid = nextid;
				    	 			}
				    	 			if(moveid)
				    		 			CLOUD.trackPost(url.move,'id=' + id + '&moveId=' + moveid, function(data){
				    							ttable.reload();
				    					});
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
						CLOUD.forminit($("#sysWorkEditform"), data);
						$("#sysWorkEditModal").modal('show');
					}
				};
				
				// 表单数据保存，新增/修改保存
				var formSaveInit = function() {
					// 是否点击保存&关闭
				    var saveclose = false;
					
					CLOUD.Validate("sysWorkEditform",  function (form) { 
						var _url = url.add;
						var isadd = true;
						if($("#sw_workId").val()!='') {
							_url = url.update; 
							isadd = false; 
						}
						CLOUD.trackPost(_url, $(form).serialize(), function(data){
							if(isadd == true) {
								CLOUD.formreset($("#sysWorkEditform")); 
							}
							// 保存&关闭
							if(saveclose) {
								$("#sysWorkEditModal").modal('hide'); 
							}
							CLOUD.updateSuccessAlert();
						});
						// 必须flase，阻止form submit
						return false;
					},{
						sw_workName : {
							required : true
						}
					});
					
					// 点击保存关闭设置saveclose=true，保存时判断
				    $(".cloudsaveclose").bind('click', function(){
				    	CLOUD.SAVECLOSE = true; 
				    	saveclose = true;
				    });
				    
				    // 编辑浮层关闭刷新列表数据
				    $("#sysWorkEditModal").on("hidden", function(){   
						ttable.reload();
						saveclose = false; 
					});
				};
				
				return {
					// 查询
					query : function() {
						ttable.query({ sw_workName : $("#wname").val()});  
					},
					// 打开新增
					addWindowOpen : function() {
						CLOUD.formreset($("#sysWorkEditform"));
	    				CLOUD.hidePrveNext();
	    				$("#sysWorkEditModal").modal('show');
					},
					// 打开修改/编辑
					updateWindowOpen : function() {
						updateOpen();
					},
					updateSorts : function() {
						CLOUD.trackPost(url.sorts,"", function(data){
								ttable.reload(); 
						});
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
					    
					    // 移动
					    CLOUD.move({
					    	url: url.move,
					    	ttable:ttable,
					    	sort:movesortno,
					    	obj:{
					    		table: table,
					    		up:$(".workUp"),
					    		down:$(".workDown"),
					    		top:$(".workTop"),
					    		bottom:$(".workBottom")
					    	}
					    });
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
	    sysWork.init();
	    
	    // 功能按钮事件绑定
	    // 查询
	    $("#findSysWork").bind('click', function() {
	    	sysWork.query();
		});
	    $("#addSysWork").bind('click', function(){
	    	sysWork.addWindowOpen();
	    });
	    $("#updateSysWork").bind('click', function(){
	    	sysWork.updateWindowOpen();
	    });
	    $("#deleteSysWork").bind('click', function(){
	    	sysWork.del();
	    });
	    
	 // 重置排序
	    $(".moveSysWork").bind('click', function(){
	    	sysWork.updateSorts();
	    });
	    
	    // 日志
	    $(".findSysLogs").bind('click', function(){
	    	var ids = sysWork.getTable().getCheckbox();  
			var rows = ids.size();
	    	if(CLOUD.isSelectOne(rows)) {
	    		var id = ids.get(0).value;
	    		CLOUD.LOG.openLogs(id); 
	    	}
	    });
    });
});
</script>