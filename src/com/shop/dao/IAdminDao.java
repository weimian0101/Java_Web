package com.shop.dao;

import com.shop.domain.Admin;

import java.sql.SQLException;
import java.util.List;

/**
 * @InterfaceName: IAdminDao
 * @Description:DAO层接口，提供基本的CRUD（增删改）功能。
 * 
 *
 */
public interface IAdminDao {
	/**
	 * 获得一个包含所有管理员的List
	 * 
	 * @return
	 * @throws SQLException
	 */
	List<Admin> findALL() throws SQLException;

	/**
	 * 根据管理员名来查找管理员
	 * 
	 * @param account
	 * @return 查到的管理员
	 */
	Admin find(String account) throws SQLException;

	/**
	 * 修改管理员信息，如密码
	 * 
	 * @param admin
	 */
	void update(Admin admin) throws SQLException;

}
