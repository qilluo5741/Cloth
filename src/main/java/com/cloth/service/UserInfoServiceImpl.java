package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IUserInfoDao;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class UserInfoServiceImpl implements IUserInfoService {
	@Autowired
	private IUserInfoDao dao;
	public Pager<UserInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}

	public List<UserInfo> selectAllList() {
		return dao.selectAllList();
	}

	public UserInfo selectOneUserInfo(String userId) {
		return dao.selectOneUserInfo(userId);
	}

	public boolean updateUserInfoBy(UserInfo user) {
		return dao.updateUserInfoBy(user);
	}
	public UserInfo selectOneUser(String userName) {
		return dao.selectOneUser(userName);
	}
}
