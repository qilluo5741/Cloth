package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IEmpInfoDao;
import com.cloth.entity.EmpInfo;
import com.cloth.entity.UserInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class EmpInfoServiceImpl implements IEmpInfoService {

	@Autowired
	private IEmpInfoDao empDao;
	
	public EmpInfo selectOne(String empId) {
		return empDao.selectOne(empId);
	}
	
	public Pager<EmpInfo> selectAllByPager(int pageIndex, int pageSize) {
		return empDao.selectAllByPager(pageIndex, pageSize);
	}
	
	public List<EmpInfo> selectAll() {
		return empDao.selectAll();
	}
	
	public boolean insertOne(EmpInfo emp) {
		return empDao.insertOne(emp);
	}
	
	public boolean updateOneHigh(EmpInfo emp) {
		return empDao.updateOneHigh(emp);
	}
	
	public boolean updateOneLow(EmpInfo emp) {
		return empDao.updateOneLow(emp);
	}
	
	public EmpInfo selectOneByUser(UserInfo user) {
		return empDao.selectOneByUser(user);
	}

	public boolean updateOneByStatus(String empId, int isServing) {
		return empDao.updateOneByStatus(empId, isServing);
	}
}
