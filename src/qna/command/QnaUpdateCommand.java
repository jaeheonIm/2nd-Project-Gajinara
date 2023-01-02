package com.gaji.qna.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;

public class QnaUpdateCommand  implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
	
	
		System.out.println(">> QnaUpdateCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		
		System.out.println("qnaIdx : " + request.getParameter("qnaIdx"));
		
		
		QnaVO vo = new QnaVO();
		vo.setId(request.getParameter("id"));
		vo.setQnaIdx(request.getParameter("qnaIdx"));
		vo.setTitle(request.getParameter("title"));
		vo.setPhone(request.getParameter("phone"));
		vo.setQnaPwd(request.getParameter("qnaPwd"));
		vo.setContent(request.getParameter("content"));
		vo.setEmail(request.getParameter("email"));
	
		QnaDAO.getUpdate(vo);
		
		QnaVO qvo = QnaDAO.getSearchIdx(request.getParameter("qnaIdx"));
		
		session.setAttribute("qvo", qvo); 

		System.out.println(">> QnaUpdateCommand 끝---------");
		
		return "/qna/qnaOneView.jsp";
	}
}
