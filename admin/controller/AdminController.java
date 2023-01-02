package com.gaji.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.admin.command.Command;
import com.gaji.admin.command.ListCommand;
import com.gaji.admin.command.MemberDeleteCommand;
import com.gaji.admin.command.MemberUpdateCommand;
import com.gaji.admin.command.ProductCommand;
import com.gaji.admin.command.ProductDeleteCommand;
import com.gaji.admin.command.ProductIdCommand;
import com.gaji.admin.command.ProductIdxCommand;
import com.gaji.admin.command.ProductSearchCommand;
import com.gaji.admin.command.ProductUpdateCommand;
import com.gaji.admin.command.QnaReCommand;
import com.gaji.admin.command.QnaReCommandOk;
import com.gaji.admin.command.QnaSearchCommand;
import com.gaji.admin.command.SearchCommand;
import com.gaji.admin.command.SearchIdCommand;
import com.gaji.admin.command.SearchIdxCommand;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;

@WebServlet("/admin/adminController")
	public class AdminController extends HttpServlet {

	private static final long serialVersionUID = 1L;
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		System.out.println("type" + type);
		Command command = null;
		
		System.out.println("type : " + type);
				
		if(type.equals("list")) { 
			command = new ListCommand();			
		} else if (type.equals("search")) {
			command = new SearchCommand();
		} else if (type.equals("searchId")) {
			command = new SearchIdCommand();
		} else if (type.equals("searchIdx")) {
			command = new SearchIdxCommand();
		} else if (type.equals("memberUpdate")) {
			command = new MemberUpdateCommand();
		} else if (type.equals("memberDelete")) {
			command = new MemberDeleteCommand();
		} else if (type.equals("product")) {
			command = new ProductCommand();
		} else if (type.equals("searchProduct")) {
			command = new ProductSearchCommand();
		} else if (type.equals("productIdx")) {
			command = new ProductIdxCommand();
		} else if (type.equals("productUpdate")) {
			command = new ProductUpdateCommand();
		} else if (type.equals("productDelete")) {
			command = new ProductDeleteCommand();
		} else if (type.equals("qnaRe")) {
			command = new QnaReCommand();
		} else if (type.equals("qnaReOk")) {
			command = new QnaReCommandOk();
		} else if (type.equals("searchQna")) {
			command = new QnaSearchCommand();
		}
						
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<CategoryVO> list = dao.getCategory();
		request.setAttribute("Categories", list);
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		
	}
}
