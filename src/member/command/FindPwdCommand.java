package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class FindPwdCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("findPwd command 시작");
		
		String id = request.getParameter("id");
		String pn = request.getParameter("phone");
		String em = request.getParameter("email");
		
		System.out.println("입력된 id : " + id);
		System.out.println("입력된 phone : " + pn);
		System.out.println("입력된 email : " + em);
		
		HttpSession ss = request.getSession();
		
		MemberVO FindPwd1 = MemberDAO.findPwd_Id(id);
		MemberVO FindPwd2 = MemberDAO.findPwd_Phone(pn);
		MemberVO FindPwd3 = MemberDAO.findPwd_Email(em);

		System.out.println("조회된 FindPwd1 : " + FindPwd1);
		System.out.println("조회된 FindPwd2 : " + FindPwd2);
		System.out.println("조회된 FindPwd3 : " + FindPwd3);


		if(id.equals(FindPwd1.getId()) && pn.equals(FindPwd2.getPhone()) && em.equals(FindPwd3.getEmail())) {
			System.out.println("아이디, 폰번호, 이메일 일치 - Pwd 출력");
			request.setAttribute("FindPwd1", FindPwd1);
			request.setAttribute("FindPwd2", FindPwd2);
			request.setAttribute("FindPwd3", FindPwd3);
		} else {
			System.out.println("아이디, 폰번호, 이메일 불일치");
		}
		
		return "findPwd_go.jsp";
	}

}
