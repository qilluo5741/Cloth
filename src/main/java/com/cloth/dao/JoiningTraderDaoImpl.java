package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.JoiningTraderInfo;
import com.cloth.util.Pager;

@Repository
@SuppressWarnings("unchecked")
public class JoiningTraderDaoImpl extends HibernateDaoSupport implements IJoiningTraderDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	/**
	 *查询单个
	 */
	public JoiningTraderInfo selectOneById(String joiningTraderId) {
		return (JoiningTraderInfo) this.getSessionFactory().getCurrentSession().get(JoiningTraderInfo.class, joiningTraderId);
	}
	
	/**
	 * 添加新的加盟商
	 */
	public boolean insertOneJoiningTrader(JoiningTraderInfo join){
		try {
			this.getSessionFactory().getCurrentSession().save(join);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 查询所有的加盟商返回list
	 */
	public List<JoiningTraderInfo> selectAllToList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from JoiningTraderInfo").list();
	}

	/**
	 * 修改加盟商的基本资料
	 */
	public boolean updateJoininfTraderByid(JoiningTraderInfo joiningTrader) {
		try {
			this.getSessionFactory().getCurrentSession().createQuery("update JoiningTraderInfo joining set joining.joiningTraderTel=?,joining.joiningTraderPeople=?,joining.joiningTraderAddress=? where joining.joiningTraderId=?").setString(0, joiningTrader.getJoiningTraderTel()).setString(1, joiningTrader.getJoiningTraderPeople()).setString(2, joiningTrader.getJoiningTraderAddress()).setString(3, joiningTrader.getJoiningTraderId()).executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 分页查询
	 */
	public Pager<JoiningTraderInfo> queryAllToJoining(int pageIndex,
			int pageSize) {
		Pager<JoiningTraderInfo> pager=new Pager<JoiningTraderInfo>();
		//设置当前页数
		pager.setPageIndex(pageIndex);
		//设置每页的大小
		pager.setPageSize(pageSize);
		List<JoiningTraderInfo> list=this.getSessionFactory().getCurrentSession().createQuery("from JoiningTraderInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from JoiningTraderInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	/**
	 * 让加盟商通过审核
	 */
	public boolean passVerify(String joiningTraderId) {
		int i=this.getSessionFactory().getCurrentSession().createQuery("update JoiningTraderInfo joining set joining.joiningTraderStatus=1 where joining.joiningTraderId=?").setString(0, joiningTraderId).executeUpdate();
		if(i!=0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 让加盟商不通过审核
	 */
	public boolean noPassVerify(String joiningTraderId) {
		int i=this.getSessionFactory().getCurrentSession().createQuery("update JoiningTraderInfo joining set joining.joiningTraderStatus=2 where joining.joiningTraderId=?").setString(0, joiningTraderId).executeUpdate();
		if(i!=0){
			return true;
		}else{
			return false;
		}
	}

}
