package com.gaji.board.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.CommentVO;
import com.gaji.member.vo.MemberVO;

public class ViewPageCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("여기는 viewPageCommand");
		
		String boardIdx = request.getParameter("boardIdx");
		// 보는 횟수 늘리기
		
		MemberVO mvo = (MemberVO) request.getSession().getAttribute("mvo");
		int isZZim = 2;
		
		if (mvo != null) {
			String id = mvo.getId();
			isZZim = boardDAO.isZZim(boardIdx, id);			
		}
		
		boardDAO.upBoardHit(boardIdx);				
		System.out.println("조회수 올리기 성공?");
		
		
//		보드아이디로 bvo 만들어서 같이 보내기, - 보기랑, 지우기랑, 수정하기
		BoardVO bvo = boardDAO.getOneBoard(boardIdx);
		
		
//		bvo에서 img 파일 쪼개기   <--------------------------------------------- 추가한 것
		if (bvo.getImg() != null) {
			StringTokenizer st = new StringTokenizer(bvo.getImg(), " ");
			
			Map<String, String> map = new HashMap<String, String>();
			Integer i = 0;
			
			while(st.hasMoreTokens()) {
				map.put("ro"+i.toString(), st.nextToken());
				i++;
			}
			request.setAttribute("map", map);
		}
		
		
				
		// 찜했는지 확인 하기 - 카운트로 받기?
		
		System.out.println("isZZim : " + isZZim);
		System.out.println("bvo : " + bvo);
		
		request.setAttribute("bvo", bvo);
		
		MemberVO seller = boardDAO.getOneMember(bvo.getId()); // 판매자 찾기
		List<CommentVO> cmtList = boardDAO.getComments(boardIdx);
		
		request.setAttribute("isZZim", isZZim);
		
		request.setAttribute("cmtList", cmtList);			
		System.out.println("cmtList :" + cmtList);
		
		request.setAttribute("seller", seller);
		
		String path = "board/view.jsp";
		
		System.out.println(cmtList);
							
		return path;
	}


}
