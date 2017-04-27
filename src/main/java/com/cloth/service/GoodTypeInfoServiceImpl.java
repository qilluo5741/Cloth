package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IGoodTypeInfoDao;
import com.cloth.entity.GoodTypeInfo;
import com.cloth.util.Pager;


@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class GoodTypeInfoServiceImpl implements IGoodTypeInfoService{
	@Autowired
	private IGoodTypeInfoDao dao;	
	
	public List<GoodTypeInfo> queryAllGoodTypeInfo(){
		return dao.queryAllGoodTypeInfo();
	}
	public void addGoodTypeInfo(GoodTypeInfo goodt){
		dao.addGoodTypeInfo(goodt);
	}
	public boolean deleteGoodTypeInfo(String goodTypeId){
		return dao.deleteGoodTypeInfo(goodTypeId);
	}
	public GoodTypeInfo selectOneGoodTypeInfo(String goodTypeId){
		return dao.selectOneGoodTypeInfo(goodTypeId);
	}
	public boolean updateGoodTypeInfo(GoodTypeInfo goodt){
		return dao.updateGoodTypeInfo(goodt);
	}
	public Pager<GoodTypeInfo> selectAllByPager(int pageIndex, int pageSize) {
		return dao.selectAllByPager(pageIndex, pageSize);
	}
}
