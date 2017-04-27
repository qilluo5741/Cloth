package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.GoodsInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class GoodsInfoDaoImpl extends HibernateDaoSupport implements
		IGoodsInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 分页查询所有的商品
	 */
	public Pager<GoodsInfo> queryAllToIndex(int pageIndex, int pageSize) {
		Pager<GoodsInfo> pager=new Pager<GoodsInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<GoodsInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from GoodsInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 根据Id查询单个商品
	 */
	public GoodsInfo selectOneById(String goodsId) {
		return (GoodsInfo) this.getSessionFactory().getCurrentSession().get(GoodsInfo.class, goodsId);
	}

	/**
	 * 修改商品信息
	 */
	public boolean updateGoodsByid(GoodsInfo goods) {
		int row=this.getSessionFactory().getCurrentSession().createQuery("update GoodsInfo goods set goods.goodsName=?,goods.goodsNum=?,goods.goodsCode=?,goods.goodsOutPrice=?,goods.goodsDiscount=?,goods.goodsRemark=? where goods.goodsId=?")
			.setString(0, goods.getGoodsName()).setInteger(1, goods.getGoodsNum()).setString(2, goods.getGoodsCode()).setDouble(3, goods.getGoodsOutPrice()).setDouble(4, goods.getGoodsDiscount()).setString(5, goods.getGoodsRemark()).setString(6, goods.getGoodsId()).executeUpdate();
		if(row==1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *修改商品数量 
	 */
	public boolean updateGoodsNum(String goodsName, int goodsNum) {
		int row=this.getSessionFactory().getCurrentSession().createQuery("update GoodsInfo goods set goods.goodsNum=goods.goodsNum-? where goods.goodsName=?").setInteger(0, goodsNum).setString(1, goodsName).executeUpdate();
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 添加商品
	 */
	public boolean insertGoods(GoodsInfo goods) {
		try {
			this.getSessionFactory().getCurrentSession().save(goods);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 查询所有商品返回list
	 */
	public List<GoodsInfo> selectAllToList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo").list();
	}
	
	/**
	 * 根据类型查询商品
	 */
	public List<GoodsInfo> queryAllByGoodsType(String goodTypeId) {
		List<GoodsInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo goods where goods.size.sizeId in (select sizes.sizeId from SizeInfo sizes where sizes.goodType.goodTypeId=?)")
		.setString(0, goodTypeId)
		.list();
		return list;
	}
	/**
	 * 查询畅销商品
	 */
	public List<GoodsInfo> queryAllSaleGood() {
		List<GoodsInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo goods order by goods.goodsDiscount asc").setFirstResult(0).setMaxResults(8)
		.list();
		return list;
	}
	
	public List<GoodsInfo> selectBygoodsName(String goodsName) {
		return this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo goods where goods.goodsName=?").setString(0, goodsName).list();
	}
	
	public GoodsInfo selectOnebySize(String goodsName, String sizeName,
			String colorName) {
		return (GoodsInfo) this.getSessionFactory().getCurrentSession().createQuery("from GoodsInfo goods where goods.goodsName=? and goods.size.sizeName=? and goods.color.colorName=?").setString(0, goodsName).setString(1, sizeName).setString(2, colorName);
	}
}
