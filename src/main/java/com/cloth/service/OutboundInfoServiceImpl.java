package com.cloth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.cloth.dao.IOutboundInfoDao;
import com.cloth.entity.OutboundInfo;
import com.cloth.util.Pager;

@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class OutboundInfoServiceImpl implements IOutboundInfoService{
	@Autowired
	private IOutboundInfoDao dao;
	
	public Pager<OutboundInfo> selectbyAlloutbound(int pageIndex, int pageSize) {
		return dao.selectbyAlloutbound(pageIndex, pageSize);
	}
	public boolean insertOne(OutboundInfo outb) {
		return dao.insertOne(outb);
	}
	public OutboundInfo selectOutboundInfo(String outboundId){
		return dao.selectOutboundInfo(outboundId);
	}
	public boolean updateOutboundInfo(OutboundInfo outb){
		return dao.updateOutboundInfo(outb);
	}
	public boolean deleteOutboundInfo(String outboundId){
		return dao.deleteOutboundInfo(outboundId);
	}
}
