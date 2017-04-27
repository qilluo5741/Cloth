package com.cloth.service;


import com.cloth.entity.GoodsInventoryInfo;
import com.cloth.util.Pager;

public interface IGoodsInventoryService {
	public Pager<GoodsInventoryInfo> selectAllByPager(int pageIndex,int pageSize);
	public GoodsInventoryInfo selectOne(String goodsInventoryId);
	public GoodsInventoryInfo selectOneBy(String goodsName,String colorName,String sizeName);
	public boolean insertOne(GoodsInventoryInfo goodsInventory);
	public boolean deleteOne(String goodsInventoryId);
	public boolean updateOneAdd(String goodsInventoryId,int num);
	public boolean updateOneReMove(String goodsInventoryId,int num);
	public boolean updateOneMove(String goodsInventoryId,String warehouseId);
}
