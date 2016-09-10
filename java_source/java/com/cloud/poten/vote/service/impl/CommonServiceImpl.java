
package com.cloud.poten.vote.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.poten.result.IResult;
import com.cloud.poten.service.BaseServiceImpl;
import com.cloud.poten.vote.bean.CommonBean;
import com.cloud.poten.vote.dao.CommonDao;
import com.cloud.poten.vote.service.CommonService;


@Service
public class CommonServiceImpl extends BaseServiceImpl implements CommonService {
	@Autowired
	private CommonDao commonDao;

	
	/**
	 * 字典下行业的标签信息
	 */
	public List<CommonBean> findDicIndustryTags(CommonBean common) {
		return commonDao.findDicIndustryTags(common);
	}



	@Override
	public IResult delete(String id) {
		return null;
	}
	
	
}
