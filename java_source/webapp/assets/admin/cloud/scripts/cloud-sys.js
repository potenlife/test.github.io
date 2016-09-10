/**
*	调用系统公共方法JS
*/

// 字典 start
CLOUD.dict = {
	 url : {
		parent: CLOUD.PATH+ '/dictionary_findByParentList.json',
		NO: CLOUD.PATH+ '/dictionary_findByNoList.json',
		ByNO: CLOUD.PATH + '/dictionary_findByNo.json'
	 	},
		clear : function(id) { 
			$('#' + id).val('');
		},
		setSelectByParent: function(id, pid, sid) {
			var _url = this.url.parent ;
			var opts = document.getElementById(id).options;
			opts.length = 1;
			if(pid) {
				var jpobj = $("#" + id);
				var defaulevalue = jpobj.attr('data-value');
				$.getJSON(_url,'id=' + pid,function(data){
					for(var i=0;i<data.length;i++) {
						var opt = new Option(data[i].sd_dictionaryName, data[i].sd_dictionaryId);
						if(defaulevalue && defaulevalue == data[i].sd_dictionaryId) {
							opt.selected = true;
						}
						opts.add(opt);
					}
					if(jpobj.is(".bs-select"))
						jpobj.selectpicker('refresh'); 
				});
			}
			
			if(sid) {
				$("#" + id).on('change', function(){
					CLOUD.dict.setSelectByParent(sid, $(this).val());
				});
				
				var _pid = $("#" + id).val();
				if(_pid)
					CLOUD.dict.setSelectByParent(sid, _pid, null);
			}
		},
		setSelectByNO: function(id, NO, sid) {
			var _url = this.url.NO ;
			var opts = document.getElementById(id).options;
			opts.length = 1;
			if(NO) {
				$.getJSON(_url,'id=' + NO,function(data) {
					for(var i=0;i<data.length;i++) {
						opts.add(new Option(data[i].sd_dictionaryName, data[i].sd_dictionaryId));
					} 
					var jpobj = $("#" + id);
					if(jpobj.is(".bs-select"))
						jpobj.selectpicker('refresh'); 
				});
				$.getJSON(this.url.ByNO, 'id=' + NO, function(data){
					if(data.success) {
						$("#btn_" + id).bind('click', function(){
							CLOUD.formreset($("#sytsDictionaryEditform"), {sd_isLeaf : 'Y', sd_state : 'N'});
							$("#editInputId").val(id);
							$("#edit_sd_parentDictionaryId").val(data.data.sd_dictionaryId);
							$("#sysDictionaryEditModal").modal('show');
						});
					}
				});
				
			}
			
			if(sid) {
				$("#" + id).on('change', function(){
					CLOUD.dict.setSelectByParent(sid, $(this).val());
				});
				var _pid = $("#" + id).val();
				if(_pid)
					CLOUD.dict.setSelectByParent(sid, _pid, null);
			}
		},
		setSelectByNOAndCode:function(id, NO) {
			var _url = this.url.NO ;
			var opts = document.getElementById(id).options;
			opts.length = 1;
			$.getJSON(_url,'id=' + NO,function(data) {
				for(var i=0;i<data.length;i++) {
					opts.add(new Option(data[i].sd_dictionaryName, data[i].sd_dictionaryCode));
				}
				var jpobj = $("#" + id);
				if(jpobj.is(".bs-select"))
					jpobj.selectpicker('refresh'); 
			});
		}, 
		setSelectByParentAndCode:function(id, pid) {
			var _url = this.url.parent ;
			var opts = document.getElementById(id).options;
			opts.length = 1;
			$.getJSON(_url,'id=' + pid,function(data) {
				for(var i=0;i<data.length;i++) {
					opts.add(new Option(data[i].sd_dictionaryName, data[i].sd_dictionaryCode));
				}
				var jpobj = $("#" + id);
				if(jpobj.is(".bs-select"))
					jpobj.selectpicker('refresh'); 
			});
		}, 
		setMultipleByParent: function(name, pid, divid, defval){
			var _url = this.url.parent ;
			var html = '<div class="checkbox-list" style="padding-left:20px">';
			if(pid) {
				$.ajax({url: _url, data : 'id=' + pid, success: function(data){
					for(var i=0;i<data.length;i++) {
						var checked = false;
						if(defval && defval.indexOf(data[i].sd_dictionaryId) > -1 ) {
							checked = true;
						}
						html += '<label class="checkbox-inline" style="margin-left:5px">' 
								+ '<input type="checkbox"  name="'+name+'" value="'+data[i].sd_dictionaryId+'" '+(checked ? 'checked': '')+'> '+data[i].sd_dictionaryName+'</label>';
						
					}
				}, async:false, type : 'get', dataType : 'json'
				});
				
			}
			html += '</div>'; 
			$("#" + divid).html(html);
		}
};
// 字典 end

