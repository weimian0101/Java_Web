package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import com.shop.domain.Item;
import com.shop.domain.Page;
import com.shop.domain.ShoppingcartItem;

/**
 * @InterfaceName: IShoppingcartItemService
 * @Description:Service
 *
 */
public interface IShoppingcartItemService {
	/**
	 * 向购物车中添加一个商品
	 * 
	 * @param item
	 * @throws SQLException
	 */
	void add(ShoppingcartItem item) throws Exception;

	/**
	 * 更新购物车中商品的信息(数量)
	 * 
	 * @param item
	 * @throws SQLException
	 */
	void update(ShoppingcartItem item) throws SQLException;

	/**
	 * 通过userId和itemId，来移除某用户购物车中的某个商品
	 * 
	 * @param itemId
	 * @throws SQLException
	 */
	void delete(int userId, int itemId) throws SQLException;

	/**
	 * 得到所有用户购物车餐点列表
	 * 
	 * @throws SQLException
	 */
	List<ShoppingcartItem> getAll() throws SQLException;

	/**
	 * 得到某个用户的购物车中商品列表
	 * 
	 * @throws SQLException
	 */
	List<ShoppingcartItem> get(int userId) throws SQLException;

	/**
	 * 得到某个用户的购物车中总金额
	 * 
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	double sumTotalMoney(int userId) throws SQLException;

	/**
	 * 根据itemId和userId,来获得一个ShoppingcartItem
	 * 
	 * @param itemId
	 * @return ShoppingcartItem
	 * @throws SQLException
	 */
	ShoppingcartItem get(int userId, int itemId) throws SQLException;

	/**
	 * 根据itemId和userId，来检查某用户购物车内是否已经存在某商品
	 * 
	 * @param itemId
	 * @return true/false
	 * @throws SQLException
	 */
	boolean checkExist(int userId, int itemId) throws SQLException;
}
