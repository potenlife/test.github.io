// 公共查询组件

// 初始可查询字段列表
var columntypes = [] ;
//CLOUD.search.fordata = null;
/**
 * tablename	表名
 * searchobj		查询jquery对象，高级查询按钮插入之后
 * ttable			数据列表，执行查询方法
 * aliasname 	SQL 语句FROM 表 别名
 */
CLOUD.search = function(tablename, searchobj, ttable, aliasname, fordata) {
	if(CLOUD.isPrivlege("findSysSearch") == false) { 
		return false;
	}
	searchobj.after(' <button class="btn green " onclick="return false;" id="findSysSearch">	<span class="fa fa-search"></span> 高级查询</button>');
	// 打开高级查询
	$("#findSysSearch").bind('click',function(){
		$("#AdvancedSearchModal").modal("show");
	});
	
	$("#ss_tableName").val(tablename);
	$.getJSON(CLOUD.PATH + '/tools/table_column_findList.json', 'stc_tableName='+tablename+'&sort=stc_pageName&stc_isSearch=Y',function(data) {
		var opts1 = $(".cloumns1").get(0).options;
		var opts2 = $(".cloumns2").get(0).options;
		opts1.length = 0;
		opts2.length = 0; 
		for(var i=0;i<data.length;i++) {
			columntypes[data[i].stc_columnName] = data[i].stc_columnType;
			opts1.add(new Option(data[i].stc_pageName,data[i].stc_columnName));
			opts2.add(new Option(data[i].stc_pageName,data[i].stc_columnName));
		}
		$(".cloumns1").bind('change', function(){
			if(columntypes[this.value] == 'datetime') {
				$(this).closest(".searchwhere").find(".advdate").show();
			}
			else{
				$(this).closest(".searchwhere").find(".advdate").hide();
			}
		});
		$(".advdate").datepicker({
			rtl: Metronic.isRTL(),
            orientation: "left",
            autoclose: true
		}).on('changeDate',function(ev){
			  var startTime = formatDate(ev.date, 'yyyy-MM-dd');
			  $(this).closest(".searchwhere").find(".t").val(startTime);  
		});
	});
	
	// 初始去除添加条件
	$("#searchwheres .searchwhereadd").remove(); 
	$("#searchtext1").val('');  
	$("#AdvancedSearchbbBtn").unbind('click');
	// 执行查询
	$("#AdvancedSearchbbBtn").bind('click',function(){
		if($("#searchtext1").val()!=''){
			var sqlwhere = CLOUD._getSearchWhere();
			var querydata = {
					where: sqlwhere,
					tan : aliasname ? aliasname : ''
				};
			if(fordata) {
				fordata.call(fordata, querydata);
			}
			ttable.query(querydata);
			$("#AdvancedSearchModal").modal("hide"); 
		}
	});
};
// 获取组装&查询条件
CLOUD._getSearchWhere = function() {
	var sqlwhere = "";
	$("#searchwheres .searchwhere").each(function(i){
		var onewhere = "";
		var st = $(this).find(".t").get(0).value;
		if(st!="") {
			var c = $(this).find(".c").get(0).value;
			var o = $(this).find(".o").get(0).value;
			var l = "";
			if(i!=0) {
				l = $(this).find(".l").get(0).value;
			}
			onewhere = l + "," + c + "," + o + "," + st;
			sqlwhere += (i!=0?"|":"") + onewhere;
		}
	});
	return sqlwhere;
};


