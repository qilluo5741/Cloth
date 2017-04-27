package com.cloth.dao;

import com.cloth.entity.JoiningTraderReturnInfo;
import com.cloth.util.Pager;

public interface IJoiningTraderReturnInfoDao {
	public JoiningTraderReturnInfo selectOne(String joiningTraderReturnId);
	public Pager<JoiningTraderReturnInfo> selectAllByPager(int pageIndex,int pageSize);
	public boolean updateOneByStatus(String joiningTraderReturnId);
	public boolean insertOne(JoiningTraderReturnInfo joiningTraderReturn);
}
