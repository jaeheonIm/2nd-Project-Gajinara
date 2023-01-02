package com.gaji.member.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class ModifyPwCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원 정보 수정에서 pw 입력으로 도착");

		String path = "";
		String pwd = request.getParameter("pwd");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		List<MemberVO> pwdGet = MemberDAO.getPwdMember(mvo.getPwd());
		
		System.out.println("조회된 pwd : " + pwdGet);
		
		System.out.println("수정 ID 정보 : " + mvo);	
		
		HttpSession ss = request.getSession();
	
		if (mvo != null) {
			if(mvo.getPwd().equals(pwd)) {
				System.out.println("pwd 일치");
				ss.setAttribute("mvo", mvo);
				path = "modify.jsp";
			} else {
				System.out.println("pwd 불일치");
				path = "modifyPw.jsp";
			}
		}

		return path;
	}

}
