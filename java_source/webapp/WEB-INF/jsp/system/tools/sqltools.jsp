<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi />
</h3>
<div class="page-bar">
	<c:navi />
</div>

<div class="row">
	<div class="col-md-4">
		<div class="portlet blue-hoki box" > 
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-database"></i>数据表
				</div>
				<div class="tools" >
					<a href="javascript:;" class="collapse"> 
					</a>
					<a href="javascript:;" class="reload" id="sql_tree_reload">
					</a> 
					
				</div>
			</div>
			<div class="portlet-body" style="min-height:300px;"> 
				<div id="sql_tree" class="tree-demo">
					
				</div>
			</div>
			</div>
	</div>
	<div class="col-md-8"> 
			<div class="portlet box blue-hoki" >  
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-arrows"></i>操作区
					</div>
				</div>
				<div class="portlet-body">
					<div class="table-toolbar notAnimate" >
						<div class="row">
							<div class="col-md-12">
								<div class="btn-group">
									<button class="btn green"  id="createSql">新建</button>
								</div>
								<div class="btn-group">	
									<button class="btn green"  id="openSqlList">打开</button>
								</div>
								<div class="btn-group">	
									<button class="btn green"  id="saveSql">保存</button>
								</div>	
								<div class="btn-group">
									<button class="btn green dropdown-toggle" type="button" data-toggle="dropdown">
									插入 <i class="fa fa-angle-down"></i>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li class="dropdown-submenu">
											<a href="javascript:;">
											操纵语言 </a>
											<ul class="dropdown-menu" style="">
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('SELECT');">SELECT</a></li>
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('UPDATE');" >UPDATE</a></li>
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('DELETE FROM');" >DELETE</a></li>
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('CREATE');" >CREATE</a></li>
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('ALTER');" >ALTER</a></li>
												<li><a href="javascript:;" onclick="SQLContentEditor.insert('DROP');" >DROP</a></li>
											</ul>	
										</li>
										<li class="divider">
										</li>
										<li class="dropdown-submenu">
											<a href="javascript:;">
											运算符 </a>
											<ul class="dropdown-menu" style="">
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('AND');">AND</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('OR');">OR</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('NOT');">NOT</a></li>
												<li class="divider"></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('IN');">IN</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('NOT IN');">NOT IN</a></li>
												<li class="divider"></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('EXISTS');">EXISTS</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('NOT EXISTS');">NOT EXISTS</a></li>
												<li class="divider"></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('&gt;');">&gt;</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('&lt;');">&lt;</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('&gt;=');">&gt;=</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('&lt;=');">&lt;=</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('=');">=</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('&lt;&gt;');">&lt;&gt;</a></li>
												<li class="divider"></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('IS NULL');">IS NULL</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('IS NOT NULL');">IS NOT NULL</a></li>
											</ul>
										</li>
										
										<li class="dropdown-submenu">
											<a href="javascript:;">
											聚集函数 </a>
											<ul class="dropdown-menu" style="">
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('COUNT');">COUNT</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('SUM');">SUM</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('AVG');">AVG</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('MAX');">MAX</a></li>
												<li><a href="javascript:;"  onclick="SQLContentEditor.insert('MIN');">MIN</a></li>
											</ul>
										</li>
									</ul>
								</div>
								<div class="btn-group">
									<button class="btn green" id="excetueSql">执行</button>
								</div>
								<div class="btn-group">	
									<button class="btn green trig-privbtn"  id="backupSql" privkey="backupSqlTools">备份</button> 
								</div>
								<div class="btn-group">	
									<button class="btn green trig-privbtn"  id="exceuteScriptSql" privkey="recoverSqlTools">恢复</button> 
								</div>
								
							</div>
						</div>
					</div>
					
					<div id="sqlwindow" >
						<textarea rows="5" cols="100" id="sqltools_sql"></textarea>
						<span class="help-block">
												ctrl ：智能提示 </span>
					</div>
				</div>
				<div class="portlet-body "> 
					<div class="table-toolbar notAnimate" >
						<div class="row">
							<div class="col-md-12">
								<div class="btn-group">  
									<button class="btn green dropdown-toggle trig-privbtn" privkey="exportSqlTools" data-toggle="dropdown" >导出 <i class="fa fa-angle-down"></i></button>
									<ul class="dropdown-menu pull-right" id="exportSqlData"> 
										<li><a href="javascript:;"  onclick="sqltoolsexp(1);">CSV</a></li>
									    <li><a href="javascript:;"  onclick="sqltoolsexp(3);">PDF</a></li>
									    <li><a href="javascript:;"  onclick="sqltoolsexp(2);">XML</a></li>
									</ul>
								</div>
								<div class="btn-group  ">  
								<button class="btn green dropdown-toggle" data-toggle="dropdown" >图表 <i class="fa fa-angle-down"></i></button>
									<ul class="dropdown-menu pull-right"> 
										<li>
											<a href="javascript:;"  class="sqlcontainer" data-type="bar"> 
											柱图 </a>
										</li>
										<li>
											<a href="javascript:;"  class="sqlcontainer" data-type="pie"> 
											饼图</a>
										</li>
										<li>
											<a href="javascript:;"  class="sqlcontainer" data-type="line"> 
											曲线图</a>
										</li>
									</ul>
								</div>
								
							</div>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover" id="trig-sql-table">
						<thead>
						<tr id="sql_header">
							
						</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
			</div>
		</div>
	</div>
