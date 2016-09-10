
var CLOUD = CLOUD || {};
// 工程路径
CLOUD.PATH = '';
// 静态文件路径
CLOUD.STATICPATH = '';
// 上传文件路径
CLOUD.UPLOADPATH = '';
// 默认设置
CLOUD.settings = {
		sound : true,
		msgLocation : 'toast-top-right',
		style : 'default',
		dataRecycleBin : true
};

//语言常量
CLOUD.TEXT = CLOUD.TEXT || {};
/** 系统常量 */
CLOUD.Contants = {
	WIDTH_200 : 200,
	WIDTH_400 : 400,
	WIDTH_600 : 600,
	WIDTH_800 : 800,
	CSRF_PARA : 'frcs',
	CSRF_HEADER : 'frcs',
	CSRF_COOKIE : '__frcs'
};
//系统包
CLOUD.system = CLOUD.system || {};
//ID列宽
CLOUD.system.idw = 230;
// 错误代码表
CLOUD.ERRORCODES = [];
//错误代码表
CLOUD.ERROR = {}; 
CLOUD.ERROR.MESSAGE = 0; //没有错
CLOUD.ERROR.ERROR = -1;  //系统错误
CLOUD.ERROR.NOT_LOGIN = -2; //未登录
//信息对话框
CLOUD.messager = CLOUD.messager || {};

CLOUD.messager._alert = function(type, message, alertname, fn) {
	if(fn) {
		 bootbox.alert(message, fn);  
	} else {
		toastr.options = {
	            closeButton: true,
	            debug: false,
	            positionClass: CLOUD.settings.msgLocation,
	            showDuration: "1000",
	            hideDuration: "1000",
	            timeOut: "5000",
	            extendedTimeOut: "1000",
	            showEasing: "swing",
	            hideEasing: "linear",
	            showMethod: "fadeIn",
	            hideMethod: "fadeOut"
	        };
		toastr[type](message, alertname);
	}
	if(CLOUD.settings.sound==true) {
		if(type=='error') {
			if(document.getElementById("ohoh_mp3"))
				document.getElementById("ohoh_mp3").play();
		} else {
			if(document.getElementById("ding_mp3"))
				document.getElementById("ding_mp3").play();
		}
	}
};

CLOUD.messager.alertError = function(message, fn) {
	CLOUD.messager._alert('error', message, CLOUD.TEXT.PUBLIC.ERROR, fn);
};

CLOUD.messager.alert = function(info, alertname, fn) {
	if(!alertname || alertname==''){//提示窗TITLE
		alertname = CLOUD.TEXT.PUBLIC.TIP;
	}
	CLOUD.messager._alert('info', info, alertname, fn);
};

CLOUD.messager.alertSuccess = function(info, alertname) {
	if(!alertname || alertname==''){//提示窗TITLE
		alertname = CLOUD.TEXT.PUBLIC.TIP;
	}
	CLOUD.messager._alert('success', info, alertname);
};

CLOUD.messager.confirm = function(title, msg, fn) {
	bootbox.setDefaults({locale:'zh_CN'});
	bootbox.confirm(msg, fn); 
};

/** 统一AJAX提交返回处理 */
CLOUD.successHandle = function(data){
	try{
		var isobj = typeof(data) == "object" ;
		// 非对象
		if(!isobj) {
			data = $.parseJSON(data);
		}
		if(data.success==false){
			// 提示消息
			var msg = CLOUD.ERRORCODES[data.errorCode];
			if(data.message) {
				msg = data.message;
			}
			// 未登录
			if(data.errorCode == CLOUD.ERROR.NOT_LOGIN){
				CLOUD.messager.alertError(data.errorCode + ":" + msg, function() {
						openlogin();
				});
			} else {
				CLOUD.messager.alertError(data.errorCode + ":" + msg);
			}
		}
		return data;
	}catch(e){
		CLOUD.messager.alertError(CLOUD.TEXT.PUBLIC.SYSERROR_2 + "\n" + e.message);
	}
};
//更新/修改成功后提示
CLOUD.updateSuccessAlert = function(){
	CLOUD.messager.alertSuccess(CLOUD.TEXT.PUBLIC.BTN.SAVE + CLOUD.TEXT.PUBLIC.SUCCESS);
};

