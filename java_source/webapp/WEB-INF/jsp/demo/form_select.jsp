<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoFormSelect"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoFormSelect"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 下拉框选择
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
							<label class="col-md-3 control-label">组织机构</label>
							<div class="col-md-6">
									<!-- bs-select 选择样式 -->
									<select class="form-control bs-select" >
											<option value="">请选择</option> 
											<option value="1">研发</option>
											<option value="2">项目</option>
											<option value="3">移动</option>
									</select>
							</div>
						</div> 
						<div class="form-group">
							<label class="col-md-3 control-label">禁用</label>
							<div class="col-md-6">
									<select class="form-control bs-select"  disabled >
											<option value="">请选择</option> 
											<option value="1" selected>研发</option>
											<option value="2">项目</option>
											<option value="3">移动</option>
									</select>
							</div>
						</div> 
						<div class="form-group">
							<label class="col-md-3 control-label">分组</label>
							<div class="col-md-6">
									<select class="form-control bs-select" >
											<option value="">请选择</option> 
											<optgroup label="生产部门">
												<option value="1" >研发</option>
												<option value="3">移动</option>
												<option value="2">项目</option>
											</optgroup>
											<optgroup label="管理部门">
												<option value="4" >行政</option>
											</optgroup>
									</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label">多选</label>
							<div class="col-md-6">
									<select class="form-control bs-select"   multiple>
											<option value="1">研发</option>
											<option value="2">项目</option>
											<option value="3">移动</option>
									</select>
							</div>
						</div> 
						
						<div class="form-group">
							<label class="col-md-3 control-label">标签选择</label>
							<div class="col-md-6">
									<input type="hidden" id="tags"  class="form-control select2"/>
							</div>
						</div> 
						<div class="form-group">
							<label class="col-md-3 control-label">Bootstrap</label>
							<div class="col-md-6">
									<select class="bs-select form-control input-small" data-style="btn-primary">
										<option>Mustard</option>
										<option>Ketchup</option>
										<option>Relish</option>
									</select>
									<select class="bs-select form-control input-small" data-style="btn-success">
										<option>Mustard</option>
										<option>Ketchup</option>
										<option>Relish</option>
									</select> 
									<select class="bs-select form-control input-small" data-style="btn-info">
										<option>Mustard</option>
										<option>Ketchup</option>
										<option>Relish</option>
									</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-3">禁用选项</label> 
							<div class="col-md-6">
								<select class="bs-select form-control" multiple>
									<option>Mustard</option>
									<option disabled>Ketchup</option>
									<option>Relish</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-3">除号选项（分隔分项）</label>
							<div class="col-md-6">
								<select class="bs-select form-control input-medium">
									<option>Mustard</option>
									<option>Ketchup</option>
									<option>Relish</option>
									<option>Mayonnaise</option>
									<option data-divider="true"></option>
									<option>Barbecue Sauce</option>
									<option>Salad Dressing</option>
									<option>Tabasco</option>
									<option>Salsa</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-3">Icons</label>
							<div class="col-md-4">
								<select class="bs-select form-control" data-show-subtext="true">
									<option data-icon="fa-glass icon-success">Mustard</option>
									<option data-icon="fa-heart icon-info">Ketchup</option>
									<option data-icon="fa-film icon-default">Relish</option>
									<option data-icon="fa-home icon-warning">Mayonnaise</option>
									<option data-icon="fa-user icon-danger">Barbecue Sauce</option>
								</select>
							</div>
						</div>
						
						<div class="form-group ">
							<label class="control-label col-md-3">HTML content</label>
							<div class="col-md-4">
								<select class="bs-select form-control" data-show-subtext="true">
									<option data-content="Mustard <span class='label lable-sm label-success'>fresh </span>
									">Mustard</option>
									<option data-content="Ketchup <span class='label lable-sm label-default'>tasty </span>
									">Ketchup</option>
									<option data-content="Relish <span class='label lable-sm label-warning'>warning </span>
									">Relish</option>
									<option data-content="Mayonnaise <span class='label lable-sm label-info'>organic </span>
									">Mayonnaise</option>
									<option data-content="Barbecue sauce <span class='label lable-sm label-danger'>hot </span>
									">Barbecue Sauce</option>
								</select>
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="control-label col-md-3">多选2</label>
							<div class="col-md-9">
								<select multiple="multiple" class="multi-select" id="my_multi_select1" name="my_multi_select1[]">
									<option>Dallas Cowboys</option>
									<option>New York Giants</option>
									<option selected>Philadelphia Eagles</option>
									<option selected>Washington Redskins</option>
									<option>Chicago Bears</option>
									<option>Detroit Lions</option>
									<option>Green Bay Packers</option>
									<option>Minnesota Vikings</option>
									<option selected>Atlanta Falcons</option>
									<option>Carolina Panthers</option>
									<option>New Orleans Saints</option>
									<option>Tampa Bay Buccaneers</option>
									<option>Arizona Cardinals</option>
									<option>St. Louis Rams</option>
									<option>San Francisco 49ers</option>
									<option>Seattle Seahawks</option>
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
		$("#tags").select2({
            tags: [{id:1,text:"red"}, {id:2,text:"green"}, {id:3,text:"blue"}, {id:4, text:"yellow"},{id:5, text: "pink"}] 
        });
		$('#my_multi_select1').multiSelect();
	});
</script>