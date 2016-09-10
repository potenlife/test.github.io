<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoPrivlege"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoPrivlege"/> 
</div>

<div class="row">
	<div class="col-md-12">
			<div class="btn-group">
				<button class="btn green trig-privbtn" privkey="addSysUser" >有权</button> 
			</div>
			<div class="btn-group">
				<button class="btn green trig-privbtn" privkey="add2SysUser" >无权</button> 
			</div>
			<c:privlege key="addSysUser">
					有权 (权限判断)
			</c:privlege>
			<c:privlege key="add2SysUser">
					无权
			</c:privlege>
			
			<c:role key="admin">
					admin 角色 (角色判断) 
			</c:role>
			<c:role key="test">
					test 角色
			</c:role>
	</div>
</div>

<script>
	$(function(){
		if(CLOUD.isPrivlege("addSysUser")) {
			CLOUD.messager.alert("有 addSysUser 权");
    	}
		if(CLOUD.isPrivlege("add2SysUser")) {
			CLOUD.messager.alert("有 add2SysUser 权");
    	}
		
		if(CLOUD.isRole("admin")) {
			CLOUD.messager.alert("有 admin 角色");
		} 
		if(CLOUD.isRole("test")) {
			CLOUD.messager.alert("有 test 角色");
		} 
	});
</script>