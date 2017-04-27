package com.cloth.dao;

import java.util.List;

import com.cloth.entity.DistributionInfo;
import com.cloth.util.Pager;

public interface IDistributionInfoDao {

	/**
	 * 查询全部
	 * @return
	 */
	public List<DistributionInfo> selectListAll();
	
	/**
	 * 查询单个
	 * @param distributionId
	 * @return
	 */
	public DistributionInfo selectOne(String distributionId);
	
	/**
	 * 分页
	 * @return
	 */
	public Pager<DistributionInfo> querySelectAll(int pageIndex, int pageSize);
	
	/**
	 * 添加
	 * @param distribution
	 * @return
	 */
	public boolean insert(DistributionInfo distribution);
	
	/**
	 * 验收
	 * @return
	 */
	public boolean updateIsAcceptance(String distributionId,int isAcceptance);
}
