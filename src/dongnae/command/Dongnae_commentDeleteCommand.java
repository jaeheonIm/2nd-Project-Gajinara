package com.gaji.dongnae.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;

public class Dongnae_commentDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		
		String uriCommentIdx = request.getParameter("uriCommentIdx");
		String uriBoardIdx = request.getParameter("uriBoardIdx");
		System.out.println("uriCommentIdx" + uriCommentIdx );
		System.out.println("uriBoardIdx" + uriBoardIdx );
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		if(1 <= dao.deleteComment(uriCommentIdx)) {			
			path = "controller?type=detail&uriBoardIdx="+uriBoardIdx;			
		}				
		dao.updateCC(uriBoardIdx);
		return path;
	}

}