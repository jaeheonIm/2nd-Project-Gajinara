package com.gaji.dongnae.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.BoardVO;
import com.gaji.dongnae.vo.UriCommentVO;

public class Dongnae_commentWrtieCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		String id = request.getParameter("userid");
		String content = request.getParameter("cmtcontent");
		
		System.out.println("comment id : " + id);
		System.out.println("comment content : " + content);
		BoardVO bvo =(BoardVO) request.getSession().getAttribute("board");
		System.out.println("코멘트작성 command " + bvo);
		
		String path = null;
		
		UriCommentVO cvo = new UriCommentVO(bvo.getBoardIdx(), id, content);
		if(cvo != null) {
			dao.insertComment(cvo);
			path = "controller?type=detail&boardIdx="+bvo.getBoardIdx();
			System.out.println("comment insert 성공");
			System.out.println("cvo 값 : " + cvo);
		} 
		return path;
	}

}
