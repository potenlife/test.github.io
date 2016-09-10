<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%><%@taglib prefix="s" uri="/struts-tags"%>
<h3 class="page-title">
我的工作台
</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascript:;">首页</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="javascript:;">我的工作台</a>
		</li>
	</ul>
</div>

<div class="row">
	<s:iterator value="worklist" status="st">
	<div class="col-md-6 col-sm-6">
		<!-- BEGIN PORTLET-->
		<div class="portlet light bg-inverse">
			<s:property value="sw_content" escape="false"/>
		</div>
		<!-- END PORTLET-->
	</div>
	<s:if test="(#st.index+1) % 2 == 0 && #st.index+1 != worklist.size()">
		</div>
		<div class="clearfix">
		</div>		
	</s:if>
	</s:iterator>
</div>
<div class="clearfix">
</div>			
