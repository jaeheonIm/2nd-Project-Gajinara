package com.gaji.admin.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.BoardDAO;
import com.gaji.admin.dao.MemberDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.member.vo.MemberVO;

public class ProductUpdateCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> ProductUpdateCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		
		System.out.println("product update 컨트롤러의 boardIdx : " + request.getParameter("boardIdx"));
		System.out.println("product update 컨트롤러의 category : " + request.getParameter("category"));
		System.out.println("product update 컨트롤러의 title : " + request.getParameter("title"));
		System.out.println("product update 컨트롤러의 price : " + request.getParameter("price"));
		
		BoardVO vo = new BoardVO();
		vo.setBoardIdx(request.getParameter("boardIdx"));
		vo.setCategory(request.getParameter("category"));
		vo.setTitle(request.getParameter("title"));
		vo.setPrice(request.getParameter("price"));
		vo.setContent(request.getParameter("content"));
		vo.setStatus(request.getParameter("status"));
		vo.setRegdate(request.getParameter("regdate"));
		
		BoardDAO.getUpdate(vo);
		
		BoardVO bvo = BoardDAO.getSearchIdx(request.getParameter("boardIdx"));
		
		session.setAttribute("bvo", bvo);

		System.out.println(">> ProductUpdateCommand 끝---------");
		
		return "viewProduct.jsp";
		
	}

}
