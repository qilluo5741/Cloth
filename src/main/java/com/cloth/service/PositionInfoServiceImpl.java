package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.cloth.dao.IPositionInfoDao;
import com.cloth.entity.PositionInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class PositionInfoServiceImpl implements IPositionInfoService{
	@Autowired
	private IPositionInfoDao dao;	

	public List<PositionInfo> queryAllPositionInfo(){
		return dao.queryAllPositionInfo();
	}
	public void addPositionInfo(PositionInfo posi){
		dao.addPositionInfo(posi);
	}
	public boolean deletePositionInfo(String positionId){
		return dao.deletePositionInfo(positionId);
	}
	public PositionInfo selectOnePositionInfo(String positionId){
		return dao.selectOnePositionInfo(positionId);
	}
	public boolean updatePositionInfo(PositionInfo posi){
		return dao.updatePositionInfo(posi);
	}
	public Pager<PositionInfo> selectByPager(int pageIndex, int pageSize) {
		return dao.selectByPager(pageIndex, pageSize);
	}
}
