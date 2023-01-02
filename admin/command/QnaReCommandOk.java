package com.gaji.admin.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.vo.MemberVO;
import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;

public class QnaReCommandOk implements Command{

	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println(">> QnaReCommandOk ---------"); 

		String id = request.getParameter("id");
		System.out.println("id : " + id);
		String qnaIdx = request.getParameter("qnaIdx");
		System.out.println("qnaIdx : " + qnaIdx);
		
		
		String content = request.getParameter("content");
		String qnaPwd = request.getParameter("qnaPwd");
		String title = request.getParameter("title");

		QnaVO qvo = new QnaVO();
		qvo.setId(id);
		qvo.setQnaIdx(qnaIdx);
		qvo.setContent(content);
		qvo.setQnaPwd(qnaPwd);
		qvo.setTitle(title);

		System.out.println("QNA_IDX update 실행");
		QnaDAO.updateSeq(qnaIdx);

		System.out.println("답글 작성 실행");
		QnaDAO.insertReQna(qvo);
		
		System.out.println("seq 증가 실행");
		QnaDAO.increaseSeq();

		session.setAttribute("qvo", qvo);
		
		System.out.println(">> QnaReCommandOk 끝 ---------"); 
		return "/QnaController?type=qnaMain";
	}
}
