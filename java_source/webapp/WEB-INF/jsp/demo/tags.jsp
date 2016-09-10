<%@ page contentType="text/html;charset=UTF-8" %><%@taglib prefix="c" uri="/cloud-tags"%>
<h3 class="page-title">
	<c:mi key="findDemoTags"/>
</h3>
<div class="page-bar">
	<c:navi key="findDemoTags"/> 
</div>

<div class="row">
	<div class="col-md-12">
		<div class="col-md-6" style="padding-top:10px">
			某项功能是否设置，trig.properties  key设置为true<br/>
			&lt;t: is key="cloud.privlege.content"&gt;
			<c:is key="cloud.privlege.content" >
					test 角色
			</c:is>
			&lt;/t: is&gt;
		</div>	
		<div class="col-md-6" style="padding-top:10px">
			获取配置文件 trig.properties  key 值<br/>
			&lt;t: resources key="cloud.privlege.content" /&gt;
			<c:resources key="cloud.privlege.content" />
		</div>
		<div class="col-md-6" style="padding-top:10px">
			获取国际化资源文件 cloudresources_zh_CN.properties  key 值<br/>
			&lt;t: text key="PUBLIC.SYSTEMNAME" /&gt;
			<c:text key="PUBLIC.SYSTEMNAME" />
		</div>
		<div class="col-md-6" style="padding-top:10px">
			获取csrf  返回值<br/>
			&lt;t: csrf type="1"/&gt;  &lt;input type="hidden" name="Constants.WEB_CSRF_COOKIES_PARA"  value="<c:csrf type="2"/>"/&gt; 
			&lt;t: csrf type="2"/&gt;
			<c:csrf type="2"/>  
		</div>
	</div>
</div>