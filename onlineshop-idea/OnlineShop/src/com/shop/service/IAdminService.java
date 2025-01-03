package com.shop.service;

import java.sql.SQLException;

import com.shop.domain.Admin;

/**
 * @InterfaceName: IAdminService
 * @Description:Service层接口，提供管理员户登录等服务。
 * 
 *
 */
public interface IAdminService {
	/**
	 * 管理员登录,如果账号存在且密码匹配，则返回Admin对象实体
	 * 
	 * @param account
	 * @param password
	 * @return Admin
	 * @throws SQLException
	 */
	Admin login(String account, String password) throws SQLException;

}
