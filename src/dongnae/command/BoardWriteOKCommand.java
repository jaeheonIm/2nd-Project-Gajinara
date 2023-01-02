package com.gaji.dongnae.command;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOKCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String savePath = request.getServletContext().getRealPath("/upload");
		File file = new File(savePath);
		file.mkdirs();
		
		HttpSession session = request.getSession();	
		MultipartRequest mr = new MultipartRequest(
				request, //요청객체
				savePath, //실제 파일을 저장할 경로
				10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
				"UTF-8", //인코딩 형식
				new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경 처리
				);
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String category = mr.getParameter("category");
		String filename = mr.getFilesystemName("filename");
		
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		UriBoardVO bvo = new UriBoardVO();			
		bvo.setId(vo.getId());
		bvo.setName(vo.getName());
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setCategory(category);
		bvo.setImg(filename);		
		System.out.println("id:" + vo.getId() + "\n"
						  +"name:" + vo.getName() + "\n"
						  + "title:" + title + "\n"
						  + "content:" + content + "\n"
						  + "category:" + category + "\n"
						  + "filename:" + filename + "\n"
						  + "savePath:" + savePath);
		List<UriBoardVO> list = dao.getList();
		request.setAttribute("list", list);
		String path;
		if(vo.getId() == null || category == null) {
			path = "controller?type=moveTo_Board";
		} else {
			dao.insertBoard(bvo);
			path = "controller?type=moveTo_Board";
		}
		return path;
	}

}
