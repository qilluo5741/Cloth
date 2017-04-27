package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.IProcurementInfoDao;
import com.cloth.entity.ProcurementInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ProcurementInfoServiceImpl implements IProcurementInfoService {
	@Autowired
	private IProcurementInfoDao dao;	
	public boolean insert(ProcurementInfo procurement) {
		return dao.insert(procurement);
	}

	public Pager<ProcurementInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}

	public List<ProcurementInfo> selectAllList() {
		return dao.selectAllList();
	}

	public ProcurementInfo selectOneById(String ProcurementId) {
		return dao.selectOneById(ProcurementId);
	}
	public boolean deleteProcurementInfo(String ProcurementId) {
		return dao.deleteProcurementInfo(ProcurementId);
	}
	public boolean updateProcurementInfo(ProcurementInfo procurement) {
		return dao.updateProcurementInfo(procurement);
	}
}