// 数据表验证 start
CLOUD.FormValidate = function(tablename, formid, submtfun, tablealias, ignore) {
	var tan = tablealias ? tablealias : tableToLower(tablename);
	$.getJSON(CLOUD.PATH + '/tools/table_column_findList.json', 'stc_tableName='+ tablename ,function(data) {
		var str = "{";
		var isone = true;
		for(var i=0;i<data.length;i++) {
			var re = false;
			if(data[i].stc_isNull=='N') {
				re = true;
			}
			if(data[i].stc_validator && data[i].stc_validator!='') {
				if(isone == false) {
					str += ",";
				}
				isone = false;
				str += tan + "_" + data[i].stc_aliasName+" : {required:"+re+","+data[i].stc_validator+":true}";
			} else if(re && data[i].stc_isPk && data[i].stc_isPk=='N') {
				if(isone == false) {
					str += ",";
				}
				isone = false;
				str += tan + "_" + data[i].stc_aliasName+" : {required:"+re+"}";
			}
		}
		str += "}";
		var rules = $.parseJSON(str);
		CLOUD.Validate(formid, submtfun, rules, ignore);
	});
};

function tableToLower(tablename) {
	tablename = tablename.toLowerCase();
	var cs = tablename.split("_");
	var c =cs[0].charAt(0);
	if (cs.length > 1) {
		for(var i=1; i<cs.length; i++) {
			c+= cs[i].charAt(0);
		}
	}
	return c.toString();
}
// 表单验证 end

// 数据列表，使用 jquery datatable，start
// 默认行大小
CLOUD.PAGESIZE = 15;
// 默认可选择行大小
CLOUD.PAGELIST = [[10,15,30,50,100,-1],[10,15,30,50,100,'全部']]; 

CLOUD.TABLE_LANGUAGE = {
		"lengthMenu" : " _MENU_",
		"zeroRecords" : "抱歉， 没有找到",
		"processing" : "正在获取数据，请稍后...", 
		"info" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
		"infoEmpty" : "没有数据",
		"infoFiltered" : "",//"(从 _MAX_ 条数据中检索)",
		"zeroRecords" : "没有检索到数据",
		"sSearch": "搜索：", 
		"paginate" : {
			"first" : "首页",
			"previous" : "前一页",
			"next" : "后一页",
			"last" : "尾页"
		}
	};
/** 分页参数转换 */
CLOUD.addTablePage = function(d, opts) {
	if(d.order && d.order.length>0) {
		var orders = d.order;
		for(var i=0;i<orders.length;i++) { 
			if(i==0) {
				d.sort = d.columns[orders[i]['column']]['data'];
				d.order = d.order[i]['dir']; 
			} else {
				if(orders[i]['column']) {
					d.sort = d.sort + ',' + d.columns[orders[i]['column']]['data'];
					d.order = d.order + ',' + orders[i]['dir'];   
				} 
			}
		} 
	} 
	if(opts.paging!=false) { 
		d.rows = d.length;
		d.page = d.start/d.length+1; 
	}
	if(opts.filter) {
		d.searchKey = d.search['value']; 
	}
	// 将DATA TABLE传递参数赋空，将少参数传递
	d.columns = ''; 
	d.search = ''; 
};

