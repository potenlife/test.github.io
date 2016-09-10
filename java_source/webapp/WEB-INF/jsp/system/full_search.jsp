<%@ page contentType="text/html;charset=UTF-8" %><%@ taglib uri="/struts-tags" prefix="s" %>
<h3 class="page-title">
搜索 <small></small>
</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li><i class="fa fa-home"></i><a href="javascript:gotourl('start');void(0);">首页</a>	<i class="fa fa-angle-right"></i>	</li>
		<li>
			<a href="#">搜索</a>
		</li>
	</ul>
	<div class="page-toolbar">
		<div id="dashboard-report-range" class="pull-right tooltips btn btn-fit-height grey-salt" data-placement="top" data-original-title="数据日期范围">
			<i class="icon-calendar"></i>&nbsp; <span class="thin uppercase visible-lg-inline-block"></span>&nbsp; <i class="fa fa-angle-down"></i>
		</div>
	</div>
</div>

<div class="trig-search">
		<form class="form form-inline " role="form" id="trig-search-form">
			<div class="form-group">
				<input type="text" class="form-control"  placeholder="名称"  id="sfs_title" value="<s:property value='key'/>"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn green " onclick="return false;" id="findSysFullSearch">
					<span class="fa fa-search"></span> 搜索
				</button>
			</div>
		</form>
</div>

<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET--> 
		<div class="trig-table" >
			<div class="portlet-body trig-table-body" >
				<table class="table table-striped table-bordered table-hover" id="trig-search-table">
				<thead>
				<tr>
					<th>ID</th>
					<th>功能</th>
					<th>名称</th>
					<th class="hidden-xs">描述</th>
					<th class="hidden-xs trig-th-time">创建时间</th>
				</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<div class="trig-bottom"></div>

<script>
	$(function(){
		var st = '';
		var et = '';
		var ttable = undefined;
		CLOUD.daterangepicker("dashboard-report-range", function(start, end){
			st = start.format("YYYY-MM-DD");
			et = end.format("YYYY-MM-DD");
			if(ttable) {
				var un = $('#sfs_title').val();
		    	ttable.query({ 
		    		sfs_title: un,
					startTime: st,
					endTime2: et
					});
			}
		});
		
		var table = $("#trig-search-table");
		ttable = new CLOUD.Datatable({
	    		table : table, 
	    		url : 'full_search_findPageList.json', 
	    		columns : [
		                 { "data": "sfs_id"},
		                 { "data": "sm_moduleName" },
		                 { "data": "sfs_title"},
		                 { "data": "sfs_description", "className":"hidden-xs"},
		                 { "data": "sfs_createTime", "className":"hidden-xs"}
	    		],
	    		order: [[4,'desc']],
	    		queryParams: {
	    			sfs_title: $("#sfs_title").val(),
	    			startTime: st,
					endTime2: et
	    		}
	    });
		$("#findSysFullSearch").bind('click', function(){
			ttable.query({
				sfs_title: $("#sfs_title").val(),
				startTime: st,
				endTime: et
			});
		});
	});
</script>