package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.dongnae.common.Paging;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.member.vo.MemberVO;

public class LoginCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		//MemberVO 가져오기		
		String id = request.getParameter("id");
		System.out.println(id);
		MemberVO vo = dao.getMember(id);
		
		session.setAttribute("user", vo);
		System.out.println("Login" + vo);
		return "controller?type=moveTo_Board";
	}

}
