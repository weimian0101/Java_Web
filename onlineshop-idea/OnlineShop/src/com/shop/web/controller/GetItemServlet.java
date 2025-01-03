package com.shop.web.controller;

import com.shop.domain.Item;
import com.shop.service.IItemService;
import com.shop.service.impl.ItemServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 用于获得Item，来在商品详情页面上显示
 * 
 *
 */
@WebServlet(name = "GetItemServlet", urlPatterns = "/servlet/getItemServlet")
public class GetItemServlet extends HttpServlet {
	private IItemService itemService = new ItemServiceImpl();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------GetItemServlet work start-----------");
		
		//获取itemId，从而得到相应的item
		int itemId=getItemId(request);
		System.out.println(itemId);
		
		//根据itemId,得到item
		Item item=null;
		try {
			item=itemService.get(itemId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		System.out.println("item:"+item);
		
		request.setAttribute("item", item);//设置item到request中，供jsp页面使用
		request.getRequestDispatcher("/item.jsp").forward(request, response);
		//request.getAttribute("item") 来获取这个商品信息。
		System.out.println("------------GetItemServlet work finished-----------");
	}

	/**
	 * 从request中读取itemId参数并转化成int型，或没有改参数，返回0
	 * 
	 * @param request
	 * @return int
	 */
	private int getItemId(HttpServletRequest request) {
		String itemId = request.getParameter("itemId");
		if (itemId == null) {
			itemId = "0";
		}
		return Integer.parseInt(itemId);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
