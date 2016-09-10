package com.cloud.poten.vote.service;

import java.util.List;

import com.cloud.poten.vote.bean.CommonBean;

/**
 * 公共service
 * @author Administrator
 *
 */
public interface CommonService {
	
	/**
	 * 行业下的标签信息
	 * @param common
	 * @return
	 */
	public List<CommonBean> findDicIndustryTags(CommonBean common);
}
