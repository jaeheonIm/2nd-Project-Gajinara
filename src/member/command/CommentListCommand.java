package com.gaji.member.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;
import com.gaji.board.vo.CommentVO;

public class CommentListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("commentList command 도착");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		List<CommentVO> commentList = MemberDAO.commentList(mvo.getId());
		
		System.out.println("commentList : " + commentList);
		
		request.setAttribute("commentList", commentList);
		
		return "commentList.jsp";
	}

}
