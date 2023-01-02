package com.gaji.member.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class idCheckCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("idCheck command 도착");
		
		String path = "";
		String id = request.getParameter("id");
		
		System.out.println("입력된 id : " + id);
		
		MemberVO mvo = MemberDAO.getOneMember(id);
		
		System.out.println(mvo);
		
		String result ="";

		if (mvo != null) {
			if(id.equals(mvo.getId())) {
				System.out.println("입력된 id가 중복됩니다.");
				result = "1";
				
			} else {
				System.out.println("사용 가능한 id입니다.");
				result = "2";
			}
		}
		
		return result;
	}

}
