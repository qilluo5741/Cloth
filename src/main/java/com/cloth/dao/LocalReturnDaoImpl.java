package com.cloth.dao;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.LocalReturnInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class LocalReturnDaoImpl extends HibernateDaoSupport implements ILocalReturnDao {
	
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	/**
	 * 查询所有
	 */
	public Pager<LocalReturnInfo> queryLocalAll(int pageIndex, int pageSize) {
		Pager<LocalReturnInfo> pager=new Pager<LocalReturnInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<LocalReturnInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from LocalReturnInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from LocalReturnInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 修改本地对货状态
	 */
	public boolean updateReturnStatus(String returnId) {
		int row=this.getSessionFactory().getCurrentSession().createQuery("update LocalReturnInfo localreturn set localreturn.returnStatus=0 where localreturn.returnId=?").setString(0, returnId).executeUpdate();
		if(row!=0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 根据id查询单个退货记录
	 */
	public LocalReturnInfo selectOntByReturnId(String returnId) {
		return (LocalReturnInfo) this.getSessionFactory().getCurrentSession().get(LocalReturnInfo.class, returnId);
	}
	public boolean returnGoods(LocalReturnInfo locals, String empId,
			String outboundId) {
		try {
			this.getSessionFactory().getCurrentSession().createSQLQuery("{call pro_localreturnGoods(?,?,?,?,?,?,?)}").setString(0, locals.getReturnId()).setString(1, locals.getGoodsName()).setString(2, locals.getColorName()).setString(3, locals.getSizeName()).setInteger(4, locals.getGoodsNum()).setString(5, empId).setString(6, outboundId).executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
