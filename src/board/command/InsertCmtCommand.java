package com.gaji.board.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.CommentVO;
import com.gaji.member.vo.MemberVO;

public class InsertCmtCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터 가져오기
		String content = request.getParameter("content");
		String boardIdx = request.getParameter("boardIdx");
		String path = "";
//		String id = request.getParameter("id");
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		if (mvo == null) {
			path = "/member/login.jsp";
		}
		
		if (mvo != null) {
			String id = mvo.getId();
			
			
			// 보드에 cc수 하나 늘리기
			boardDAO.upBoardCc(boardIdx);
			
			// 코멘트 넣기
			HashMap<String, String> map = new HashMap<String, String>();  
			map.put("content", content);
			map.put("boardIdx", boardIdx);
			map.put("id", id);
			boardDAO.inserCmt(map);
			
			// 게시판 다시 가져오기
			BoardVO bvo = boardDAO.getOneBoard(boardIdx);
			request.setAttribute("bvo", bvo);
			MemberVO seller = boardDAO.getOneMember(bvo.getId()); // 판매자 찾기
			List<CommentVO> cmtList = boardDAO.getComments(boardIdx);
			
			request.setAttribute("cmtList", cmtList);		
			request.setAttribute("seller", seller);
			
			System.out.println(cmtList);
					
			// 패스 설정
			path = "/boardcontrol?type=viewcon&boardIdx="+ boardIdx;			
		}

		return path;
	}

}
