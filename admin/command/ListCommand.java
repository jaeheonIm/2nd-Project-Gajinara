package com.gaji.admin.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.admin.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class ListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		System.out.println(">> LIstCommand ---------");
		
		// 1. DB연결하고 데이터 가져오기
		List<MemberVO> list = MemberDAO.getList();
		
		// 2. 응답할 페이지(list.jsp)에 DB에서 가져온 데이터 전달
		session.setAttribute("list", list); //MemberVO가 담겨져있는 list 객체를 "list"라는 이름으로 저장

		System.out.println(">> LIstCommand 끝---------");
		
		return "/admin/list.jsp";
		
	}

}


