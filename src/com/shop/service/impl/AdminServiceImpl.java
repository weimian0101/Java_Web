package com.shop.service.impl;

import com.shop.dao.IAdminDao;
import com.shop.dao.impl.AdminDaoImpl;
import com.shop.domain.Admin;
import com.shop.service.IAdminService;

import java.sql.SQLException;

/**
 * @InterfaceName: AdminServiceImpl
 * @Description:Service层,IAdminServiceI的实现类，提供管理员登录等服务。
 * 
 *
 */
public class AdminServiceImpl implements IAdminService {
	private IAdminDao adminDao = new AdminDaoImpl();

	@Override
	public Admin login(String account, String password) throws SQLException {
		Admin admin = adminDao.find(account);
		// 没找到，则user=null，返回空值。
		// 密码不匹配，同样也为空值。
		if (admin == null || admin.getPassword().equals(password)) {
			return admin;
		} else {
			return null;
		}
	}
}