function openlogin() {
	location.href = CLOUD.PATH +  '/login.htm';
}


//登录身份令牌
function getToken() {
	return getCookie('token');
}

//权限判断
var trigroles = '';//用户角色
var trigprivlegs = {};//权限权
//trigprivlegs['findUser'] = true;
//初始用户角色与权限
function setRolePriv(data){
	if(data.roles){
		trigroles = data.roles;
	}
	if(data.privlegs) {
		trigprivlegs = data.privlegs;
	}
}

CLOUD.isRole = function(rolename) {
	return (trigroles + ",").indexOf(rolename + ",") > -1; 
};

CLOUD.UserSuperAdmin = false;
/** 是否超级管理角色 */
CLOUD.isSuperAdmin = function() {
	return CLOUD.UserSuperAdmin;
};

CLOUD.isPrivlege = function(pv) {
	// index.jsp 设置 
	if(CLOUD.settings.priv.fun==false) {
		return true;
	}
	var isp = eval("trigprivlegs."+pv);
	if(isp == true){
		return true;
	}
	return false;
};
/** 初始操作按钮是否可用,无权禁用 */
CLOUD.initPrivleg = function(div) {
	// 功能权限启用，index.jsp 设置 
	if(CLOUD.settings.priv.fun) {
		var btns = null;
		if(div){
			btns = $(".trig-privbtn", div);
		}else{
			btns = $(".trig-privbtn");
		}
		
		btns.each(function(){
			var pv = $(this).attr('privkey');
			if(pv&&pv!=''){
				if(CLOUD.isPrivlege(pv)==false) { 
					//$(this).addClass('disabled');
					$(this).unbind('click');
					$(this).remove(); 
				}
			}
		});
	}
};

String.prototype.StartWith = function(s) {
	if (s == null || s == "" || this.length == 0 || s.length > this.length)
		return false;
	if (this.substr(0, s.length) == s)
		return true;
	else
		return false;
	return true;
};

CLOUD.isContentPrivlege = function(uv, pv) {
	if(CLOUD.settings.priv.content==false || CLOUD.isSuperAdmin()) {
		return true;
	}
	if(uv) {
		if(pv.StartWith('find') || pv.StartWith('Advanced')) { // 查询、高级查询
			if(uv=='B-write' || uv=="C-read" || uv == 'D-view') {
				return true;
			}
		}else {
			if(uv=='B-write') {
				return true;
			}
		}
	}
	return false;
};

CLOUD.isContentQuery = function(pv) {
	if(CLOUD.settings.priv.content==false || CLOUD.isSuperAdmin()) {
		return true;
	}
	return pv && (pv=='B-write' || pv=='D-view' || pv=='C-read');
};
/** 内容权限,初始操作按钮是否可用,无权禁用 */
CLOUD.initContentPrivleg = function(uv, div) {
	// 内容权限启用，index.jsp设置
	if(CLOUD.settings.priv.content && CLOUD.isSuperAdmin() == false) {
		var btns = null;
		if(div){
			btns = $(".trig-privbtn", div);
		}else{
			btns = $(".trig-privbtn");
		}
		btns.each(function(){
			var pv = $(this).attr("privkey");
			if(pv&&pv!=''){
				if(CLOUD.isPrivlege(pv)) {
					if(CLOUD.isContentPrivlege(uv, pv)==false){
						$(this).addClass('disabled');
						//$(this).unbind('click');
					} else {
						$(this).removeClass('disabled'); 
					}
				} else {
					//$(this).addClass('disabled');
				}
			}
		});
	}
};

CLOUD.initTableContentPrivleg = function(id, div) {
	$.post(CLOUD.PATH + '/role_content_findUserPrivlege.json','id='+id, function(data){
		data = CLOUD.successHandle(data);
		if(data.success) {
			var uv = data.val;
			CLOUD.initContentPrivleg(uv, div);
		}
	});
};

