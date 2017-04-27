package com.cloth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IJoiningTraderReturnInfoDao;
import com.cloth.entity.JoiningTraderReturnInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class JoiningTraderReturnInfoServiceImpl implements
		IJoiningTraderReturnInfoService {

	@Autowired
	private IJoiningTraderReturnInfoDao jtriDao;
	
	/**
	 * 	查询单个
	 * */
	public JoiningTraderReturnInfo selectOne(String joiningTraderReturnId) {
		return jtriDao.selectOne(joiningTraderReturnId);
	}
	
	/**
	 * 	分页查询所有
	 * */
	public Pager<JoiningTraderReturnInfo> selectAllPager(int pageIndex, int pageSize) {
		return jtriDao.selectAllByPager(pageIndex, pageSize);
	}
	
	/**
	 * 	修改状态
	 * */
	public boolean updateOneByStatus(String joiningTraderReturnId) {
		return jtriDao.updateOneByStatus(joiningTraderReturnId);
	}
	
	/**
	 * 添加单个
	 * */
	public boolean insertOne(JoiningTraderReturnInfo joiningTraderReturn) {
		return jtriDao.insertOne(joiningTraderReturn);
	}

}