$(function(){
	// 添加一个新查询条件
	$("#AdvancedSearchttBtn").bind('click',function(){
		var swhere = $("#searchwhereDiv").clone(true);
		$("#searchwheres").append(swhere.html()); 
		$(".cloumns2").bind('change', function(){
			if(columntypes[this.value] == 'datetime') {
				$(this).closest(".searchwhere").find(".advdate").show();
			}
			else{
				$(this).closest(".searchwhere").find(".advdate").hide();
			}
			$(".advdate").datepicker({
				rtl: Metronic.isRTL(),
	            orientation: "left",
	            autoclose: true
			}).on('changeDate',function(ev){
				  var startTime = formatDate(ev.date, 'yyyy-MM-dd');
				  $(this).closest(".searchwhere").find(".t").val(startTime);  
			});
		});
		
	});
	
	// 新建查询
	$("#AdvancedSearchCreateBtn").bind('click', function(){
		$(".searchdel").each(function(i){
			if(i>0)
				$(this).closest(".searchwhere").remove();
		});
		$("#ss_searchId").val('');
		$("#ss_searchName").val('');
	}); 
	
	$("#AdvancedSearchSaveBtn").bind('click', function(){
		if($("#searchtext1").val()!=''){
			$("#searchEditModal").modal('show');
		} else {
			CLOUD.messager.alert("没有条件");
		}
	});
	
	CLOUD.Validate('searchEditform', function(form){
		var id = $("#ss_searchId").val();
		var _url = CLOUD.PATH + '/search_add.json';
		if(id!='') {
			_url = CLOUD.PATH + '/search_update.json';
		}
		$("#wheres").val(CLOUD._getSearchWhere());
		CLOUD.trackPost(_url, $(form).serialize(), function(data) {
			// 新增后，再保存为修改。
			$("#ss_searchId").val(data.data.ss_searchId);
			$("#searchEditModal").modal('hide');
			CLOUD.updateSuccessAlert(); 
		});
		return false;
    }, {
    	ss_searchName : {
    		required : true
    	}
    });
	
	var pttable = undefined;
	var sttable = undefined;
	$("#AdvancedSearchOpenBtn").bind('click', function(){
		if(pttable==undefined) {
			pttable = new CLOUD.Datatable({
				table : $("#trig-pro-search-table"), 
				url : CLOUD.PATH + '/search_findPageList.json' , 
				columns : [
				           { "data": null, "render": function(data, type, row, mete){ 
				        	   	return '<input type="checkbox" class="checkboxes" value="'+row.ss_searchId+'"/>';   
				           	}, orderable: false, className: "trig-checkbox"},
				            { "data": "ss_searchName" },
				            { "data": "ss_createTime" }
				],
				order: [[2,'desc']], 
				queryParams : {
					ss_tableName : $("#ss_tableName").val()
				},
				filter : true
			});
		} else {
			pttable.query({ss_tableName : $("#ss_tableName").val()});
		}
		if(sttable == undefined) {
			sttable = new CLOUD.Datatable({
				table : $("#trig-share-search-table"), 
				url : CLOUD.PATH + '/search_findPageList.json?t=1', 
				columns : [
				           { "data": null, "render": function(data, type, row, mete){ 
				        	   	return '<input type="checkbox" class="checkboxes" value="'+row.ss_searchId+'"  data-name="'+row.ss_searchName+'"/>';   
				           	}, orderable: false, className: "trig-checkbox"},
				            { "data": "ss_searchName" },
				            { "data": "ss_createTime" }
				],
				queryParams : {
					ss_tableName : $("#ss_tableName").val()
				},
				order: [[2,'desc']], 
				filter : true
			});
		} else {
			sttable.query({ss_tableName : $("#ss_tableName").val()});
		}
		$("#searchSelectModal").modal('show');
	});
	
	function setWhere(id) {
		$.post(CLOUD.PATH + '/search_findWhere.json', 'id='+ id, function(data){
			data = CLOUD.successHandle(data);
			$(".searchdel").each(function(i){
				if(i>0)
					$(this).closest(".searchwhere").remove();
			});
			if(data.success) {
				var onesss = $("#searchwheres .searchwhere");
				//onesss.find(".l").val(data.rows[0].ssw_whereLogic);
				onesss.find(".o").val(data.rows[0].ssw_whereOpertaion);
				onesss.find(".c").val(data.rows[0].ssw_whereField);
				onesss.find(".t").val(data.rows[0].ssw_whereText);
				for(var i=1;i<data.rows.length;i++) {
					var swhere = $("#searchwhereDiv").clone(true);
					$("#searchwheres").append(swhere.html());
					var sss = $("#searchwheres .searchwhere:last-child");
					sss.find(".l").val(data.rows[i].ssw_whereLogic);
					sss.find(".o").val(data.rows[i].ssw_whereOpertaion);
					sss.find(".c").val(data.rows[i].ssw_whereField);
					sss.find(".t").val(data.rows[i].ssw_whereText);
				}
			}
		});
	}
	
	$("#searchselectbtn").bind('click', function(){
		var index = $("#searchtabs .active a").attr("data-index");
		if(index=='0') {
			var ids = pttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				$("#ss_searchId").val(ids.val());
				$("#ss_searchName").val(ids.attr('data-name'));
				setWhere(ids.val());
				$("#searchSelectModal").modal('hide');
			}
		} else {
			var ids = sttable.getCheckbox();
			var rows = ids.size();
			// 是否选择单条记录
			if(CLOUD.isSelectOne(rows)) {
				setWhere(ids.val());
				// 分享的不能修改
				$("#ss_searchId").val('');
				$("#searchSelectModal").modal('hide');
			}
		}
	});
	
	$("#deleteSysSearch").bind('click', function() {
		var objs = pttable.getCheckbox();
		var rows = objs.size();
		CLOUD.isDelSelectOne(rows,function(){
			var ids = "";
			objs.each(function(){
				ids += this.value + ",";
			});   
			CLOUD.trackPost(CLOUD.PATH + '/search_delete.json', "ids=" + ids, function(data){
				pttable.reload();
			});
		});
	});
	
});

function formatDate(date,format){
    var paddNum = function(num){
      num += "";
      return num.replace(/^(\d)$/,"0$1");
    };
    //指定格式字符
    var cfg = {
       yyyy : date.getFullYear() //年 : 4位
      ,yy : date.getFullYear().toString().substring(2)//年 : 2位
      ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
      ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
      ,d  : date.getDate()   //日 : 如果1位的时候不补0
      ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
      ,hh : date.getHours()  //时
      ,mm : date.getMinutes() //分
      ,ss : date.getSeconds() //秒
    };
    format || (format = "yyyy-MM-dd hh:mm:ss");
    return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
}

