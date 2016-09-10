<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row" id="tree_main_div">
	<div class="col-md-3" style="width:initial;min-width:25%;" id="tree_left_div">
		<div class="portlet blue-hoki box" > 
			<div class="portlet-title">
				<div class="caption">
					<i class="fa icon-folder"></i>字典
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="dictionary_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="dictionary_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-9" id="tree_right_div">
			<div class="portlet box blue-hoki" >
				<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-list"></i>字典列表
							</div>
							<div class="tools">
								<a href="javascript:;" class="reload"  id="dictionary_list_reload">
								</a>
							</div> 
				</div>
				<div class="portlet-body "> 
				<div class="table-toolbar" >
					<div class="row">
						<div class="col-md-12">
							<div class="btn-group">
								<button id="addSysDictionary" class="btn green trig-privbtn" privkey="addSysDictionary" >新增</button> 
							</div>
							<div class="btn-group">
								<button id="updateSysDictionary" class="btn green trig-privbtn" privkey="updateSysDictionary">修改</button>
							</div>
							<div class="btn-group">
								<button id="deleteSysDictionary" class="btn green trig-privbtn" privkey="deleteSysDictionary">删除</button> 
							</div>
							
							<div class="btn-group  ">  
							<button class="btn green dropdown-toggle trig-privbtn" data-toggle="dropdown" privkey="moveSysDictionary">移动 <i class="fa fa-angle-down"></i></button>
							<ul class="dropdown-menu pull-right"> 
								<li>
									<a href="javascript:;" class="btn dictionaryMove" > 
									移动到... </a>
								</li>
								<li>
									<a href="javascript:;" class="btn dictionaryUp" > 
									上移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn dictionaryDown" > 
									下移 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn dictionaryTop" > 
									置顶 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn dictionaryBottom" > 
									置底 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn dictionarySort" > 
									修改排序值 </a>
								</li>
								<li>
									<a href="javascript:;" class="btn moveSysDictionary" > 
									重置排序 </a>
								</li>
							</ul>
							</div>
							
							<c:privlege key="addRolePrivlegeDef">
							<div class="btn-group ">
								<button id="updateAddRolePrivlegeDef" class="btn green trig-privbtn hidden-xs hidden-sm" privkey="addRolePrivlegeDef">更新内容权值</button>
							</div>
							</c:privlege>
							
							<c:is key="cloud.log.open">
							<div class="btn-group ">
								<button class="btn green trig-privbtn hidden-xs hidden-sm findSysLogs" privkey="findSysLogs">日志</button>
							</div>
							</c:is>
						</div>
					</div>
				</div>
				<table class="table table-striped table-bordered table-hover" id="trig-dictionary-table">
				<thead>
				<tr>
					<th class="table-checkbox">
						<input type="checkbox" class="group-checkable" data-set="#trig-dictionary-table .checkboxes"/>
					</th>
					<th>名称</th>
					<th>标识</th>
					<th class="hidden-xs">代码</th>
					<th class="hidden-xs">禁用</th>
					<th>排序</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
		</div>
		</div>
	</div>
</div>
<%--  浮层  --%>
<div id="dictionaryEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  >
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">编辑</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="dictionaryEditform">
	<input type="hidden" name="sd_dictionaryId" id="sd_dictionaryId" />
	<input type="hidden" name="sd_parentDictionaryId" id="sd_parentDictionaryId" value="1"/>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sd_dictionaryName" id="sd_dictionaryName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">标识</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="sd_dictionaryNo" id="sd_dictionaryNo">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">代码</label>
								<div class="col-md-6">
										<input type="text" class="form-control"  name="sd_dictionaryCode" id="sd_dictionaryCode">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">叶子</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sd_isLeaf"  value="Y"  checked> 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sd_isLeaf"  value="N" > 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">禁用</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sd_state"  value="Y"  > 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sd_state"  value="N"  checked> 否</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">描述</label>
								<div class="col-md-6">
									<textarea rows="5" class="form-control"  name="sd_description" id="sd_description"></textarea>
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer">
		<%@include file="../inc/editbtn.jsp" %>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="dictionaryMoveModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">移动到</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
				<div class="form-body">
							<div class="form-group">
								<label class="col-md-4 control-label">将 <span id="movedictionaryname" style="color:red;"></span> 移动到父字典</label>
								<div class="col-md-6">
										<input type="text" name="dictionarymoveselect" id="dictionarymoveselect"  class="form-control"/>
								</div>
							</div>
					</div>
				</div>	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue" id="moveSave">移动</button>
	</div>
</div>

<div id="dictionarySortModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">修改排序值</h4>
	</div>
	<form class="form-horizontal" id="dictionarySortEditform">
	<input type="hidden" name="sd_dictionaryId" />
	<input type="hidden" name="sd_parentDictionaryId" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body"> 
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
										<input type="text" name="sd_dictionaryName"   class="form-control"  readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">排序</label>
								<div class="col-md-6">
										<input type="text" name="sd_sortNo"   class="form-control"/>
								</div>
							</div>
					</div>
				</div>	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" id="sortSave">保存</button>
	</div>
	</form>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/system/dictionary.js"></script>