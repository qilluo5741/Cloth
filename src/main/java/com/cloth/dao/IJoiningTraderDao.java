package com.cloth.dao;


import java.util.List;

import com.cloth.entity.JoiningTraderInfo;
import com.cloth.util.Pager;


public interface IJoiningTraderDao {
	public JoiningTraderInfo selectOneById(String joiningTraderId);//查询单个
	public boolean insertOneJoiningTrader(JoiningTraderInfo join);//添加新的加盟商
	public List<JoiningTraderInfo> selectAllToList();//查询所有的加盟商返回list
	public boolean updateJoininfTraderByid(JoiningTraderInfo joiningTrader);//修改加盟商基本信息
	public Pager<JoiningTraderInfo> queryAllToJoining(int pageIndex,int pageSize);//分页查询
	public boolean passVerify(String joiningTraderId);//让加盟商通过审核
	public boolean noPassVerify(String joiningTraderId);//让加盟商不通过审核
}
