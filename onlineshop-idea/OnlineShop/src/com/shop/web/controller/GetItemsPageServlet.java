package com.shop.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.domain.Item;
import com.shop.domain.Page;
import com.shop.service.IItemService;
import com.shop.service.impl.ItemServiceImpl;
import com.shop.util.PageUtils;
import com.shop.util.WebUtils;

/**
 * 用于获得Item分页，每次切换页面都要访问
 * 
 *
 */
@WebServlet(name = "GetItemsPageServlet", urlPatterns = "/servlet/getItemsPageServlet")
public class GetItemsPageServlet extends HttpServlet {
	private IItemService itemService = new ItemServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------GetItemsPageServlet work start-----------");
		try {
			// 根据request中的必要参数，就能获得page。
			Page<Item> page = PageUtils.getPage(request, response, 5, itemService);
			System.out.println("Get ItemsPage:" + page);
			//回显
			request.setAttribute("itemsPage", page);
			request.getRequestDispatcher("/pages/admin/manage-items.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		System.out.println("------------GetItemsPageServlet work finished-----------");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
