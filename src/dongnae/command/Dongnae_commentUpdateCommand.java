package com.gaji.dongnae.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JsonObject;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriCommentVO;

public class Dongnae_commentUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("uriCommentIdx");
		String content = request.getParameter("content");
		String uriBoardIdx = request.getParameter("uriBoardIdx");
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		UriCommentVO cvo = new UriCommentVO();
		cvo.setUriCommentIdx(idx);
		cvo.setContent(content);
		dao.updateComment(cvo);
		
		JsonObject obj = new JsonObject();
		obj.put("content",cvo.getContent());
		obj.put("uriBoardIdx",uriBoardIdx);
		obj.put("uriCommentIdx",cvo.getUriCommentIdx());
		System.out.println(obj.toJson());
		return obj.toJson();
	}

}
