package com.gaji.admin.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.BoardDAO;
import com.gaji.board.vo.BoardVO;


public class ProductIdxCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		System.out.println(">> ProductIdxCommand ---------");
		
		String boardIdx = request.getParameter("boardIdx"); 
		
		System.out.println(">boardIdx : -" + boardIdx + "-");
		
		BoardVO bvo = BoardDAO.getSearchIdx(boardIdx); //idx로 찾은값을 vo에저장
		
		session.setAttribute("bvo", bvo);  //vo를 세션에저장

		System.out.println(">> ProductIdxCommand 끝---------");
		
		return "viewProduct.jsp"; 

		
	}

}
