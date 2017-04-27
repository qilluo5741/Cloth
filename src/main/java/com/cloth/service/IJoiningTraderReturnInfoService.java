package com.cloth.service;

import com.cloth.entity.JoiningTraderReturnInfo;
import com.cloth.util.Pager;

public interface IJoiningTraderReturnInfoService {
	public JoiningTraderReturnInfo selectOne(String joiningTraderReturnId);
	public Pager<JoiningTraderReturnInfo> selectAllPager(int pageIndex,int pageSize);
	public boolean updateOneByStatus(String joiningTraderReturnId);
	public boolean insertOne(JoiningTraderReturnInfo joiningTraderReturn);
}
