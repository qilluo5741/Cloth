package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.FinancialInfo;
import com.cloth.util.Pager;

@Repository
public class FinancialInfoDaoImpl extends HibernateDaoSupport implements IFinancialInfoDao{
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<FinancialInfo> selectbyAll(int pageIndex, int pageSize) {
		Pager<FinancialInfo> pager = new Pager<FinancialInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<FinancialInfo> list = getSessionFactory().getCurrentSession().createQuery("from FinancialInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from FinancialInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	/**
	 * 查询全部
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FinancialInfo> queryAllFinancialInfo(){
		List<FinancialInfo> list= this.getSessionFactory().getCurrentSession().createQuery("from FinancialInfo").list();
		return list;
	}
	public boolean insertOneFinancialInfo(FinancialInfo fina){
		try {
			this.getSessionFactory().getCurrentSession().save(fina);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	public FinancialInfo selectFinancialInfo(String financialId){
		return (FinancialInfo) getSessionFactory().getCurrentSession().get(FinancialInfo.class, financialId);
	}
	/*修改*/
	public boolean updateFinancialInfo(FinancialInfo fina){
		try {
			getSessionFactory().getCurrentSession().createQuery("update FinancialInfo fina set fina.isSpending=:isSpending,fina.financialMoney=:financialMoney,fina.procurement.procurementId=:procurementId,fina.salesRecord.salesRecordId=:salesRecordId,fina.financialRemark=:financialRemark where fina.financialId=:financialId")
			.setString("isSpending", fina.getIsSpending())
			.setString("financialMoney", fina.getFinancialMoney())
			.setString("procurementId",fina.getProcurement().getProcurementId())
			.setString("salesRecordId", fina.getSalesRecord().getSalesRecordId())
			.setString("financialRemark",fina.getFinancialRemark())
			.setString("financialId", fina.getFinancialId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	/*删除*/
	public boolean deleteFinancialInfo(String financialId){
		try {
			getSessionFactory().getCurrentSession().createQuery("delete FinancialInfo fina where fina.financialId = :financialId")
			.setString("financialId", financialId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
