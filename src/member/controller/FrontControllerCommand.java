package com.gaji.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.member.command.Command;
import com.gaji.member.command.CommentListCommand;
import com.gaji.member.command.JoinCommand;
import com.gaji.member.command.LoginCommand;
import com.gaji.member.command.ModifyCommand;
import com.gaji.member.command.ModifyPwCommand;
import com.gaji.member.command.InfoListCommand;
import com.gaji.member.command.LogoutCommand;
import com.gaji.member.command.DeleteCommand;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;
import com.gaji.member.command.BuyListCommand;
import com.gaji.member.command.SaleListCommand;
import com.gaji.member.command.SoldOutListCommand;
import com.gaji.member.command.UriCommentListCommand;
import com.gaji.member.command.WishListCommand;
import com.gaji.member.command.idCheckCommand;
import com.gaji.member.command.FindIdCommand;
import com.gaji.member.command.FindPwdCommand;

@WebServlet("/member/controller")
public class FrontControllerCommand extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> FrontControllerCommand doGet() 실행~!~!~!!!!!");
		
		String type = request.getParameter("type");
		
		System.out.println("type : " + type);
		
		Command command = null;
		if ("join".equals(type)) {
			command = new JoinCommand();
		}  else if("idCheck".equals(type)) {
			command = new idCheckCommand();
		}  else if("login".equals(type)) {
			command = new LoginCommand();
		}  else if("modify".equals(type)) {
			command = new ModifyCommand();
		}	else if("modifyPw".equals(type)) {
			command = new ModifyPwCommand();
		}	else if("infoList".equals(type)) {
			command = new InfoListCommand(); 
		}   else if("logout".equals(type)) {
			command = new LogoutCommand(); 
		} 	else if("delete".equals(type)) {
			command = new DeleteCommand(); 
		}  else if("buyList".equals(type)) {
			command = new BuyListCommand(); 
		}  else if("saleList".equals(type)) {
			command = new SaleListCommand(); 
		}  else if("soldOutList".equals(type)) {
			command = new SoldOutListCommand(); 
		}  else if("wishList".equals(type)) {
			command = new WishListCommand();
		} else if("findId".equals(type)) {
			command = new FindIdCommand();
		} else if("findPwd".equals(type)) {
			command = new FindPwdCommand();
		} else if("uriCommentList".equals(type)) {
			command = new UriCommentListCommand();
		} else if("commentList".equals(type)) {
			command = new CommentListCommand();
		} 		
		
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<CategoryVO> list = dao.getCategory();
		request.setAttribute("Categories", list);
		
		String path = command.exec(request, response);
		if(path.contains(".jsp")) {
			request.getRequestDispatcher(path).forward(request, response);
		} else if(path.contains("type")) {
			request.getRequestDispatcher(path).forward(request, response);
		}	else {
			PrintWriter out	= response.getWriter();
			out.write(path);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> FrontController doPost() 실행~!~!~!!!!!");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		
	}
}
