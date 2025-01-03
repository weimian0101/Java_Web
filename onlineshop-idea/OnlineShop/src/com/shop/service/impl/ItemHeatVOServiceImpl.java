package com.shop.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.shop.dao.IItemHeatVODao;
import com.shop.dao.impl.ItemHeatVODaoImpl;
import com.shop.domain.ItemHeatVO;
import com.shop.service.IItemHeatVOService;

/**
 * @InterfaceName: ItemHeatVOServiceImpl
 * @Description:Service层,IItemHeatVOService的实现类，可以获取一个ItemHeatVO的列表，来供前端使用
 * 
 *
 */
public class ItemHeatVOServiceImpl implements IItemHeatVOService {
	private IItemHeatVODao itemHeatVODao = new ItemHeatVODaoImpl();

	@Override
	public List<ItemHeatVO> getAll() throws SQLException {
		return itemHeatVODao.findAll();
	}

}
