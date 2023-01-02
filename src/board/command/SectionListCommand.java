package com.gaji.board.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.Paging;

public class SectionListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SectionListCommand 여기 커맨드로 들어옴");
		
		// 한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html; charset=UTF-8");	
		
		String section = request.getParameter("section");
		request.setAttribute("section", section);
		System.out.println("section : "+ section);
				
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
		
		// 정보 변환
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
		
		// Json으로 변환
		String result = makeJson(bbsList, p, section);
				
		System.out.println(":: 응답 JSON 문자열 : " + result);
		
		PrintWriter out = response.getWriter();
//		out.print("{\"idx\":1}"); // {"idx : 1"}
		
		out.print(result);
		
		return null;
	}

	private String makeJson(List<BoardVO> bbsList, Paging p, String section) {

		StringBuilder result  = new StringBuilder();
		
		// bbs 리스트 제이슨으로
		result.append("{\"bbsList\" : [");		
		for (BoardVO bvo : bbsList) {
			result.append("{");
			result.append("\"img\" : " +"\"" + bvo.getImg() + "\" ,");
			result.append("\"boardIdx\" : \""+ bvo.getBoardIdx() + "\",");
			result.append("\"price\" : \""+ bvo.getPrice() +"\",");
			result.append("\"title\" : \"" + bvo.getTitle() + "\",");
			result.append("\"content\" : \"" + bvo.getContent() +"\"");
			result.append("},");
		}		
		result.deleteCharAt(result.length()-1); // 마지막 컴마 삭제				
//		
//		// 페이징 제이슨으로
		result.append("], \"pvo\" : [");				
		result.append("{");
		result.append("\"nowPage\" : \"" + p.getNowPage() + "\",");
		result.append("\"beginPage\" : \""+ p.getBeginPage() + "\",");
		result.append("\"endPage\" : \""+ p.getEndPage() +"\",");
		result.append("\"totalPage\" : \"" + p.getTotalPage() + "\"");
		result.append("}");		
		
		// 섹션 제이슨으로
//		result.append("{\"section\" : ");
		result.append("], \"section\" : ");			
		
		result.append('\"'+section+'\"');		
		result.append(" }");
				
		return result.toString();		

	}

}
