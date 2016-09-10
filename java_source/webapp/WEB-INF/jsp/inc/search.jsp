<%@ page contentType="text/html;charset=UTF-8" %>
<%--副本 --%>
<div id="searchwhereDiv" style="display:none">
	<div class="form-group searchwhere searchwhereadd"> 
		<div class="col-md-2">
			<select name="logic" class="form-control l">
				<option value="AND">AND</option>
				<option value="OR">OR</option>
				<option value="AND NOT">AND NOT</option>
				<option value="OR NOT">OR NOT</option>
			</select>
		</div>
		<div class="col-md-2">	
			<select class="form-control cloumns2 c" name="field" ></select> 
		</div>
		<div class="col-md-2">	
			<select name="operation" class="form-control o">
				<option value="LIKE">包含</option>
				<option value="=">是</option>
				<option value="!=">不是</option>
				<option value="&gt;">大于</option>
				<option value="&gt;=">大于等于</option>
				<option value="&lt;">小于</option>
				<option value="&lt;=">小于等于</option>
			</select>
		</div>
		<div class="col-md-4">	
			<div class="input-group input-medium ">
			<input type="text" class="form-control t "  name="searchtext" > <span class="input-group-btn advdate" style="display:none"> 
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>
			</div>									
		</div>
		<div class="col-md-2">
			<button class="btn green searchdel"  onclick="$(this).parents('.searchwhere').remove();">删除</button>  
		</div>
	</div>
</div>							
<%--高级查询浮层 --%>
<div id="AdvancedSearchModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="860"  data-height="400">  
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button> 
		<h4 class="modal-title">高级查询</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body" id="searchwheres">
							<div class="form-group searchwhere">
								<div class="col-md-3">
									<select class="form-control cloumns1 c" name="field" ></select>
								</div>
								<div class="col-md-3">	
									<select name="operation" class="form-control o">
										<option value="LIKE">包含</option>
										<option value="=">是</option>
										<option value="!=">不是</option>
										<option value="&gt;">大于</option>
										<option value="&gt;=">大于等于</option>
										<option value="&lt;">小于</option>
										<option value="&lt;=">小于等于</option>
									</select>
								</div>	
								<div class="col-md-4">
									<div class="input-group input-medium ">
									<input type="text" class="form-control t"  name="searchtext" id="searchtext1" > <span class="input-group-btn advdate" style="display:none"> 
												<button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
												</span>  
									</div>			
								</div> 
								<div class="col-md-2">
									<button class="btn green"  id="AdvancedSearchttBtn">添加</button>
								</div>
							</div>
					</div>
				</div> 	
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue" id="AdvancedSearchCreateBtn">新建查询</button>
		<button type="button" class="btn blue" id="AdvancedSearchOpenBtn">打开</button>
		<button type="button" class="btn blue" id="AdvancedSearchSaveBtn">保存</button>
		<button type="button" class="btn blue" id="AdvancedSearchbbBtn">查询</button>
	</div>
</div>

<div id="searchEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">保存</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="searchEditform">
	<input type="hidden" name="ss_searchId" id="ss_searchId" /> 
	<input type="hidden" name="ss_tableName" id="ss_tableName"  />
	<input type="hidden" name="wheres" id="wheres" />
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="ss_searchName" id="ss_searchName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">分享</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="ss_isShare"  value="Y"  > 是 </label>
										<label class="radio-inline">
										<input type="radio" name="ss_isShare"  value="N"  checked> 否</label>
									</div>
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	<div class="modal-footer"> 
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="submit" class="btn blue" >保存</button>
	</div>
	</form>
	<!-- END FORM-->
</div>

<div id="searchSelectModal" class="modal fade modal-scroll" tabindex="-1" data-width="760" data-height="500">    
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button> 
		<h4 class="modal-title">查询选择</h4>
	</div>
	<div class="modal-body">
		<div class="tabbable-custom ">
			<ul class="nav nav-tabs" id="searchtabs">
					<li class="active">
						<a href="#search_tab_1" data-toggle="tab"  data-index="0">
						个人</a>
					</li>
					<li>
						<a href="#search_tab_2" data-toggle="tab" data-index="1">
						共享</a>
					</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="search_tab_1">
					<div class="row">
							<div class="col-md-12">
									<div class="table-toolbar notAnimate" >
										<div class="row">
											<div class="col-md-12">
												<div class="btn-group">
													<button id="deleteSysSearch" class="btn green" >删除</button>
												</div>
											</div>
										</div>
									</div>
									<table class="table table-striped table-bordered table-hover" id="trig-pro-search-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-pro-search-table .checkboxes"/> 
										</th>
										<th>名称</th>
										<th class="trig-th-time">创建时间</th>
									</tr>
									</thead>
									<tbody>
									
									</tbody>
									</table> 
						</div> 
					</div>	
			</div>
			<div class="tab-pane" id="search_tab_2">
					<div class="row">
							<div class="col-md-12">
									<table class="table table-striped table-bordered table-hover" id="trig-share-search-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-share-search-table .checkboxes"/> 
										</th>  
										<th>名称</th>
										<th class="trig-th-time">创建时间</th> 
									</tr>
									</thead>
									<tbody>
									
									</tbody>
									</table> 
							</div> 
					</div>	
				</div>
		</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue"  id="searchselectbtn">选择</button>
	</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/admin/cloud/inc/search.js"></script>  