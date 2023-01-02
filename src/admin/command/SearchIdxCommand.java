package com.gaji.admin.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;


public class SearchIdxCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println(">> SearchIdxCommand ---------");

		String idx = request.getParameter("idx"); 
		
		System.out.println(">idx : -" + idx + "-");
		
		MemberVO mvo = MemberDAO.getSearchIdx(idx);
		
		session.setAttribute("mvo", mvo); 

		System.out.println(">> SearchIdxCommand 끝---------");
		
		return "updateMember.jsp";
	}

}
