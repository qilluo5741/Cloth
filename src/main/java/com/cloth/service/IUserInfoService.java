package com.cloth.service;

import java.util.List;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;

public interface IUserInfoService {
	public UserInfo selectOneUserInfo(String userId);
	public UserInfo selectOneUser(String userName);
	public boolean updateUserInfoBy(UserInfo user);
	public List<UserInfo> selectAllList();
	public Pager<UserInfo> selectAll(int pageIndex, int pageSize);
}
