
package com.cloud.poten.vote.dao;

import java.util.List;

import com.cloud.poten.vote.bean.CommonBean;


/**
 * 公共处理Dao
 */
public interface CommonDao {

	/**
	 * 查询行业下的字典信息
	 * @param common
	 * @return
	 */
	public List<CommonBean> findDicIndustryTags(CommonBean common);
}