package com.cloth.service;

import com.cloth.entity.LocalReturnInfo;
import com.cloth.util.Pager;

public interface ILocalReturnService {
	public Pager<LocalReturnInfo> queryLocalAll(int pageIndex,int pageSize);//查询所有的本地退货记录
	public boolean updateReturnStatus(String returnId);//改变退货状态
	public LocalReturnInfo selectOntByReturnId(String returnId);//根据Id查询单个退货记录
	public boolean returnGoods(LocalReturnInfo locals,String empId,String outboundId);//本地退货
}
