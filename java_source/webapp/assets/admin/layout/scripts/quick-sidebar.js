/**
Core script to handle the entire theme and core functions
**/
var QuickSidebar = function () {
	
	var isusermsg = false;
	var ismsgback = true;
	var datatype = 'user';
	var isrun = false;
    var initrun = false;
	CLOUD.messager.uid = '';
	var mi_time = '';
    // Handles quick sidebar toggler
    var handleQuickSidebarToggler = function () {
        // quick sidebar toggler
        $('.top-menu .dropdown-quick-sidebar-toggler a, .page-quick-sidebar-toggler').click(function (e) {
        	if(isusermsg == true){ 
        		isusermsg = false;
        	}else{
        		isusermsg = true;
        	} 
            $('body').toggleClass('page-quick-sidebar-open'); 
        });
        
    }
    
    // Handles quick sidebar chats
    var handleQuickSidebarChat = function () {
        var wrapper = $('.page-quick-sidebar-wrapper');
        var wrapperChat = wrapper.find('.page-quick-sidebar-chat');

        var initChatSlimScroll = function () {
            var chatUsers = wrapper.find('.page-quick-sidebar-chat-users');
            var chatUsersHeight;

            chatUsersHeight = wrapper.height() - wrapper.find('.nav-justified > .nav-tabs').outerHeight();

            // chat user list 
            Metronic.destroySlimScroll(chatUsers);
            chatUsers.attr("data-height", chatUsersHeight);
            Metronic.initSlimScroll(chatUsers);

            var chatMessages = wrapperChat.find('.page-quick-sidebar-chat-user-messages');
            var chatMessagesHeight = chatUsersHeight - wrapperChat.find('.page-quick-sidebar-chat-user-form').outerHeight() - wrapperChat.find('.page-quick-sidebar-nav').outerHeight();

            // user chat messages 
            Metronic.destroySlimScroll(chatMessages);
            chatMessages.attr("data-height", chatMessagesHeight);
            Metronic.initSlimScroll(chatMessages);
        }

        initChatSlimScroll();
        Metronic.addResizeHandler(initChatSlimScroll); // reinitialize on window resize
        
        
        function preparePost(dir, time, name, avatar, message) {
            var tpl = '';
            tpl += '<div class="post '+ dir +'">';
            tpl += '<img class="avatar" alt="" src="'+avatar+'"/>';
            tpl += '<div class="message">';
            tpl += '<span class="arrow"></span>';
            tpl += '<a href="javascript:;" class="name">'+name+'</a>&nbsp;';
            tpl += '<span class="datetime">' + time + '</span>'; 
            tpl += '<span class="body">';
            tpl += message;
            tpl += '</span>';
            tpl += '</div>';
            tpl += '</div>';

            return tpl;
        }
        var chatContainer = wrapperChat.find(".page-quick-sidebar-chat-user-messages");
        wrapper.find('.page-quick-sidebar-chat-users .media-list > .media').click(function () {
        	ismsgback = false;
        	CLOUD.messager.uid = $(this).attr("data-id");
        	datatype = $(this).attr("data-type");
        	mi_time = '';
        	
    		chatContainer.html(''); 
        	/*$.getJSON('message/myinfo_accept_findUserList.json','su_userId=' + CLOUD.messager.uid ,function(data){
        		
        		if(data.length>0) {
        			
        			for(var i=0;i<data.length;i++) {
        				var message = preparePost(data[i].su_userId!=CLOUD.messager.uid?'out':'in', data[i].mi_sendTime.substr(5,11), data[i].su_userName, 'avatar3', data[i].mi_content);
        	            message = $(message);
        	            chatContainer.append(message);
        	            mi_time = data[i].mi_createTime;
        			}
        			initChatSlimScroll();
        		} */
    		
    		
    		// 是否运行
    		if(initrun==false) {
        			initrun = true;
        			getUserMsg(true);
        		} else {
        			getUserMsg();
        		}
	            
        		wrapperChat.addClass("page-quick-sidebar-content-item-shown");
        //	});
        });
        
        function isUserMsg() {
			setTimeout(function(){
				if(isusermsg && ismsgback==false) { 
            		getUserMsg(true);
            	}else{
            		isUserMsg();
            	}
			}, 5000); 
		}
        var getLastPostPos = function() {
            var height = 0;
            chatContainer.find(".post").each(function() {
                height = height + $(this).outerHeight();
            });

            return height;
        }
        
        function getUserMsg(xh) {
			if(isrun==false) {
				isrun = true;
				var url = 'message/myinfo_accept_findUserList.json';
				var pp = 'su_userId=' + CLOUD.messager.uid+'&mi_createTime='+mi_time;
				if(datatype!='user') {
					url = 'message/mygroupinfo_findList.json';
					pp = 'mgi_groupId=' + CLOUD.messager.uid+'&mgi_createTime='+mi_time;
				}
    			$.getJSON(url, pp,function(data){
            		if(data.length>0) {
        				for(var i=0;i<data.length;i++) {
        					var uavatar = CLOUD.getUserAvatar({
        						su_sex : data[i].su_sex,
        						su_userAvatar : data[i].su_userAvatar
        					});
	        				var message = ''; 
	        				if(datatype == 'user') {
	        					message = preparePost(data[i].su_userId!=CLOUD.User.su_userId?'in':'out', data[i].mi_sendTime.substr(5,11), data[i].su_userName, uavatar, data[i].mi_content);
	        				} else {
	        					var sendtime = ''
        						if(data[i].mgi_sendTime){
        							sendtime = data[i].mgi_sendTime.substr(5,11);
        						}
	        					message = preparePost(data[i].mgi_userId!=CLOUD.User.su_userId?'in':'out',sendtime , data[i].su_userName, uavatar, data[i].mgi_content);
	        				}	
	        	            message = $(message);
	        	            chatContainer.append(message);
	        	            if(datatype == 'user') {
	        	            	mi_time = data[i].mi_createTime;
	        	            } else {
	        	            	mi_time = data[i].mgi_createTime;
	        	            }
	        	            
	        			}
		
		                chatContainer.slimScroll({
		                    scrollTo: getLastPostPos()
		                });
            		}
            		isrun = false;
            	});
			}
			// 是否循环
    		if(xh) {
    			setTimeout(function(){
	                	if(isusermsg && ismsgback==false) {
	                		getUserMsg(true);
	                	}else{
	                		isUserMsg();
	                	}
		            }, 5000);
    		}
		}
        
        
        
        wrapper.find('.page-quick-sidebar-chat-user .page-quick-sidebar-back-to-list').click(function () {
        	ismsgback = true;
            wrapperChat.removeClass("page-quick-sidebar-content-item-shown");
        });

        var handleChatMessagePost = function (e) {
            e.preventDefault();
            var input = wrapperChat.find('.page-quick-sidebar-chat-user-form .form-control');
            var text = input.val();
            if (text.length == 0) {
                return;
            }

            // handle post
            var url = 'message/myinfo_add.json';
			var pp = 'mi_content=' + text+'&acceptUsers='+CLOUD.messager.uid;
			if(datatype!='user') {
				url = 'message/mygroupinfo_add.json';
				var grouptype = '0';
				if(datatype == 'group'){
					grouptype = '1';
				}
				pp = 'mgi_content=' + text + '&mgi_groupId='+CLOUD.messager.uid+'&grouptype='+grouptype;
			}
            $.post(url, pp, function(data){
            	data = $.parseJSON(data);
        		if(data.success){
        			 input.val("");
        			 getUserMsg();
        		}
            });
        }

        wrapperChat.find('.page-quick-sidebar-chat-user-form .btn').click(handleChatMessagePost);
        wrapperChat.find('.page-quick-sidebar-chat-user-form .form-control').keypress(function (e) {
            if (e.which == 13) {
                handleChatMessagePost(e);
                return false;
            }
        });
    }

    return {

        init: function () {
            //layout handlers
            handleQuickSidebarToggler(); // handles quick sidebar's toggler
            handleQuickSidebarChat(); // handles quick sidebar's chats
        }
    };

}();