// Datatable
CLOUD.Datatable = function(opts) {
	var options = opts;
	var table = options.table;
	// 查询参数
	var queryParams = options.queryParams ? options.queryParams : {};
	var pagenum = 1;
	var pagesize = options.pagesize ? options.pagesize : CLOUD.PAGESIZE;
	// 记录总数
	var recordsTotal = 0;
	// 是否监听行选中事件
	var trcli = opts.trclick != undefined ? opts.trclick : true;  
	// 拖动当前上级id
	var dndid = '';
	// 是否可拖动，解决未拖动时自动移动
	var isdnd = false;
	
	var tablesetting = {   
	    	"paginationType" : "full_numbers",
			"filter": options.filter ? true : false,  
			"paging": options.paging == false ? false : true,  
			"serverSide": true ,  
			"stateSave" : true,
			"processing":true,
			"ajax": { url : options.url, type: 'POST' ,data: function ( d ) {
				// 加截分页/排序参数
				CLOUD.addTablePage(d, options);
				// 添加查询条件
				for(var key in queryParams){  
					var val = queryParams[key];
					if(val) eval("d."+key+" = queryParams['" + key + "'];") ; 
				}
				if(options.paging != false) pagenum = d.page;
			}},
			"columns": options.columns,
            "destroy": true,
            "language": CLOUD.TABLE_LANGUAGE,
            "lengthMenu": options.pagelist ? options.pagelist : CLOUD.PAGELIST,
            "pageLength": pagesize,  
            "order" :  options.order, 
            "drawCallback": function (oSettings) { // run some code on table redraw
                Metronic.initUniform($('input[type="checkbox"]', table)); // reinitialize uniform checkboxes on each table reload
                // 加行号
                $(".checkboxes", table).each(function(i){
    	    		$(this).attr("number", i); 
    	    		//$(this).parents('td').addClass("nodrag");
    	    	}); 
                if(options.drawCallback) {
                	options.drawCallback.call();
                }
                dndid = '';
                isdnd = false;
                // 拖动
                if(options.dnd) {
                	var order = this.api().order();
            		if(parseInt(order[0][0])==options.dnd.sort && (order[0][1]=='asc')) { 
            			table.tableDnD({
            				onDragClass: 'trig-tablednd',
            				onDragStart: function(table, row) {
            	                dndid = $(row).prev('tr').find('.checkboxes').val();
            	                isdnd = true;
            	            }
            			});
            		}
                }
            }
	    };
		if(opts.tablesetting) {
			for(var key in opts.tablesetting){  
				var val = opts.tablesetting[key];
				if(val!=undefined) eval("tablesetting."+key+" = opts.tablesetting['" + key +"'];") ; 
			}
		}
	
	 var dtable = table.on('xhr.dt', function(e, settings, data){
	    	CLOUD.successHandle(data);  
	    	if(options.load) { 
	    		options.load.call(options.load, data);
	    	}
	    	if(data.success) {
	    		recordsTotal = data.recordsTotal;
	    	}
	    }).dataTable(tablesetting);
	 
	 
	 // 拖动结束事件
	 if(options.dnd && options.dnd.onDrop) {
 		table.on('mouseup', 'tbody tr', function(e){
 			// 详情点击、nodrag设定不能拖动、选择框不做拖动
 			if(isdnd == false || $(e.target).is('.nodrag') || $(e.target).is('.row-details') || $(e.target).is('.checkboxes')) return false;
 			var id = $(this).find('.checkboxes').val();
 			var perv = $(this).prev('tr');
 			var next = $(this).next('tr');
 			var pervid = "";
 			pervid = perv.find('.checkboxes').val();
 			if(dndid != pervid && (dndid || pervid))
 				options.dnd.onDrop.call(this, id, pervid, next.find('.checkboxes').val());
 		});
 	}
	 
	    // 监听 TABLE CHECKBOX，加行选样式 
	 table.find('.group-checkable').change(function () {
	        var set = jQuery(this).attr("data-set"); 
	        var checked = jQuery(this).is(":checked");
	        jQuery(set).each(function () {
	            if (checked) {
	                $(this).attr("checked", true);
	                $(this).parents('tr').addClass("active");
	            } else {
	                $(this).attr("checked", false);
	                $(this).parents('tr').removeClass("active");
	            }
	        });
	        jQuery.uniform.update(set);
	    });
		
	    table.on('change', 'tbody tr .checkboxes', function (e) {
	    	var checked = jQuery(this).is(":checked");
	    	if(checked) {
	    		$(this).attr("checked", true);
	            $(this).parents('tr').addClass("active");
	    	}else {
	    		$(this).attr("checked", false);
	            $(this).parents('tr').removeClass("active");  
	        }
	    	 jQuery.uniform.update($(this));   
	    });
	    
	    if(trcli) { 
	    	table.on('click', 'tbody tr', function (e) {
	    		// 更多详细中的tr不触发
		    	if ($(e.target).is('.checkboxes') || $(e.target).is('.row-details') || $(this).find(".details").size()>0 || $(this).attr("role") == undefined) { 
		    	    return; 
		    	  }
		    	if($(this).is(".active") && !options.dblclick) {
		    		//$("tr", table).removeClass("active"); 
		    		$(this).removeClass("active");
		    		$(".checkboxes", $(this)).attr("checked", false);  
		    	} else {
		    		$("tr", table).removeClass("active");
					$(this).addClass("active");
					$(".checkboxes", table).attr("checked", false);  
			        $(".checkboxes", $(this)).attr("checked", true); 
		    	}
		        jQuery.uniform.update($(".checkboxes", table));   
			});
	    }
	    
	    if(options.dblclick) {
	    	table.on('dblclick', 'tbody tr', function (e) {
	    		// 更多详细中的tr不触发,双击+不触发
	    		if($(this).find(".details").size()>0 || $(this).attr("role") == undefined || $(e.target).is('.row-details') || $(e.target).is('.checkboxes')){  
	    			return ;
	    		}
	    		options.dblclick.call(this, e);
	        });
	    }
	   	    
	    return {
	    	getTable : function() { return dtable;},
	    	// 获取查询参数，用于导出等
	    	getQueryParams : function() { return queryParams; },
	    	getUrl : function() { return options.url; },
	    	getPageNumber : function() { return pagenum;},
	    	getPageSize : function() { return pagesize;},
	    	getRecordsTotal : function() { return recordsTotal;},
	    	// 执行查询操作
	    	query : function(q) {
	    		queryParams = q;
	    		dtable.api().ajax.reload();
	    	},
	    	// 重新加载TABLE数据
	    	reload: function(callback) {
	    		var oldRecordsTotal = recordsTotal;
	    		// 保持当前分页
	    		dtable.api().ajax.reload(function(data){
	    			if(callback) callback.call(callback, data);
	    			// 记录数发生改变时跳转至第一页
	    			if(data.success && oldRecordsTotal!=data.recordsTotal) {
	    				dtable.fnPageChange(0);
	    			}
	    		}, false);
	    	},
	    	initMore : function(viewmore) {
	    		//table.unbind('click', 'tbody .row-details');
	    		// 更多点击事件
	    	     table.on('click', 'tbody .row-details', function(e){
	    	     	var nTr = $(this).parents('tr')[0]; 
	    	     	var id = $(this).attr('dataid'); 
	    	     	if (dtable.fnIsOpen(nTr)) {
	    	            /* This row is already open - close it */
	    	            $(this).addClass("row-details-close").removeClass("row-details-open");
	    	            dtable.fnClose(nTr);
	    	        } else {
	    	            /* Open this row */
	    	            $(this).addClass("row-details-open").removeClass("row-details-close");
	    	            var strhtml = viewmore.call(this, id);
	    	            dtable.fnOpen(nTr, strhtml, 'details');
	    	        }
	    	     });
	    	     
	    	     // 快捷键关闭打开所有
	    	     var row_details_close = true;
	    	     $(document).keydown(function(e){
	    	    	 if(e.ctrlKey && e.which == 73) { // ctrl+i
	    	    		 	// 打开所有
		    	    	 	if(row_details_close) {
		    	    	 		row_details_close = false;
		    	    	 		$('tbody .row-details', table).each(function(){
		    	    	 			var nTr = $(this).parents('tr')[0]; 
		    	    	 			var id = $(this).attr('dataid'); 
		    	    	 			 $(this).addClass("row-details-open").removeClass("row-details-close");
		    	    	 			 var strhtml = viewmore.call(this, id);
		    	    	 			 dtable.fnOpen(nTr, strhtml, 'details');
		    	    	 		});
		    	    	 	} else { // 关闭所有
		    	    	 		row_details_close = true;
		    	    	 		$('tbody .row-details', table).each(function(){
		    	    	 			var nTr = $(this).parents('tr')[0]; 
			    	    	 		$(this).addClass("row-details-close").removeClass("row-details-open");
				    	            dtable.fnClose(nTr);
		    	    	 		});
		    	    	 	}
	    	    	 }
	    	     });
	    	},
	    	// 获取checkbox取
	    	getCheckbox : function() { 
	    		return $('.checkboxes:checked', table);
	    	},
	    	prev : function(prevbtn, callback) {
	    		var _btn = '.trig-prev';
	    		if(prevbtn) _btn = prevbtn;
	    		$(_btn).bind('click', function(){ 
	    	    	var next = $(".active", table).prev("tr[role='row']"); 
	    	    	if(next.size()>0) {
	    	    		next.click();
	    	    		if(callback) {
	    	    			callback.call();
	    	    		} else if(options.dblclick) { 
	    	    			options.dblclick.call();   
	    	    		}
	    	    	} else {
	    	    		CLOUD.messager.alert('已是第一个了'); 
	    	    	}
	    	    });
	    	},
	    	next : function(nextbtn, callback) {
	    		var _btn = '.trig-next';
	    		if(nextbtn) _btn = nextbtn;
	    		 $(_btn).bind('click', function(){
	    		    	var next = $(".active", table).next("tr[role='row']"); 
	    		    	if(next.size()>0) {
	    		    		next.click();
	    		    		if(callback) {
		    	    			callback.call();
		    	    		} else if(options.dblclick) {   
		    	    			options.dblclick.call();   
		    	    		} 
	    		    	} else {
	    		    		CLOUD.messager.alert('已是最后一个了'); 
	    		    	}
	    		    });
	    	},
	    	getNumber:function() {
	    		return  $('.checkboxes:checked', table).attr('number');  
	    	},
	    	getSort: function() {
	    		return sort;
	    	},
	    	getOrder: function() {
	    		return order;
	    	}
	    };
};
CLOUD.showPrveNext = function() {
	$(".trig-next").show();
	$(".trig-prev").show();
};
CLOUD.hidePrveNext = function() {
	$(".trig-next").hide();
	$(".trig-prev").hide();
};
//数据列表 end

