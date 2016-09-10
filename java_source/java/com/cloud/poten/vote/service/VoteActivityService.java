/*
 * VoteActivityService	2016-08-30
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.service;

import com.cloud.poten.mybatis.service.CURDService;
import com.cloud.poten.result.PageListResult;
import com.cloud.poten.vote.bean.VoteActivity;

/**
 * @author cloud
 * @version 1.0, 2016-08-30
 */
public interface VoteActivityService extends CURDService<VoteActivity> {
	/** 
	 * 分页查找 
	 * @param pageno
	 * @param pagesize
	 * @param bean
	 * @return
	 */
	PageListResult<VoteActivity> findPageList(int pageno, int pagesize,VoteActivity bean);
}