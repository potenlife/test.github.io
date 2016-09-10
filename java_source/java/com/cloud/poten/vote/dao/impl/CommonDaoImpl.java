
package com.cloud.poten.vote.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.poten.mybatis.dao.BaseDaoImpl;
import com.cloud.poten.vote.bean.CommonBean;
import com.cloud.poten.vote.dao.CommonDao;


@Repository
public class CommonDaoImpl extends BaseDaoImpl<CommonBean> implements CommonDao {


	public List<CommonBean> findDicIndustryTags(CommonBean common){
		return super.findList("common.findDicIndustryTags", common);
	}
}