package com.gaji.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;

public class ZzimCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("찜 커맨드에 도착");
		
		String zzim = request.getParameter("zzim");
		String boardIdx = request.getParameter("boardIdx");
		String id = request.getParameter("id");
		
		System.out.println("찜에서 아이디와 보드 : " + id + ", " + boardIdx);
		
		
		if (zzim.equals("on")) {
			boardDAO.zzimOn(boardIdx, id);
		} else if (zzim.equals("off")){
			boardDAO.zzimOff(boardIdx, id);
		}
		
		return null;
	}
	
}
