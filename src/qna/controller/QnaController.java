package com.gaji.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.gaji.qna.command.AllQnaCommand;
import com.gaji.qna.command.Command;
import com.gaji.qna.command.QnaDeleteCommand;
import com.gaji.qna.command.QnaPwdCommand;
import com.gaji.qna.command.QnaSearchIdxCommand;
import com.gaji.qna.command.QnaUpdateCommand;
import com.gaji.qna.command.QnaWriteCommand;
import com.gaji.qna.command.QnaWriteCommandOk;

@WebServlet("/QnaController")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		Command command = null;
		
		System.out.println("type : " + type);
				
		if(type.equals("qnaMain")) { 
			command = new AllQnaCommand();			
		} else if (type.equals("qnaWrite")) {
			command = new QnaWriteCommand();
		} else if (type.equals("qnaWriteOK")) {
			command = new QnaWriteCommandOk();
		} else if (type.equals("searchIdx")) {
			command = new QnaSearchIdxCommand();
		} else if (type.equals("qnaPwd")) {
			command = new QnaPwdCommand();
		} else if (type.equals("qnaUpdate")) {
			command = new QnaUpdateCommand();
		} else if (type.equals("qnaDelete")) {
			command = new QnaDeleteCommand();
		} else if (type.equals("searchProduct")) {
			//command = new ProductSearchCommand();
		}
						
		String path = command.exec(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
