package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.UriCommentVO;

public class Dongnae_commentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		String id = request.getParameter("userid");
		String content = request.getParameter("cmtcontent");
		
		UriBoardVO bvo =(UriBoardVO) request.getSession().getAttribute("board");		
		String path = null;
		if(id != null) {
			UriCommentVO cvo = new UriCommentVO();
			cvo.setId(id);
			cvo.setContent(content);
			cvo.setUriBoardIdx(bvo.getUriBoardIdx());
			if(cvo != null) {
				dao.insertComment(cvo);
				dao.updateCC(bvo.getUriBoardIdx());
				path = "controller?type=detail&uriBoardIdx="+bvo.getUriBoardIdx();
				System.out.println("comment insert 성공");
				System.out.println("cvo 값 : " + cvo);
			}
		} else {
			List<UriCommentVO> commentList = dao.getCommentList(bvo.getUriBoardIdx());
			request.setAttribute("commentList", commentList);
			path ="./blog-detail.jsp";
		}
		
		return path;
	}

}
