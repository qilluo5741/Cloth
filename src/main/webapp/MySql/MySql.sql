/*跳转到test用户数据库*/
use cloth;
/*创建角色表*/
create table RoleInfo
(
 	roleId varchar(36) primary key not null,
    roleName varchar(100) not null
);
/*插入数据*/
insert into RoleInfo values('24333928814870528','管理员');
insert into RoleInfo values('24333928814870529','加盟商');
insert into RoleInfo values('24333928814870530','员工');
insert into RoleInfo values('24333928814870531','子公司');
insert into RoleInfo values('24333928814870532','总经理');
insert into RoleInfo values('24333928814870533','superAdmin');
insert into RoleInfo values('24333928814870534','用户');
/*查询*/
select * from RoleInfo;
/*用户表*/
create table UserInfo
(
    userId varchar(36) primary key not null,
    userName varchar(20) not null,
    userPwd varchar(20) not null,
	userStatus int not null,/*0 审核中  1 成功  2失败*/
    userTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
    userRemark varchar(500) not null,
    roleId varchar(36) not null /*角色外键*/
);
alter table UserInfo
         add constraint fk_UserInfo_roleId foreign key(roleId) references RoleInfo(roleId);
/*插入数据*/
insert into UserInfo values('24333928814870534','章科','123456',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870535','彭安琳','632541',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870536','聂伟','632541',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870537','罗梓溶','632541',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870538','周美玲','632541',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870539','胡介涛','632541',1,default,'这家伙很懒,什么都没留下','24333928814870528');
insert into UserInfo values('24333928814870540','博垢','632541',1,default,'这家伙很懒,什么都没留下','24333928814870534');
insert into UserInfo values('24333928814870541','赵钱','111111',0,default,'这家伙很懒,什么都没留下','24333928814870534');
insert into UserInfo values('24333928814870542','孙李','111111',0,default,'这家伙很懒,什么都没留下','24333928814870534');
insert into UserInfo values('24333928814870543','周吴','111111',0,default,'这家伙很懒,什么都没留下','24333928814870534');
insert into UserInfo values('24333928814870544','郑王','111111',0,default,'这家伙很懒,什么都没留下','24333928814870534');
insert into UserInfo values('24333928814877777','第六组','111111',1,default,'这家伙很懒,什么都没留下','24333928814870533');
insert into UserInfo values('24333928814887777','采购员','111111',1,default,'这家伙很懒,什么都没留下','24333928814870530');
/*查询*/
select * from UserInfo;

/*菜单类型*/
create table MenuType
(
	menuTypeId varchar(36) primary key not null,
	menuTypeName varchar(60) not null,
	remark varchar(100)
);
insert into MenuType values('24333928814870996','用户管理','用户管理');
insert into MenuType values('24333928814870997','菜单管理','菜单管理');
insert into MenuType values('24333928814870998','权限管理','权限管理');
insert into MenuType values('24333928814870999','用户管理','用户管理');
insert into MenuType values('24333928814871001','退货管理','退货管理');
insert into MenuType values('24333928814871002','加盟管理','加盟管理');
insert into MenuType values('24333928814871003','仓库管理','仓库管理');
insert into MenuType values('24333928814871004','商品管理','商品管理');
insert into MenuType values('24333928814871005','配送管理','配送管理');
insert into MenuType values('24333928814871006','财务管理','财务管理');
insert into MenuType values('24333928814871007','供应商管理','供应商管理');
insert into MenuType values('24333928814871008','采购管理','采购管理');
/*查询*/
select * from MenuType;
/*菜单表*/
create table MenuInfo
(
 	   menuId varchar(36) primary key not null,
		 menuName varchar(30) not null,
		 href varchar(300) not null,
		 target varchar(100),
		 menuTypeId varchar(36) references MenuType(menuTypeId)
);
/*插入数据*/
insert into MenuInfo values('24333928814870545','采购','Procure/selectAll.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870546','职位','select/selectByPager.action','rightFrame','24333928814870999');
insert into MenuInfo values('24333928814870547','本地退货','localReturn/queryLocalReturn.action','rightFrame','24333928814871001');
insert into MenuInfo values('24333928814870548','加盟商退货','joiningTraderReturn/selectAllByPager.action','rightFrame','24333928814871001');
insert into MenuInfo values('24333928814870549','加盟','join/queryAllToJoining.action','rightFrame','24333928814871002');
insert into MenuInfo values('24333928814870550','商品类型','select/selectAllByPager.action','rightFrame','24333928814871004');
insert into MenuInfo values('24333928814870551','库存','goodsInventory/selectAllByPager.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870552','商品','goods/queryallBypager.action','rightFrame','24333928814871004');
insert into MenuInfo values('24333928814870553','员工','emp/selectAllByPager.action','rightFrame','24333928814870999');
insert into MenuInfo values('24333928814870554','颜色','color/querySelectAll.action','rightFrame','24333928814871004');
insert into MenuInfo values('24333928814870555','仓库','Warehouse/selectAll.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870556','仓库记录','WarehousLog/selectAll.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870772','尺码','size/queryAllSize.action','rightFrame','24333928814871004');
insert into MenuInfo values('24333928814870773','供应商','supplier/querySelectAll.action','rightFrame','24333928814871007');
insert into MenuInfo values('24333928814870774','财务','select/selectbyAll.action','rightFrame','24333928814871006');
insert into MenuInfo values('24333928814870775','配送记录','distribution/querySelectAll.action','rightFrame','24333928814871005');
insert into MenuInfo values('24333928814870776','申请','Order/queryAllByPager.action','rightFrame','24333928814871005');
insert into MenuInfo values('24333928814870777','出库','select/selectbyAlloutbound.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870778','销售','salesRecord/selectAllByPager.action','rightFrame','24333928814871004');
insert into MenuInfo values('24333928814870779','权限','jurisdiction/getReole.action','rightFrame','24333928814870998');
insert into MenuInfo values('24333928814870780','菜单','Menu/selectAll.action','rightFrame','24333928814870997');
insert into MenuInfo values('24333928814870781','用户','User/selectAll.action','rightFrame','24333928814870996');
insert into MenuInfo values('24333928814870782','菜单类型','jurisdiction/getMenuType.action?pageIndex=1','rightFrame','24333928814870997');
insert into MenuInfo values('24333928814870783','入库','inbound/querySelectAll.action','rightFrame','24333928814871003');
insert into MenuInfo values('24333928814870784','采购','goodsinsert.jsp','rightFrame','24333928814871008');
/*查询*/
select * from MenuInfo;
/*菜单管理表:*/
create table MenuRoleInfo
(
	rmid  varchar(36) primary key not null,
	menuId varchar(36) not null references MenuInfo(menuId),
	roleId varchar(36) null references RoleInfo(roleId)
);
/*插入数据*/
insert into MenuRoleInfo values('24333928814870557','24333928814870545','24333928814870528');
insert into MenuRoleInfo values('24333928814870558','24333928814870546','24333928814870528');
insert into MenuRoleInfo values('24333928814870559','24333928814870547','24333928814870528');
insert into MenuRoleInfo values('24333928814870560','24333928814870548','24333928814870528');
insert into MenuRoleInfo values('24333928814870561','24333928814870549','24333928814870528');
insert into MenuRoleInfo values('24333928814870562','24333928814870550','24333928814870528');
insert into MenuRoleInfo values('24333928814870563','24333928814870554','24333928814870528');
insert into MenuRoleInfo values('24333928814870775','24333928814870551','24333928814870528');
insert into MenuRoleInfo values('24333928814870776','24333928814870552','24333928814870528');
insert into MenuRoleInfo values('24333928814870777','24333928814870553','24333928814870528');
insert into MenuRoleInfo values('24333928814870778','24333928814870555','24333928814870528');
insert into MenuRoleInfo values('24333928814870779','24333928814870556','24333928814870528');
insert into MenuRoleInfo values('24333928814870780','24333928814870772','24333928814870528');
insert into MenuRoleInfo values('24333928814870781','24333928814870773','24333928814870528');
insert into MenuRoleInfo values('24333928814870782','24333928814870774','24333928814870528');
insert into MenuRoleInfo values('24333928814870783','24333928814870775','24333928814870528');
insert into MenuRoleInfo values('24333928814870784','24333928814870776','24333928814870528');
insert into MenuRoleInfo values('24333928814870785','24333928814870777','24333928814870528');
insert into MenuRoleInfo values('24333928814870786','24333928814870778','24333928814870528');
insert into MenuRoleInfo values('24333928814870787','24333928814870779','24333928814870533');
insert into MenuRoleInfo values('24333928814870788','24333928814870780','24333928814870533');
insert into MenuRoleInfo values('24333928814870789','24333928814870781','24333928814870533');
insert into MenuRoleInfo values('24333928814870790','24333928814870782','24333928814870533');
insert into MenuRoleInfo values('24333928814870791','24333928814870783','24333928814870528');
insert into MenuRoleInfo values('24333928814870792','24333928814870784','24333928814870530');
/*查询*/
select * from MenuRoleInfo;
/*职位表*/
create table PositionInfo
(
	 positionId varchar(36) primary key not null,
	 positionName  varchar(36) not null,
     positionRemark varchar(500) not null
);
/*插入数据*/
insert into PositionInfo values('24333928814870568','部门经理','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870569','市场总监','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870570','财务总监','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870571','仓库管理员','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870572','采购员','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870573','销售员','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870574','搬运工','这家伙很懒,什么都没留下');
insert into PositionInfo values('24333928814870583','销售记录员','这家伙很懒,什么都没留下');
/*查询*/
select * from PositionInfo;

/*员工表*/
create table EmpInfo
(
    empId  varchar(36) primary key not null,
    empName  varchar(36) not null,
    empGender varchar(36) not null,
    empAge int not null,
    empPhoto varchar(36) not null,
    empTel varchar(36) not null,
    empSal double not null,
    empCardNo  varchar(36) not null,
    empAddress varchar(36) not null,
    empRemark varchar(36) not null,
    positionId  varchar(36) not null,/*--职位外键*/
	userId varchar(36) references userInfo(userId),
	isServing int not null default 0
);
alter table EmpInfo
         add constraint fk_EmpInfo_positionId foreign key(positionId) references PositionInfo(positionId);
/*插入数据*/
insert into EmpInfo values('24333928814870584','章科','男',18,'1.jpg','13854389438',10000,'500000199001021111','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870568','24333928814870534',0);
insert into EmpInfo values('24333928814870585','彭安琳','女',19,'2.jpg','13854389439',10000,'500000199001021112','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870569','24333928814870535',0);
insert into EmpInfo values('24333928814870586','胡介涛','男',19,'3.png','13854389439',10000,'500000199001021113','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870570','24333928814870536',0);
insert into EmpInfo values('24333928814870587','聂伟','男',19,'4.png','13854389439',10000,'500000199001021114','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870571','24333928814870537',0);
insert into EmpInfo values('24333928814870588','周美玲','女',19,'5.jpg','13854389439',10000,'500000199001021115','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870572','24333928814870538',0);
insert into EmpInfo values('24333928814870589','罗梓溶','女',19,'1.jpg','13854389439',10000,'500000199001021116','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870573','24333928814870539',0);
insert into EmpInfo values('24333928814870590','赵柳','女',19,'2.jpg','13854389439',10000,'500000199001021117','重庆市沙坪坝','这家伙很懒,什么都没留下！','24333928814870573','24333928814870539',0);
/*查询*/
select * from EmpInfo;	 
/*供应商*/  
create table SupplierInfo
(
	supplierId varchar(36) primary key not null,
	supplierName varchar(36) not null,
	supplierPeople varchar(36) not null,
	supplierAddress varchar(36) not null,
	supplierTel varchar(36) not null,
	supplierRemark varchar(500) not null
);

/*插入数据*/
insert into SupplierInfo values('24333928814870599','景宁英川和顺有限公司','赵六','北京市朝阳区','13854389440','这家伙很懒, 什么都没留下！');
insert into SupplierInfo values('24333928814870600','浙江元康有限公司','田四','北京市朝阳区','13854389447','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870601','缙云县夏氏有限公司','田七','北京市朝阳区','13854389441','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870602','龙泉市乔丰制衣厂','张三','北京市朝阳区','13854389442','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870603','丽水永林有限公司','李四','北京市朝阳区','13854389443','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870604','庆元县森海吊瓜专业合作社','王五','北京市朝阳区','13854389444','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870605','龙泉绿瓯有限公司','王八','北京市朝阳区','13854389445','这家伙很懒,什么都没留下！');
insert into SupplierInfo values('24333928814870606','庆元县兰天绿谷实业有限公司','九州','北京市朝阳区','13854389446','这家伙很懒,什么都没留下！');
/*查询*/
select * from SupplierInfo;

/*本地退货表*/
create table LocalReturnInfo
(
	returnId varchar(36) primary key not null,
	returnOrExchange int not null,/*--退货还是换货  0：退  1换*/
	returnTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),/*--退货发起时间*/
	returnRemark varchar(500) not null,/*--退货说明*/
	goodsName varchar(36) not null,/* –退货商品名称*/
	colorName varchar(36) not null,/* –退货商品颜色*/
	sizeName varchar(36) not null,/* –退货商品大小*/
	goodsNum int not null,/*退货的商品数量*/
	returnStatus int not null,/*退(换)货状态0:已 1：未*/
	warehouseId varchar(36) not null references WarehouseInfo(warehouseId)/*—从劣质商品仓库中拿出*/
);
/*插入数据*/
insert into LocalReturnInfo values('24333928814870771',0,default,'这家伙很懒,什么都没留下！','牛仔裤','黑色','L',1,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814870772',0,default,'这家伙很懒,什么都没留下！','毛皮大衣','白色','M',6,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814870773',1,default,'这家伙很懒,什么都没留下！','休闲裤','黑色','26',10,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814870774',0,default,'这家伙很懒,什么都没留下！','休闲装','天蓝色','L',9,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814870775',1,default,'这家伙很懒,什么都没留下！','羽绒服','蜜色','XL',9,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814870776',0,default,'这家伙很懒,什么都没留下！','打底裤','黑色','L',9,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814870777',1,default,'这家伙很懒,什么都没留下！','职业装','白色','M',9,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814170777',1,default,'这家伙很懒,什么都没留下！','衬衣','白色','L',45,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814270777',1,default,'这家伙很懒,什么都没留下！','毛衣','红色','M',65,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814370777',0,default,'这家伙很懒,什么都没留下！','休闲裤','黑色','27',59,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814470777',1,default,'这家伙很懒,什么都没留下！','牛仔裤','间海蓝','26',87,0,'24333928814870687');
insert into LocalReturnInfo values('24333928814570777',0,default,'这家伙很懒,什么都没留下！','衬衣','白色','M',34,1,'24333928814870687');
insert into LocalReturnInfo values('24333928814670777',1,default,'这家伙很懒,什么都没留下！','毛衣','米色','M',19,0,'24333928814870687');
/*查询*/
select * from LocalReturnInfo;
/*加盟表*/
create table JoiningTraderInfo
(
	joiningTraderId varchar(36) primary key not null,
	isSubsidiary  int not null,/*-- 0   1    0 代表子公司  1  代表加盟商*/
	joiningTraderNo int not null,/*--第几期加盟*/
	joiningTraderYear int not null,/*--年限*/
	joiningTraderTime timestamp not NULL DEFAULT CURRENT_TIMESTAMP(),/*--加盟时间*/
	joiningTraderName varchar(36) not null,/*--加盟名字*/
	joiningTraderMoney double not null,/*--加盟资金*/
	joiningTraderTel varchar(20) not NULL,/*加盟商联系方式*/
	joiningTraderStatus int not null, /* --加盟状态  0 审核中  1 已经加盟成功  2审核失败*/
    joiningWarning int not null,/*加盟提醒0,1*/
	joiningTraderPeople varchar(30) not null,/*联系人*/
	userId varchar(36) references userInfo(userId),/*--加盟商对的用户*/
	joiningTraderAddress varchar(36) not null/*--加盟地点*/
);
/*插入数据*/
insert into JoiningTraderInfo values('24333928814870616',1,6,5,default,'伊雪',6000000,'13060244511',1,0,'张三','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870617',0,6,3,'2015-04-01 10:53:24','典扼',7000000,'13060244531',0,0,'李四','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870618',0,3,6,'2010-05-15 10:53:24','指尖',7000000,'13060244532',1,1,'王五','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870619',0,6,3,default,'徘徊',7000000,'13060244533',0,0,'赵六','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870620',0,6,3,'2014-04-15 01:03:24','嘴鸥',7000000,'13060244534',0,0,'田七','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870621',0,6,3,'2015-11-12 11:12:24','联通',7000000,'13060244535',1,0,'六八','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870622',0,6,3,default,'移动',7000000,'13060244536',0,0,'学姐','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24333928814870623',0,6,3,default,'电信',7000000,'13060245371',2,0,'宅男','24333928814870541','重庆市沙坪坝');
insert into JoiningTraderInfo values('24123959123471234',0,4,3,'2013-09-06 15:53:24','特步',2000000,'13060245671',1,1,'你猜','24333928814870541','重庆市渝北区');
/*查询*/
select * from JoiningTraderInfo;

