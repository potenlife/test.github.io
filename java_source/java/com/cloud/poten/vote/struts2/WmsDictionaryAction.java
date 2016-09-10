
package com.cloud.poten.vote.struts2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cloud.poten.result.DataResult;
import com.cloud.poten.result.ListResult;
import com.cloud.poten.system.SysConstants;
import com.cloud.poten.system.bean.SysDictionary;
import com.cloud.poten.system.service.SysDictionaryService;
import com.cloud.poten.vote.bean.CommonBean;
import com.cloud.poten.vote.service.CommonService;
import com.cloud.poten.web.struts2.action.BaseAction;
import com.cloud.util.StringUtils;

/**
 * 前台查询字典工具action
 * @author Administrator
 *
 */
@Scope("prototype")
@Controller("wms.WmsDictionaryAction")
public class WmsDictionaryAction extends BaseAction {
	@Autowired
	private SysDictionaryService dictionaryService;
	
	@Autowired
	private CommonService commonService;
	
	/**
	 * 获取服务信息
	 * @return
	 * @throws Exception
	 */
	public String getServices() throws Exception {
		SysDictionary dictionary = new SysDictionary();
		dictionary.put("parentNo", getPNo());
		dictionary.put("key",getKey()=="-1"?null:getKey());
		return this.renderResult(new ListResult<SysDictionary>(dictionaryService.findListForFront(dictionary)));
	}
	
	/**
	 * 获取行业下的标签列表
	 * @return
	 */
	public String  getDicIndustryTags(){
		CommonBean common = new CommonBean();
		common.put("d3pNo", getD3pNo());
		return this.renderResult(new ListResult<CommonBean>(commonService.findDicIndustryTags(common)));
		
	}
	/**
	 * 根据父ID获取子字典 
	 * @return
	 * @throws Exception
	 */
	public String getSubDataByPId() throws Exception {
		SysDictionary dictionary = new SysDictionary();
		dictionary.setParentdictionaryId(getPid());
		dictionary.setSort(SysDictionary.SortNo);
		dictionary.setState(SysConstants.NO);
		return this.renderResult(new ListResult<SysDictionary>(dictionaryService.findList(dictionary).getRows()));
	}
	/**
	 * 根据标识获取子字典
	 * @return
	 * @throws Exception
	 */
	public String getSubDataByPNo() throws Exception {
		SysDictionary dictionary = new SysDictionary();
		dictionary.put("parentNo", getPNo());
		return this.renderResult(new ListResult<SysDictionary>(dictionaryService.findListForFront(dictionary)));
	}
	
	/**
	 * 获取一条记录
	 * @return
	 * @throws Exception
	 */
	public String getDataByNo() throws Exception {
		DataResult<SysDictionary> dr = new DataResult<SysDictionary>();
		SysDictionary sd = dictionaryService.findByNo(getNo());
		if(sd != null) {
			dr.setDataMap(sd);
			dr.setSuccess(true);
		}
		return renderResult(dr);
	}
	
	public String findByID() throws Exception {
		DataResult<SysDictionary> dr = new DataResult<SysDictionary>();
		SysDictionary sd = dictionaryService.find(getId());
		if(sd != null) {
			dr.setDataMap(sd);
			dr.setSuccess(true);
		}
		return renderResult(dr);
	}
	
	
	
	//==== 获取参数 start
	private String getId(){
		String id = getParameters().get("id");
		if (StringUtils.isEmpty(id)) {
			id="-1";
		}
		return id;
	}
	private String getPid(){
		String pid = getParameters().get("pid");
		if (StringUtils.isEmpty(pid)) {
			pid="-1";
		}
		return pid;
	}
	private String getNo(){
		String no = getParameters().get("no");
		if (StringUtils.isEmpty(no)) {
			no="-1";
		}
		return no;
	}
	private String getPNo(){
		String pno = getParameters().get("pno");
		if (StringUtils.isEmpty(pno)) {
			pno="-1";
		}
		return pno;
	}
	
	private String getKey(){
		String key = getParameters().get("key");
		if (StringUtils.isEmpty(key)) {
			key="-1";
		}
		return key;
	}
	private String getD3pNo(){
		String key = getParameters().get("d3pNo");
		if (StringUtils.isEmpty(key)) {
			key="-1";
		}
		return key;
	}
	//==== 获取参数 end
}
