package com.gaji.dongnae.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.UriCommentVO;

public class Dongnae_detailDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path;
		HttpSession session = request.getSession(true);
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		UriBoardVO bvo = (UriBoardVO)session.getAttribute("board");
		
		if(bvo.getTitle() == null) {
			path = "controller?type=detail&uriBoardIdx="+bvo.getUriBoardIdx();
			System.out.println("Dongnae_detailDeleteCommand 삭제 실패");
		} else {
			dao.deleteBoardU(bvo);
			dao.deleteCommentU(bvo.getUriBoardIdx());
			path = "controller?type=moveTo_Board";
			session.removeAttribute("board");			
		}
		return path;
	}
}
