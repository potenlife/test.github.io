/**
 * 并发操作控制，记录锁
 */

var LOCK_OPTIMISTIC = "0";
var LOCK_PESSIMISTIC = "1";
var lock = lock || {};
lock.id = ""; // 锁ID
lock.type = LOCK_OPTIMISTIC;
lock.rid = ""; // 记录ID
function addLock(id, type) {
	if(CLOUD.settings.lock) {
		if(!type) type = LOCK_OPTIMISTIC;
		deleteLock();
		$.get(CLOUD.PATH + '/syslock_add.json','type='+ type +'&sl_recordId=' + id, function(data) {
			data = CLOUD.successHandle(data);
			lock.id = data.data.sl_lockId;
		});
	}
}
function getLock(id) {
	if(CLOUD.settings.lock) {
		lock.rid = id;
		lock.type = LOCK_OPTIMISTIC;
		addLock(id, LOCK_OPTIMISTIC);
	}
}
function getPessLock(id){
	if(CLOUD.settings.lock) {
		lock.rid = id;
		lock.type = LOCK_PESSIMISTIC;
		addLock(id, LOCK_PESSIMISTIC);
	}
}
function refreshLock() {
	if(lock.rid != "") {
		addLock(lock.rid, lock.type);
	}
}
function deleteLock() {
	if(CLOUD.settings.lock) {
		if(lock.id != '') {
			$.post(CLOUD.PATH + '/syslock_delete.json', 'id=' + lock.id,function(data) {
				
			});
		}
	}
}