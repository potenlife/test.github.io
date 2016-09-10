var trig_cache_table = null;
$(function(){
	var cache = {};
	cache.url = {};
	cache.url.find = 'tools/cache_getList.json';
	cache.url.removeKey = 'tools/cache_removeKey.json';
	
    var table = $('#trig-cache-table');
    // begin first table
    trig_cache_table = new CLOUD.Datatable({
    		table : table, 
    		url : cache.url.find, 
    		columns : [
    				   { "data": "id" , orderable: false },
    				   { "data": "size" , orderable: false },
    		           { "data": "null" , orderable: false, "render": function(data, type, row, mete) {
    		        	   return '<a href="javascript:;" class="btn default btn-xs black" onclick="trig_tools_cache_remove(\''+row.id+'\');">\
										<i class="fa fa-trash-o"></i> 清除 </a> <a href="javascript:;" class="btn default btn-xs black" onclick="trig_tools_cache_removeKey(\''+row.id+'\');">\
							<i class="fa fa-trash-o"></i> 清除key </a>';
    		           } }
    		],
    		paging : false,
    		trclick : false
    });
    
    CLOUD.Validate('cacheRemoveform', function(form){
    	CLOUD.trackPost(cache.url.removeKey, $(form).serialize(), function(data){
    		CLOUD.messager.alert("清除成功");
    		$("#cacheRemoveModal").modal('hide');
    		CLOUD.formreset($("#cacheRemoveform"));
    		trig_cache_table.reload();
    	});
    	return false;
    }, {
    	key : {
    		required : true
    	}
    });
});

function trig_tools_cache_remove(id) {
	CLOUD.trackPost('tools/cache_remove.json', 'id=' + id, function(data){
		CLOUD.messager.alert("清除成功");
		trig_cache_table.reload();
	});
}

function trig_tools_cache_removeKey(id) {
	$("#cacheid").val(id);
	$("#cacheRemoveModal").modal('show');
}