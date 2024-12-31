package com.shop.impl;

import com.shop.dao.IOrderDetailVODao;
import com.shop.domain.OrderDetailVO;
import com.shop.util.ConnectionContext;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: OrderDetailVODaoImpl
 * @Description:DAO层,IOrderDetailVODao的实现类，提供了item表与order_detail表的多表连接查询功能，提供更详细的订单信息；插入/更新/删除原则上不应该使用
 * 
 *
 */
public class OrderDetailVODaoImpl implements IOrderDetailVODao {

	@Override
	public List<OrderDetailVO> findByOrderId(int orderId) throws SQLException {
		QueryRunner qr = new QueryRunner();
		BeanProcessor bean = new GenerousBeanProcessor();
		RowProcessor processor = new BasicRowProcessor(bean);
		String sql = "select * from `order_detail` inner join `item` on `order_detail`.item_id=`item`.item_id where order_id=?";

		return (List<OrderDetailVO>) qr.query(ConnectionContext.getInstance().getConnection(), sql, orderId,
				new BeanListHandler<OrderDetailVO>(OrderDetailVO.class, processor));
	}
}
