package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.GoodsInventoryInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class GoodsInventoryDaoImpl extends HibernateDaoSupport implements IGoodsInventoryDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 查询单个
	 * */
	public GoodsInventoryInfo selectOne(String goodsInventoryId) {
		return (GoodsInventoryInfo) getSessionFactory().getCurrentSession().get(GoodsInventoryInfo.class, goodsInventoryId);
	}
	
	/**
	 * 有条件的查询单个
	 * */
	public GoodsInventoryInfo selectOneBy(String goodsName,String colorName,String sizeName) {
		return (GoodsInventoryInfo) getSessionFactory().getCurrentSession().createQuery("from GoodsInventoryInfo gii where gii.goodsName = :goodsName and gii.colorName = :colorName and gii.sizeName = :sizeName")
		.setString("goodsName", goodsName)
		.setString("colorName", colorName)
		.setString("sizeName", sizeName).uniqueResult();
	}
	
	/**
	 * 	删除单个
	 * */
	public boolean deleteOne(String goodsInventoryId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("delete GoodsInventoryInfo gii where gii.goodsInventoryId = :goodsInventoryId")
			.setString("goodsInventoryId", goodsInventoryId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 添加单个
	 * */
	public boolean insertOne(GoodsInventoryInfo goodsInventory) {
		try {
			getSessionFactory().getCurrentSession().save(goodsInventory);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 	分页查询所有
	 * */
	public Pager<GoodsInventoryInfo> selectAllByPager(int pageIndex, int pageSize) {
		Pager<GoodsInventoryInfo> pager = new Pager<GoodsInventoryInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<GoodsInventoryInfo> list = getSessionFactory().getCurrentSession().createQuery("from GoodsInventoryInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from GoodsInventoryInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 修改单个(增加商品数量)
	 * */
	public boolean updateOneAdd(String goodsInventoryId,int num) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update GoodsInventoryInfo gii set gii.goodsNum = gii.goodsNum+:num where gii.goodsInventoryId=:goodsInventoryId")
			.setInteger("num", num)
			.setString("goodsInventoryId", goodsInventoryId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 修改单个(减少商品数量)
	 * */
	public boolean updateOneReMove(String goodsInventoryId,int num) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update GoodsInventoryInfo gii set gii.goodsNum = gii.goodsNum-:num where gii.goodsInventoryId=:goodsInventoryId")
			.setInteger("num", num)
			.setString("goodsInventoryId", goodsInventoryId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 修改单个(转移位置)
	 * */
	public boolean updateOneMove(String goodsInventoryId,String warehouseId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update GoodsInventoryInfo gii set gii.warehouse.warehouseId=:warehouseId where gii.goodsInventoryId=:goodsInventoryId")
			.setString("warehouseId", warehouseId)
			.setString("goodsInventoryId", goodsInventoryId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
