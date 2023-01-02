package com.gaji.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;

public class removeCmtCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardIdx = request.getParameter("boardIdx");
		String commentIdx = request.getParameter("commentIdx");
		
		String path = "boardcontrol?type=viewcon&boardIdx="+boardIdx;
		
		boardDAO.deleteCmt(commentIdx);
		
		return path;
	}

}
