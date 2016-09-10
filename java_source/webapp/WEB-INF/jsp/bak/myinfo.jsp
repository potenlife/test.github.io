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
    <input type="hidden" name="mi_infoId" id="mi_infoId" />
    <input type="hidden" name="acceptUsers" id="acceptUsers" />
    <table> 
		<tr><td><span>收件人</span>：</td><td><select name="acceptUsersSelect" id="acceptUsersSelect" class="trigformbigtext"></select></td></tr>
		<tr><td><span>内容</span>：</td><td><textarea rows="15" name="mi_content" id="mi_content" class="trigformbigtext" ></textarea></td></tr>
		<tr><td><span>类型</span>：</td><td><input type="radio" name="mi_type" id="mi_type1" value="1" /> 紧急 <input type="radio" name="mi_type" id="mi_type2" value="2" /> 定时</td></tr>
		<tr><td><span>发送时间</span>：</td><td><input type="text" name="mi_sendTime" id="mi_sendTime" class="trigformbigtext easyui-datetimebox" /></td></tr>
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
	messageInfo.cs = 1/3.0;
	messageInfo.columnw = messageInfo.ddw * messageInfo.cs;
	messageInfo.dd = $('#messageInfodatagrid');
	messageInfo.win = $("#messageInfowin");
	messageInfo.ff = $("#messageInfoform");
	
	messageInfo.url = {};
	messageInfo.url.add = 'myinfo_add.json';
	messageInfo.url.update = 'myinfo_update.json';
	messageInfo.url.del = 'myinfo_delete.json';
	messageInfo.url.find = 'myinfo_findPageList.json';
	
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
			{field:'mi_infoId',title:'收件人',width:messageInfo.columnw,formatter:function(value,row,index){
				var acceptUser = row.acceptUser;
				var v = '';
				for(var i=0;i<acceptUser.length;i++) {
					if(i!=0) v+=',';
					v += CLOUD.getUserName(acceptUser[i]);
				}
				return v;
			},sortable:true},
			{field:'mi_content',title:'内容',width:messageInfo.columnw,styler:function(){
				return 'overflow:hidden';
			}},
			{field:'mi_sendTime',title:'时间',width:messageInfo.columnw,formatter:function(value,row,index){
				if(value) {
					return value;
				}
				return row.mi_createTime;
			},sortable:true},
			{field:'mi_createTime',title:CLOUD.TEXT.PUBLIC.CREATETIME,width:messageInfo.columnw,sortable:true,hidden:true}
		]],
		pagination:true,
		rownumbers:true,
		toolbar:[{
			id:'addMyMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.ADD,
			iconCls:'icon-add',
			handler:function(){
				messageInfo.win.window({
					title:CLOUD.TEXT.PUBLIC.BTN.ADD
				});
				CLOUD.formreset(messageInfo.ff);
				$("#acceptUsersSelect").combobox('clear');
				$("#messageInfosubmit").linkbutton('enable');
				messageInfo.win.window('open');
			}
		},'-',{
			id:'deleteMyMessageInfo',
			text:CLOUD.TEXT.PUBLIC.BTN.DELETE,
			iconCls:'icon-remove',
			handler:function(){
				var rows = messageInfo.dd.datagrid('getSelections');
				CLOUD.isDelSelectOne(rows,function(){
					var ids = "";
					for(var i=0;i<rows.length;i++){
						if(i>0) ids += ",";
						ids += rows[i].mi_infoId;
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
		CLOUD.formreset(messageInfo.ff);
		messageInfo.ff.form('load',rowData);
		var acceptUser = rowData.acceptUser;
		var v = '';
		for(var i=0;i<acceptUser.length;i++) {
			if(i!=0) v+=',';
			v += CLOUD.getUserName(acceptUser[i]);
		}
		$("#acceptUsersSelect").combobox('setValue', v);
		$("#messageInfosubmit").linkbutton('disable');
		messageInfo.win.window('open');
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
		iconCls:'icon-edit',
		title:'SYSTEM ROLE',
		buttons:'#messageInfobb'
	});
	$("#mi_content").validatebox({
		required:true		
	});
	$("#messageInfosubmit").linkbutton({
		iconCls:'icon-save',
		text:CLOUD.TEXT.PUBLIC.BTN.SAVE
	});
	
	$("#acceptUsersSelect").combobox({
		valueField:'su_userId',
		textField:'su_userName',
		url: CLOUD.PATH+ '/user_select.json',
		formatter:function(row) {
			return CLOUD.getUserName(row);
		},		
		multiple:true,
		required:true,
		editable:false
	});
	
	$("#messageInfosubmit").bind('click',function() {
		CLOUD.progress();
		var uid = $("#mi_infoId").val();
		$("#acceptUsers").val($("#acceptUsersSelect").combobox('getValues'));
		var _url = messageInfo.url.add;
		if(uid!='') {
			// 查看
			CLOUD.progressClose();
			return false;
		}
		messageInfo.ff.form('submit',{
			url:_url,
			onSubmit:function(){
				var isValid = $(this).form('validate');
				var st = $('#mi_sendTime').datetimebox('getValue');
				if(st) {
					var nowtime = new Date();
					var sts = st.split('-');
					var sttime = new Date(parseInt(sts[0]),parseInt(sts[1])-1,parseInt(sts[2]),23,59,59);
					if(CLOUD.dateCompare(nowtime, sttime)){
						CLOUD.messager.alert('定时发送时间不能小于当前时间');
						isValid = false;
					}
				}
				
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