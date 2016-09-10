$(function(){
	var dictionary = {};
	dictionary.url = {};
	dictionary.url.add = 'dictionary_add.json';
	dictionary.url.update = 'dictionary_update.json';
	dictionary.url.del = 'dictionary_delete.json';
	dictionary.url.find = 'dictionary_findList.json';
	dictionary.url.tree = 'dictionary_findTree.json';
	dictionary.url.moveSort = 'dictionary_moveSort.json';
	dictionary.url.move = 'dictionary_move.json';
	dictionary.url.sorts = 'dictionary_updateSorts.json';
	dictionary.url.updateSort = 'dictionary_updateSort.json';
	dictionary.url.updateContentManager = 'dictionary_updateContentManager.json';
	
	var movesortno = 5;
	var pid = "1"; 
	// 左菜单树
	$('#dictionary_tree').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                  return dictionary.url.tree;
                },
                'data' : function (node) {
                  return { 'id' : node.id, 'cid':pid }; 
                }
            }
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "plugins" : [ "dnd", "state", "types" ]
    }).bind("loaded.jstree",function(e,data){
    	f_loadWidth();
    }).bind("click.jstree",function(e,data){
    	f_loadWidth();
    });
	
	//加载tree和grid的宽度
	function f_loadWidth(){
		var main_width = $("#tree_main_div").width();
    	var left_width =$("#tree_left_div").width();
    	var right_width =  main_width - left_width-80;
    	$("#tree_right_div").width(right_width);
		
	}
	
	var tablerows = []; 
    var table = $('#trig-dictionary-table');
    var ttable = new CLOUD.Datatable({
		table : table, 
		url : dictionary.url.find, 
		filter: true,
		paging : false,
		columns : [
				   { "data": null, "render": function(data, type, row, mete){ 
					   tablerows[row.sd_dictionaryId] = row;
						return '<input type="checkbox" class="checkboxes" value="'+row.sd_dictionaryId+'"/>';   
				   }, orderable: false, className: "trig-checkbox" },
		                 { "data": "sd_dictionaryName", "render":function(data,type,row,mete){
		                	 return '<span class="row-details row-details-close" dataid="'+row.sd_dictionaryId+'"></span> ' + data;
		                 } },
		                 { "data": "sd_dictionaryNo" },
		                 { "data": "sd_dictionaryCode", "className" : "hidden-xs"},  
		                 { "data": "sd_state" , "className" : "hidden-xs", "render": function(value) {
		                	 return CLOUD.getYesNoHtml(value);
		                 }},
		                 { "data": "sd_sortNo" }
		],
		queryParams:{ cid: pid },
		order: [[5,'asc']], 
		dblclick : function() {   // 双击打开编辑浮层
			// 是否有修改权限
	    	if(CLOUD.isPrivlege("updateSysDictionary")) {
	    		showUpdate();
	    	}
		}  ,
		dnd: {	// 拖动排序
			sort:movesortno,
			onDrop: function(id, previd, nextid){
	 			var moveid = previd;
	 			if(!previd) {
	 				moveid = nextid;
	 			}
	 			var rowData = tablerows[id];
	 			var moveData = tablerows[moveid];
	 			if(rowData.sd_sortNo > moveData.sd_sortNo) {
	 				moveid = nextid;
	 			}
	 			if(moveid)
	 				CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.moveSort, pid),'id=' + id + '&moveId=' + moveid, function(data){
							ttable.reload();
							refreshtree();
					});
			}
		},
		load:function(){
			
		}
    });
    
    CLOUD.initTableContentPrivleg(pid);
    
    $('#dictionary_tree').on('select_node.jstree', function(e,data) { 
    	pid = data.node.id;
    	if(pid=='#') pid="1";
    	var pv = $("#" +pid+"_anchor").attr('pv');
    	CLOUD.initContentPrivleg(pv);
    	if(CLOUD.isContentQuery(pv))
    		ttable.query({cid: pid});   
        return false;
    });
    
    // 移动&修改排序
    $( "#dictionary_tree" ).on('move_node.jstree', function(e, data){
    	if(data.parent == '#') {
    		return false;
    	}
        CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.updateSort, pid), {
        	sd_dictionaryId:data.node.id,
        	sd_parentDictionaryId:data.parent,
        	sd_sortNo: data.position+1
        }, function(data){
			ttable.reload();
		});
     });
    
    ttable.next(); // 初始下一个按钮事件
    ttable.prev(); // 初始上一个按钮事件
    
    $("#dictionary_tree_reload").bind('click', function(){ 
    	$('#dictionary_tree').jstree('refresh_node', {id: '1'});   
    });
    
    function refreshtree() {
    	$('#dictionary_tree').jstree('refresh_node', {id: pid}); 
    }
    
    // 显示更多字段值
    ttable.initMore(function(id) { 
   	 var rowData = tablerows[id];
   	 var sOut = '<table>';
   	 sOut += '<tr><td><div class="trig-more-content">ID：</div></td><td>' + id + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">叶子：</div></td><td>' + rowData.sd_isLeaf + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">代码：</div></td><td>' + rowData.sd_dictionaryCode + '</td></tr>';
        sOut += '<tr class="visible-xs"><td><div class="trig-more-content">禁用：</div></td><td>' + rowData.sd_state + '</td></tr>';
        sOut += '<tr><td><div class="trig-more-content">创建时间：</div></td><td>' + rowData.sd_createTime + '</td></tr>'; 
        sOut += '</table>';
        return  sOut;
    });
    
    $("#dictionary_list_reload").bind('click', function(){
    	ttable.reload();
    });
    
    function formreset() {
    	CLOUD.formreset($("#dictionaryEditform"), {sd_isLeaf : 'Y', sd_state : 'N'});
    }
    
    // 新增
    $("#addSysDictionary").bind('click',function(){
    	formreset();
    	CLOUD.hidePrveNext();
    	$("#sd_parentDictionaryId").val(pid);
    	$("#dictionaryEditModal").modal('show');
    });
    
 // 修改加载表单数据
    function showUpdate() {
    	var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			CLOUD.showPrveNext();
			var id = ids.get(0).value;
			var data = tablerows[id];
			// 初始表单数据
			CLOUD.forminit($("#dictionaryEditform"), data);
			$("#dictionaryEditModal").modal('show');
		}
    }
    
    // 打开修改编辑浮层
    $("#updateSysDictionary").bind('click', function(){
    	showUpdate();
    });
    
    // 是否点击保存&关闭
    var saveclose = false;
    // 添加/编辑->保存
    CLOUD.FormValidate("sys_dictionary", "dictionaryEditform",  function (form) {
			var _url = dictionary.url.add;
			var isadd = true;
			if($("#sd_dictionaryId").val()!='') {
				_url = dictionary.url.update;
				isadd = false;
			}
			CLOUD.trackPost(CLOUD.getContentUrl(_url, pid), $(form).serialize(), function(data){
				//ttable.reload();
				if(isadd == true) {
					formreset(); 
					$("#sd_parentDictionaryId").val(pid);
				}
				if(saveclose) {
					$("#dictionaryEditModal").modal('hide');  
				} 
				refreshtree();
				CLOUD.updateSuccessAlert(); 
			});
			return false;
    });
    $(".cloudsaveclose").bind('click', function(){
    	saveclose = true; 
    }); 
    // 关闭编辑浮层刷新列表 
    $("#dictionaryEditModal").on('hidden', function(){
    	ttable.reload();
    	saveclose = false;
    });
    
    // 删除
    $("#deleteSysDictionary").bind('click', function(){
    	var objs = ttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.del, pid), "ids=" + ids, function(data){
				ttable.reload();
				refreshtree();
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
    
    // 重置排序
    $(".moveSysDictionary").bind('click', function(){
    	CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.sorts, pid),"id=" + pid, function(data){
				refreshtree();
				ttable.reload(); 
		});
    });
    
    // 移动
    CLOUD.move({
    	url: dictionary.url.moveSort,
    	ttable:ttable,
    	sort:movesortno,
    	obj:{
    		table: table,
    		up:$(".dictionaryUp"),
    		down:$(".dictionaryDown"),
    		top:$(".dictionaryTop"),
    		bottom:$(".dictionaryBottom")
    	}
    }, function(){
    	refreshtree();
    }, function(){
    	return pid;
    });
    
    // 移动到...
    var searchm = '';
    $("#dictionarymoveselect").select2({
        minimumInputLength: 1,   
        placeholder: "请选择父字典",
         ajax: {  
             url: 'dictionary_findTree.json',
             dataType: 'json',
             data: function (term, page) {
            	 searchm = term;
                 return {
                	searchKey: term, 
                 	rows:10,
                 	cid:pid
                 };
             },
             results: function (data, page) {
             	var datas = [];
             	if('ROOT'.indexOf(searchm)>-1) {
             		datas.push({id:'1',text:'ROOT'});
             	}
             	for(var i=0;i<data.length;i++) {
             		datas.push({id:data[i].id,text:data[i].text});
             	}
                 return {
                     results: datas 
                 };
             }
         }
     });
    
    
    $(".dictionaryMove").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var rowDate =  tablerows[ids.val()];
    		$("#movedictionaryname").text(rowDate.sd_dictionaryName);
    		$("#dictionaryMoveModal").modal('show');
    	}
    });
     
    $("#moveSave").bind('click', function(){
    	var ids = ttable.getCheckbox();
    	var selfid = ids.val();
    	var moveId = $("#dictionarymoveselect").val();
    	if(moveId) {
	    	if(selfid==moveId || moveId==tablerows[selfid].sd_parentDictionaryId) {
				CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.SORT.NOTMOVE);
				return false;
			}
	    	CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.move, pid),'id=' + selfid + "&moveId=" + moveId,function(data){
				ttable.reload();
				$('#dictionary_tree').jstree('refresh_node', {id: '1'});   
				$("#dictionarymoveselect").select2('val','');
				$("#dictionaryMoveModal").modal('hide'); 
			});
    	}
    });
    
    // 修改排序值
    $(".dictionarySort").bind('click', function(){
    	var ids = ttable.getCheckbox();  
		var rows = ids.size();
    	if(CLOUD.isSelectOne(rows)) {
    		var rowData =  tablerows[ids.val()];
    		CLOUD.forminit($("#dictionarySortEditform"), rowData);
    		$("#dictionarySortModal").modal('show');
    	}
    });
    
    CLOUD.Validate("dictionarySortEditform",  function (form) {
			CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.updateSort, pid), $(form).serialize(), function(data){
				ttable.reload();
				$("#dictionarySortModal").modal('hide');  
				refreshtree();
				CLOUD.updateSuccessAlert(); 
			});
			return false;
	}, {
		sd_sortNo : { 
    		required : true,
    		integer : true
    	}
	});
    
    $("#updateAddRolePrivlegeDef").bind('click', function(){
    	CLOUD.trackPost(CLOUD.getContentUrl(dictionary.url.updateContentManager, pid), '', function(data){
    		CLOUD.updateSuccessAlert(); 
		});
    });
});