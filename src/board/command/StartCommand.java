package com.gaji.board.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.categoryVO;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;

public class StartCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();	
		List<categoryVO> caList = boardDAO.getCategory();
		session.setAttribute("caList", caList);		// 카테고리 정리
				
		System.out.println(caList);
		
		
							
		String path = "/index.jsp";
		return path;
	}

}
