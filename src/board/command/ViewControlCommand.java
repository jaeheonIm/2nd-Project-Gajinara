package com.gaji.board.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.CommentVO;
import com.gaji.board.vo.Paging;
import com.gaji.member.vo.MemberVO;

public class ViewControlCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String boardIdx = request.getParameter("boardIdx");
		// 보는 횟수 늘리기
		boardDAO.upBoardHit(boardIdx);
		
//		보드아이디로 bvo 만들어서 같이 보내기, - 보기랑, 지우기랑, 수정하기
		BoardVO bvo = boardDAO.getOneBoard(boardIdx);
		
		String img = bvo.getImg();
		String imgPath = request.getServletContext().getRealPath("/upload") + "/" + img;
		request.setAttribute("imgPath", imgPath);
		// 보내고, bvo.getId() 값이 null이 아닌 경우 이 값을 넣고 아니면, 기본 사진을 띄우는 것으로 생각하면 좋을 듯
		
		request.setAttribute("bvo", bvo);
		
		MemberVO seller = boardDAO.getOneMember(bvo.getId()); // 판매자 찾기
		List<CommentVO> cmtList = boardDAO.getComments(boardIdx);
		
		request.setAttribute("cmtList", cmtList);			
		System.out.println("cmtList :" + cmtList);
		
		request.setAttribute("seller", seller);
		
		String path = "/board/view.jsp";						
							
		return path;
	}


}
