package com.cloth.service;

import java.util.List;

import com.cloth.entity.EmpInfo;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;

public interface IEmpInfoService {
	public EmpInfo selectOne(String empId);
	public EmpInfo selectOneByUser(UserInfo user);
	public List<EmpInfo> selectAll();
	public Pager<EmpInfo> selectAllByPager(int pageIndex,int pageSize);
	public boolean updateOneLow(EmpInfo emp);
	public boolean updateOneByStatus(String empId, int isServing);
	public boolean updateOneHigh(EmpInfo emp);
	public boolean insertOne(EmpInfo emp);
}
