package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.GoodsInfo;
import com.cloth.entity.OrderInfo;
import com.cloth.util.Pager;
@Repository
@SuppressWarnings("unchecked")
public class OrderInfoDaoImpl extends HibernateDaoSupport implements IOrderInfoDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/*
	 *删除
	 * */
	public boolean deleteOrderInfoInfo(String orderId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("delete OrderInfo o where o.orderId = :orderId")
			.setString("orderId", orderId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void insert(OrderInfo order) {
		this.getSessionFactory().getCurrentSession().save(order);
	}
	
	/**
	 * 分页
	 */
	public Pager<OrderInfo> selectAll(int pageIndex, int pageSize) {
		Pager<OrderInfo> pager=new Pager<OrderInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<OrderInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from OrderInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from OrderInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	/**
	 * 查询所有
	 */
	public List<OrderInfo> selectAllList() {
		List<OrderInfo> list= this.getSessionFactory().getCurrentSession().createQuery("from OrderInfo order by OrderInfo desc").list();
		return list;
	}
	
	/**
	 * 查询单个
	 */
	public OrderInfo selectOneById(String orderId) {
		
		return (OrderInfo) getSessionFactory().getCurrentSession().get(OrderInfo.class,orderId);
	}
	/* order.goodsId = :order.goodsId,*/
	public boolean updateOrderInfoBy(OrderInfo order) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update OrderInfo order set order.goodsNum = :goodsNum,order.joiningTraderId=:joiningTraderId,order.isdo=:isdo,order.orderRemark=:orderRemark where order.orderId=:orderId")
			.setInteger("goodsNum",order.getGoodsNum())
			.setString("joiningTraderId", order.getJoiningTrader().getJoiningTraderId())
			.setInteger("isdo", order.getIsdo())
			.setString("orderRemark",order.getOrderRemark())
			.setString("orderId", order.getOrderId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 查询未处理的订单
	 */
	public List<OrderInfo> selectIsDo() {
		List<OrderInfo> list= this.getSessionFactory().getCurrentSession().createQuery("from OrderInfo o where o.isdo = 1").list();
		return list;
	}
	/**
	 * 查询申请商品数量*---------------*判断数量
	 */
	public boolean selectOrderById(String orderId) {
		//查询商品id
		int goodsId = ((Long)this.getSessionFactory().getCurrentSession().createQuery("select o.goods.goodsId from OrderInfo o where o.orderId = :orderId").setString("orderId", orderId).uniqueResult()).intValue();
		//查询该商品的所有信息
		List<GoodsInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo g where g.goodsId = :goodsId").setString("goodsId", goodsId+"").list();
		GoodsInfo goods = null;
		if(list.size() > 0){
			goods = list.get(0);
		}
		String colorName = goods.getColor().getColorName();
		String  sizeName = goods.getSize().getSizeName();
		String goodsName = goods.getGoodsName();
		//查询商品库存的数量
		int goodsNum = ((Long)this.getSessionFactory().getCurrentSession().createQuery("select goodsNum from GoodsInventoryInfo g where g.goodsName = :goodsName and colorName = :colorName and sizeName = :sizeName").setString("goodsName", goodsName).setString("colorName", colorName).setString("sizeName", sizeName).uniqueResult()).intValue();
		//查询申请的商品数量
		int rows = ((Long)this.getSessionFactory().getCurrentSession().createQuery("select o.goodsNum from OrderInfo o where o.orderId = :orderId").setString("orderId", orderId).uniqueResult()).intValue();
		if(goodsNum >= rows ){
			return true;
		}
		else{
			return false;
		}
	}
	public boolean passVerify(String orderId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update OrderInfo order set order.isdo = 0 where order.orderId = :orderId")
			.setString("orderId", orderId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean noPassVerify(String orderId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update OrderInfo order set order.isdo = 2 where order.orderId = :orderId")
			.setString("orderId", orderId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
