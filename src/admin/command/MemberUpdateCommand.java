package com.gaji.admin.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class MemberUpdateCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		System.out.println(">> MemberUpdateCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		
		System.out.println("update 컨트롤러의 id : " + request.getParameter("id"));
		System.out.println("update 컨트롤러의 status : " + request.getParameter("status"));
		System.out.println("update 컨트롤러의 grade : " + request.getParameter("grade"));
		System.out.println("update 컨트롤러의 name : " + request.getParameter("name"));
		
		MemberVO vo = new MemberVO();
		vo.setPwd(request.getParameter("pwd"));
		vo.setId(request.getParameter("id"));
		vo.setBirth(request.getParameter("birth"));
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		vo.setRoadaddress(request.getParameter("roadaddress"));
		vo.setDetailaddress(request.getParameter("detailaddress"));
		vo.setEmail(request.getParameter("email"));
		vo.setGrade(request.getParameter("grade"));
		vo.setStatus(request.getParameter("status"));
		
		MemberDAO.getUpdate(vo);
		
		MemberVO mvo = MemberDAO.getSearchId(request.getParameter("id"));
		
		session.setAttribute("mvo", mvo);

		System.out.println(">> MemberUpdateCommand 끝---------");
		
		return "viewUser.jsp";
		
	}

}
