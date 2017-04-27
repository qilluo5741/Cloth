package com.cloth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.cloth.dao.IMenuInfoDao;
import com.cloth.entity.MenuInfo;
import com.cloth.util.Pager;
@Service
@Transactional(readOnly=false,propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class MenuInfoServiceImpl implements IMenuInfoService {
	@Autowired
	private IMenuInfoDao dao;
	public Pager<MenuInfo> selectAll(int pageIndex, int pageSize) {
		return dao.selectAll(pageIndex, pageSize);
	}
	public List<MenuInfo> selectAllList() {
		return dao.selectAllList();
	}
	public boolean updateMenuInfoBy(MenuInfo Menu) {
		return dao.updateMenuInfoBy(Menu);
	}
	public MenuInfo selectOneMenuInfo(String menuId) {
		return dao.selectOneMenuInfo(menuId);
	}
}
