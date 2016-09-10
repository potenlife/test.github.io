<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoCheckboxTree"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoCheckboxTree"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 复选树
				</div>
				<div class="tools">
					<a href="" class="collapse"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="tree_1" class="tree-demo">
					
				</div>
				<button type="button" class="btn blue" id="rolePrivSaveBtn" >获取选中checkbox</button>
				<button type="button" class="btn blue" id="rolePrivSaveBtn2" >获取待定选择checkbox</button>
			</div>
			
		</div>
	</div>	
</div>

<script>
$(function(){
	// JsTreeResult 结果集，一次全部返回
	$.getJSON('role_privlege_def_findList.json', 'srpd_roleId=1', function(data){  
		$("#tree_1").jstree({  
	        "core" : {
	            "themes" : {
	                "responsive": false
	            },
	            "data": data    
	        }, 
	        "types" : {
	            "default" : {
	                "icon" : "fa fa-folder icon-state-warning icon-lg" 
	            }
	        },
	        "plugins" : ["checkbox", "types"]
	    });
	});
	
	$("#rolePrivSaveBtn").bind('click', function(){
		var nodes = $("#tree_1").jstree('get_checked', true); 
		var ids = [];
		$.each(nodes, function(i,n){
    		ids.push(n.id); 
    	}); 
		alert(ids);
	});
	$("#rolePrivSaveBtn2").bind('click', function(){
		var ids = CLOUD.TreeUndetermined('tree_1'); 
		alert(ids);
	});
	
});
</script>
