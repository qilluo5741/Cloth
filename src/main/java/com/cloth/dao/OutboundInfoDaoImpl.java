package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.OutboundInfo;
import com.cloth.util.Pager;

@Repository
public class OutboundInfoDaoImpl extends HibernateDaoSupport implements IOutboundInfoDao{
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<OutboundInfo> selectbyAlloutbound(int pageIndex, int pageSize) {
		Pager<OutboundInfo> pager = new Pager<OutboundInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<OutboundInfo> list = getSessionFactory().getCurrentSession().createQuery("from OutboundInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from OutboundInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	/**
	 * 	添加单个
	 * */
	public boolean insertOne(OutboundInfo outb) {
		try {
			this.getSessionFactory().getCurrentSession().save(outb);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 查询单个
	 * */
	public OutboundInfo selectOutboundInfo(String outboundId){
		return (OutboundInfo) getSessionFactory().getCurrentSession().get(OutboundInfo.class, outboundId);
	}
	/**
	 * 
	 */
	/*修改*/
	public boolean updateOutboundInfo(OutboundInfo outb){
		try {
			getSessionFactory().getCurrentSession().createQuery("update OutboundInfo outb set outb.emp.empId=:empId,outb.warehouse.warehouseId=:warehouseId,outb.joiningTrader.joiningTraderId=:joiningTraderId,outb.outboundRemark=:outboundRemark where outb.outboundId=:outboundId")
			.setString("empId", outb.getEmp().getEmpId())
			.setString("warehouseId", outb.getWarehouse().getWarehouseId())
			.setString("joiningTraderId",outb.getJoiningTrader().getJoiningTraderId())
			.setString("outboundRemark", outb.getOutboundRemark())
			.setString("outboundId", outb.getOutboundId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/*删除*/
	public boolean deleteOutboundInfo(String outboundId){
		try {
			getSessionFactory().getCurrentSession().createQuery("delete OutboundInfo outb where outb.outboundId = :outboundId")
			.setString("outboundId", outboundId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
