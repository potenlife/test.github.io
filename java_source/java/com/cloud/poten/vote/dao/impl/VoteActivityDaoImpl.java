/*
 * VoteActivityDaoImpl	2016-08-30
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloud.poten.mybatis.dao.CURDDaoImpl;
import com.cloud.poten.vote.bean.VoteActivity;
import com.cloud.poten.vote.dao.VoteActivityDao;
import com.cloud.util.page.PageTools;

/**
 * @author cloud
 * @version 1.0, 2016-08-30
 */
@Repository
public class VoteActivityDaoImpl extends CURDDaoImpl<VoteActivity> implements VoteActivityDao {
		
	/** 
	 * @see VoteActivityDao#findPageList(int, int, VoteActivity)
	 */
	public PageTools<VoteActivity> findPageList(int pageno, int pagesize,VoteActivity bean){
		return super.findPageList("voteActivity.getPageList", "voteActivity.getPageListCount", pageno, pagesize, bean);
	}
}