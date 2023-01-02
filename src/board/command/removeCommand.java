package com.gaji.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;

public class removeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardIdx = request.getParameter("boardIdx");
		
		System.out.println("삭제할 보드 : " + boardIdx);
		
		boardDAO.deleteBoard(boardIdx);		
		
		String path = "boardcontrol?type=viewList&cPage=1";
		return path;
	}

}
