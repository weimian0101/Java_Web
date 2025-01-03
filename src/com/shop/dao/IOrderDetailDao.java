package com.shop.dao;

import com.shop.domain.OrderDetail;

import java.sql.SQLException;

/**
 * @InterfaceName: IOrderDetailDao
 * @Description:DAO层接口，提供插入功能；更新和删除原则上不应该使用；查询功能由于要提供item的详细信息，应需要多表查询，放在了IOrderDetailVODao的查询功能中。
 * 
 *
 */
public interface IOrderDetailDao {
	/**
	 * 添加订单小件信息
	 * 
	 * @param orderDetail
	 */
	void insert(OrderDetail orderDetail) throws SQLException;
}
