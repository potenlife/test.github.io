/*
 * VoteActivityDao	2016-08-30
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.dao;

import com.cloud.poten.vote.bean.VoteActivity;
import com.cloud.poten.mybatis.dao.CURDDao;
import com.cloud.util.page.PageTools;

/**
 * @author cloud
 * @version 1.0, 2016-08-30
 */
public interface VoteActivityDao extends CURDDao<VoteActivity> {
	/** 
	 * 分页查找 
	 * @param pageno
	 * @param pagesize
	 * @param bean
	 * @return
	 */
	PageTools<VoteActivity> findPageList(int pageno, int pagesize,VoteActivity bean);		
}