//  移动
CLOUD.move = function(opts, callback, cidback) {
	var ttable = opts.ttable;
	var moveSortUrl = opts.url;
	var tableObj = opts.obj.table;
	var upObj = opts.obj.up;
	var downObj = opts.obj.down;
	var topObj = opts.obj.top;
	var bottomObj = opts.obj.bottom;
	var moveSort = opts.sort;
	
	function mmove(t) {
		var order = ttable.getTable().api().order();
		
		if(parseInt(order[0][0])!=moveSort || (order[0][1]!='asc')) { 
			CLOUD.messager.alert('当前排序状态下不能进行移动，请将排序设置为<排序字段>升序');   
			return false;
		}
		var ids = ttable.getCheckbox();
		var rows = ids.size();
		// 是否选择单条记录
		if(CLOUD.isSelectOne(rows)) {
			var id = ids.get(0).value;
			var number = parseInt(ttable.getNumber()); 
			var moveid = '';
			if(t=='top') {
				if(number <= 0) {
					CLOUD.messager.alert('已是第一个了'); 
					return false;
				}
				var top = $(".checkboxes[number='0']", tableObj);
				moveid = top.val();
			}else if(t=='bottom') { 
				var ids = $(".checkboxes[number]", tableObj);
				var count = ids.size();
				if(number >= count -1) {
					CLOUD.messager.alert('已是最后一个了'); 
					return false;
				}
				moveid = ids.get(count -1).value;
			}else if(t=='up') {
				if(number <= 0) {
					CLOUD.messager.alert('已是第一个了'); 
					return false;
				}
				var prev = $(".checkboxes[number='"+(number-1)+"']");
				moveid = prev.val();
			}else if(t=='down') {
				var next = $(".checkboxes[number='"+(number+1)+"']");
				if(next && next.size()>0) {
					moveid = next.val();
				} else {
					CLOUD.messager.alert('已是最后一个了'); 
					return false;
				}
			}/*else if(t=='insertNext') {
				id = organization.selectid;
				moveid = organization.nextid;
			}else if(t=='insertPrev') {
				id = organization.selectid;
				moveid = organization.insertprevid;
			}*/
			else {
				CLOUD.messager.alert('操作不正确，请重试'); 
				return false;
			}
			var url = moveSortUrl;
			// 内容权值
			if(cidback) {
				var cid = cidback.call();
				url = CLOUD.getContentUrl(moveSortUrl, cid);
			}
			
			$.post(url,'id=' + id + '&moveId=' + moveid, function(data){
				data = CLOUD.successHandle(data);
				if(data.success==true) {
					ttable.reload();
					if(callback) {
						callback.call();
					}
				}
			});
		}
	}
	// 上移
	upObj.bind('click', function(){
		mmove('up');
	});
	// 下移
	downObj.bind('click', function(){
		mmove('down');
	});
	// 置顶
	topObj.bind('click', function(){
		mmove('top');
	});
	// 置底
	bottomObj.bind('click', function(){
		mmove('bottom');
	});
};
// 移动 end