/*商品类型*/
create table GoodTypeInfo
(
	goodTypeId varchar(36) primary key not null,
	goodTypeName varchar(36) not null,
	goodTypeRemark varchar(36) not null
);
/*插入数据*/
insert into GoodTypeInfo values('24333928814870633','职业工装','这家伙很懒,什么都没留下！');
insert into GoodTypeInfo values('24333928814870634','休闲系列','这家伙很懒,什么都没留下！');
insert into GoodTypeInfo values('24333928814870635','淑女系列','这家伙很懒,什么都没留下！');
insert into GoodTypeInfo values('24333928814870636','运动系列','这家伙很懒,什么都没留下！');
insert into GoodTypeInfo values('24333928814870637','冬装系列','这家伙很懒,什么都没留下！');
/*查询*/
select * from GoodTypeInfo;

/*尺码表*/
create table SizeInfo
(
	sizeId varchar(36) primary key not null,
	sizeName varchar(36) not null,
	sizeRemark varchar(500) not null,
	goodTypeId  varchar(36) not null/*--商品类型*/
);
alter table SizeInfo
         add constraint fk_SizeInfo_goodTypeId foreign key(goodTypeId) references GoodTypeInfo(goodTypeId);
/*插入数据*/
insert into SizeInfo values('24333928814870650','ss','这家伙很懒,什么都没留下！','24333928814870633');/*职业工装*/
insert into SizeInfo values('24333928814870651','XL','这家伙很懒,什么都没留下！','24333928814870634');/*休闲系列*/
insert into SizeInfo values('24333928814870652','S','这家伙很懒,什么都没留下！','24333928814870635');/*淑女系列*/
insert into SizeInfo values('24333928814870653','M','这家伙很懒,什么都没留下！','24333928814870636');/*运动系列*/
insert into SizeInfo values('24333928814870654','L','这家伙很懒,什么都没留下！','24333928814870637');/*冬装系列*/
insert into SizeInfo values('24333928814870655','XXL','这家伙很懒,什么都没留下！','24333928814870637');/*冬装系列*/
insert into SizeInfo values('24333928814870656','35','这家伙很懒,什么都没留下！','24333928814870634');/*休闲系列*/
insert into SizeInfo values('24333928824870651','36','这家伙很懒,什么都没留下！','24333928814870633');/*职业工装*/
insert into SizeInfo values('24333928834870652','37','这家伙很懒,什么都没留下！','24333928814870634');/*休闲系列*/
insert into SizeInfo values('24333928844870653','38','这家伙很懒,什么都没留下！','24333928814870635');/*淑女系列*/
insert into SizeInfo values('24333928854870654','26','这家伙很懒,什么都没留下！','24333928814870636');/*运动系列*/
insert into SizeInfo values('24333928864870655','27','这家伙很懒,什么都没留下！','24333928814870637');/*冬装系列*/
insert into SizeInfo values('24333928874870657','28','这家伙很懒,什么都没留下！','24333928814870633');/*职业工装*/
insert into SizeInfo values('24333921874870657','39','这家伙很懒,什么都没留下！','24333928814870634');/*休闲系列*/
insert into SizeInfo values('24333922874870657','41','这家伙很懒,什么都没留下！','24333928814870635');/*淑女系列*/
insert into SizeInfo values('24333923874870657','42','这家伙很懒,什么都没留下！','24333928814870636');/*运动系列*/

