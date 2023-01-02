package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class FindIdCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("findId command 시작");

		String pn = request.getParameter("phone");
		String em = request.getParameter("email");
		
		System.out.println("입력된 phone : " + pn);
		System.out.println("입력된 email : " + em);
		
		MemberVO FindId1 = MemberDAO.findId_Phone(pn);
		MemberVO FindId2 = MemberDAO.findId_Email(em);

		System.out.println("조회된 FindId1 : " + FindId1);
		System.out.println("조회된 FindId2 : " + FindId2);

		if (pn.equals(FindId1.getPhone()) && em.equals(FindId2.getEmail())) {
			System.out.println("입력 phone 정보와 vo phone정보 일치");
			System.out.println("입력 email 정보와 vo email정보 일치");
			request.setAttribute("FindId1", FindId1);
			request.setAttribute("FindId2", FindId2);
		} else {
			System.out.println("phone, email 불일치");
		}
		return "findId_go.jsp";
	}

}
