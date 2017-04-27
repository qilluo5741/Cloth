package com.cloth.service;
 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cloth.dao.ITestDao; 
import com.cloth.entity.TestInfo;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class TestServiceImpl  implements ITestService {
	@Autowired
	private ITestDao dao;
	 
	public boolean addTest(TestInfo test) {
		return dao.addTest(test);
	}
}
