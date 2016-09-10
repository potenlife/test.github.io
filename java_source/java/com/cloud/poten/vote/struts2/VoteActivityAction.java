/*
 * VoteActivityAction	2016-08-30
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.struts2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cloud.poten.system.struts2.AdminAction;
import com.cloud.poten.vote.bean.VoteActivity;
import com.cloud.poten.vote.service.VoteActivityService;

import com.cloud.poten.annotation.web.Privlege;
import com.cloud.poten.result.DataTablesResult;
import com.cloud.poten.result.IResult;

/**
 * @author cloud
 * @version 1.0, 2016-08-30
 */
@Scope("prototype")
@Controller("vote.VoteActivityAction")
@Privlege("findVoteActivity")
public class VoteActivityAction extends AdminAction {
	@Autowired
	private VoteActivityService voteActivityService;
	
	@Privlege("findVoteActivity")
	public String init() {
		return SUCCESS;
	}
	
	@Privlege("findVoteActivity")
	public String findPageList() throws Exception{
		VoteActivity voteActivity = new VoteActivity();
		//将参数输入
		voteActivity.putAll(getParameters());
		return renderResult(new DataTablesResult<VoteActivity>(voteActivityService.findPageList(getPage(), getRows(), voteActivity), getDraw()));
	}
	
	@Privlege("addVoteActivity")
	public String add() throws Exception{

		VoteActivity voteActivity = new VoteActivity();
		//将参数输入 
		voteActivity.putAll(getParameters());
		IResult rs = voteActivityService.save(voteActivity);
		// 日志
		//log(voteActivity.getId(), rs.getMessage(), rs);
		return renderResult(rs);
	}
	
	@Privlege("updateVoteActivity")
	public String update() throws Exception{
		VoteActivity voteActivity = new VoteActivity();
		//将参数输入 
		voteActivity.putAll(getParameters());
		IResult rs = voteActivityService.update(voteActivity);
		// 日志
		//log(voteActivity.getId(), rs.getMessage(), rs);
		return renderResult(rs);
	}
	
	@Privlege("deleteVoteActivity")
	public String delete() throws Exception{
		IResult rs = voteActivityService.deleteIds(getIds());
		// 日志
		log(getIds(), rs.getMessage(), rs);
		return renderResult(rs);
	}
	
}