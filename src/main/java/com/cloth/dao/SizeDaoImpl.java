package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.SizeInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class SizeDaoImpl extends HibernateDaoSupport implements ISizeInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 分页查询所有
	 */
	public Pager<SizeInfo> queryAllSize(int pageIndex, int pageSize) {
		Pager<SizeInfo> pager=new Pager<SizeInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<SizeInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from SizeInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from SizeInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 新增尺寸
	 */
	public boolean insertSize(SizeInfo sizes) {
		try {
			this.getSessionFactory().getCurrentSession().save(sizes);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 查询所有尺寸返回list
	 */
	public List<SizeInfo> selectAllToList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from SizeInfo").list();
	}
	
	/**
	 * 查询是否存在尺寸
	 */
	public boolean selectIsExistsSize(String sizeName,String goodsTypeName) {
		int row=((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from SizeInfo sizes where sizes.sizeName=? and sizes.goodType.goodTypeName=?").setString(0, sizeName).setString(1, goodsTypeName).uniqueResult()).intValue();
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
}
