package com.shop.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
import com.mchange.v2.sql.filter.FilterResultSet;

/**
 * 通过商品名、类型，搜索商品
 * 
 *
 *
 */
@WebServlet(name = "SearchItemPageServlet", urlPatterns = "/servlet/searchItemPageServlet")
public class SearchItemPageServlet extends HttpServlet {
	private IItemService itemService = new ItemServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------SearchItemPageServlet work start-----------");
		// 获取关键词，类型
		String nameKeyword = request.getParameter("nameKeyword");
		String type = request.getParameter("type");
		if (nameKeyword == null) {
			nameKeyword = "";
		}
		if (type == null) {
			type = "";
		}
		System.out.println("nameKeyword=" + nameKeyword + ",type=" + type);

		// 特征搜索
		try {
			// 设置要搜索的特征对象
			Item featureItem = new Item();
			featureItem.setName(nameKeyword);
			featureItem.setType(type);

			// 通过service和特征对象进行搜索
			Page<Item> page = PageUtils.getPage(request, response, 6, itemService, featureItem);
			System.out.println("Get ItemsPage:" + page);

			request.setAttribute("itemsPage", page);
			request.getRequestDispatcher("/search-items.jsp").forward(request, response);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		System.out.println("------------SearchItemPageServlet work finished-----------");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