</div>

<%--浮层操作 --%>
<div id="sqlEditModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">保存</h4>
	</div>
	<!-- BEGIN FORM-->
	<form class="form-horizontal" id="sqlEditform">
	<input type="hidden" name="sst_sqlId" id="sst_sqlId" /> 
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">名称</label>
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="请输入名称" name="sst_sqlName" id="sst_sqlName">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">SQL</label>
								<div class="col-md-6">
									<textarea rows="5"  readonly="readonly"  class="form-control"  name="sst_sqlStr" id="sst_sqlStr" ></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">分享</label>
								<div class="col-md-6">
									<div class="radio-list">
										<label class="radio-inline">
										<input type="radio" name="sst_isShare"  value="Y"  > 是 </label>
										<label class="radio-inline">
										<input type="radio" name="sst_isShare"  value="N"  checked> 否</label>
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

<div id="sqlSelectModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="960" data-height="500">    
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button> 
		<h4 class="modal-title">SQL</h4>
	</div>
	<div class="modal-body">
		<div class="tabbable-custom ">
			<ul class="nav nav-tabs" id="sqltabs">
					<li class="active">
						<a href="#sqltools_tab_1" data-toggle="tab"  data-index="0">
						个人</a>
					</li>
					<li>
						<a href="#sqltools_tab_2" data-toggle="tab" data-index="1">
						共享</a>
					</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="sqltools_tab_1">
					<div class="row">
							<div class="col-md-12">
									<div class="table-toolbar notAnimate" >
										<div class="row">
											<div class="col-md-12">
												<div class="btn-group">
													<button id="deleteSqlTools" class="btn green trig-privbtn" privkey="deleteSqlTools">删除</button>
												</div>
											</div>
										</div>
									</div>
									<table class="table table-striped table-bordered table-hover" id="trig-pro-sql-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-pro-sql-table .checkboxes"/> 
										</th>
										<th>名称</th>
										<th>SQL</th>    
										<th class="trig-th-time">创建时间</th>
									</tr>
									</thead>
									<tbody>
									
									</tbody>
									</table> 
						</div> 
					</div>	
			</div>
			<div class="tab-pane" id="sqltools_tab_2">
					<div class="row">
							<div class="col-md-12">
									<table class="table table-striped table-bordered table-hover" id="trig-share-sql-table">
									<thead>
									<tr>
										<th class="table-checkbox">
											<input type="checkbox" class="group-checkable" data-set="#trig-share-sql-table .checkboxes"/> 
										</th>  
										<th>名称</th>
										<th>SQL</th>    
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
		<button type="button" class="btn blue"  id="sqlselectbtn">选择</button>
	</div>
</div>

<div id="sqlChartModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  data-min-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">统计图表</h4>
	</div>
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
				<div id="container" style="min-width: 758px; height: 400px; margin: 0 auto"></div>
			</div>
		</div>
	</div>
</div>

<div id="exceuteScriptSqlModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760" >    
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button> 
		<h4 class="modal-title">恢复</h4>
	</div>
	<form class="form-horizontal" >
	<div class="modal-body">
		<div class="row">
			<div class="portlet-body form">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label">SQL</label>
								<div class="col-md-6">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="请上传或选择SQL文件"  id="sqlfile"  readonly="readonly">
										<span class="input-group-btn">
											<button class="btn green" type="button" id="sqlfile_fb">上传</button>  
											<button class="btn default" id="sqlfile_select" type="button"><i class="fa fa-search"></i></button>
										</span>
									</div>
								</div>
							</div>
						</div>
				</div>
		</div>
	</div>
	</form>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue"  id="exceuteScriptSqlbtn">执行</button>
	</div>
</div>

<form action="tools/sqltools_exp.htm" id="expform">
	<input name="exptype" id="sqlexptype" type="hidden" />
	<input name="frcs" id="frcs" type="hidden" />
	<input name="sql" id="expsql" type="hidden"/>
</form>
<script>
	var DB_TYPE = '<c:resources key="cloud.dbtype" file="jdbc"/>';
</script>
<script src="<%=request.getContextPath() %>/assets/admin/cloud/system/tools/sqltools.js"></script>		