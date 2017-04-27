package com.cloth.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.PositionInfo;
import com.cloth.util.Pager;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

@Repository
public class PositionInfoDaoImpl extends HibernateDaoSupport implements IPositionInfoDao{
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/*查询全部*/
	@SuppressWarnings("unchecked")
	public List<PositionInfo> queryAllPositionInfo(){
			List<PositionInfo> list= this.getSessionFactory().getCurrentSession().createQuery("from PositionInfo").list();
			return list;
	}
	/*添加*/
	public void  addPositionInfo(PositionInfo posi ){
		 this.getSessionFactory().getCurrentSession().save(posi);
	}
	/*删除*/
	public boolean deletePositionInfo(String positionId) {
		try {
			getSessionFactory().getCurrentSession().createQuery("delete PositionInfo p where p.positionId = :positionId")
			.setString("positionId", positionId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/*查询单个*/
	public PositionInfo selectOnePositionInfo(String positionId){
		return (PositionInfo) getSessionFactory().getCurrentSession().get(PositionInfo.class, positionId);
	}
	/*修改*/
	public boolean updatePositionInfo(PositionInfo posi){
		try {
			getSessionFactory().getCurrentSession().createQuery("update PositionInfo posi set posi.positionName = :positionName,posi.positionRemark = :positionRemark where posi.positionId=:positionId")
			.setString("positionName",posi.getPositionName())
			.setString("positionRemark", posi.getPositionRemark())
			.setString("positionId", posi.getPositionId())
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
	public Pager<PositionInfo> selectByPager(int pageIndex, int pageSize) {
		Pager<PositionInfo> pager = new Pager<PositionInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<PositionInfo> list = getSessionFactory().getCurrentSession().createQuery("from PositionInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from PositionInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
}
