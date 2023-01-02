package com.gaji.member.command;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.member.dao.MemberDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.member.vo.MemberVO;

public class WishListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("wishList command 도착");
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		
		List<BoardVO> wishList = MemberDAO.wishList(mvo.getId());
		
		for(BoardVO bvo : wishList) {
			if (bvo.getImg() == null) continue;
			
			String imgs = bvo.getImg();
			System.out.println("imgs : " + imgs);
			
			StringTokenizer st = new StringTokenizer(imgs, " ");
			String chImg = st.nextToken();
			bvo.setImg(chImg);
		}
		
		System.out.println("wishList : " + wishList);
		
		request.setAttribute("wishList", wishList);
		
		return "wishList.jsp";
	}

}