// 组织机构、用户选择 start
// 组织机构选择，默认select框，type=selectpicker为selectpicker
CLOUD.OrgSelect = function(id, defval, type, orgs) {
	if(CLOUD.settings.org) {
		// 初始组织机构
		$.getJSON('organization_findSelectList.json', '', function(data) {
	 		var o = $("#" + id).get(0).options;
	 		for(var i=0;i<data.length;i++) {
	 			var opt = new Option(data[i].so_organizationName, data[i].so_organizationId);
	 			if(defval && data[i].so_organizationId==defval) {
	 				opt.selected = true;
	 			}
	 			o.add(opt);
	 			if(orgs)
	 				orgs[data[i].so_organizationId] = data[i].so_organizationName;
	 		}
	 		if(type && type == 'selectpicker') {
	 			$('#' + id).selectpicker({
	                iconBase: 'fa',
	                tickIcon: 'fa-check'
	            });
	 		}
		});
	}
};
// 用户查找选择，multiple=true多选
CLOUD.UserSelect = function(id, multiple) {
	var _multiple = multiple==true ? true : false;
	var selectobj = $("#" + id).select2({
        minimumInputLength: 0,   
        placeholder: "请选择用户",
        multiple :  _multiple,
         ajax: {  
             url: CLOUD.PATH + '/user_select.json',
             dataType: 'json',
             data: function (term, page) {
                 return {
                	 searchKey: term, 
                 	rows:15 
                 };
             },
             results: function (data, page) {
             	var datas = [];
             	for(var i=0;i<data.length;i++) {
             		datas.push({id:data[i].su_userId,text:data[i].su_userName + '('+data[i].su_realName+')'});
             	}
                 return {
                     results: datas 
                 };
             }
         }
     });
	return { 
		getVal : function(){
			return $("#" + id).val();
		},
		setVal : function(vals) {
			if(vals) {
				$.getJSON(CLOUD.PATH + "/user_finds.json", "ids=" + vals, function(data){
					var datas = [];
					for(var i=0;i<data.length;i++){
						datas.push({id:data[i].su_userId, text:data[i].su_userName+ '('+data[i].su_realName+')'});
					}
					if(_multiple) {
						selectobj.select2('data', datas);
					} else {
						selectobj.select2('data', datas[0]);
					}
				});
			}
		},
		setData : function(data) {
			if(data) {
				selectobj.select2('data', data);
			}
		}
	};
};



