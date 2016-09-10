<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoDict"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoDict"/>  
</div>

<div class="row">
	<div class="col-md-6 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 根据字典标识获取标识子字典列表
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form role="form">
					<div class="form-body">
						<div class="form-group">
							<label>内容类型</label>
							<select class="form-control bs-select" id="d1">
								<option value="">请选择</option>
								
							</select>
						</div>
						
						<div class="form-group">
							<label>省份</label>
							<select class="form-control bs-select" id="d2">
								<option value="">请选择</option>
								
							</select>
						</div>
						<div class="form-group">
							<label>城市</label>
							<select class="form-control bs-select" id="d3">
								<option value="">请选择</option>
								
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-6 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 根据字典ID获取子字典列表
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form role="form">
					<div class="form-body">
						<div class="form-group">
							<label>内容类型</label>
							<select class="form-control bs-select" id="d4">
								<option value="">请选择</option>
								
							</select>
						</div>
						
						<div class="form-group">
							<label>省份</label>
							<select class="form-control bs-select" id="d5">
								<option value="">请选择</option>
								
							</select>
						</div>
						<div class="form-group">
							<label>城市</label>
							<select class="form-control bs-select" id="d6">
								<option value="">请选择</option>
								
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-md-6 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 根据字典标识获取子字典列表，值为字典代码
				</div>
				<div class="tools">
					<a href="" class="collapse">
					</a>
				</div>
			</div>
			<div class="portlet-body form">
				<form role="form">
					<div class="form-body">
						<div class="form-group">
							<label>内容类型</label>
							<select class="form-control bs-select" id="d7">
								<option value="">请选择</option>
								
							</select>
						</div>
						
						
						<div class="form-group">
							<label>内容类型（多选）</label>
							<input type="hidden" id="tags" class="form-control select2"/>
						</div>
						
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
<!--
	$(function(){
		// 标识获取
		CLOUD.dict.setSelectByNO('d1','cms_content_type'); 
		CLOUD.dict.setSelectByNO('d2','province', 'd3'); 
		// ID获取
		CLOUD.dict.setSelectByParent('d4','5eb5a5f7-aa89-11e3-81d6-5454a74a6b19'); 
		CLOUD.dict.setSelectByParent('d5','0e1dda06-c877-11e2-97e4-0021cc62962c', 'd6'); 
		
		CLOUD.dict.setSelectByNOAndCode('d7','validator');
		
		$("#tags").select2({
	        minimumInputLength: 0,   
	        multiple : true, 
	        placeholder : '请选择',
	        ajax: {  
	            url: "dictionary_findByNoList.json",
	            dataType: 'json',
	            data: function (term, page) {
	                return {
	                	ct_tagName : term,
	                	id: 'validator',
	                	rows:10 
	                };
	            },
	            results: function (data, page) { // parse the results into the format expected by Select2.
	            	var datas = [];
	            	for(var i=0;i<data.length;i++) {
	            		datas.push({id:data[i].sd_dictionaryId,text:data[i].sd_dictionaryName});
	            	}
	                return {
	                    results: datas 
	                };
	            }
	        }
	    }); 
	});
//-->
</script>
