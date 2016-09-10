$(function(){
	$("#username").text(CLOUD.User.su_userName);
	$("#realname").text(CLOUD.User.su_realName);
	$("#sex").text(CLOUD.User.su_sex=='F' ? '女' : CLOUD.User.su_sex=='M' ? '男' : '未知');
	$("#mobile").text(CLOUD.User.su_mobile ? CLOUD.User.su_mobile : '');
	$("#email").text(CLOUD.User.su_email ? CLOUD.User.su_email : '');
	if(CLOUD.settings.org) {
		$.getJSON('organization_find.json','id=' + CLOUD.User.su_organizationId, function(data){
			if(data.success) {
			   $("#organization_name").text(data.data.so_organizationName);
			   $("#so_organizationName").val(data.data.so_organizationName); 
			}
		});
		//$("#organization_name").text(CLOUD.User.so_organizationName ? CLOUD.User.so_organizationName : '');
	}
	$("#last_login_date").text(CLOUD.User.su_lastLoginDate ? CLOUD.User.su_lastLoginDate : '');
	$("#trigroles").text(trigroles);
	if(CLOUD.UserGroup) {
		$("#triggroups").text(CLOUD.UserGroup);
	} else {
		$("#triggroups").closest("p").hide();
	}
	if(CLOUD.settings.message) {
		//未读消息
		$("#usermsg").text($("#infocount").text()); 
	}
	
	new CLOUD.Datatable({
			table : $("#user_login_table"), 
			url : 'userinfo_loginLogList.json', 
			columns : [
			                 { "data": "slt_loginTime" }, 
			                 { "data": "slt_endTime", "className":"hidden-xs" },
			                 { "data": "slt_loginIp" },
			                 { "data": "slt_loginType" , "render":function(value){
			                	 if (value == '1'){
			     					return CLOUD.TEXT.LOGIN.type1;
			     				} else if(value == '2') {
			     					return CLOUD.TEXT.LOGIN.type2;
			     				}
			     				else {
			     					return CLOUD.TEXT.LOGIN.type0;
			     				}
    		                 }}
			],
			order: [[0,'desc']],
			paging:false 
	});
	
	if(CLOUD.settings.message) {
		$.getJSON('message/myinfo_accept_findPageList.json', '', function(data){
			if(data.data.length>0) {
				var h = '';
				for(var i=0;i<data.data.length;i++) {
					h += '<li>';
					h += '<div class="col1" style="width:auto;">';
					h += '<div class="cont">';
					h += '<div class="cont-col1">';
					h += '<div class="label label-warning">';
					h += '<i class="fa fa-'+(data.data[i].su_userId=='admin'?'bell-o':'user')+'"></i>';
					h += '</div>';
					h += '</div>';
					h += '<div class="cont-col2">';
					h += '<div class="desc">';
					h += data.data[i].mi_content;
					h += '</div>';
					h += '</div>';
					h += '</div>';
					h += '</div>';
					h += '<div class="col2" style="float:right;width:auto;">';
					h += '<div class="date">';
					h += data.data[i].su_userName + ' ' + data.data[i].mi_sendTime;
					h += '</div>';
					h += '</div>';
					h += '</li>';
				}
				$(".feeds").html(h);
			}
		});
	}
	
	CLOUD.forminit($("#userform"), CLOUD.User);
	// 账号信息修改
	CLOUD.FormValidate("sys_user", "userform",  function (form) {
			CLOUD.trackPost('updateUserInfo.json', $(form).serialize(), function(data){
				CLOUD.User = data.data;
				$(".username").text(CLOUD.getUserName(CLOUD.User));
				CLOUD.updateSuccessAlert();
			});
			return false;
	});
	
	// 取消
	$("#userreset").bind('click', function(){
		document.getElementById("userform").reset();
		CLOUD.forminit($("#userform"), CLOUD.User);
	});
	
	// 密码修改
	CLOUD.Validate("pwdform", function(form){
		CLOUD.trackPost('userinfo_updatePassword.json', $(form).serialize(), function(data){
				CLOUD.updateSuccessAlert();
				document.getElementById("pwdform").reset();
		});
		return false;
	}, {
    	su_password : {
    		required : true
    	}, 
    	su_password1 : {
    		required : true,
    	},
    	su_password2 : {
    		required : true,
    		equalTo : '#su_password1' 
    	}
    });
	
	// 头像修改
	if(CLOUD.User.su_userAvatar) {
		$("#old_user_avatar").attr('src', CLOUD.UPLOADPATH + CLOUD.User.su_userAvatar);
		$(".img-responsive").attr('src', CLOUD.UPLOADPATH + CLOUD.User.su_userAvatar);
	}
	
	$("#user_avatar_submit").bind('click', function(){
		if($("#su_userAvatar").val()=='') {
			CLOUD.messager.alert("请选择图片");
			return false;
		}
		CLOUD.progress();
		var _url = CLOUD.PATH + "/tools/resource_tools_upload.json?id=/uploadfiles/images/&uploadType="+CLOUD.FILETYPE_IMG+"&" + CLOUD.Contants.CSRF_PARA + "=" + getCookie(CLOUD.Contants.CSRF_COOKIE);
		$.ajaxFileUpload({  
			url: _url,  
			secureuri: false,  
			fileElementId: 'su_userAvatar',  
			dataType: 'json',  
		   beforeSend: function() { 
				//$("#loading").show();  
		   },  
			complete: function() {
			   //$("#loading").hide();  
			},  
			success: function(data, status) { 
				CLOUD.progressClose();
				if(data.success==true) {
					var upavatar = data.filename;
					$.post('userinfo_updateAvatar.json','su_userAvatar='+upavatar, function(data){
						CLOUD.User.su_userAvatar = upavatar;
						$("#useravatar").attr('src', CLOUD.getUserAvatar(CLOUD.User));
						$("#old_user_avatar").attr('src', CLOUD.UPLOADPATH + upavatar);
						$(".fileinput-exists").click();
						CLOUD.messager.alert("保存成功");
					});
				}else {
					CLOUD.successHandle(data);
				}
			},  
			error: function(data, status, e) {  
					alert(e);  
					CLOUD.progressClose();
				}  
		});
	});
	
	var defopts = document.getElementById("sud_pagesize").options;
	$.each(CLOUD.PAGELIST[0], function(i, text){
		defopts.add(new Option(CLOUD.PAGELIST[1][i], text)); 
	});
	//  个性化初始
	if(CLOUD.UserDef) {
		CLOUD.forminit($("#userdefform"), CLOUD.UserDef);
		$(".defstyle li").each(function(){
			if($(this).attr('data-style') == CLOUD.UserDef.sud_style) {
				$(this).css('border', 'solid 2px #d64635');
			}
		});
	}
	$(".defstyle li").bind('click', function(){
		$(".defstyle li").css('border', 'solid 1px #707070');
		$(this).css('border', 'solid 2px #d64635');
		$("#sud_style").val($(this).attr('data-style'));
	});
	$("#userdefreset").bind('click', function(){
		if(CLOUD.UserDef) {
			CLOUD.forminit($("#userdefform"), CLOUD.UserDef);
		}else{
			document.getElementById("userdefform").reset();
		}
	});
	CLOUD.Validate("userdefform",  function (form) {
		var url = 'user_def_addUser.json';
		if($("#sud_defId").val()!='') {
			url = 'user_def_updateUser.json';
		}
		CLOUD.trackPost(url, $(form).serialize(), function(data){
			CLOUD.UserDef = data.data;
			CLOUD.initUserDef(data.data);
			$("#sud_defId").val(data.data.sud_defId);
			CLOUD.updateSuccessAlert();
		});
		return false;
	}, {
		sud_pagesize : { 
    		required : true
    	}
	});
});