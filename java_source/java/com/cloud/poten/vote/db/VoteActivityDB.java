/*
 * VoteActivityDB.java	2016-08-31
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.db;

import com.cloud.poten.db.BaseDB;

/**
 * @author cloud
 * @version 1.0, 2016-08-31
 */
public interface VoteActivityDB extends BaseDB {
	String TABLE_NAME="vote_activity";
	/**活动名称*/
	String NAME = "name";
	/**活动开始时间*/
	String START_TIME = "start_time";
	/**活动结束时间*/
	String END_TIME = "end_time";
	/**排序方式;asc 和 desc*/
	String ORDER_TYPE = "order_type";
	/**排序字段,根据前台需要定*/
	String ORDER_FIELD = "order_field";
	/**投票次数_类型（1：人次；2：人天次）*/
	String VOTE_USER_TYPE = "vote_user_type";
	/**投票次数限制*/
	String VOTE_COUNT = "vote_count";
	/**参与者次数限制*/
	String PART_COUNT = "part_count";
	/**得票统计1：百分比；2：得票数*/
	String GAIN_TICKET_STAT = "gain_ticket_stat";

}