CLOUD.getContentUrl = function(url, cid) {
	return url += (url.indexOf("?")>-1 ? "&" : "?") + "cid=" + cid;
};

//datagrid update 
CLOUD.isSelectOne = function(rows) {
	if(!rows || rows==0){
		CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE); //选择一条记录
		return false;
	}
	if(rows>1){
		CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTNOTMORES);//不能多行
		return false;
	}
	return true;
};

CLOUD.isSelect = function(rows) {
	if(rows==0){
		CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE); //至少一行
		return false;
	}
	return true;
};

//datagrid delete
CLOUD.isDelSelectOne = function(rows, fn) {
	if(!rows){
		CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE); //至少一行
		return false;
	}
	CLOUD.messager.confirm(CLOUD.TEXT.PUBLIC.MESSAGE.DELMSGTITLE,rows + CLOUD.TEXT.PUBLIC.MESSAGE.DELTIPW + CLOUD.TEXT.PUBLIC.MESSAGE.DELTIP,function(r){
	//是否删除	
		if(r) {
			fn.call();
		}
	});
	return true;
};
// 放入回收站
CLOUD.isDelRecycleBinSelectOne = function(rows, fn) {
	if(CLOUD.settings.dataRecycleBin) {
		if(!rows){
			CLOUD.messager.alert(CLOUD.TEXT.PUBLIC.MESSAGE.SELECTONE); //至少一行
			return false;
		}
	
		CLOUD.messager.confirm(CLOUD.TEXT.PUBLIC.MESSAGE.DELMSGTITLE,rows + CLOUD.TEXT.PUBLIC.MESSAGE.DELTIPW + CLOUD.TEXT.PUBLIC.MESSAGE.DEL_RECYCLE_BIN_TIP,function(r){
		//是否删除	
			if(r) {
				fn.call();
			}
		});
	} else {
		return CLOUD.isDelSelectOne(rows, fn);
	}
	return true;
};


//批量删除
CLOUD.isDels = function(fn){
	CLOUD.messager.confirm(CLOUD.TEXT.PUBLIC.MESSAGE.DELMSGTITLE,CLOUD.TEXT.PUBLIC.MESSAGE.DELSTIP,function(r){
	//是否删除	
		if(r) {
			fn.call();
		}
	});
};

// 进度加载，统一load...
CLOUD.progress = function(_msg) {
	$('#ajax-modal-loading').modal({
		backdrop : 'static'
	});
};
CLOUD.progressClose = function() {
	$('#ajax-modal-loading').modal('hide');
};


// log js
CLOUD.LOG = {
		isdebug : true,
		isinfo : true,
		Debug: function(log) {
			if(CLOUD.LOG.isdebug) {
				CLOUD.Console.info(log, 'debug');
			}
		},
		Info: function(log) {
			if(CLOUD.LOG.isinfo) {
				CLOUD.Console.info(log);
			}
		},
		Error: function(log) {
			CLOUD.Console.info(log, 'error');
		}
};
CLOUD.Console = CLOUD.Console || {};
CLOUD.Console.info = function(log, level) {
	try{
		if(level) {
			if(level == 'error') {
				console.error(log);
			} else if(level == 'debug') {
				console.debug(log);
			} else if(level == 'info') {
				console.info(log);
			}
		} else {
			console.info(log);
		}
		
	}catch(e){}
};
// end log js

//cookie

//  设置，需与系统设置同步
CLOUD.Cookie = {
		domain : '',
		secure : false,
		path : '/'
};

function getCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1) endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
}

function getCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg) return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break;
    }
    return null;
}
function setCookie(name, value) {
    var exp = new Date();
    exp.setTime(exp.getTime() + 3600000000);
    setCookieValue(name, value, exp);
}

function delCookes(name) {
    var date = new Date();
    //将date设置为过去的时间
    date.setTime(date.getTime() - 10000);
    //将userId这个cookie删除
    setCookieValue(name, '', date);
}

