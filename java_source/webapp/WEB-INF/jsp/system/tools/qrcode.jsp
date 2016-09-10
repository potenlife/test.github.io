<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-12">
		<div class="col-md-6">
				<div>
					<textarea rows="14" class="form-control"  name="sm_description" id="sm_description"  placeholder="请输入文字内容，支持普通文本和网址！"></textarea>  
				</div>
				<div style="padding-top:10px;padding-bottom:10px;text-align:center">
					<button type="button"  class="btn blue"  id="genbtn">生成二维码</button> 
					<button type="button"  class="btn blue"  id="click-down" style="display:none;">下载</button> 
				</div>
		</div>
	
		<div class="col-md-6"> 
				<div style="padding-left:100px;width:100%"> 
					<div style="text-align:center;width:290px;height:290px;vertical-align:middle;border:1px solid #bbb"> 
						<img src="assets/admin/cloud/img/defqr.png" alt="二维码生成器"  id="qrimage"/> 
					</div>
				</div>
				<div class="tabbable-line">
					<ul class="nav nav-tabs ">
						<li class="active">
							<a href="#qrcode_tab_1" data-toggle="tab">
							基本设置 </a>
						</li>
						<li class="">
							<a href="#qrcode_tab_2" data-toggle="tab">
							颜色 </a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="qrcode_tab_1">
						<div class="portlet-body form">  
						<form role="form" class="form-horizontal form-bordered"  id="form1">
								<div class="form-body">
									<div class="form-group">
										<label class="control-label col-md-2" style="width:17%">容错</label>
										<div class="col-md-9"> 
											<div class="radio-list">
											<label class="radio-inline">
												<input type="radio" name="level"  value="L"  > 7% </label>
												<label class="radio-inline">
												<input type="radio" name="level"  value="M" > 15%</label>
												<label class="radio-inline">
												<input type="radio" name="level"  value="Q" > 25%</label>
												<label class="radio-inline">
												<input type="radio" name="level"  value="H"  checked> 30%</label>  
											</div>
										</div> 
									</div> 
									<div class="form-group">
										<label class=" control-label col-md-2" style="width:17%">图案大小</label>
										<div class="col-md-9">   
											<input id="qrcode_size" type="text" name="qrcode_size" value="50;800"/>
										</div> 
									</div>
								</div>
								</form> 
							</div>
						</div>
						<div class="tab-pane" id="qrcode_tab_2">
						<div class="tab-pane active" id="qrcode_tab_1">
						<div class="portlet-body form">  
						<form role="form" class="form-horizontal form-bordered">
								<div class="form-body">
								<div class="form-group">
										<label class=" control-label col-md-2" style="width:17%">前景</label>
										<div class="col-md-9">   
											<input id="fgcolor" name="mycolor" type="text"  value="#000000" class="colorpicker-default form-control" />
										</div> 
								</div>
								
								<div class="form-group">
										<label class=" control-label col-md-2" style="width:17%">背景</label>
										<div class="col-md-9">   
											<input id="bggcolor"  class="colorpicker-default form-control" name="mycolor" type="text"  value="#ffffff"/>
										</div> 
								</div>
								
								<div class="form-group">
										<label class=" control-label col-md-2" style="width:17%">透明背景</label>
										<div class="col-md-9">   
											<input id="tmbj"  type="checkbox"  />
										</div> 
								</div>
								
								<div class="form-group">
										<label class=" control-label col-md-2" style="width:17%"></label>
										<div class="col-md-9">   
											提示：前景色要比背景色深！ 
										</div> 
								</div>
							</div>
							</form>
							</div>
							</div>
							<div style="padding-top:10px;padding-bottom:10px;text-align:center">
								<button type="button"  class="btn blue"  id="resetbtn">恢复默认</button> 
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
<div style="padding-bottom:100px;"></div>  
<script>
	$(function(){
		$("#qrcode_size").ionRangeSlider({
            type: "single",
            step: 2,
            postfix: " px",
            from: 280,
            hideText: true
        });
		
		 $('.colorpicker-default').colorpicker({
	            format: 'hex'
	     });
		 
		 var size = 280;
		 var qr_filepath = '';
		 
		 $("#genbtn").bind('click', function(){
			 var text = $("#sm_description").val();
			 if(text!='') {
				 var len = $.trim(text).length;
				if(len>150){
					CLOUD.messager.alert('内容过多二维码不易扫描'); 
					return false;
				}
				 var bgcolor = $("#bggcolor").val().substring(1) ;
				 if($("#tmbj").is(':checked')) {
					 bgcolor = 'transparent';
				 }
				 var param = 'text=' + text + '&forecolor=' + $("#fgcolor").val().substring(1) + '&bgcolor=' + bgcolor + '&level=' + document.getElementById("form1").level.value; //$("input[name='level'][checked]").val(); 
				 param += '&size=' + $("#qrcode_size").val();
				 CLOUD.trackPost("tools/qrcode_generate.json",param,function(data) {
					 	qr_filepath = data.imgpath;
						setQRsize();
						$("#click-down").show();
				 });
			 }
			 
		 });
		 
		 // 下载
		 $("#click-down").click(function(){
				window.open('tools/qrcode_download.htm?file=' + qr_filepath,'_blank'); 
		 });
		 
		 $("#resetbtn").bind('click', function(){
			 $("#fgcolor").val("#000000");
			 $('#fgcolor').colorpicker('setValue', '#000000');  
			 $("#bggcolor").val("#ffffff");
			 $('#bggcolor').colorpicker('setValue', '#ffffff');   
			 $("#tmbj").attr('checked', false); 
			 $("#tmbj").closest('span').removeClass("checked");  
		 });
		 
		//二维码显示大小
		var qrimg = null;
		 var setQRsize = function(){
			if(!qrimg){
				qrimg = $("#qrimage").load(function(){
					if(size<280) qrimg.css({width:'auto',height:'auto'});
					else qrimg.css({width:280+'px',height:280+'px'});
					qrimg.show();
				});
			}
			qrimg.attr("src",CLOUD.PATH  + qr_filepath+"?"+new Date());    
		};
	});
</script>