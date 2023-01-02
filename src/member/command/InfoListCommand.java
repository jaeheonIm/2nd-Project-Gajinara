package com.gaji.member.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class InfoListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("infoList command 도착");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		List<MemberVO> infoList = MemberDAO.infoList(mvo.getId());
		
		request.setAttribute("infoList", infoList);
		
		System.out.println("infoList : " + infoList);
		
		return "infoList.jsp";
	}

}
