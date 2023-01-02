package com.gaji.qna.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.gaji.qna.vo.QnaVO;
import com.gaji.qna.dao.QnaDAO;

public class AllQnaCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		System.out.println(">> AllQnaCommand ---------");
		
		List<QnaVO> qnaList = QnaDAO.getAllBoard();
		
		session.setAttribute("qnaList", qnaList); 

		System.out.println(">> AllQnaCommand 끝---------");
		
		return "/qna/qnaMain.jsp";
	}

}


