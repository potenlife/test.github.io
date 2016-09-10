<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoPhoto"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoPhoto"/> 
</div>

<div class="row">
	<div class="col-md-12">
		<div id="photowin" class="trigwin" style="overflow: hidden;">
			<br />
			<div style="text-align: center;">
				<div id="photocut"></div>
				截取图片路径：<input id="photoval" name="photoval" readonly="readonly" />
				<br />
			</div>
		</div>

	</div>
</div>

<script>
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
			var fo = new FlashObject(CLOUD.PATH + "/assets/admin/cloud/swf/photo.swf", "photoFlash", this.width, this.height , "10", "#ffffff");
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
					if(document.getElementById(_this.nid))
					 	document.getElementById(_this.nid).value = data.img;
					else
						this.clearInterval();
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

CLOUD.PHOTO.isinitphoto = false;
CLOUD.PHOTO.photoid = '';
CLOUD.PHOTO.photoimgid = '';
CLOUD.PHOTO.openphotowin = function(id, imgid) {
	CLOUD.PHOTO.photoid = id;
	CLOUD.PHOTO.photoimgid = imgid;
	if(CLOUD.PHOTO.isinitphoto==false) {
		CLOUD.PHOTO.cut('photocut', '', 'photoval');
		CLOUD.PHOTO.isinitphoto = true;
	} else {
		CLOUD.PHOTO.startInterval();
	}
};

$(function(){
	CLOUD.PHOTO.openphotowin();
	$("#PhtotbbBtn").bind('click',function(){
		var pname = $("#photoval").val();
		
		if(pname!='') {
			$("#"+CLOUD.PHOTO.photoid).val(pname);
			if(CLOUD.PHOTO.photoimgid && CLOUD.PHOTO.photoimgid!='') {
				if(document.getElementById(CLOUD.PHOTO.photoimgid)){
					document.getElementById(CLOUD.PHOTO.photoimgid).src = CLOUD.PATH + pname;
				}
			}
			$("#photoval").val('');
		} else {
			CLOUD.messager.alert('请照像并保存图片。');
		}
	});
});
</script>