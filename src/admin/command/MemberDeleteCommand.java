package com.gaji.admin.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class MemberDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> MemberDeleteCommand ---------");
		
		String id = request.getParameter("id");
		System.out.println("delete 컨트롤러 id : " + id);
		
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		
		MemberDAO.getDelete(vo);
		
		MemberVO mvo = MemberDAO.getSearchId(id);
		
		session.setAttribute("mvo", mvo); 

		System.out.println(">> MemberDeleteCommand 끝---------");
		
		return "viewUser.jsp";
	}

}
