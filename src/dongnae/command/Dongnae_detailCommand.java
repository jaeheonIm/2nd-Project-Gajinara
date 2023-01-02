package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.dongnae.common.Paging;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.UriCommentVO;
import com.gaji.member.vo.MemberVO;

public class Dongnae_detailCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
				
		String uriBoardIdx = request.getParameter("uriBoardIdx");
		String cPage = request.getParameter("cPage");
		dao.updateHit(uriBoardIdx);
		UriBoardVO bvo = dao.getOneList(uriBoardIdx);					
		List<UriCommentVO> commentList = dao.getCommentList(uriBoardIdx);
		System.out.println(bvo);		
		session.setAttribute("board", bvo);		
		request.setAttribute("commentList", commentList);
		request.setAttribute("cPage", cPage);		
		System.out.println(commentList);
		return "./blog-detail.jsp";
	}

}
