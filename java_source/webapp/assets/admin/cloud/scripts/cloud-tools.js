

CLOUD.PHOTO = CLOUD.PHOTO || {};

CLOUD.PHOTO = {
		_getCutUrl : function() {
			return CLOUD.PATH + "/tools/photo_cut.json?token=" + getToken();
		},
		_getFileUrl : function() {
			return CLOUD.PATH + "/tools/photo_getFileName.json?token=" + getToken();
		},
		did: 'photo',
		sid: '',
		nid: 'photoval',
		width: 324,
		height: 275,
		interval : null,
		/**did 放置swf DIV id, sid 显示图片ID nid 存在图片input id */
		cut : function(did, sid, nid, width, height) {
			// 初始值
			this.did = did || this.did;
			this.sid = sid || this.sid;
			this.nid = nid || this.nid;
			this.width = width || this.width;
			this.height = height || this.height;
			// 初始SWF
			var fo = new FlashObject(CLOUD.PATH + "/swf/photo.swf", "photoFlash", this.width, this.height , "10", "#ffffff");
			fo.addParam("quality", "high");
			fo.addParam("allowFullScreen", "false");
			fo.addParam("allowScriptAccess", "sameDomain");
			fo.addParam("flashvars","servicesUrl=" + this._getCutUrl());
			fo.addParam("align", "middle");
			fo.write(this.did);
			this.startInterval();
		},
		getFileName : function() {
			var _this = this;
			$.get(this._getFileUrl(),"",function(data) {
				data = $.parseJSON(data);
				if(data.success==true) {
					if(_this.sid&&document.getElementById(_this.sid)) {
						document.getElementById(_this.sid).src = CLOUD.PATH + data.img;
					}
					document.getElementById(_this.nid).value = data.img;
				}
			});
		},
		startInterval: function() {
			this.interval = setInterval("CLOUD.PHOTO.getFileName()", 1000);
		},
		clearInterval: function() {
			clearInterval(this.interval);
		}
};