package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.cloth.entity.EmpInfo;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;

@Repository
public class EmpDaoImpl extends HibernateDaoSupport implements IEmpInfoDao {

	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}
	
	/**
	 * 查询单个
	 * */
	public EmpInfo selectOne(String empId) {
		return (EmpInfo) getSessionFactory().getCurrentSession().get(EmpInfo.class, empId);
	}
	
	/**
	 * 根据user查询单个
	 * */
	public EmpInfo selectOneByUser(UserInfo user) {
		return (EmpInfo) getSessionFactory().getCurrentSession().createQuery("from EmpInfo emp where emp.user.userId = (select userId from UserInfo user where user.userName = :userName and user.userPwd = :userPwd)")
		.setString("userName", user.getUserName())
		.setString("userPwd", user.getUserPwd())
		.uniqueResult();
	}
	
	/**
	 * 查询所有
	 * */
	@SuppressWarnings("unchecked")
	public List<EmpInfo> selectAll() {
		return getSessionFactory().getCurrentSession().createQuery("from EmpInfo").list();
	}
	
	/**
	 * 分页查询所有
	 * */
	@SuppressWarnings("unchecked")
	public Pager<EmpInfo> selectAllByPager(int pageIndex, int pageSize) {
		Pager<EmpInfo> pager = new Pager<EmpInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<EmpInfo> list = getSessionFactory().getCurrentSession().createQuery("from EmpInfo").setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)getSessionFactory().getCurrentSession().createQuery("select count(*) from EmpInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}
	
	/**
	 * 	添加单个
	 * */
	public boolean insertOne(EmpInfo emp) {
		try {
			emp.setIsServing(0);
			getSessionFactory().getCurrentSession().save(emp);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 	修改单个(基本资料)
	 * */
	public boolean updateOneLow(EmpInfo emp) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update EmpInfo emp set emp.empName = :empName,emp.empPhoto = :empPhoto,emp.empTel = :empTel,emp.empAddress = :empAddress,emp.empRemark = :empRemark where emp.empId = :empId")
			.setString("empName", emp.getEmpName())
			.setString("empPhoto", emp.getEmpPhoto())
			.setString("empTel", emp.getEmpTel())
			.setString("empAddress", emp.getEmpAddress())
			.setString("empRemark", emp.getEmpRemark())
			.setString("empId", emp.getEmpId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 	修改单个(高级资料)
	 * */
	public boolean updateOneHigh(EmpInfo emp) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update EmpInfo emp set emp.empSal = :empSal,emp.position.positionId = :positionId,emp.isServing = :isServing where emp.empId = :empId")
			.setDouble("empSal", emp.getEmpSal())
			.setString("positionId", emp.getPosition().getPositionId())
			.setInteger("isServing", emp.getIsServing())
			.setString("empId", emp.getEmpId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 修改就职状态
	 * */
	public boolean updateOneByStatus(String empId, int isServing) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update EmpInfo emp set emp.isServing = :isServing where emp.empId = :empId")
			.setInteger("isServing", isServing)
			.setString("empId", empId)
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
