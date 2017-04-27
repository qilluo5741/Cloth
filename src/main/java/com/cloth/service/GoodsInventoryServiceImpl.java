package com.cloth.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IGoodsInventoryDao;
import com.cloth.entity.GoodsInventoryInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class GoodsInventoryServiceImpl implements IGoodsInventoryService {

	@Autowired
	private IGoodsInventoryDao giDao;
	
	public boolean deleteOne(String goodsInventoryId) {
		return giDao.deleteOne(goodsInventoryId);
	}

	public GoodsInventoryInfo selectOne(String goodsInventoryId) {
		return giDao.selectOne(goodsInventoryId);
	}
	
	public GoodsInventoryInfo selectOneBy(String goodsName, String colorName, String sizeName) {
		return giDao.selectOneBy(goodsName, colorName, sizeName);
	}
	
	public boolean insertOne(GoodsInventoryInfo goodsInventory) {
		return giDao.insertOne(goodsInventory);
	}

	public Pager<GoodsInventoryInfo> selectAllByPager(int pageIndex, int pageSize) {
		return giDao.selectAllByPager(pageIndex, pageSize);
	}

	public boolean updateOneAdd(String goodsInventoryId, int num) {
		return giDao.updateOneAdd(goodsInventoryId, num);
	}

	public boolean updateOneReMove(String goodsInventoryId, int num) {
		return giDao.updateOneReMove(goodsInventoryId, num);
	}
	
	public boolean updateOneMove(String goodsInventoryId, String warehouseId) {
		return giDao.updateOneMove(goodsInventoryId, warehouseId);
	}
}
