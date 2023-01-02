package com.gaji.board.command;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.Paging;
import com.gaji.board.vo.categoryVO;

public class ViewSectionListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("뷰섹션리스트코맨드에 도착함");
		
		HttpSession session = request.getSession();
		List<categoryVO> caList = boardDAO.getCategory();		
		
		session.setAttribute("caList", caList);			
		
		String path = "board/board.jsp";
		
		String section = request.getParameter("section");
		
		System.out.println("section: " + section);
		
		request.setAttribute("section", section);
				
				
		// 전체 페이지 수 가져오기
		Paging p = new Paging();		
		p.setTotalRecord(boardDAO.getTotalCount(section));
		p.setTotalPage(); // 가져온 페이지로 전체 페이지 구하기
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		// 현재 페이지에 시작할 첫게시글 번호, 끝 게시글 번호
		p.setEnd(p.getNowPage()*p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() +1);
		
		if (p.getEnd() > p.getTotalRecord()) p.setEnd(p.getTotalRecord()); // 끝번호가 더 크면 토탈번호와 맞게 하기 - 끝블록 끝페이지 때문
		
		// 블록 계산하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage -1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) p.setEndPage(p.getTotalPage());

		// 리스트 가져오기
		List<BoardVO> bbsList = boardDAO.getSectionList(p.getBegin(), p.getEnd(), section);
		
		
		for(BoardVO bvo : bbsList) {
			if (bvo.getImg() == null) continue;
			
			String imgs = bvo.getImg();
			System.out.println("imgs : " + imgs);
			
			StringTokenizer st = new StringTokenizer(imgs, " ");
			String chImg = st.nextToken();
			bvo.setImg(chImg);
		}
		
		for(BoardVO bvo : bbsList) {						
			String content = bvo.getContent();	
			if (content.length() < 100) continue;
			
			bvo.setContent(content.substring(0, 100));
		}
		
		
		request.setAttribute("bbsList", bbsList);
		request.setAttribute("pvo", p);		
		
		System.out.println(bbsList);
		System.out.println(caList);
		
		return path;
	}

}