// 组织机构、用户选择 end

// 统计图
CLOUD.Chart = function(containerID, title, data, type) {
	data = $.parseJSON(data);
	if(data.data.length>0) {
		try{
			if(type=='bar') {
				var xdata = [];
				var name = "";
				var datas = [];
				var row = data.data[0];
				var k=1;
				var key1 = "";
				var key2 = "";
				for(var key in row){
					name = key;
					if(k==1) {
						key1 = key;
					}else{
						key2 = key;
					}
					k++;
				}
				for(var i=0;i<data.data.length;i++) {
					//alert(eval("data.data["+i+"]"+key1));
					xdata.push(eval("data.data["+i+"]."+key1));
					datas.push(eval("data.data["+i+"]."+key2));
				}
				$('#' + containerID).highcharts({
			            chart: {
			                type: 'column'
			            },
			            title: {
			                text: title
			            },
			            subtitle: {
			                text: ''
			            },
			            xAxis: {
			                categories: xdata
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: name
			                }
			            },
			            
			            plotOptions: {
			                column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			            series: [{
			                name: name,
			                data: datas
			    
			            }],
			            exporting: {
			                enabled: false
			            },credits: {
			            	enabled: false
			            }
			   });
			} else if(type=='pie') {
				var name = "";
				var datas = [];
				var row = data.data[0];
				var k=1;
				var key1 = "";
				var key2 = "";
				for(var key in row){
					name = key;
					if(k==1) {
						key1 = key;
					}else{
						key2 = key;
					}
					k++;
				}
				for(var i=0;i<data.data.length;i++) {
					datas.push([eval("data.data["+i+"]."+key1),eval("data.data["+i+"]."+key2)]);
				}
				$('#' + containerID).highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: title
		            },
		            tooltip: {
		        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
		            	percentageDecimals: 1
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
		                    dataLabels: {
		                        enabled: true,
		                        color: '#000000',
		                        connectorColor: '#000000',
		                        formatter: function() {
		                            return '<b>'+ this.point.name +'</b>: ' + this.point.y;
		                        }
		                    }
		                }
		            },
		            series: [{
		                type: 'pie',
		                name: name,
		                data: datas
		            }],
		            exporting: {
		                enabled: false
		            },credits: {
		            	enabled: false
		            }
		        });
			} else if(type=='line') {
				var xdata = [];
				var name = "";
				var datas = [];
				var row = data.data[0];
				var k=1;
				var key1 = "";
				var key2 = "";
				for(var key in row){
					name = key;
					if(k==1) {
						key1 = key;
					}else{
						key2 = key;
					}
					k++;
				}
				for(var i=0;i<data.data.length;i++) {
					//alert(eval("data.data["+i+"]"+key1));
					xdata.push(eval("data.data["+i+"]."+key1));
					datas.push(eval("data.data["+i+"]."+key2));
				}
				$('#' + containerID).highcharts({
		            chart: {
		                type: 'line',
		                marginRight: 130,
		                marginBottom: 25
		            },
		            title: {
		                text: title,
		                x: -20 //center
		            },
		            subtitle: {
		                text: '',
		                x: -20
		            },
		            xAxis: {
		                categories: xdata
		            },
		            yAxis: {
		                title: {
		                    text: name
		                },
		                plotLines: [{
		                    value: 0,
		                    width: 1,
		                    color: '#808080'
		                }]
		            },
		            tooltip: {
		                valueSuffix: ''
		            },
		            legend: {
		                layout: 'vertical',
		                align: 'right',
		                verticalAlign: 'top',
		                x: -10,
		                y: 100,
		                borderWidth: 0
		            },
		            series: [{
		                name: name,
		                data: datas
		    
		            }],
		            exporting: {
		                enabled: false
		            },credits: {
		            	enabled: false
		            }
		        });
			}
		}catch(e) {
			CLOUD.messager.alert("转换错误：" + e.message);
		}
	} else {
		CLOUD.messager.alert("没有数据");
	}
};

