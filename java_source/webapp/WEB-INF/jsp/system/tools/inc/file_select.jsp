<div id="file_select_treeModal" class="modal fade modal-scroll trig-edit-modal" tabindex="-1" data-width="760"  data-height="500">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
		<h4 class="modal-title">选择文件</h4>
	</div>
	<!-- BEGIN FORM-->
	<div class="modal-body">
		<div class="row">
			<div class="col-md-12">
			<div id="file_select_tree" class="tree-demo">
								
			</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" data-dismiss="modal" class="btn btn-default">取消</button>
		<button type="button" class="btn blue" id="file_select_tree_btn">选择</button>
	</div>
</div>		
<script>
	CLOUD.FileSelectInit = false;
	CLOUD.FileSelect = function(root, selectinputid, fileType) {
			var rootpath = root || '/';
			var type = fileType || 0;
			
			if(CLOUD.FileSelectInit == true) $("#file_select_tree").jstree(true).destroy();   
			$('#file_select_tree').jstree({
		        "core" : {
		            "themes" : {
		                "responsive": false
		            }, 
		            // so that create works
		            "check_callback" : true,
		            'data' : {
		            	'dataType' : "json",  
		                'url' : function (node) {
		                  return 'tools/resource_fileTree.json';
		                },
		                'data' : function (node) {
		                  return { 'id' : node.id == '#' ? rootpath : node.id, 'fileType' : type }; 
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
			FileSelectInit = true;
			
			$("#file_select_tree_btn").unbind('click');
			$("#file_select_tree_btn").bind('click', function(){
				var nodes = $("#file_select_tree").jstree('get_selected', true);    
				if(nodes && nodes.length>1) {
					CLOUD.messager.alert('请选择一个文件');
					return false;
				} 
				var filename = '';
				$.each(nodes, function(i,n){
					filename = n.id;
				});
				$("#"+selectinputid).val(filename.substr(0,filename.length-1));
				$("#file_select_treeModal").modal('hide');
			});
			
			return {
				open : function() {
					$("#file_select_tree").jstree('refresh_node', {id: rootpath });
					$("#file_select_treeModal").modal('show');
				}
			}
	};
</script>