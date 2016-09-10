/*
 * VoteActivity	2016-08-31
 *
 * Copyright 2016 Cloud User Zhijun Yuan
 * 
 */
package com.cloud.poten.vote.bean;

import org.apache.ibatis.type.Alias;

import com.cloud.poten.annotation.db.Column;
import com.cloud.poten.annotation.db.Column.DataType;
import com.cloud.poten.annotation.db.Table;
import com.cloud.poten.annotation.db.PrimaryKey;
import com.cloud.poten.mybatis.bean.DBTableBean;
import com.cloud.poten.vote.db.VoteActivityDB;

/**
 * @author cloud
 * @version 1.0, 2016-08-31
 */
@Table(VoteActivityDB.TABLE_NAME)
@Alias("vote.VoteActivity") 
public class VoteActivity extends DBTableBean {
	private static final long serialVersionUID = 1L;
	@Column(value = VoteActivityDB.ID,  alias = VoteActivity.Id)
	@PrimaryKey
	public static final String Id = "va_id";
	@Column(value = VoteActivityDB.NAME,  alias = VoteActivity.Name)
	/**活动名称*/
	public static final String Name = "va_name";
	@Column(value = VoteActivityDB.START_TIME, dataType = DataType.DateTime, alias = VoteActivity.StartTime)
	/**活动开始时间*/
	public static final String StartTime = "va_startTime";
	@Column(value = VoteActivityDB.END_TIME, dataType = DataType.DateTime, alias = VoteActivity.EndTime)
	/**活动结束时间*/
	public static final String EndTime = "va_endTime";
	@Column(value = VoteActivityDB.ORDER_TYPE,  alias = VoteActivity.OrderType)
	/**排序方式;asc 和 desc*/
	public static final String OrderType = "va_orderType";
	@Column(value = VoteActivityDB.ORDER_FIELD,  alias = VoteActivity.OrderField)
	/**排序字段,根据前台需要定*/
	public static final String OrderField = "va_orderField";
	@Column(value = VoteActivityDB.VOTE_USER_TYPE,  alias = VoteActivity.VoteUserType)
	/**投票次数_类型（1：人次；2：人天次）*/
	public static final String VoteUserType = "va_voteUserType";
	@Column(value = VoteActivityDB.VOTE_COUNT, dataType = DataType.Integer, alias = VoteActivity.VoteCount)
	/**投票次数限制*/
	public static final String VoteCount = "va_voteCount";
	@Column(value = VoteActivityDB.PART_COUNT, dataType = DataType.Integer, alias = VoteActivity.PartCount)
	/**参与者次数限制*/
	public static final String PartCount = "va_partCount";
	@Column(value = VoteActivityDB.GAIN_TICKET_STAT,  alias = VoteActivity.GainTicketStat)
	/**得票统计1：百分比；2：得票数*/
	public static final String GainTicketStat = "va_gainTicketStat";
	@Column(value = VoteActivityDB.CREATE_TIME, dataType = DataType.DateTime, alias = VoteActivity.CreateTime)
	/**创建时间*/
	public static final String CreateTime = "va_createTime";
	@Column(value = VoteActivityDB.CREATE_USER_ID,  alias = VoteActivity.CreateUserId)
	/**创建人*/
	public static final String CreateUserId = "va_createUserId";
	public void setId(String id) {
		put(Id, id);
	}
	public String getId() {
		return toGetString(Id);
	}
	/**活动名称*/
	public void setName(String name) {
		put(Name, name);
	}
	public String getName() {
		return toGetString(Name);
	}
	/**活动开始时间*/
	public void setStartTime(java.util.Date startTime) {
		put(StartTime, startTime);
	}
	public java.util.Date getStartTime() {
		return toGetDate(StartTime);
	}
	/**活动结束时间*/
	public void setEndTime(java.util.Date endTime) {
		put(EndTime, endTime);
	}
	public java.util.Date getEndTime() {
		return toGetDate(EndTime);
	}
	/**排序方式;asc 和 desc*/
	public void setOrderType(String orderType) {
		put(OrderType, orderType);
	}
	public String getOrderType() {
		return toGetString(OrderType);
	}
	/**排序字段,根据前台需要定*/
	public void setOrderField(String orderField) {
		put(OrderField, orderField);
	}
	public String getOrderField() {
		return toGetString(OrderField);
	}
	/**投票次数_类型（1：人次；2：人天次）*/
	public void setVoteUserType(String voteUserType) {
		put(VoteUserType, voteUserType);
	}
	public String getVoteUserType() {
		return toGetString(VoteUserType);
	}
	/**投票次数限制*/
	public void setVoteCount(int voteCount) {
		put(VoteCount, voteCount);
	}
	public int getVoteCount() {
		return toGetInteger(VoteCount);
	}
	/**参与者次数限制*/
	public void setPartCount(int partCount) {
		put(PartCount, partCount);
	}
	public int getPartCount() {
		return toGetInteger(PartCount);
	}
	/**得票统计1：百分比；2：得票数*/
	public void setGainTicketStat(String gainTicketStat) {
		put(GainTicketStat, gainTicketStat);
	}
	public String getGainTicketStat() {
		return toGetString(GainTicketStat);
	}
	/**创建时间*/
	public void setCreateTime(java.util.Date createTime) {
		put(CreateTime, createTime);
	}
	public java.util.Date getCreateTime() {
		return toGetDate(CreateTime);
	}
	/**创建人*/
	public void setCreateUserId(String createUserId) {
		put(CreateUserId, createUserId);
	}
	public String getCreateUserId() {
		return toGetString(CreateUserId);
	}



}