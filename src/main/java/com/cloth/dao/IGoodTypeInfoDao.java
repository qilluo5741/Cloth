package com.cloth.dao;

import java.util.List;
import com.cloth.entity.GoodTypeInfo;
import com.cloth.util.Pager;
public interface IGoodTypeInfoDao {
	public List<GoodTypeInfo> queryAllGoodTypeInfo();
	public void addGoodTypeInfo(GoodTypeInfo goodt);
	public boolean updateGoodTypeInfo(GoodTypeInfo goodt);
	public boolean deleteGoodTypeInfo(String goodTypeId);
	public GoodTypeInfo selectOneGoodTypeInfo(String goodTypeId);
	public Pager<GoodTypeInfo> selectAllByPager(int pageIndex, int pageSize);

}
