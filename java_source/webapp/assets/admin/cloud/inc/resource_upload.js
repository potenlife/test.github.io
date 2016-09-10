CLOUD.FILETYPE_FILE = 2;
CLOUD.FILETYPE_IMG = 1;
CLOUD.FILETYPE_VIDEO = 3;
CLOUD.FILEBACKCALL = null;

CLOUD.UPLOAD = {
		url : CLOUD.PATH + '/resource_tools_upload.json', // 文件名随机修改，主要是避免中文名称
		url2: CLOUD.PATH + '/resource_tools_upload2.json', // 上传文件名不变，最好不要有中文
		createurl : CLOUD.PATH + '/resource_tools_createDir.json',
		uploadID : '',
		GenName : true,
		FILEBACKCALL : undefined,
		ismodal:true,
		/**
		 * uploadID	上传成功后文件返回INPUT TEXT ID
		 * uploadType 上传文件类型
		 * id 上传文件保存目录，以/开始和结尾
		 * watermarkImg 水印图片
		 * modal 是否弹出浮层确认上传
		 */
		open : function(uploadID, uploadType, id, backcall, genname, watermarkImg, modal) {
			var upform = document.getElementById("publicUploadform");
			upform.id.value = id;
			upform.uploadID.value = uploadID;
			this.uploadID = uploadID;
			upform.uploadType.value = uploadType;
			if(modal==false) {
				$("#publicuploadfile").click();
				this.ismodal = false;
			} else {
				$("#publicUploadModal").modal('show');
				this.ismodal = true;
			}
			this.FILEBACKCALL = backcall;
			this.GenName = true;
			if(genname == false) {
				this.GenName = genname;
			}
			// 水印，JPG/PNG图片添加
			if(watermarkImg) {
				var upform = document.getElementById("publicUploadform");
				upform.watermarkImg.value = "/assets/admin/layout/img/logo.png";
			}
		},
		openImg : function(uploadID, watermarkImg) {
			this.open(uploadID, CLOUD.FILETYPE_IMG, "/uploadfiles/images/", null, true, watermarkImg);
		},
		openFile : function(uploadID) {
			this.open(uploadID, CLOUD.FILETYPE_FILE, "/uploadfiles/files/");
		},
		openVideo : function(uploadID) {
			this.open(uploadID, CLOUD.FILETYPE_VIDEO, "/uploadfiles/videos/");
		},
		openDir : function(uploadID, id) {
			var upform = document.getElementById("publicUploadCreateform");
			if(id)
				upform.id.value = id;
			this.uploadID = uploadID;
			$("#publicUploadCreateModal").modal('show');
		},
		openView: function(filepath, type) {
			if(filepath) {
				if(type == CLOUD.FILETYPE_IMG) {
					$("#uploadfileviewid").html('<img src="'+CLOUD.PATH + filepath+'" style="max-height:300px"/><a href="'+CLOUD.PATH + filepath + '" target="_blank"> 查看原图 </a>');
				} else {
					$("#uploadfileviewid").html('<a href="'+CLOUD.PATH + filepath + '" target="_blank">'+ filepath + '</a>');
				}
				$("#publicUploadViewModal").modal('show');
			} else {
				CLOUD.messager.alert("文件不能为空");
			}
		}
};

$(function(){
	$("#publicuploadfile").live('change', function() {
		if(CLOUD.UPLOAD.ismodal == false) {
			if(this.value != "" ) {
				pervuploadname = this.value;
				$("#publicUploadform").submit();
			}
		}
	});
	// 上传文件
	CLOUD.Validate('publicUploadform', function(form){
		Pace.track(function() {
			CLOUD.progress();
			var _url = CLOUD.UPLOAD.GenName ? CLOUD.UPLOAD.url : CLOUD.UPLOAD.url2;
			var upform = document.getElementById("publicUploadform");
			_url += "?id=" + upform.id.value + "&uploadType=" + upform.uploadType.value + "&watermarkImg="+upform.watermarkImg.value+"&" + CLOUD.Contants.CSRF_PARA + "=" + getCookie(CLOUD.Contants.CSRF_COOKIE);
			if($("#publicuploadfile").val() == "") {
				CLOUD.progressClose();
				return false;
			}
			$.ajaxFileUpload({  
				url: _url,  
				secureuri: false,  
				fileElementId: 'publicuploadfile',  
				dataType: 'json',  
			   beforeSend: function() { 
					//$("#loading").show();  
			   },  
				complete: function() {
				   //$("#loading").hide();  
				},  
				success: function(data, status) { 
					CLOUD.progressClose();
					//data = $.parseJSON(data);
					if(data.success==true) {
						$("#publicUploadModal").modal('hide');
						CLOUD.messager.alert("上传成功");
						$("#" + CLOUD.UPLOAD.uploadID).val(data.filename);
						if(CLOUD.UPLOAD.FILEBACKCALL) {
							CLOUD.UPLOAD.FILEBACKCALL.call(this, data.filename, data.sourceFilename);
						}
						CLOUD.UPLOAD.FILEBACKCALL = undefined;
					}else {
						if(data.errorCode==10003) {
							CLOUD.messager.alert("文件已存在");
						}else{
							CLOUD.successHandle(data);
						}
					}
				},  
				error: function(data, status, e) {  
						CLOUD.messager.alert(e);  
						CLOUD.progressClose();
					}  
				});
		});
    	return false;
    }, {
    	uploadfile : {
    		required : true
    	}
    });
	// 创建文件夹
    CLOUD.Validate('publicUploadCreateform', function(form){
    	var _url = CLOUD.UPLOAD.createurl +"?" + CLOUD.Contants.CSRF_PARA + "=" + getCookie(CLOUD.Contants.CSRF_COOKIE);
    	$.post(_url, $(form).serialize(), function(data){
    		data = CLOUD.successHandle(data);
			if(data.success==true) {
				$("#publicUploadCreateModal").modal('hide');
				var upform = document.getElementById("publicUploadCreateform");
				$("#" + CLOUD.UPLOAD.uploadID).val(upform.id.value + upform.fileName.value);
				upform.reset();
			}
    	});
    	return false;
    }, {
    	fileName : {
    		required : true
    	}
    });
});