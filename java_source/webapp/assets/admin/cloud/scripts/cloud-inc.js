/** CLOUD 页面初始 */
CLOUD.init = function() {
	// 编辑模态关闭时，删除编辑打开时加的记录锁。
	$('.trig-edit-lock-modal').on('hidden', function () {
		deleteLock(); 
	});
	
	//if(!$(".trig-edit-modal").is('noDraggable')) {
		$(".trig-edit-modal").draggable({  
		    handle:".modal-header"   //当拖动modal-header的时候整个层才会动的  
		});  
		$(".trig-edit-modal").find('.modal-header').css('cursor','move');
	//}
	
	$('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    }); 
	
};
