package com.gaji.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO mvo = new MemberVO();
		String path = "/boardcontrol?type=start";
		HttpSession ss = request.getSession();

		ss.invalidate();

		System.out.println("로그 아웃 후 : " + mvo);
		
		return path;
	}
	
}
