package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class ModifyCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO mvo = dao.getOneMember(id);
		
		mvo.setName(request.getParameter("name"));
		mvo.setPwd(request.getParameter("pwd"));
		mvo.setPhone(request.getParameter("phone"));
		mvo.setPostcord(request.getParameter("postcord"));
		mvo.setRoadaddress(request.getParameter("roadaddress"));
		mvo.setDetailaddress(request.getParameter("detailaddress"));
		mvo.setEmail(request.getParameter("email"));
		
		 dao.modify(mvo);
		 
		 HttpSession ss = request.getSession();
		 
		 ss.setAttribute("mvo", mvo);
		 
		 System.out.println("수정 내용 : " + mvo);
		
		String path = "infoList.jsp";

		return path;
	}

}
