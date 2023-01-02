package com.gaji.dongnae.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JsonObject;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;

public class Board_likesUpdateCommand implements Command{

	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("likes update 테스트");
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		
		String uriBoardIdx = request.getParameter("uriBoardIdx");
		UriBoardVO bvo = (UriBoardVO) request.getSession().getAttribute("board");
		dao.updateLikes(uriBoardIdx);
		bvo = dao.getOneList(uriBoardIdx);
		
		request.getSession().setAttribute("board", bvo);
		JsonObject obj = new JsonObject();
		obj.put("likes", bvo.getLikes());
		
		return obj.toJson();		
	}

}
