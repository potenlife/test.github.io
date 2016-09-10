<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:false" class="trigtab" style="width:100%" >
		<div class="triggridtop"></div>
		<div>
			<span>关键字</span>：<input type="text" class="trigsearchtext" name="keywords" id="keywords"/>
			<a href="#" id="findMessageInfo" >search</a>
		</div>
	</div>	
	<div data-options="region:'center',border:false" class="trigtab" style="width:100%">
		<table id="messageInfodatagrid"></table>
	</div>
</div>	

	<div id="messageInfowin" class="trigwin" >     
    <form id="messageInfoform" class="trigform" method="post" >
    <input type="hidden" name="mi_infoId" id="mi_infoId" />
    <table> 
		<tr><td><span>收件人</span>：</td><td><input type="text" name="su_userId" id="su_userId" class="trigformtext" /></td></tr>
		<tr><td><span>内容</span>：</td><td><textarea rows="15" name="mi_content" id="mi_content" class="trigformtext" ></textarea></td></tr>
    </table>  
    </form>   
    </div> 
    <div id="messageInfobb" >     
       <a id="messageInfosubmit"></a> 
    </div> 
    <c:wintoolbar ddid="messageInfodatagrid" formid="messageInfoform" id="wintools" winid="messageInfowin"/>


<script type="text/javascript">
$(function(){
	var messageInfo = {};
	messageInfo.idw = CLOUD.system.idw;
	messageInfo.ddw = tabwidth - 90 - messageInfo.idw;
	messageInfo.cs = 1/4.0;
	messageInfo.columnw = messageInfo.ddw * messageInfo.cs;
	messageInfo.dd = $('#messageInfodatagrid');
	messageInfo.win = $("#messageInfowin");
	messageInfo.ff = $("#messageInfoform");
	
	messageInfo.url = {};
	messageInfo.url.add = 'info_add.json';
	messageInfo.url.update = 'info_update.json';
	messageInfo.url.del = 'info_delete.json';
	messageInfo.url.dels = 'info_deletes.json';
	messageInfo.url.find = 'info_findPageList.json';
	
	messageInfo.dd.datagrid({
		nowrap: true,
		autoRowHeight: false,
		fit:true,
		fitColumns:true,
		striped: true,
		collapsible:true,
		pageSize:CLOUD.PAGESIZE,
		pageList:CLOUD.PAGELIST,
		url:messageInfo.url.find,
		sortName: 'mi_createTime',
		sortOrder: 'desc',
		remoteSort: false,
		idField:'mi_infoId',
		frozenColumns:[[
            {field:'ck',checkbox:true},
            {title:'ID',field:'mi_infoId',width:messageInfo.idw,sortable:true,hidden:true}
        ]],
		columns:[[
			{field:'mi_infoPath',title:CLOUD.TEXT.messageInfo.infoPath,width:messageInfo.columnw,sortable:true},
			{field:'mi_createTime',title:CLOUD.TEXT.PUBLIC.CREATETIME,width:messageInfo.columnw,sortable:true}
		]],
		pagination:true,
		rownumbers:true,
		toolbar:[{
			id:'addMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.ADD,
			infoCls:'info-add',
			handler:function(){
				messageInfo.win.window({
					title:CLOUD.TEXT.PUBLIC.BTN.ADD
				});
				CLOUD.formreset(messageInfo.ff);
				CLOUD.MODNEXT.disable();
				messageInfo.win.window('open');
			}
		},'-',{
			id:'updateMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.UPDATE,
			infoCls:'info-edit',
			handler:function(){
				var rows = messageInfo.dd.datagrid('getSelections');
				if(CLOUD.isSelectOne(rows)) {
					var rowData = rows[0];
					update(rowData);
				}
			}
		},'-',{
			id:'deleteMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.DELETE,
			infoCls:'info-remove',
			handler:function(){
				var rows = messageInfo.dd.datagrid('getSelections');
				CLOUD.isDelSelectOne(rows,function(){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						if(i>0) ids += ",";
						ids += rows[i].mi_infoId;
						if(rows[i].mi_infoType=='1') {//系统
							CLOUD.messager.alert(rows[i].mi_infoId + CLOUD.TEXT.messageInfo.tip.NOUPDATE);
							return false;
						}
					}
					$.post(messageInfo.url.del,"ids=" + ids, function(data){
						data = CLOUD.successHandle(data);
						if(data.success==true) {
							messageInfo.dd.datagrid('load');
							messageInfo.dd.datagrid('clearSelections');
						}
					});
				});
			}
		},'-',{
			id:'deletesMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.DELS,
			infoCls:'trig-info-removes',
			handler:function(){
				CLOUD.isDels(function(){
					var un = $('#sysinfoname').val();
					un = un?un:'';
					var para = 'mi_className=' + un;
					$.post(messageInfo.url.dels,para,function(data){
						data = CLOUD.successHandle(data);
						if(data.success==true) {
							messageInfo.dd.datagrid('load');
							messageInfo.dd.datagrid('clearSelections');
						}
					});
				});
			}
		}],
		onLoadSuccess: function(data) {
			CLOUD.successHandle(data);
		},
		onDblClickRow: function(rowIndex, rowData){//双击
			$(this).datagrid('clearSelections');
			$(this).datagrid('selectRow', rowIndex);
			update(rowData);
		},
		onClickRow: function(rowIndex, rowData) {
			$(this).datagrid('clearSelections');
			$(this).datagrid('selectRow', rowIndex);
		},
		onHeaderContextMenu:function(e,field){//表头菜单
			e.preventDefault();
			if(messageInfo.hmminit == false) {
				CLOUD.datagridHeadMenu(messageInfo.dd, messageInfo.hmm);
				messageInfo.hmminit = true;
			}
			messageInfo.hmm.menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});
	
	function update(rowData){
		messageInfo.win.window({
			title:CLOUD.TEXT.PUBLIC.BTN.UPDATE
		});
		messageInfo.ff.form('load',rowData);
		CLOUD.MODNEXT.enable();
		messageInfo.win.window('open');
	}
	
	$("#findMessageInfo").linkbutton({
		infoCls:'trig-info-search',
		text:CLOUD.TEXT.PUBLIC.BTN.SEARCH
	});
	
	$("#findMessageInfo").bind("click",function(){
		$('#messageInfodatagrid').datagrid('load',{
				mi_className:$("#sysinfoname").val()
		});
		messageInfo.dd.datagrid('clearSelections');
	});
	messageInfo.win.dialog({
		modal:true,
		closed:true,
		collapsible:true,
		infoCls:'info-edit',
		title:'SYSTEM ROLE',
		buttons:'#messageInfobb'
	});
	$("#mi_className").validatebox({
		required:true		
	});
	$("#mi_infoPath").validatebox({
		required:true		
	});
	
	$("#messageInfosubmit").linkbutton({
		infoCls:'info-save',
		text:CLOUD.TEXT.PUBLIC.BTN.SAVE
	});
	
	$("#messageInfosubmit").bind('click',function() {
		CLOUD.progress();
		var uid = $("#mi_infoId").val();

		var _url = messageInfo.url.add;
		if(uid!='') {
			_url = messageInfo.url.update;
		}
		messageInfo.ff.form('submit',{
			url:_url,
			onSubmit:function(){
				var isValid = $(this).form('validate');
				if(!isValid==true){
					CLOUD.progressClose();
				}
				return isValid;	
			},success: function(data){
				CLOUD.progressClose();
				data = CLOUD.successHandle(data);
				if(data.success==true) {
					messageInfo.win.window('close');
					messageInfo.dd.datagrid('load');
					messageInfo.dd.datagrid('clearSelections');
					CLOUD.updateSuccessAlert();
				}
				
			}

		});
	});
});
</script>