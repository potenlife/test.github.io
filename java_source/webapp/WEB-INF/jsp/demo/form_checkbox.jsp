<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormCheckbox"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormCheckbox"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 复选框、单选框
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
								<label class="control-label col-md-3">默认</label>
								<div class="col-md-9">
									<input type="checkbox" checked class="make-switch" data-size="small">
									<input type="checkbox" checked class="make-switch" data-size="normal">
									<input type="checkbox" checked class="make-switch" data-size="large">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">颜色</label>
								<div class="col-md-9">
									<input type="checkbox" class="make-switch" checked data-on-color="primary" data-off-color="info">
									<input type="checkbox" class="make-switch" checked data-on-color="info" data-off-color="success">
									<input type="checkbox" class="make-switch" checked data-on-color="success" data-off-color="warning">
									<input type="checkbox" class="make-switch" checked data-on-color="warning" data-off-color="danger">
									<input type="checkbox" class="make-switch" checked data-on-color="danger" data-off-color="default">
									<input type="checkbox" class="make-switch" checked data-on-color="default" data-off-color="primary">
								</div>  
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-3">禁用/只读</label> 
								<div class="col-md-9">
									<input type="checkbox" checked disabled class="make-switch"/>
									<input type="checkbox" checked readonly class="make-switch"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-3">文本</label>
								<div class="col-md-9">
									<input type="checkbox" class="make-switch" data-on-text="Yes" data-off-text="No">
									<input type="checkbox" class="make-switch" data-on-text="1" data-off-text="0">
								</div>
							</div> 
							
							<div class="form-group">
								<label class="control-label col-md-3">HTML 文本</label>
								<div class="col-md-9">
									<input type="checkbox" class="make-switch" checked data-on-text="<i class='fa fa-check'></i>" data-off-text="<i class='fa fa-times'></i>"> <input type="checkbox" class="make-switch" checked data-on-text="<i class='fa fa-user'></i>" data-off-text="<i class='fa fa-trash-o'></i>">
								</div>
							</div>
							
							<div class="form-group">
									<label class="control-label col-md-3">Radio Group</label>
									<div class="col-md-9">
										<div class="margin-bottom-10">
											<label for="option1">Option 1</label>
											<input id="option1" type="radio" name="radio1" value="option1" class="make-switch switch-radio1">
										</div>
										<div class="margin-bottom-10">
											<label for="option2">Option 2</label>
											<input id="option2" type="radio" name="radio1" value="option2" class="make-switch switch-radio1">
										</div>
										<div class="margin-bottom-10">
											<label for="option3">Option 3</label>
											<input id="option3" type="radio" name="radio1" value="option3" class="make-switch switch-radio1">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3">Checkboxes</label>
									<div class="col-md-9">
									<div class="checkbox-list">
										<label>
										<input type="checkbox"> Checkbox 1 </label>
										<label>
										<input type="checkbox"> Checkbox 2 </label>
										<label>
										<input type="checkbox" disabled> Disabled </label>
									</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Inline Checkboxes</label>
									<div class="col-md-9">
									<div class="checkbox-list">
										<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox1" value="option1"> Checkbox 1 </label>
										<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox2" value="option2"> Checkbox 2 </label>
										<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox3" value="option3" disabled> Disabled </label>
									</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Radio</label>
									<div class="col-md-9">
									<div class="radio-list">
										<label>
										<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> Option 1</label>
										<label>
										<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"> Option 2 </label>
										<label>
										<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled> Disabled </label>
									</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Inline Radio</label>
									<div class="col-md-9">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="optionsRadios" id="optionsRadios4" value="option1" checked> Option 1 </label>
										<label class="radio-inline">
										<input type="radio" name="optionsRadios" id="optionsRadios5" value="option2"> Option 2 </label>
										<label class="radio-inline">
										<input type="radio" name="optionsRadios" id="optionsRadios6" value="option3" disabled> Disabled </label>
									</div> 
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