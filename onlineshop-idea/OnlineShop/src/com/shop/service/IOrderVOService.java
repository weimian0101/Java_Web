package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import com.shop.domain.Order;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.Page;

/**
 * @InterfaceName: IOrderVOService
 * @Description:Service层接口，提供获取OrderVO的分页对象，以在前端显示
 * 
 *
 */
public interface IOrderVOService extends IPageService<OrderVO> {

	@Override
	Page<OrderVO> get(int begin, int pageSize) throws SQLException;

	@Override
	Page<OrderVO> get(OrderVO orderFeature, int begin, int pageSize) throws SQLException;

}
