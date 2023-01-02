package com.gaji.qna.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;



public class QnaDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> QnaDeleteCommand ---------");
		
		String qnaIdx = request.getParameter("qnaIdx");
		System.out.println("delete 컨트롤러 qnaIdx : " + qnaIdx);

		
		QnaVO qvo = QnaDAO.getSearchIdx(qnaIdx); 
		QnaDAO.getDelete(qvo);
		
		
		session.setAttribute("qvo", qvo); 

		System.out.println(">> QnaDeleteCommand 끝---------");
		
		return "/QnaController?type=qnaMain";
	}

}
