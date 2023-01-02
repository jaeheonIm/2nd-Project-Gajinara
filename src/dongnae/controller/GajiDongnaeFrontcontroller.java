package com.gaji.dongnae.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.command.BoardWriteCommand;
import com.gaji.dongnae.command.BoardWriteOKCommand;
import com.gaji.dongnae.command.Board_commentList;
import com.gaji.dongnae.command.Board_likesUpdateCommand;
import com.gaji.dongnae.command.Command;
import com.gaji.dongnae.command.Dongane_detailUpadteCommand;
import com.gaji.dongnae.command.Dongane_detailUpadteOKCommand;
import com.gaji.dongnae.command.Dongnae_commentDeleteCommand;
import com.gaji.dongnae.command.Dongnae_commentUpdateCommand;
import com.gaji.dongnae.command.Dongnae_commentWriteCommand;
import com.gaji.dongnae.command.Dongnae_detailCommand;
import com.gaji.dongnae.command.Dongnae_detailDeleteCommand;
import com.gaji.dongnae.command.Dongnae_moveList;
import com.gaji.dongnae.command.LoginCommand;
import com.gaji.dongnae.command.SearchCommand;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;

@WebServlet("/dongnae/controller")
public class GajiDongnaeFrontcontroller extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		Command command = null;
		System.out.println(type);
		
		if(type.equals("login")) {
			command = new LoginCommand();
			
		} else if(type.equals("moveTo_Board")) {
			command = new Dongnae_moveList();
			
		} else if(type.equals("search_all")) {
			command = new SearchCommand();
			
		} else if(type.equals("boardWrite")) {
			command = new BoardWriteCommand();
			
		} else if (type.equals("write_ok")) {
			command = new BoardWriteOKCommand();
			
		} else if (type.equals("detail")) {
			command = new Dongnae_detailCommand();
			
		} else if (type.equals("update_board")) {
			command = new Dongane_detailUpadteCommand();
			
		} else if (type.equals("update_board_ok")) {
			command = new Dongane_detailUpadteOKCommand();
			
		} else if (type.equals("delete_board")) {
			command = new Dongnae_detailDeleteCommand();
			
		} else if (type.equals("comment_write")) {
			command = new Dongnae_commentWriteCommand();
			
		} else if (type.equals("comment_Update")) {
			command = new Dongnae_commentUpdateCommand();
			
		} else if (type.equals("comment_Delete")) {
			command = new Dongnae_commentDeleteCommand();
			
		} else if (type.equals("updateLikes")) {
			command = new Board_likesUpdateCommand();
			
		} else if (type.equals("getCommentList")) {
			command = new Board_commentList();
		}
		String path = command.exec(request, response);
		
		if(path.contains(".jsp")) {
			request.getRequestDispatcher(path).forward(request, response);
		} else if(path.contains("controller")) {
			request.getRequestDispatcher(path).forward(request, response);
		} else {
				PrintWriter out = response.getWriter();
				out.write(path);
				out.close();
		}
	}
		
/*		if(type.equals("detail")) {
			String boardIdx = request.getParameter("boardIdx");
			System.out.println("boardIdx : " + boardIdx);
			BoardVO vo = dao.getOneList(boardIdx);
			request.setAttribute("board", vo);
			request.getRequestDispatcher("../dongnae/Dongnae_detail.jsp").forward(request, response);
			
		} else if (type.equals("write")) {
			System.out.println("write 실행");
			request.getRequestDispatcher("../dongnae/Dongnae_write.jsp").forward(request, response);
			
		} else if (type.equals("write_ok")) {
			request.getRequestDispatcher("../dongnae/Dongnae_write_ok.jsp").forward(request, response);
			
		} else if (type.equals("update_board")) {
			System.out.println("update_board 실행");
			String boardIdx = request.getParameter("boardIdx");
			BoardVO bvo = dao.getOneList(boardIdx);
			request.setAttribute("board", bvo);
			request.getRequestDispatcher("../dongnae/Dongnae_update.jsp").forward(request, response);
			
		} else if (type.equals("update_board_ok")) {
			
			request.getRequestDispatcher("../dongnae/Dongnae_update_ok.jsp").forward(request, response);
		}
		
	
*/	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
