package com.cloth.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.GoodTypeInfo;
import com.cloth.util.Pager;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

@Repository
public class GoodTypeInfoDaoImpl extends HibernateDaoSupport implements IGoodTypeInfoDao{
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/*查询全部*/
	@SuppressWarnings("unchecked")
	public List<GoodTypeInfo> queryAllGoodTypeInfo(){
		List<GoodTypeInfo> list= this.getSessionFactory().getCurrentSession().createQuery("from GoodTypeInfo").list();
		return list;
	}
	/*添加*/
	public void  addGoodTypeInfo(GoodTypeInfo goodt ){
		 this.getSessionFactory().getCurrentSession().save(goodt);
	}
	/*删除*/
	public boolean deleteGoodTypeInfo(String goodTypeId){
		try {
			getSessionFactory().getCurrentSession().createQuery("delete GoodTypeInfo goodt where goodt.goodTypeId = :goodTypeId")
			.setString("goodTypeId", goodTypeId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/*查询单个*/
	public GoodTypeInfo selectOneGoodTypeInfo(String goodTypeId) {
		return (GoodTypeInfo) getSessionFactory().getCurrentSession().get(GoodTypeInfo.class, goodTypeId);
	}
	/*修改*/
	public boolean updateGoodTypeInfo(GoodTypeInfo goodt){
		try {
			getSessionFactory().getCurrentSession().createQuery("update GoodTypeInfo goodt set goodt.goodTypeName = :goodTypeName,goodt.goodTypeRemark = :goodTypeRemark where goodt.goodTypeId=:goodTypeId")
			.setString("goodTypeName",goodt.getGoodTypeName())
			.setString("goodTypeRemark", goodt.getGoodTypeRemark())
			.setString("goodTypeId", goodt.getGoodTypeId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<GoodTypeInfo> selectAllByPager(int pageIndex, int pageSize) {
		Pager<GoodTypeInfo> pager = new Pager<GoodTypeInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<GoodTypeInfo> list = getSessionFactory().getCurrentSession().createQuery("from GoodTypeInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from GoodTypeInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
}