/*查询*/
select * from SizeInfo;
		 
		 
/*颜色表*/
create table ColorInfo
(
	colorId varchar(36) primary key not null,
	colorNo varchar(36) not null,
	colorName varchar(30) not null,
	colorRemark varchar(30) not null
);
/*插入数据*/
insert into ColorInfo values('24333928814870657','red','红色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870658','#FFFFFF','白色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870659','#000000','黑色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870660','#FFFAF0','花白色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870661','#FFF0F5','淡紫红','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870662','#2F4F4F','墨绿色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870663','#5F9EA0','军兰色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870664','#008000','绿色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870665','#F5F5DC','米色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870666','#3CB371','间海蓝','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870667','#F0FFF0','蜜色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928814870668','#87CEEB','天蓝色','这家伙很懒,什么都没留下！');
insert into ColorInfo values('24333928863259668','gray','灰色','这家伙很懒,什么都没留下！');
/*查询*/
select * from ColorInfo;

/*仓库表*/
create table WarehouseInfo
(
	warehouseId varchar(36) primary key not null,/*id*/
	warehouseName varchar(36) not null,/*仓库编号*/
	warehouseAddress varchar(50) not null,/*仓库所在位置*/
	empId varchar(36) not null/*--员工（仓库管理员）*/
);
alter table WarehouseInfo
         add constraint fk_WarehouseInfo_empId foreign key(empId) references EmpInfo(empId);
		 
