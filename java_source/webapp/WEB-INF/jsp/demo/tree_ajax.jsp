<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoAjaxTree"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoAjaxTree"/> 
</div>

<div class="row">
	<div class="col-md-12 ">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 异步树
				</div>
				<div class="tools">
					<a href="" class="collapse"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="tree_1" class="tree-demo">
					
				</div>
			</div>
		</div>
	</div>	
</div>

<script>
$(function(){
	$('#tree_1').jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data' : {
            	'dataType' : "json",  
                'url' : function (node) {
                 // SysListResult<AjaxJsTree> 结果集返回	
                  return 'module_findTree.json';
                },
                'data' : function (node) {
                  return { 'id' : node.id }; 
                }
            }
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "plugins" : [ "state", "types" ]
    });
});
</script>
