package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;
import com.gaji.member.vo.MemberVO;

public class BoardWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();		
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<CategoryVO> list = dao.getCategory();
		
		String path = "";
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		request.setAttribute("categoryList", list);
		System.out.println("글쓰기 user : " + vo);
		
		if(vo == null) {
			path = "/member/login.jsp";
		} else {
			return "/dongnae/write.jsp";
		}
		return path;
	}

}
