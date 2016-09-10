<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormMoreSelect"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormMoreSelect"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 下拉框选择（N级联）
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form action="#" class="form-horizontal" id="demoform" name="demoform">
						<div class="form-body" >
							<div class="form-group">
								<label class="control-label col-md-3">省份</label>
								<div class="col-md-4">
									<select class="form-control bs-select" id="d1">
										<option value="">请选择</option>
										<option value="1">北京</option>
										<option value="2">上海</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">城市</label>
								<div class="col-md-4">
								<select class="form-control bs-select" id="d2">
									<option value="">请选择</option>
									
								</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">区</label>
								<div class="col-md-4">
								<select class="form-control bs-select" id="d3">
									<option value="">请选择</option>
									
								</select>
								</div>
							</div>
					</div>
			</form>
		</div>
	</div>
</div>	
<script type="text/javascript">
	$(function(){
		var d2 = [];
		d2[1] = ['北京'];
		d2[2] = ['上海'];
		
		var d3 = [];
		d3['北京'] = ['东城','西城'];
		d3['上海'] = ['浦东','虹桥'];
		
		$("#d1").on('change', function(){
			var val = $(this).val();
			var opts = document.getElementById("d2").options;
			document.getElementById("d3").options.length = 1;
			opts.length = 1;
			for(var i=0;i<d2[val].length;i++) {
				opts.add(new Option(d2[val][i],d2[val][i]));
			}
			$('#d2').selectpicker('refresh'); 
			$('#d3').selectpicker('refresh'); 
		});
		
		$("#d2").on('change', function(){
			var val = $(this).val();
			var opts = document.getElementById("d3").options;
			opts.length = 1;
			for(var i=0;i<d3[val].length;i++) {
				opts.add(new Option(d3[val][i],d3[val][i]));
			}
			$('#d3').selectpicker('refresh'); 
		});
	});
</script>