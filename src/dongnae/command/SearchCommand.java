package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.common.Paging;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.CategoryPageVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		System.out.println("searchCommand keyword: " + keyword);
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		Paging p = new Paging();
		
		p.setTotalRecord(dao.getTotalCountSearch(keyword));
		p.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}	
		
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		CategoryPageVO svo = new CategoryPageVO();			
		svo.setBegin(p.getBegin());
		svo.setEnd(p.getEnd());
		svo.setKeyword(keyword);
		
		List<UriBoardVO> list = dao.getSearchList(svo);
		request.setAttribute("fullList", list);
		request.setAttribute("pvo", p);
		return "/dongnae/blog.jsp?keyword="+keyword;
	}

}
