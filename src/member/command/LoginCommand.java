package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("로그인에 왔음");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String path = "/boardcontrol?type=start";
		
		System.out.println("입력된 id : " + id);
		System.out.println("입력된 pwd : " + pwd);
		
		HttpSession ss = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO mvo = dao.getOneMember(id);
		
		System.out.println("login : " + mvo);
		
		if (mvo != null) {						
				if (mvo.getPwd().equals(pwd)) {
					System.out.println("로그인 성공");
					ss.setAttribute("mvo", mvo);
					
					path = "/boardcontrol?type=start"; 

				} else {
					System.out.println("비밀번호가 틀립니다");
					path = "login.jsp";
				};
		} else {
			System.out.println("아이디가 없습니다");
			path = "login.jsp";			
		}
		return path;
	}
	
}
