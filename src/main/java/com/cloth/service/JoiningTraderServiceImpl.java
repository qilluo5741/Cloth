package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IJoiningTraderDao;
import com.cloth.entity.JoiningTraderInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class JoiningTraderServiceImpl implements IJoiningTraderService {
	
	@Autowired
	private IJoiningTraderDao dao;

	/**
	 * 添加新的加盟商
	 */
	public boolean insertOneJoiningTrader(JoiningTraderInfo join) {
		return dao.insertOneJoiningTrader(join);
	}

	/**
	 * 查询单个加盟商
	 */
	public JoiningTraderInfo selectOneById(String joiningTraderId) {
		return dao.selectOneById(joiningTraderId);
	}

	/**
	 * 查询所有的加盟商返回list
	 */
	public List<JoiningTraderInfo> selectAllToList() {
		return dao.selectAllToList();
	}

	/**
	 * 修改加盟商的基本资料
	 */
	public boolean updateJoininfTraderByid(JoiningTraderInfo joiningTrader) {
		return dao.updateJoininfTraderByid(joiningTrader);
	}
	
	/**
	 * 分页查询
	 */
	public Pager<JoiningTraderInfo> queryAllToJoining(int pageIndex,
			int pageSize) {
		return dao.queryAllToJoining(pageIndex, pageSize);
	}
	
	/**
	 * 让加盟商通过审核
	 */
	public boolean passVerify(String joiningTraderId) {
		return dao.passVerify(joiningTraderId);
	}
	
	/**
	 * 让加盟商不通过审核
	 */
	public boolean noPassVerify(String joiningTraderId) {
		return dao.noPassVerify(joiningTraderId);
	}
}
