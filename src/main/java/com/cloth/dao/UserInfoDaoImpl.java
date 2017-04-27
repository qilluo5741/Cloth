package com.cloth.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;
@Repository
public class UserInfoDaoImpl extends HibernateDaoSupport implements IUserInfoDao {
	@Autowired
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	@SuppressWarnings("unchecked")
	public Pager<UserInfo> selectAll(int pageIndex, int pageSize) {
		Pager<UserInfo> pager = new Pager<UserInfo>();
		pager.setPageIndex(pageIndex);
		pager.setPageSize(pageSize);
		List<UserInfo> list = this.getSessionFactory().getCurrentSession().createQuery("from UserInfo").setFirstResult((pageIndex - 1) * pageSize + 1).setMaxResults(pageSize).list();
		pager.setList(list);
		pager.setTotalRecords(((Long)this.getSessionFactory().getCurrentSession().createQuery("select count(*) from UserInfo").uniqueResult()).intValue());
		pager.setTotalPages();
		return pager;
	}

	@SuppressWarnings("unchecked")
	public List<UserInfo> selectAllList() {
		return this.getSessionFactory().getCurrentSession().createQuery("from UserInfo").list();
	}

	public UserInfo selectOneUserInfo(String userId) {
		return (UserInfo) getSessionFactory().getCurrentSession().get(UserInfo.class,userId);
	}
	public UserInfo selectOneUser(String userName) {
		return (UserInfo) getSessionFactory().getCurrentSession().get(UserInfo.class,userName);
	}
	public boolean updateUserInfoBy(UserInfo user) {
		try {
			getSessionFactory().getCurrentSession().createQuery("update UserInfo user set user.userName = :userName,user.userPwd = :userPwd,user.userStatus = :userStatus,user.userRemark = :userRemark,user.role.roleId = :roleId where user.userId = :userId")
			.setString("userName",user.getUserName())
			.setString("userPwd", user.getUserPwd())
			.setString("userStatus", user.getUserStatus())
			.setString("userRemark", user.getUserRemark())
			.setString("roleId", user.getRole().getRoleId())
			.setString("userId", user.getUserId())
			.executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
}
