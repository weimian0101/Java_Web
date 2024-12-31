package com.shop.impl;

import com.shop.dao.IOrderVODao;
import com.shop.domain.OrderVO;
import com.shop.util.ConnectionContext;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: OrderVODaoImpl
 * @Description:DAO层,IOrderVODao的实现类，提供了order表与user表的多表连接查询功能，因为order表提供了user_id，但是缺少account。
 * 
 *
 */
public class OrderVODaoImpl implements IOrderVODao {

	@Override
	public List<OrderVO> findAll() throws SQLException {
		QueryRunner qr = new QueryRunner();
		BeanProcessor bean = new GenerousBeanProcessor();
		RowProcessor processor = new BasicRowProcessor(bean);
		String sql = "select * from `order` inner join `user` on `order`.user_id=`user`.user_id";

		return (List<OrderVO>) qr.query(ConnectionContext.getInstance().getConnection(), sql,
				new BeanListHandler<OrderVO>(OrderVO.class, processor));
	}

	@Override
	public List<OrderVO> find(OrderVO orderFeature, int begin, int pageSize) throws SQLException {
		QueryRunner qr = new QueryRunner();
		BeanProcessor bean = new GenerousBeanProcessor();
		RowProcessor processor = new BasicRowProcessor(bean);
		String sql = "select * from `order` inner join `user` on `order`.user_id=`user`.user_id where order_id=? or account like ? order by order_id limit ?,?";
		Object[] params = { orderFeature.getOrderId(), "%" + orderFeature.getAccount() + "%", begin, pageSize };

		return (List<OrderVO>) qr.query(ConnectionContext.getInstance().getConnection(), sql, params,
				new BeanListHandler<OrderVO>(OrderVO.class, processor));
	}

	@Override
	public List<OrderVO> find(int begin, int pageSize) throws SQLException {
		QueryRunner qr = new QueryRunner();
		BeanProcessor bean = new GenerousBeanProcessor();
		RowProcessor processor = new BasicRowProcessor(bean);
		String sql = "select * from `order` inner join `user` on `order`.user_id=`user`.user_id order by order_id limit ?,?";
		Object[] params = { begin, pageSize };

		return (List<OrderVO>) qr.query(ConnectionContext.getInstance().getConnection(), sql, params,
				new BeanListHandler<OrderVO>(OrderVO.class, processor));
	}

	@Override
	public List<OrderVO> find(OrderVO orderFeature) throws SQLException {
		QueryRunner qr = new QueryRunner();
		BeanProcessor bean = new GenerousBeanProcessor();
		RowProcessor processor = new BasicRowProcessor(bean);
		String sql = "select * from `order` inner join `user` on `order`.user_id=`user`.user_id where order_id=? or account like ? ";
		Object[] params = { orderFeature.getOrderId(), "%" + orderFeature.getAccount() + "%" };

		return (List<OrderVO>) qr.query(ConnectionContext.getInstance().getConnection(), sql, params,
				new BeanListHandler<OrderVO>(OrderVO.class, processor));
	}


}
