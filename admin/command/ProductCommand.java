package com.gaji.admin.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.BoardDAO;

import com.gaji.board.vo.BoardVO;



public class ProductCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(">> ProductCommand ---------");
		
		List<BoardVO> productList = BoardDAO.getAllBoard();
		System.out.println("productList :" + productList);
		
		session.setAttribute("productList", productList);

		System.out.println(">> ProductCommand 끝---------");
		
		return "productMain.jsp";
		
	}

}
