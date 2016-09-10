<%@ page contentType="text/html;charset=UTF-8" %>
<div id="sysDictionaryEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  >
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">新增</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="sytsDictionaryEditform">
	<input type="hidden" name="sd_parentDictionaryId"  id="edit_sd_parentDictionaryId" value=""/>
	<input type="hidden" name="sd_state"  value="N"/>
	<input type="hidden" name="sd_dictionaryNo"  value=""/>
	<input type="hidden" name="sd_isLeaf"  value="Y"/>
	<input type="hidden" name="sd_dictionaryCode"  value=""/>
	<input type="hidden" id="editInputId" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sd_dictionaryName"  >
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sd_description" ></textarea>
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue cloudsaveclose" >保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<script>
	$(function(){
		CLOUD.FormValidate("sys_dictionary", "sytsDictionaryEditform",  function (form) {
				var _url = CLOUD.PATH + '/dictionary_add.json';
				var pid = $("#edit_sd_parentDictionaryId").val();
				CLOUD.trackPost(CLOUD.getContentUrl(_url, pid), $(form).serialize(), function(data){
					$("#sysDictionaryEditModal").modal('hide'); 
					var opts = document.getElementById($("#editInputId").val()).options;
					var opt = new Option(data.data.sd_dictionaryName, data.data.sd_dictionaryId);
					opt.selected = true;
					opts.add(opt);
				});
				return false;
	    });
	});
</script>