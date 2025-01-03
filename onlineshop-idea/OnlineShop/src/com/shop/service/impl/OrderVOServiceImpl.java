package com.shop.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.IOrderDetailVODao;
import com.shop.dao.IOrderVODao;
import com.shop.dao.impl.OrderDetailVODaoImpl;
import com.shop.dao.impl.OrderVODaoImpl;
import com.shop.domain.Order;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.Page;
import com.shop.service.IOrderVOService;

/**
 * @InterfaceName: OrderVOServiceImpl
 * @Description:Service层,IOrderVOService的实现类，提供获取OrderVO的分页对象，以在前端显示
 * 
 *
 */
public class OrderVOServiceImpl implements IOrderVOService {
	private IOrderVODao orderVODao = new OrderVODaoImpl();
	private IOrderDetailVODao orderDetailVODao = new OrderDetailVODaoImpl();

	@Override
	public Page<OrderVO> get(int begin, int pageSize) throws SQLException {
		List<OrderVO> list = (ArrayList<OrderVO>) orderVODao.find(begin, pageSize);

		Page<OrderVO> orderPage = new Page<>();
		orderPage.setList(list);
		orderPage.setTotalCount(orderVODao.findAll().size());

		return orderPage;
	}

	@Override
	public Page<OrderVO> get(OrderVO orderFeature, int begin, int pageSize) throws SQLException {
		List<OrderVO> list = (ArrayList<OrderVO>) orderVODao.find(orderFeature, begin, pageSize);

		Page<OrderVO> orderPage = new Page<>();
		orderPage.setList(list);
		orderPage.setTotalCount(orderVODao.find(orderFeature).size());

		return orderPage;
	}

}
