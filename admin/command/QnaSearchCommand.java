package com.gaji.admin.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.qna.dao.*;
import com.gaji.qna.vo.QnaVO;

public class QnaSearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println(">> 검색 QnaSearchCommand ---------");
		
		String search = request.getParameter("search"); 
		System.out.println(">search : -" + search + "-");

		List<QnaVO> qnaList = QnaDAO.getSearch(search);
		
		session.setAttribute("qnaList", qnaList);

		System.out.println(">> QnaSearchCommand 끝---------");
		
		return "/qna/qnaSearch.jsp";
		
		
		
	}
}

