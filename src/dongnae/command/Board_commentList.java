package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JsonArray;
import org.json.simple.JsonObject;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriCommentVO;

public class Board_commentList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uriBoardIdx = request.getParameter("uriBoardIdx");
		System.out.println("commentList 테스트");
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<UriCommentVO> list = dao.getCommentList(uriBoardIdx);
		JsonObject ob = new JsonObject();
		JsonArray jary =  new JsonArray();
		for(int i = 0; i < list.size(); i++) {
			JsonObject sob = new JsonObject();
			sob.put("id", list.get(i).getId());
			sob.put("name", list.get(i).getName());
			sob.put("regadate", list.get(i).getRegdate());
			sob.put("uriBoardIdx", list.get(i).getUriBoardIdx());
			sob.put("uriCommentIdx", list.get(i).getUriCommentIdx());
			jary.add(sob);			
		}
		ob.put("commentList", jary);
		System.out.println(ob.toJson());
		return ob.toJson();
	}

}