function setCookieValue(name, value, date) {
	document.cookie = name + "=" + value + "; expire=" + date.toGMTString() + "; path=" + (CLOUD.PATH ? CLOUD.PATH : CLOUD.Cookie.path) + (CLOUD.Cookie.domain ? ';domain=' + CLOUD.Cookie.domain : '') +  (CLOUD.Cookie.secure==true ? ';secure' : '');
}

// 清除表单值 
CLOUD.formreset = function(form, defdata) {
	form.find('input[type=hidden]').each(function(){
		this.value = '';
	});
	if(defdata) {
		// 默认初始
		CLOUD.forminit(form, defdata);
	} else {
		form.get(0).reset();
		//form.form('clear');
		//form.form('reset');
		// 清除隐藏域，因reset不消除这里
		CLOUD.updateCheckRadioStyle(form);
	}
};

// 更新手动设置 checkbox radio 样式效果，form为jquery对象
CLOUD.updateCheckRadioStyle = function(form) {
	var rr = form.find('input[type=radio], input[type=checkbox]');
	rr.each(function(){
		var f = $(this);
		jQuery.uniform.update(f); 
	});
};

function _checkField(form, name, val){
	var rr = form.find('input[name="'+name+'"][type=radio], input[name="'+name+'"][type=checkbox]');
	rr.prop('checked', false);
	rr.each(function(){
		var f = $(this);
		if (f.val() == val || $.inArray(f.val(), $.isArray(val)?val:[val]) >= 0){
			f.prop('checked', true);
		}
		jQuery.uniform.update(f); 
	});
	return rr;
}

CLOUD.forminit = function(form, data) {
	form.get(0).reset();
	for(var name in data) {
		var val = data[name];
		var rr = _checkField(form, name, val);
		if (!rr.length) {
			$('input[name="'+name+'"]', form).val(val);
			$('textarea[name="'+name+'"]', form).val(val);
			$('select[name="'+name+'"]', form).val(val);
		}
	}
};

// 导出HTML初始
CLOUD.initexpHTML = function(id, expurl, table) {
	// 是否有导出权限
	//if(CLOUD.isPrivlege(id)) {
		var obj = $("#"+id);
		var oHTML = '';
		oHTML += '<li><a href="javascript:;" class="trig-export-file" type="1" pagetype="0">导出所有页面为CSV </a></li>';
		oHTML += '<li>	<a href="javascript:;" class="trig-export-file" type="2" pagetype="0">导出所有页面为XML </a></li>';
		oHTML += '<li><a href="javascript:;" class="trig-export-file" type="3" pagetype="0">导出所有页面为PDF </a></li>';
		oHTML += '<li><a href="javascript:;" class="trig-export-file" type="1" pagetype="1">导出当前页面为CSV </a></li>';
		oHTML += '<li><a href="javascript:;" class="trig-export-file" type="2" pagetype="1">导出当前页面为XML </a></li>';
		oHTML += '<li><a href="javascript:;" class="trig-export-file" type="3" pagetype="1">导出当前页面为PDF </a></li>';
		obj.html(oHTML);
		$(".trig-export-file" , obj).on("click", function(){
			var _the = $(this);
			CLOUD.expdata(_the.attr('type'), expurl, table, _the.attr('pagetype'));
		});
	//}
};

// 导出 pagetype=0 全部
CLOUD.expdata = function(type, url, table, pagetype) {
	if(url.indexOf('?')>-1) {
		url += "&";
	}else{
		url += "?";
	}
	var rows = 0;
	var page = 1;
	// 默认导出全部
	if(pagetype && table && pagetype=='1'){
		page = table.getPageNumber();
		rows= table.getPageSize();
	} 
	// 是否存在导出FORM
	if(!document.getElementById('expform')) {
		jQuery('<form action="" method="POST" name="expform" id="expform"></form>').appendTo(document.body);	
	}
	var expform = document.getElementById('expform');
	
	url += "exptype=" + type + "&rows=" + rows + "&page=" + page;
	var frcs = getCookie(CLOUD.Contants.CSRF_COOKIE);
	if(frcs) {
		url += "&" + CLOUD.Contants.CSRF_PARA + "=" + frcs;
	}
	// 查询条件
	var queryParams = table ? table.getQueryParams() : {};
	// 赋值
	$("#expform").html('');
	for(var key in queryParams){
		jQuery('<input type="hidden" name="'+ key +'" />').appendTo(expform);
	}
	//$("#expform").form('load', queryParams);
	CLOUD.forminit($("#expform"), queryParams);
	
	expform.action = CLOUD.PATH + "/" + url;
	expform.method = 'post'; 
	expform.submit();
};

