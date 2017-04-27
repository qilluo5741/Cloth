package com.cloth.dao;


import java.util.List;

import com.cloth.entity.SizeInfo;
import com.cloth.util.Pager;

public interface ISizeInfoDao {
	public Pager<SizeInfo> queryAllSize(int pageIndex,int pageSize);//分页查询所有的尺寸
	public boolean insertSize(SizeInfo sizes);//新增尺寸
	public List<SizeInfo> selectAllToList();//查询所有尺寸返回list
	public boolean selectIsExistsSize(String sizeName,String goodsTypeName);//查询是否存在
}
