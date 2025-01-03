package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import com.shop.domain.ItemHeatVO;

/**
 * @InterfaceName: IItemHeatVOService
 * @Description:Service层接口，提供获取ItemHeatVO的List，以在网页端显示。
 * 
 *
 */
public interface IItemHeatVOService {
	/**
	 * 获得所有ItemHeatVO，用于在网页端显示
	 * 
	 * @return List<ItemHeatVO>
	 * @throws SQLException
	 */
	List<ItemHeatVO> getAll() throws SQLException;
}
