package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.common.Paging;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.CategoryPageVO;
import com.gaji.dongnae.vo.CategoryVO;

public class Dongnae_moveList implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		System.out.println("category: " + category);
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		
		String path = null;
		//페이징 처리를 위한 객체(Paging) 생성
		Paging p = new Paging();
		
		//1. 전체 게시물 수량 구하기
		if(category == null) {
			p.setTotalRecord(dao.getTotalCount());
			p.setTotalPage();		
		} else if (category != null) {
			p.setTotalRecord(dao.getTotalCount(category));
			p.setTotalPage();
		}
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		//System.out.println(">> 시작번호(begin) : " + p.getBegin());
		//System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		if(category == null) {
				
			List<UriBoardVO> list = dao.getList(p.getBegin(), p.getEnd());
			request.setAttribute("pvo", p);		
			request.setAttribute("fullList", list);
			path = "./blog.jsp";
			
		} else if(category != null) {		
			CategoryPageVO svo = new CategoryPageVO();			
			svo.setBegin(p.getBegin());
			svo.setEnd(p.getEnd());
			svo.setCategory(category);			
			
			List<UriBoardVO> list = dao.getDongnae_category(svo);
			request.setAttribute("pvo", p);		
			request.setAttribute("categoryList", list);
			request.setAttribute("category", svo);
			path = "/dongnae/blog.jsp?category="+category;			
			
		}		
		return path;
	}

}
