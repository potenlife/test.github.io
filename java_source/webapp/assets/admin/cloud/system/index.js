/**
 * 首页的消息提示数量的修改
 */
CLOUD.index = {
		findMyinfoAcceptList: function() {
			
			   function getMsg() {
				   // 消息
				   $.getJSON("message/myinfo_accept_findList.json", '', function(data){ 
					  var userinfocount = 0;
					  var sysinfocount = 0;
					  if(data.length>0) {
						  var h = '';
						  var sh = '';
						  for(var i=0;i<data.length;i++) {
							 if(data[i].su_userName!='admin') { // 非系统消息
								 h = h + '<li><a href="javascript:;" onclick="gotohrefurl(\'message/myinfo_accept_init.c\');">';
								 h = h + '<span class="photo"><img width="45px" src="'+CLOUD.getUserAvatar(data[i])+'" alt=""/></span>'; 
								 h = h + '<span class="subject">	<span class="from">	'+ data[i].su_userName +' </span>';
								 h = h + '<span class="time">	'+ data[i].mi_sendTime.substr(5,11) +' </span></span>';  
								 var c = data[i].mi_content;
								 if(c.length>14) {
									c = c.substr(0, 14) + '...';
								 }
								 h = h + '<span class="message">'+ c +' </span>'; 
								 h = h + '</a></li>'; 
								 userinfocount++;
							  } else { //系统消息
								  sh = sh + '<li>	<a href="javascript:;" onclick="gotohrefurl(\'message/myinfo_accept_init.c\');"> ';
								  sh = sh + '<span class="time">' +data[i].mi_sendTime.substr(5,11) + ' </span>';
								  sh = sh + '<span class="details"><span class="label label-sm label-icon label-warning">	<i class="fa fa-bell-o"></i>	</span>';
								  var c = data[i].mi_content;
									 if(c.length>20) {
										c = c.substr(0, 20) + '...';
									 }
								  sh = sh + c;
								  sh = sh + '</span>';
								  sh = sh + '	</a></li>';
								  sysinfocount++;
							  }
						  }
						  
						  $(".userinfocount").text(userinfocount);
						  $(".sysinfocount").text(sysinfocount);
						  $("#userinfocountHTML").html(h); 
						  $("#sysinfocountHTML").html(sh); 
						  $("#infocount").text(data.length);
						  $("#infocount").show();
					  } else {
						  $("#infocount").hide();
					  }  
					  
					  if(sysinfocount == 0 ){
						  $("#header_notification_bar").hide();
					  } else {
						  $("#header_notification_bar").show();
					  }
					  if(userinfocount == 0) {
						  $("#header_inbox_bar").hide();
					  }else { 
						  $("#header_inbox_bar").show();
					  } 
				   });
				   //暂定50秒收一次
				   setTimeout(getMsg, 50000);
			   }
			   
			   getMsg();
			   
			  
		}
};

$(function(){
	$(document).keydown(function(e){
		 if(e.ctrlKey && e.which == 79) { // ctrl+o 退出
			 e.preventDefault();
			 logout();
		 } else if(e.ctrlKey && e.which == 76) { // ctrl+l 退出
			 e.preventDefault();
			 window.open('lock.htm', '_self');
		 }
	});
});