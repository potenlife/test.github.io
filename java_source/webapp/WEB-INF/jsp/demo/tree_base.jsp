<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoBaseTree"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoBaseTree"/> 
</div>

<div class="row">
	<div class="col-md-6">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 普通树
				</div>
				<div class="tools">
					<a href="" class="collapse"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="tree_1" class="tree-demo">
					<ul>
						<li>Root
							<ul>
								<li data-jstree='{ "selected" : true }'><a href="#">
										节点1 </a></li>
								<li
									data-jstree='{ "icon" : "fa fa-briefcase icon-state-success " }'>
									节点2</li>
								<li data-jstree='{ "opened" : true }'>节点3
									<ul>
										<li data-jstree='{ "disabled" : true }'>节点3-1</li>
										<li data-jstree='{ "type" : "file" }'>节点3-2</li>
									</ul>
								</li>
								<li data-jstree='{ "icon" : "fa fa-warning icon-state-danger" }'>
									节点4</li>
									<li data-jstree='{ "type" : "file" }'><a
							href="http://www.jstree.com">节点5 </a></li>
							</ul>
						</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>	
	
	<div class="col-md-6">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-gift"></i> 拖动树 & 右击菜单
				</div>
				<div class="tools">
					<a href="" class="collapse"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div id="tree_2" class="tree-demo">
					
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
        "plugins": [ "types"]
    });

    // handle link clicks in tree nodes(support target="_blank" as well)
    $('#tree_1').on('select_node.jstree', function(e,data) { 
        var link = $('#' + data.selected).find('a');
        if (link.attr("href") != "#" && link.attr("href") != "javascript:;" && link.attr("href") != "") {
            if (link.attr("target") == "_blank") {
                link.attr("href").target = "_blank";
            }
            alert(link.attr("href"));
            return false;
        }
    });
    
    var contextmenu = {
    	items: {
    	 //"ccp" : false,
    	 "create" : {
    	 // The item label
    	 "label" : "复制",
    	 // The function to execute upon a click
    	"action"   : function (obj) { alert(obj) },
    	 //"_disabled"   : function (obj) { alert("obj=" + obj); return "default" != obj.attr('rel'); }
    	 },
    	}
    };
    
    $("#tree_2").jstree({
        "core" : {
            "themes" : {
                "responsive": false
            }, 
            // so that create works
            "check_callback" : true,
            'data': [{
                    "text": "Root",
                    "children": [{
                        "text": "节点1",
                        "state": {
                            "selected": true
                        }
                    }, {
                        "text": "节点2",
                        "icon": "fa fa-warning icon-state-danger"
                    }, {
                        "text": "节点3",
                        "icon" : "fa fa-folder icon-state-success",
                        "state": {
                            "opened": true
                        },
                        "children": [
                            {"text": "节点3-1", "icon" : "fa fa-file icon-state-warning"}
                        ]
                    }, {
                        "text": "节点4",
                        "icon": "fa fa-warning icon-state-warning"
                    }, {
                        "text": "节点5",
                        "icon": "fa fa-check icon-state-success",
                        "state": {
                            "disabled": true
                        }
                    }, {
                        "text": "节点6",
                        "icon": "fa fa-folder icon-state-danger",
                        "children": [
                            {"text": "Item 1", "icon" : "fa fa-file icon-state-warning"},
                            {"text": "Item 2", "icon" : "fa fa-file icon-state-success"},
                            {"text": "Item 3", "icon" : "fa fa-file icon-state-default"},
                            {"text": "Item 4", "icon" : "fa fa-file icon-state-danger"},
                            {"text": "Item 5", "icon" : "fa fa-file icon-state-info"}
                        ]
                    }]
                }
            ]
        },
        "types" : {
            "default" : {
                "icon" : "fa fa-folder icon-state-warning icon-lg"
            },
            "file" : {
                "icon" : "fa fa-file icon-state-warning icon-lg"
            }
        },
        "state" : { "key" : "demo2" },
        // contextmenu 设置右击菜单，dnd 设置可拖动
        "plugins" : [ "contextmenu", "dnd", "state", "types" ],
        "contextmenu" : contextmenu
    });
    
    $( "#tree_2" ).on('move_node.jstree', function(e, data){
       console.info(data);
       alert("id:" + data.node.id ); 
       alert("parent:" + data.parent);
       alert("position:" + data.position);
    });
});
</script>
