package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IFinancialInfoDao;
import com.cloth.entity.FinancialInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class FinancialInfoServiceImpl implements IFinancialInfoService {
	@Autowired
	private IFinancialInfoDao dao;
	
	public Pager<FinancialInfo> selectbyAll(int pageIndex, int pageSize) {
		return dao.selectbyAll(pageIndex, pageSize);
	}
	public List<FinancialInfo> queryAllFinancialInfo(){
		return dao.queryAllFinancialInfo();
	}
	public boolean insertOneFinancialInfo(FinancialInfo fina) {
		return dao.insertOneFinancialInfo(fina);
	}
	public boolean updateFinancialInfo(FinancialInfo fina){
		return dao.updateFinancialInfo(fina);
	}
	public FinancialInfo selectFinancialInfo(String financialId){
		return dao.selectFinancialInfo(financialId);
	}
	public boolean deleteFinancialInfo(String financialId){
		return dao.deleteFinancialInfo(financialId);
	}
}
