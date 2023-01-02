package com.gaji.admin.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.BoardDAO;




public class ProductSearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> 동적검색 ProductSearchCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		String id = request.getParameter("id"); 
		String title = request.getParameter("title"); 
		String status = request.getParameter("status"); 
		String category = request.getParameter("category"); 
		System.out.println(">id : -" + id + "-");
		System.out.println(">title : -" + title + "-");
		System.out.println(">status : -" + status + "-");
		System.out.println(">category : -" + category + "-");
		
		List<BoardDAO> productList = BoardDAO.getSearch(id, title, status, category);
		
		// 2. 응답할 페이지(list.jsp)에 DB에서 가져온 데이터 전달
		session.setAttribute("productList", productList);

		System.out.println(">> SearchCommand 끝---------");
		
		return "productSearch.jsp";
		
		
		
	}
}
