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

	<div id="messageInfowin" class="trigbigwin" >     
    <form id="messageInfoform" class="trigform" method="post" >
    <table> 
		<tr><td><span>发件人</span>：</td><td><input type="text" name="su_realName" id="su_realName" class="trigformbigtext" readonly="readonly"/></td></tr>
		<tr><td><span>内容</span>：</td><td><textarea rows="15" name="mi_content" id="mi_content" class="trigformbigtext" readonly="readonly"></textarea></td></tr>
	</table>  
    </form>   
    </div> 
    <div id="messageInfobb" >     
       <a id="messageInfosubmit"></a> 
    </div> 
<script type="text/javascript">
$(function(){
	var messageInfo = {};
	messageInfo.idw = CLOUD.system.idw;
	messageInfo.ddw = tabwidth - 90 ;
	messageInfo.cs = 1/5.0;
	messageInfo.columnw = messageInfo.ddw * messageInfo.cs;
	messageInfo.dd = $('#messageInfodatagrid');
	messageInfo.win = $("#messageInfowin");
	messageInfo.ff = $("#messageInfoform");
	
	messageInfo.url = {};
	messageInfo.url.del = 'myinfo_accept_delete.json';
	messageInfo.url.find = 'myinfo_accept_findPageList.json';
	messageInfo.url.updateState = 'myinfo_accept_updateState.json';
	
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
		sortName: 'mi_sendTime',
		sortOrder: 'desc',
		remoteSort: false,
		idField:'mia_acceptId',
		frozenColumns:[[
            {field:'ck',checkbox:true},
            {title:'ID',field:'mi_infoId',width:messageInfo.idw,sortable:true,hidden:true}
        ]],
		columns:[[
			{field:'su_realName',title:'发件人',width:messageInfo.columnw,sortable:true,styler:function(value,row,index){
				var s = '';
				if (row.mi_type == '1') {
					s += 'color:red;';
				}
				if(row.mia_state != 'R') {
					s += 'font-weight:bold;';
				}
				return s;
			}},
			{field:'mi_content',title:'内容',width:messageInfo.columnw,styler:function(){
				return 'overflow:hidden';
			}},
			{field:'mia_state',title:'状态',width:messageInfo.columnw,sortable:true},
			{field:'mi_sendTime',title:'发送时间',width:messageInfo.columnw,formatter:function(value,row,index){
				if(value) {
					return value;
				}
				return row.mi_createTime;
			},sortable:true},
			{field:'mia_acceptTime',title:'接收时间',width:messageInfo.columnw,sortable:true},
			{field:'mi_createTime',title:CLOUD.TEXT.PUBLIC.CREATETIME,width:messageInfo.columnw,sortable:true,hidden:true}
		]],
		pagination:true,
		rownumbers:true,
		toolbar:[{
			id:'deleteMyMessageInfoAccept',
			text:CLOUD.TEXT.PUBLIC.BTN.DELETE,
			iconCls:'icon-remove',
			handler:function(){
				var rows = messageInfo.dd.datagrid('getSelections');
				CLOUD.isDelSelectOne(rows,function(){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						if(i>0) ids += ",";
						ids += rows[i].mia_acceptId;
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
		}
	});
	
	function update(rowData){
		messageInfo.win.window({
			title:CLOUD.TEXT.PUBLIC.VIEW
		});
		messageInfo.ff.form('load',rowData);
		messageInfo.win.window('open');
		if(rowData.mia_state!='R') {
			$.post(messageInfo.url.updateState,"id=" + rowData.mia_acceptId, function(data){
				CLOUD.successHandle(data);
				messageInfo.dd.datagrid('load');
			});
		}
	}
	
	$("#findMessageInfo").linkbutton({
		iconCls:'trig-icon-search',
		text:CLOUD.TEXT.PUBLIC.BTN.SEARCH
	});
	
	$("#findMessageInfo").bind("click",function(){
		$('#messageInfodatagrid').datagrid('load',{
			mi_content:$("#keywords").val()
		});
		messageInfo.dd.datagrid('clearSelections');
	});
	messageInfo.win.dialog({
		modal:true,
		closed:true,
		collapsible:true,
		iconCls:'trig-icon-view'
	});
	
});
</script>