//取用户显示名，有真实姓名显示真实姓，无则显示帐号名
CLOUD.getUserName = function(data) {
	var un = "";
	if(data) {
		if(data.su_realName) {
			un = data.su_realName;
		} else {
			un = data.su_userName;
		}
	}
	return un;
};

CLOUD.getUserAvatar = function(data) {
	var un = CLOUD.STATICPATH + "/assets/admin/layout/img/male.png";
	if(data) {
		if(data.su_userAvatar) {
			un = CLOUD.UPLOADPATH + data.su_userAvatar;
		} else {
			if(data.su_sex == 'F')
			un = CLOUD.STATICPATH + "/assets/admin/layout/img/female.png";
		}
	}
	return un;
};
// 用户个性化设置
CLOUD.initUserDef = function(def) {
	if(def) {
		if(def.sud_pagesize && def.sud_pagesize>0) {
			CLOUD.PAGESIZE = def.sud_pagesize;
		}
		if(def.sud_sound=='N') {
			CLOUD.settings.sound = false;
		}
		if(def.sud_style) {
			CLOUD.style = def.sud_style;
			$('#style_color').attr("href",  CLOUD.STATICPATH + '/assets/admin/layout/css/themes/' + CLOUD.style + ".css");
		}
		if(def.sud_msgLocation) {
			CLOUD.settings.msgLocation = def.sud_msgLocation;
		}
		if(CLOUD.CMS) {
			if(def.sud_editorType)
				CLOUD.CMS.EditorType = def.sud_editorType;
		}
	}
};

// 时间比较,d1>d2
CLOUD.dateCompare = function(d1, d2) {
	return d1.getTime()>d2.getTime();
} ;
// 结束时间是否大于开始时间
CLOUD.startDateToEndDate = function(d1, d2) {
	if(d1&&d2) {
		d1 = new Date(Date.parse(d1.replace(/-/g,   "/")));
		d2 = new Date(Date.parse(d2.replace(/-/g,   "/")));
		return CLOUD.dateCompare(d2, d1);
	}
	return true;
};

function disableLink(e) {
    // cancels the event
    e.preventDefault();
    return false;
}

CLOUD.trackPost = function(url, para, sucfun, errfun) {
	//Pace.track(function() {
		CLOUD.progress();
		$.post(url,para, function(data){
			CLOUD.progressClose();
			data = CLOUD.successHandle(data);
			if(data.success==true) {
				if(sucfun)
					sucfun.call(this, data);
			} else {
				if(errfun)
					errfun.call(this, data);
			}
		});
	//});
};

var Pace = {
		track : function(fun) {
			fun.call();
		}
};

CLOUD.TreeUndetermined = function(treeid) {
	var ids = [];
	function setUids(nodes) {
    	for(var i=0;i<nodes.length;i++) {
    		if($("#" + treeid).jstree('is_undetermined', nodes[i])) { 
    			ids.push(nodes[i].id);
    			if(nodes[i].children && nodes[i].children.length>0) {
    				setUids(nodes[i].children);
    			}
    		}
    	}
    }
	var nodeall = $("#" + treeid).jstree('get_json'); 
	setUids(nodeall);
	return ids;
};