// 文本数据对比
CLOUD.txtDiffByTxt = function(txt1, txt2, name1, name2) {
    var base = difflib.stringAsLines(txt1);
    var newtxt = difflib.stringAsLines(txt2);
    var sm = new difflib.SequenceMatcher(base, newtxt);
    var opcodes = sm.get_opcodes();
    var diffoutputdiv = document.getElementById("diffoutput");
    while (diffoutputdiv.firstChild) diffoutputdiv.removeChild(diffoutputdiv.firstChild);
    diffoutputdiv.appendChild(diffview.buildView({
        baseTextLines: base,
        newTextLines: newtxt,
        opcodes: opcodes,
        // set the display titles for each resource
        baseTextName:  name1 ? name1 : "1",
        newTextName: name2 ? name2 : "2",
        contextSize: 1,
        viewType: 0
    }));
    $("#diffmodal").modal('show');
};

CLOUD.txtDiffByID = function(id1, id2, name1, name2) {
	CLOUD.txtDiffByTxt($("#" + id1).html(), $("#"+id2).html(), name1, name2);
};
// 文本对比 end

// 可查询多选
CLOUD.multiSelect = function(id, datas, initselectdata) {
	var jqobj = $("#" + id);
	var opts = jqobj.get(0).options;
	var _datas = datas;
	
	var init = function(_initselectdata) {
		if(_datas) {
			$.each(_datas, function(i, data){
				opts.add(new Option(data.name, data.id)); 
			});
		}
		jqobj.multiSelect(); 
		// 初始选中
		if(_initselectdata) {
			$.each(_initselectdata, function(i, data){
				jqobj.multiSelect("select", data.id); 
			});
		}	
	};
	
	var indexOf = function(objs, obj) {
    	if(objs) {
    		for(var i=0;i<objs.length;i++) {
    			if(objs[i] == obj) {
    				return true;
    			}
    		}
    	}
    	return false;
    };
	
	init(initselectdata);
	
	return {
		select : function(initselectdata) {
			opts.length = 0;
			jqobj.multiSelect('destroy'); 
			init(initselectdata);
		},
		query: function(name) {
			var selectids = jqobj.val();
			opts.length = 0;
			jqobj.multiSelect('destroy'); 
			$.each(_datas, function(i, obj){
				if(obj.name.indexOf(name)>-1|| indexOf(selectids, obj.id)) {
					opts.add(new Option(obj.name, obj.id)); 
				} 
			});
			jqobj.multiSelect(); 
			$.each(_datas, function(i, obj){
				if(indexOf(selectids, obj.id))
					jqobj.multiSelect("select", obj.id); 
			});
		}, 
		refresh : function(datas, initselectdata) {
			opts.length = 0;
			_datas = datas;
			jqobj.multiSelect('destroy'); 
			init(initselectdata);
		},
		val: function() {
			return jqobj.val();
		}
	}
};

