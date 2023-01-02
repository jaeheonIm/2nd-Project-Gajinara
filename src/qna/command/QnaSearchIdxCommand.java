package com.gaji.qna.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;




public class QnaSearchIdxCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
	
		System.out.println(">> QnaSearchIdxCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		String qnaIdx = request.getParameter("qnaIdx"); 
		
		System.out.println(">qnaIdx : -" + qnaIdx + "-");
		
		QnaVO qvo = QnaDAO.getSearchIdx(qnaIdx);
		
		
		
		// 2. 응답할 페이지(list.jsp)에 DB에서 가져온 데이터 전달
		session.setAttribute("qvo", qvo); //MemberVO가 담겨져있는 list 객체를 "list"라는 이름으로 저장

		System.out.println(">> QnaSearchIdxCommand 끝---------");
		
		return "/qna/qnaUpdate.jsp";
	}

}