/*插入数据*/
insert into WarehouseInfo values('24333928814870681','1号仓库','上海市嘉定区','24333928814870584');
insert into WarehouseInfo values('24333928814870682','2号仓库','上海市嘉定区','24333928814870585');
insert into WarehouseInfo values('24333928814870683','3号仓库','上海市嘉定区','24333928814870586');
insert into WarehouseInfo values('24333928814870684','4号仓库','上海市嘉定区','24333928814870587');
insert into WarehouseInfo values('24333928814870685','5号仓库','上海市嘉定区','24333928814870588');
insert into WarehouseInfo values('24333928814870686','6号仓库','上海市嘉定区','24333928814870589');
insert into WarehouseInfo values('24333928814870687','质检仓库','上海市闵行区','24333928814870590');
/*查询*/
select * from WarehouseInfo;

/*采购表：*/
create table ProcurementInfo
(
	procurementId varchar(36) primary key not null,
	procurementTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	supplierId varchar(36) not null references Supplierinfo(supplierId),/*供应商外键*/
	empId varchar(36) not null,/*采购人（员工）*/
	procuremenRemark varchar(500)/*--说明*/
);
alter table ProcurementInfo
			   add constraint fk_ProcurInfo_empId foreign key(empId) references EmpInfo(empId);
/*插入数据*/
insert into ProcurementInfo values('24333928814870697',default,'24333928814870599','24333928814870584','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870698',default,'24333928814870600','24333928814870585','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870699',default,'24333928814870601','24333928814870586','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870700',default,'24333928814870602','24333928814870587','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870701',default,'24333928814870603','24333928814870588','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870702',default,'24333928814870604','24333928814870589','这家伙很懒,什么都没留下！');
insert into ProcurementInfo values('24333928814870703',default,'24333928814870605','24333928814870590','这家伙很懒,什么都没留下！');
/*查询*/
select * from ProcurementInfo;

/*商品表：*/
create table GoodsInfo
(
	goodsId varchar(36) primary key not null,
	goodsNo varchar(36) not null,/*--商品编号*/
	goodsName varchar(36) not null,
	colorId varchar(36) not null references ColorInfo(colorId),/*--商品颜色*/
	sizeId varchar(36) not null references SizeInfo(sizeId),/*--商品码号（备注 可以通过码号得到商品类型）*/
	goodsNum int not null,/*--商品数量*/
	goodsCode varchar(36) not null,/*--条形码*/
	goodsImg varchar(36) not null,/*--商品图片*/
	goodsInPrice double not null,/*--商品进价*/
	goodsOutPrice double not null,/*--商品售价*/
	goodsDiscount double not null,/*--商品折扣*/
	goodsRemark varchar(500) not null,/*--商品说明*/
	enterTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),/*商品录入时间*/
	procurementId varchar(36) not null/*--采购表（外键）*/
);
alter table GoodsInfo
		 add constraint fk_GoodsInfo_procurementId foreign key(procurementId) references ProcurementInfo(procurementId);
