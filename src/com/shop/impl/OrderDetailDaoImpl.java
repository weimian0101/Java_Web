package com.shop.impl;

import com.shop.dao.IOrderDetailDao;
import com.shop.domain.OrderDetail;
import com.shop.util.ConnectionContext;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

/**
 * @ClassName: OrderDetailImpl
 * @Description:DAO层,IOrderDetail的实现类，提供插入功能；更新和删除原则上不应该使用；查询功能由于要提供item的详细信息，应需要多表查询，放在了IOrderDetailVODao的查询功能中。
 * 
 *
 */
public class OrderDetailDaoImpl implements IOrderDetailDao {

	@Override
	public void insert(OrderDetail orderDetail) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into `order_detail`(order_id,item_id,number) values(?, ?, ?)";
		Object[] params = { orderDetail.getOrderId(), orderDetail.getItemId(), orderDetail.getNumber() };

		runner.update(ConnectionContext.getInstance().getConnection(), sql, params);
	}

}