// 日期范围选择器
CLOUD.daterangepicker = function(id, backcall) {
	$('#'+id).daterangepicker({
		    opens: (Metronic.isRTL() ? 'right' : 'left'),
		    startDate: moment().subtract('days', 29),
		    endDate: moment(),
		    minDate: '2012/01/01',
		    maxDate:  new Date().getFullYear() + '/12/31', 
		    dateLimit: {
		        days: 60
		    },
		    showDropdowns: false,
		    showWeekNumbers: true,
		    timePicker: false,
		    timePickerIncrement: 1,
		    timePicker12Hour: true,
		    ranges: {
		        '今天': [moment(), moment()],
		        '昨天': [moment().subtract('days', 1), moment().subtract('days', 1)],
		        '7天': [moment().subtract('days', 6), moment()],
		        '30天': [moment().subtract('days', 29), moment()],
		        '本月': [moment().startOf('month'), moment().endOf('month')],
		        '上月': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')],
		    	'一年': [moment().subtract('year', 1), moment().subtract('days', 1)]
		    },
		    buttonClasses: ['btn btn-sm'],
		    applyClass: ' blue',
		    cancelClass: 'default',
		    format: 'YYYY/MM/DD',
		    separator: ' to ',
		    locale: {
		        applyLabel: '确认',
		        cancelLabel:'取消',
		        fromLabel: '从',
		        toLabel: '到',
		        customRangeLabel: '自定义',
		        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
		        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
		        firstDay: 1
		    }
		},
		function (start, end) {
		    $('#'+id + " span").html(start.format('YYYY/M/D') + ' - ' + end.format('YYYY/M/D')); 
		    backcall.call(backcall, start, end);
		}
	);
	$('#'+id + " span").html(moment().subtract('days', 29).format('YYYY/M/D') + ' - ' + moment().format('YYYY/M/D'));
	$('#'+id).show();
	backcall.call(backcall, moment().subtract('days', 29), moment());
	
};

CLOUD.iFrameHeight = function() { 
	var ifm= document.getElementById("iframepage"); 
	var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight; 
	} 
} ;

// 高级查询，默认无操作
CLOUD.search = function() {
	
} ;

CLOUD.getYesNoHtml = function(state) {
	if(state == 'Y') {
		return '<span class="label label-sm label-danger"> Y </span>';
	}
	return state;
};

CLOUD.LOADHTMLOrJs = function(back) {
	if(CLOUD.LOG.isdebug) {
		back.call(back);
	} else {
		try {
			back.call(back);
		}catch(e) {
			CLOUD.LOG.Error(e);
		}
	}
};

//初始jquery ajax ，设置客户端不缓存
$(function(){
	$.ajaxSetup({
        cache: false,
        type: "post",
        //dataType: 'json',
        //async: false,
        beforeSend: function(req, settings) { 
        	// csrf
        	var frcs = getCookie(CLOUD.Contants.CSRF_COOKIE);
        	if(frcs) {
        		req.setRequestHeader(CLOUD.Contants.CSRF_HEADER, frcs);
        	}
        },error: function(req, textStatus) {
        	CLOUD.progressClose();
        	if(textStatus!='abort' && textStatus!='error') 
        		CLOUD.messager.alertError(CLOUD.TEXT.PUBLIC.SYSERROR_2);
        }
	});
	
	$.parseJSON = function(data) {
		if(! (typeof(data) == "object") ) {
			data = eval("d=" + data);
		}
		return data;
	};
	
	//功能按钮滚动不隐藏 -- start
	var btntop = 0;
	function btnAnimate(btncls) {
		$(btncls).each(function(){
			if(!$(this).is('.notAnimate')) {
				if($(this).css('position') != 'fixed') {
					btntop = $(this).offset().top;
				}
				var toph = 46;
				if(Metronic.getViewPort().width < 992) { // 手机设置，没有顶
					toph = 0;
				}
				if($(window).scrollTop() > btntop - toph - 20) {
					if($(this).css('position') != 'fixed') {
						$(this).css('position', 'fixed');
						$(this).css('top', toph+'px');
					}
				} else {
					if($(this).css('position') != 'static')
						$(this).css('position', 'static');
				}
			}
		});
	}

	var btncls = '.table-toolbar';
	$(window).bind('scroll touchstart', function () {
		btnAnimate(btncls);
	});
	// 功能按钮滚动不隐藏 -- end
});