/*插入数据*/
insert into GoodsInfo values('24333928814870729','10021457','职业小西装','24333928814870665','24333928814870650',500,'10021456.png','whiteZhi.jpeg',100,260,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870769','10021457','黑色西装','24333928814870665','24333928814870650',500,'10021456.png','heixizhuangnan.jpg',500,760,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870770','10021457','都市职人','24333928814870665','24333928814870650',500,'10021456.png','heixizhuang.jpg',300,560,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870771','10021457','衬衣','24333928814870665','24333928814870650',500,'10021456.png','chenwhite.jpg',100,160,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870772','10021457','衬衣','24333928814870667','24333928814870651',500,'10021456.png','whites.jpeg',120,200,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870730','10021456','休闲裤','24333928814870659','24333928814870651',500,'10021457.png','xiuxianku.jpg',300,400,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870698');
insert into GoodsInfo values('24333928814870731','10021458','休闲裤','24333928814870667','24333928814870653',500,'10021458.png','xiuxianku2.jpg',200,298,7.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870699');
insert into GoodsInfo values('24333928814870732','10021459','运动裤','24333928814870668','24333928814870653',500,'10021459.png','yundongkunan.jpg',200,356,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870700');
insert into GoodsInfo values('24333928814870733','10021460','毛衣','24333928814870666','24333928814870654',500,'10021460.png','maoyi1.jpg',100,198,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870701');
insert into GoodsInfo values('24333928814870734','10021461','胖MM毛衣','24333928814870665','24333928814870655',500,'10021461.png','maoyi2.jpg',50,100,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870702');
insert into GoodsInfo values('24333928814870735','10021462','呢子大衣','24333928814870658','24333928814870654',500,'10021462.png','nizidayi.jpg',100,178,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333928814810729','10021457','加大号套头卫衣','24333928814870658','24333928814870654',500,'10021457.png','taotouweiyi1.jpg',80,159,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814820730','10021457','休闲T恤','24333928814870666','24333928814870651',500,'10021457.png','yundongTxunv.jpg',100,129,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870698');
insert into GoodsInfo values('24333928814830732','10021459','夏秋系列运动上衣女','24333928814870658','24333928814870653',500,'10021459.png','yundongwaitaonv.jpg',300,420,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870700');
insert into GoodsInfo values('24333123654870735','10021462','修身版T恤男','24333928814870658','24333928814870653',500,'10021462.png','yundongTxunan.jpg',80,120,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333123651236589','10021462','茧型羽绒服','24333928863259668','24333928864870655',500,'10021457.png','tpic_t_25165659.jpg',350,550,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333123654123654','10021462','修身版运动上衣','24333928814870658','24333928814870653',500,'10021461.png','yundongwaitaonan2.jpg',200,360,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333928814870755','10021457','修身版衬衣','24333928814870665','24333928814870650',500,'10021456.png','chenyi.jpg',100,160,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814870756','10021456','欧美范儿A字裙','24333928814870659','24333928814870652',500,'10021457.png','Aziqun.jpg',100,130,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870698');
insert into GoodsInfo values('24333928814870757','10021458','纯色小外套','24333928814870667','24333928814870652',500,'10021458.png','chunsewaitao.jpg',250,350,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870699');
insert into GoodsInfo values('24333928814870758','10021459','撞色运动鞋 女','24333928814870668','24333928814870653',500,'10021459.png','yundongxie3.jpg',600,780,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870700');
insert into GoodsInfo values('24333928814870759','10021460','浪莎连袜打底裤','24333928814870666','24333928814870654',500,'10021460.png','dadiku.jpg',30,49,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870701');
insert into GoodsInfo values('24333928814870760','10021461','胖MM毛衣','24333928814870666','24333928814870653',500,'10021461.png','woollymi.jpg',39,60,9.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870702');
insert into GoodsInfo values('24333928814870761','10021462','呢子大衣','24333928814870659','24333928814870652',500,'10021462.png','nizidayi1.jpg',210,320,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333928814810762','10021457','加大号套头卫衣','24333928814870668','24333928864870655',500,'10021457.png','taotouweiyi2.jpg',100,160,8.0,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870697');
insert into GoodsInfo values('24333928814820763','10021457','男款运动鞋','24333928814870666','24333928814870653',500,'10021457.png','yundongxie2.jpg',500,680,7.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870698');
insert into GoodsInfo values('24333928814830764','10021459','夏秋系列运动上衣男','24333928814870658','24333928814870653',500,'10021459.png','yundongwaitaonan.jpg',200,330,8.5,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870700');
insert into GoodsInfo values('24333123654870766','10021462','修身版运动T恤女','24333928814870658','24333928814870653',500,'10021462.png','yundongTxunv.jpg',98,128,9.5,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333123651236567','10021462','茧型呢子外套','24333928863259666','24333928864870652',500,'10021457.png','overcoat.jpg',190,265,8.8,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');
insert into GoodsInfo values('24333123654123668','10021462','男款运动鞋','24333928814870658','24333928814870652',500,'10021461.png','yundongxie1.jpg',500,650,8.9,'这家伙很懒,什么都没留下！',DEFAULT,'24333928814870703');

/*查询*/
select * from GoodsInfo;

/*库存表*/
create table GoodsInventoryInfo
( 
	goodsInventoryId varchar(36) primary key not null,
	goodsName  varchar(36) not null,/*--商品名称   不是外键*/
	colorName varchar(36) not null,/*商品颜色  不是外键*/
	sizeName varchar(36) not null,/*商品码号（备注 可以通过码号得到商品类型）不是外键*/
	goodsNum int not null,/*商品数量*/
	warehouseId varchar(36) not null references WarehouseInfo(warehouseId)/*仓库*/
);
insert into GoodsInventoryInfo values('24333928814870735','职业小西装','白色','S',556,'24333928814870681');
insert into GoodsInventoryInfo values('24333928814870736','职业小西装','白色','M',684,'24333928814870681');
insert into GoodsInventoryInfo values('24333928814870737','黑色西装','黑色','L',128,'24333928814870682');
insert into GoodsInventoryInfo values('24333928814870738','黑色西装','黑色','M',257,'24333928814870682');
insert into GoodsInventoryInfo values('24333928814870739','都市职人','黑色','S',681,'24333928814870683');
insert into GoodsInventoryInfo values('24333928814870740','都市职人','黑色','M',1101,'24333928814870683');
insert into GoodsInventoryInfo values('24333928814870741','衬衣','白色','S',654,'24333928814870683');
insert into GoodsInventoryInfo values('24333928814870742','衬衣','白色','M',555,'24333928814870683');
insert into GoodsInventoryInfo values('24333928814870743','衬衣','白色','L',1547,'24333928814870683');
insert into GoodsInventoryInfo values('24331234514870744','休闲裤','蜜色','M',663,'24333928814870687');
insert into GoodsInventoryInfo values('24331234514870745','休闲裤','黑色','M',963,'24333928814870687');
insert into GoodsInventoryInfo values('24334567814870746','运动裤','灰色','M',563,'24333928814870687');
insert into GoodsInventoryInfo values('24334567814870747','运动裤','灰色','L',745,'24333928814870687');
insert into GoodsInventoryInfo values('24339658414870748','毛衣','白色','M',152,'24333928814870687');
insert into GoodsInventoryInfo values('24339658414870749','毛衣','红色','M',65,'24333928814870687');
insert into GoodsInventoryInfo values('24333652114870750','胖MM毛衣','白色','L',83,'24333928814870687');
insert into GoodsInventoryInfo values('24333326544870751','呢子大衣','粉色','L',368,'24333928814870687');
insert into GoodsInventoryInfo values('24333326544870752','呢子大衣','白色','M',845,'24333928814870687');
insert into GoodsInventoryInfo values('24333928814870753','加大号套头卫衣','黑色','M',567,'24333928814870684');
insert into GoodsInventoryInfo values('24333928814870754','加大号套头卫衣','蓝色','L',457,'24333928814870684');
insert into GoodsInventoryInfo values('24333928814870755','休闲T恤','黑色','M',225,'24333928814870685');
insert into GoodsInventoryInfo values('24333928814870756','休闲T恤','白色','M',225,'24333928814870685');
insert into GoodsInventoryInfo values('24333928814870757','男款运动鞋','蓝色','41',300,'24333928814870686');
insert into GoodsInventoryInfo values('24333928814870758','男款运动鞋','黑色','40',400,'24333928814870686');
insert into GoodsInventoryInfo values('24333924814871259','茧型羽绒服','灰色','M',600,'24333928814870687');
insert into GoodsInventoryInfo values('24333924814871260','茧型羽绒服','黑色','M',500,'24333928814870687');
insert into GoodsInventoryInfo values('24333928814870761','茧型呢子外套','黑色','L',478,'24333928814870687');
insert into GoodsInventoryInfo values('24333928814870762','茧型呢子外套','黑色','M',650,'24333928814870687');
insert into GoodsInventoryInfo values('24333928814870763','男款运动鞋','绿色','40',425,'24333928814870687');
insert into GoodsInventoryInfo values('24333928814870764','男款运动鞋','绿色','41',93,'24333928814870687');
insert into GoodsInventoryInfo values('24123458814870765','夏秋系列运动上衣女','绿色','M',698,'24333928814870687');
insert into GoodsInventoryInfo values('24123458814870766','夏秋系列运动上衣男','黑色','L',364,'24333928814870687');
insert into GoodsInventoryInfo values('24333123456871267','浪莎连袜打底裤','黑色','M',630,'24333928814870685');
insert into GoodsInventoryInfo values('24333123456871268','浪莎连袜打底裤','黑色','M',445,'24333928814870685');
insert into GoodsInventoryInfo values('24333695874870769','纯色小外套','黄色','M',362,'24333928814870685');
insert into GoodsInventoryInfo values('24333695874870770','纯色小外套','白色','M',262,'24333928814870685');
insert into GoodsInventoryInfo values('24333928814870771','欧美范儿A字裙','黄色','M',653,'24333928814870681');
insert into GoodsInventoryInfo values('24333928814870772','欧美范儿A字裙','蓝色','M',326,'24333928814870681');

/*查询*/
select* from GoodsInventoryInfo;

/*加盟商退货表*/
create table JoiningTraderReturnInfo
(
	joiningTraderReturnId varchar(36) primary key not null,
	returnTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),/*--退货发起时间*/
	returnRemark varchar(500) not null,/*--退货说明*/
	returnOrExchange int not null,/*0 退货  1换货*/
	goodsName varchar(36) not null,/*退（换）货商品编号*/
	colorName varchar(36) not null,/*商品颜色*/
	sizeName varchar(36) not null,/*商品大小*/
	goodsNum int not null,/*退（换）货商品数量*/
  	returnStatus int not null,/*状态  0  审核中  1 成功  2 失败*/
	joiningTraderId varchar(36) not null/*--加盟Id外键*/
);
alter table JoiningTraderReturnInfo
         add constraint fk_JoiningTraderReturnInfo_joiningTraderId foreign key(joiningTraderId) references JoiningTraderInfo(joiningTraderId);
/*插入数据*/
insert into JoiningTraderReturnInfo values('24333928814870765',default,'这家伙很懒,什么都没留下！',0,'牛仔裤','黑色','L','10',0,'24333928814870616');
insert into JoiningTraderReturnInfo values('24333928814870766',default,'这家伙很懒,什么都没留下！',0,'毛皮大衣','黑色','M','10',0,'24333928814870617');
insert into JoiningTraderReturnInfo values('24333928814870767',default,'这家伙很懒,什么都没留下！',0,'羽绒服','黑色','XL','10',0,'24333928814870618');
insert into JoiningTraderReturnInfo values('24333928814870768',default,'这家伙很懒,什么都没留下！',0,'休闲装','黑色','XXL','10',0,'24333928814870619');
insert into JoiningTraderReturnInfo values('24333928814870769',default,'这家伙很懒,什么都没留下！',0,'休闲裤','黑色','M','10',0,'24333928814870620');
insert into JoiningTraderReturnInfo values('24333928814870770',default,'这家伙很懒,什么都没留下！',0,'毛衣','黑色','S','10',0,'24333928814870621');
insert into JoiningTraderReturnInfo values('24333928814870771',default,'这家伙很懒,什么都没留下！',1,'职业装','黑色','X','10',0,'24333928814870622');
/*查询*/
select * from JoiningTraderReturnInfo;

/*入库表：*/
create table InboundInfo
(
  	inboundId varchar(36) not null primary key,
	inboundTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),/*--入库时间*/
  	empId varchar(36) not null references empInfo(empId),/*审核人（审核人）*/
  	goodsName varchar(36),/*商品名称*/
	procurementId varchar(36) references ProcurementInfo(procurementId),/* --采购表（外键 采购的批次）*/
	reOrPo int not null default 0,/*退货或采购     0：采购   1：退货*/
	warehouseId varchar(36) not null references WarehouseInfo(warehouseId),/* (仓库)*/
  	inboundRemark varchar(36)/*--入库说明*/
);
/*插入数据*/
insert into InboundInfo values('24333928814870713',default,'24333928814870584',null,'24333928814870697',0,'24333928814870681','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870714',default,'24333928814870585',null,'24333928814870698',0,'24333928814870682','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870715',default,'24333928814870586',null,'24333928814870699',0,'24333928814870683','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870716',default,'24333928814870587',null,'24333928814870700',0,'24333928814870684','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870717',default,'24333928814870588',null,'24333928814870701',0,'24333928814870685','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870718',default,'24333928814870589',null,'24333928814870702',0,'24333928814870686','这家伙很懒,什么都没留下！');
insert into InboundInfo values('24333928814870719',default,'24333928814870590',null,'24333928814870703',0,'24333928814870687','这家伙很懒,什么都没留下！');

/*查询*/
select * from InboundInfo;

/*申请表*/
create table OrderInfo
(
	orderId varchar(36) primary key not null,
	orderTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	goodsNum varchar(36) not null,/*--此商品数量*/
	joiningTraderId varchar(36) not null,/*--加盟商*/
	isdo int not null,/*-- 是否处理     0 已处理  1 未处理  2 拒绝处理*/
	orderRemark varchar(500) not null
);
alter table OrderInfo
		 add constraint fk_OrderInfo_joiningTraderId foreign key(joiningTraderId) references JoiningTraderInfo(joiningTraderId);
/*插入数据*/		 
insert into OrderInfo values('24333928814870736',default,'666','24333928814870616',0,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870737',default,'777','24333928814870617',1,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870738',default,'111','24333928814870618',1,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870739',default,'222','24333928814870619',1,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870740',default,'333','24333928814870620',1,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870741',default,'555','24333928814870621',1,'这家伙很懒,什么都没留下！');
insert into OrderInfo values('24333928814870742',default,'888','24333928814870622',2,'这家伙很懒,什么都没留下！');
/*查询*/
select * from OrderInfo;

/*商品订单表*/
create table goodsOrderInfo
(
		goodsOrderId varchar(36) primary key not null,
		goodsId VARCHAR(36) references goodsInfo(goodsId) ,
		orderId varchar(36) references OrderInfo(orderId)
);

/*插入数据*/		 
insert into goodsOrderInfo values('24333928814870773','24333928814870729','24333928814870736');
insert into goodsOrderInfo values('24333928814870774','24333928814870730','24333928814870737');
insert into goodsOrderInfo values('24333928814870775','24333928814870731','24333928814870738');
insert into goodsOrderInfo values('24333928814870776','24333928814870732','24333928814870739');
insert into goodsOrderInfo values('24333928814870777','24333928814870733','24333928814870740');
insert into goodsOrderInfo values('24333928814870778','24333928814870734','24333928814870741');
insert into goodsOrderInfo values('24333928814870779','24333928814870735','24333928814870742');
/*查询*/
select * from goodsOrderInfo;
/*配货表*/
create table DistributionInfo
(
	distributionId varchar(36) not null primary key,
	distributionTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),/*--配送时间*/
	isAcceptance int not null,/*--是否验收  1 已验收 0 未验收 2 拒收*/
	disAddress varchar(300) not null,
	orderId varchar(36)not null references OrderInfo(orderId),
	distributionRemark varchar(500)/*--配货说明*/
);
/*插入数据*/
insert into DistributionInfo values('24333928814870729',default,0,'重庆市沙坪坝','24333928814870736','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870730',null,0,'上海市闵行区','24333928814870737','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870731',default,1,'北京市朝阳区','24333928814870738','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870732',default,0,'北京市朝阳区','24333928814870739','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870733',default,2,'北京市朝阳区','24333928814870740','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870734',default,0,'北京市朝阳区','24333928814870741','这家伙很懒,什么都没留下！');
insert into DistributionInfo values('24333928814870735',default,0,'北京市朝阳区','24333928814870742','这家伙很懒,什么都没留下！');
/*查询*/
select * from DistributionInfo;

/* 出库表：*/
create table OutboundInfo
(
	outboundId varchar(36) primary key not null,
	outboundTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	empId varchar(36) not null references EmpInfo(empId), /* --审核人（审核人）*/
	warehouseId  varchar(36) not null references WarehouseInfo(warehouseId),/* (仓库  从那个仓库出货)*/
	goodsName varchar(36) not null,/*商品名称*/
	goodsNum int not null,/*商品数量*/
	isExitorSale int not null,/*是本地退货还是销售  0：本地退货  1：销售*/
	joiningTraderId varchar(36),/*-- 加盟Id外键*/
    supplierId varchar(36) references SupplierInfo(supplierId),/*供应商*/
	outboundRemark varchar(500) not null/*-- 出库说明*/
);
alter table OutboundInfo
		 add constraint fk_OutboundInfo_joiningTraderId foreign key(joiningTraderId) references JoiningTraderInfo(joiningTraderId);
/* 插入数据*/		 
insert into OutboundInfo values('24333928814870742',default,'24333928814870584','24333928814870681','毛衣',36,1,'24333928814870616',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870743',default,'24333928814870585','24333928814870682','打底裤',489,1,'24333928814870617',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870744',default,'24333928814870586','24333928814870683','职业装',369,1,'24333928814870618',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870745',default,'24333928814870587','24333928814870684','牛仔裤',32,1,'24333928814870619',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870746',default,'24333928814870588','24333928814870685','毛皮大衣',56,1,'24333928814870620',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870747',default,'24333928814870589','24333928814870686','羽绒服',365,1,'24333928814870621',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870748',default,'24333928814870590','24333928814870687','休闲装',65,1,'24333928814870622',null,'这家伙很懒,什么都没留下！');
insert into OutboundInfo values('24333928814870772',default,'24333928814870590','24333928814870687','毛衣',65,0,null,'24333928814870604','由质检仓库退出伪劣商品！');
/*查询*/
select * from OutboundInfo;

/*仓库记录表:*/
create table WarehousLogInfo
(
	warehousLogId varchar(36) primary key not null,
	isIncrease int not null, /*--是否入库   0入库  1 出库*/
	outboundId  varchar(36) not null references OutboundInfo(outboundId),/*（出库表 允许为空）*/
	inboundId varchar(36) not null references InboundInfo(inboundId),/*（入库表 允许为空）*/
	warehouseId varchar(36) not null,/*(仓库  外键)*/
	warehousLogRemark varchar(500) not null
);
alter table WarehousLogInfo
		 add constraint fk_WarehousLogInfo_warehouseId foreign key(warehouseId) references WarehouseInfo(warehouseId);

/*插入数据*/		 
insert into WarehousLogInfo values('24333928814870749',1,'24333928814870742','24333928814870713','24333928814870681','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870750',1,'24333928814870743','24333928814870714','24333928814870682','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870751',0,'24333928814870744','24333928814870715','24333928814870683','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870752',1,'24333928814870745','24333928814870716','24333928814870684','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870753',0,'24333928814870746','24333928814870717','24333928814870685','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870754',1,'24333928814870747','24333928814870718','24333928814870686','这家伙很懒,什么都没留下！');
insert into WarehousLogInfo values('24333928814870755',0,'24333928814870748','24333928814870719','24333928814870687','这家伙很懒,什么都没留下！');
/*查询*/
select * from WarehousLogInfo;

/*销售记录表: */
create table SalesRecordInfo
(
	salesRecordId varchar(36) primary key not null,
	salesRecordTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	salesRecordMoney varchar(36) not null,
	goodsOrderId  varchar(36) not null,/*--订单外键*/
	salesRecordRemark varchar(500) not null
);
alter table SalesRecordInfo
         add constraint fk_SalesRecordInfo_goodsOrderId foreign key(goodsOrderId) references GoodsOrderInfo(goodsOrderId);
/*插入数据*/		 
insert into SalesRecordInfo values('24333928814870756',default,'400000','24333928814870773','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870757',default,'600000','24333928814870774','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870758',default,'600000','24333928814870775','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870759',default,'600000','24333928814870776','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870760',default,'600000','24333928814870777','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870761',default,'600000','24333928814870778','这家伙很懒,什么都没留下！');
insert into SalesRecordInfo values('24333928814870762',default,'600000','24333928814870779','这家伙很懒,什么都没留下！');
/*查询*/
select * from SalesRecordInfo;

/*财务表：*/
create table FinancialInfo
(
	financialId varchar(36) primary key not null,
	isSpending int not null,/*--是否支出  0 支出 1 收入 */
	financialMoney varchar(36) not null,
	financialTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	procurementId varchar(36) not null,
	salesRecordId varchar(36) not null,
	financialRemark varchar(500)
);

/*插入数据*/		 
insert into FinancialInfo values('24333928814870763',1,'900000',default,'24333928814870697','24333928814870756','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870764',1,'900000',default,'24333928814870698','24333928814870757','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870765',0,'300000',default,'24333928814870699','24333928814870758','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870766',1,'900000',default,'24333928814870700','24333928814870759','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870767',1,'500000',default,'24333928814870701','24333928814870760','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870768',1,'600000',default,'24333928814870702','24333928814870761','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870769',0,'700000',default,'24333928814870703','24333928814870762','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870770',1,'900000',default,'24333928814870697','24333928814870756','这家伙很懒,什么都没留下！');
insert into FinancialInfo values('24333928814870771',1,'900000',default,'24333928814870698','24333928814870757','这家伙很懒,什么都没留下！');
/*查询*/
select * from FinancialInfo;
/*------------------------------存储过程---------------------------------*/
create PROCEDURE pro_localreturnGoods
(  
   return_returnId varchar(36),
   return_goodsName varchar(36),
   return_colorName varchar(36),
   return_sizeName varchar(36),
   return_goodsNum int,
   return_userId varchar(36),
   outboundids varchar(60)
)   
BEGIN   
   DECLARE proId varchar(36);
   declare sizeIds varchar(36);
   declare colorIds varchar(36);
   declare empIds varchar(36);
		declare supplierIds varchar(36);
		update localreturninfo locals set locals.returnStatus=0 where locals.returnId=return_returnId;
		select sizes.sizeId into sizeIds from sizeInfo sizes where sizes.sizeName=return_sizeName;
        select colors.colorId into colorIds from colorinfo colors where colors.colorName=return_colorName;
		select goods.procurementId into proId from goodsInfo goods where goods.goodsName=return_goodsName and goods.colorId=colorIds and goods.sizeId=sizeIds;
		select pro.supplierId into supplierIds from procurementinfo pro where pro.procurementId=proId;
		update goodsinventoryinfo goodsin set goodsin.goodsNum=goodsin.goodsNum - return_goodsNum where goodsin.goodsName=return_goodsName
		and goodsin.colorName=return_colorName and goodsin.sizeName=return_sizeName and goodsin.warehouseId='24333928814870687';
    select emp.empId into empIds from empinfo emp where emp.userId=	return_userId;	
    insert into outboundinfo values(outboundids,default,empIds,'24333928814870687',return_goodsName,return_goodsNum,0,null,supplierIds,'由质检仓库退出伪劣商品！');
END;



/*录入商品的存储过程*/
create procedure proc_enteredGoods
(
		param_goodsNo varchar(36), 
		param_goodsName varchar(36), 
		param_sizeId varchar(36), 
		param_colorId varchar(36),
		param_goodsCode varchar(36),
		param_imgGoods varcahr(36), 
		param_goodsInPrice double, 
		param_goodsOutPrice double, 
		param_goodsNum int, 
		param_goodsRemark varchar(300),
		param_empName varchar(36)
)

BEGIN
	  declare goodsId varchar(36);
		declare goodsName varchar(36);
		declare sizeName varchar(36);
		declare colorName varchar(36);
		declare empId varchar(36);
		
/*procurementId varchar(36) primary key not null,
	procurementTime timestamp NULL DEFAULT CURRENT_TIMESTAMP(),
	supplierId varchar(36) not null references Supplierinfo(supplierId),/*供应商外键
	empId varchar(36) not null,/*采购人（员工）
	procuremenRemark varchar(500)/*--说明*/
	
END
/*
    call pro_localreturnGoods('24333928814570777','衬衣','白色','ss',45,'24333928814870538','231564859641236547123');
	select * from LocalReturnInfo;
	select * from goodsinventoryinfo;
	select * from OutboundInfo;
	select * from goodsInfo;
	DROP PROCEDURE pro_localreturnGoods;
	select * from userInfo;
*/