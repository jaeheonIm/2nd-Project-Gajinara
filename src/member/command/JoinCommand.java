package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class JoinCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("join command 도착");
		
		MemberVO mvo = new MemberVO();
		
		mvo.setId(request.getParameter("id"));
		mvo.setPwd(request.getParameter("pwd"));
		mvo.setName(request.getParameter("name"));
		mvo.setBirth(request.getParameter("birth"));
		mvo.setPhone(request.getParameter("phone"));
		mvo.setPostcord(request.getParameter("postcord"));
		mvo.setRoadaddress(request.getParameter("roadaddress"));
		mvo.setDetailaddress(request.getParameter("detailaddress"));
		mvo.setEmail(request.getParameter("email"));

		MemberDAO dao = new MemberDAO();
		
		dao.join(mvo);
		
		HttpSession ss = request.getSession();
		
		ss.setAttribute("mvo", mvo);
		
		System.out.println("회원가입 : " + mvo);
		
		String path = "/boardcontrol?type=start";

		return path;
	}

}
