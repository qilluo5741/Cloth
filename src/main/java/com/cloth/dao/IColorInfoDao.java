package com.cloth.dao;

import java.util.List;

import com.cloth.entity.ColorInfo;
import com.cloth.util.Pager;

public interface IColorInfoDao {

	/**
	 * 查询所有
	 * @return
	 */
	public List<ColorInfo> selectAll();
	/**
	 * 分页查询所有
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Pager<ColorInfo> querySelectAll(int pageIndex,int pageSize);
	
	
	/**
	 * 查询单个
	 * @return
	 */
	public ColorInfo selectOne(String colorId);
	
	/**
	 * 根据颜色码查询
	 * @return
	 */
	public ColorInfo selectName(String colorNo);
	/**
	 * 添加
	 * @param color
	 * @return
	 */
	public boolean insertColorInfo(ColorInfo color);
	
}
