/*
 * VoteActivityServiceImpl	2016-08-30
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.poten.mybatis.service.CURDServiceImpl;
import com.cloud.poten.result.PageListResult;
import com.cloud.poten.vote.dao.VoteActivityDao;
import com.cloud.poten.vote.bean.VoteActivity;
import com.cloud.poten.vote.service.VoteActivityService;
import com.cloud.poten.mybatis.dao.CURDDao;

/**
 * @author cloud
 * @version 1.0, 2016-08-30
 */
@Service
public class VoteActivityServiceImpl extends CURDServiceImpl<VoteActivity> implements VoteActivityService {
	@Autowired
	private VoteActivityDao voteActivityDao;
	protected CURDDao<VoteActivity> getDao() {
		return voteActivityDao;
	}
	
	/** 
	 * @see VoteActivityService#findPageList(int, int, VoteActivity)
	 */
	public PageListResult<VoteActivity> findPageList(int pageno, int pagesize,VoteActivity bean) {
		return new PageListResult<VoteActivity>(voteActivityDao.findPageList(pageno, pagesize, bean));
	}

}
