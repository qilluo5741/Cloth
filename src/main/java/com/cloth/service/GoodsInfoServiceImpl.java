package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IGoodsInfoDao;
import com.cloth.entity.GoodsInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class GoodsInfoServiceImpl implements IGoodsInfoService {

	@Autowired
	private IGoodsInfoDao dao;
	
	/**
	 * 分页查询所有 
	 */
	public Pager<GoodsInfo> queryAllToIndex(int pageIndex, int pageSize) {
		return dao.queryAllToIndex(pageIndex, pageSize);
	}

	/**
	 * 根据Id查询单个商品
	 */
	public GoodsInfo selectOneById(String goodsId) {
		return dao.selectOneById(goodsId);
	}

	public boolean updateGoodsByid(GoodsInfo goods) {
		return dao.updateGoodsByid(goods);
	}
	
	public boolean updateGoodsNum( String goodsName, int goodsNum) {
		return dao.updateGoodsNum( goodsName, goodsNum);
	}
	
	/**
	 * 添加商品
	 */
	public boolean insertGoods(GoodsInfo goods) {
		return dao.insertGoods(goods);
	}
	
	/**
	 * 查询所有商品返回list
	 */
	public List<GoodsInfo> selectAllToList() {
		return dao.selectAllToList();
	}
	public List<GoodsInfo> queryAllByGoodsType(String goodTypeId) {
		return dao.queryAllByGoodsType(goodTypeId);
	}
	
	/**
	 * 查询畅销商品
	 */
	public List<GoodsInfo> queryAllSaleGood() {
		return dao.queryAllSaleGood();
	}
	public List<GoodsInfo> selectBygoodsName(String goodsName) {
		return dao.selectBygoodsName(goodsName);
	}
	
	public GoodsInfo selectOnebySize(String goodsName, String sizeName,
			String colorName) {
		return dao.selectOnebySize(goodsName, sizeName, colorName);
	}
}
