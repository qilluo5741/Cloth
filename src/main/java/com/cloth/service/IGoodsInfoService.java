package com.cloth.service;

import java.util.List;

import com.cloth.entity.GoodsInfo;
import com.cloth.util.Pager;

public interface IGoodsInfoService {
	public Pager<GoodsInfo> queryAllToIndex(int pageIndex,int pageSize);//分页查询所有的商品
	public GoodsInfo selectOneById(String goodsId);//根据goodsId查询商品
	public boolean updateGoodsByid(GoodsInfo goods);//修改商品信息
	public boolean updateGoodsNum(String goodsName,int goodsNum);//修改商品数量
	public boolean insertGoods(GoodsInfo goods);//新增商品
	public List<GoodsInfo> selectAllToList();//查询是所有商品返货list
	public List<GoodsInfo> queryAllByGoodsType(String goodTypeId);//根据商品类型查询商品
	public List<GoodsInfo> queryAllSaleGood();//查询畅销商品
	public List<GoodsInfo> selectBygoodsName(String goodsName);//根据商品名称查询商品
	public GoodsInfo selectOnebySize(String goodsName,String sizeName,String colorName);
}
