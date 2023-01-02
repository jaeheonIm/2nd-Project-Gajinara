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

public class ProductDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> ProductDeleteCommand ---------");
		
		String boardIdx = request.getParameter("boardIdx");
		System.out.println("delete 컨트롤러 boardIdx : " + boardIdx);
		
		//BoardVO vo = new BoardVO();
		//vo.setId(request.getParameter("boardIdx"));
		
		BoardVO bvo = BoardDAO.getSearchIdx(boardIdx); 
		BoardDAO.getDelete(bvo);
		
		bvo = BoardDAO.getSearchIdx(boardIdx);
		
		
		session.setAttribute("bvo", bvo); 

		System.out.println(">> ProductDeleteCommand 끝---------");
		
		return "viewProduct.jsp";
	}

}
