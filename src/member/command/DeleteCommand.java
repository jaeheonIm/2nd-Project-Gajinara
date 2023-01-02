package com.gaji.member.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.dao.MemberDAO;
import com.gaji.member.vo.MemberVO;

public class DeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String path = "/boardcontrol?type=start";
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO mvo = dao.getOneMember(id);
		
		mvo.setStatus(request.getParameter("status"));
		
		dao.delete(mvo);
		
		HttpSession ss = request.getSession();

		ss.invalidate();

		return path;
	}

}
