package com.gaji.board.command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.categoryVO;
import com.gaji.member.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.jdi.Location;

public class WriteBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ok = request.getParameter("ok");
		System.out.println("ok : " + ok);
		HttpSession session = request.getSession();
		
		List<categoryVO> caList = boardDAO.getCategory();
		request.setAttribute("caList", caList);
								
		MemberVO mvo = null;		
		mvo = (MemberVO) session.getAttribute("mvo");		
		
		
		System.out.println("mvo : " + mvo);
		String path = "";
		String id, title, category, price, content;
		
		// 로그인 안됐으면 로그인 페이지로 이동, 한번 더 체크
		if (mvo == null) {
			path = "/member/login.jsp";
		}
		
		if (mvo != null) {
			BoardVO bvo = new BoardVO();
			
			if (!ok.equals("ok")) { // 작성 장소 갈때
				
				path = "board/writeBoard.jsp";
							
			} else if (ok.equals("ok")) { // 입력 할때
							
				
				String imgPath = request.getServletContext().getRealPath("/upload"); // 업로드의 실제 패스값을 저장 리얼패스임
				
				File file = new File(imgPath);
				file.mkdirs();
				
				System.out.println(request.getParameter("title"));
				System.out.println("리얼패스인 imgPath : " + imgPath);
											
				
				MultipartRequest mr = new MultipartRequest(
			 			request, // 요청 객체
			 			imgPath, // 실제 파일을 저장할 경로
			 			10 * 1024 * 1024, // 업로드 파일의 최대 크기 (byte단위)
			 			"UTF-8", //인코딩 형식
			 			new DefaultFileRenamePolicy() // 중복값 있을시? 파일 이름 변경하겠다 					
			 	);
							
				
				StringBuffer realImgName = new StringBuffer();
				String img1 = mr.getFilesystemName("img1");
				String img2 = mr.getFilesystemName("img2");
				String img3 = mr.getFilesystemName("img3");
				String img4 = mr.getFilesystemName("img4");
				
				if (img1 != null) {
					realImgName.append(img1);
					realImgName.append(" ");				
				}
				if (img2 != null) {
					realImgName.append(img2);
					realImgName.append(" ");				
				}
				if (img3 != null) {
					realImgName.append(img3);
					realImgName.append(" ");				
				}
				if (img4 != null) {
					realImgName.append(img4);
					realImgName.append(" ");				
				}
							
							
				System.out.println("realImgName : " + realImgName);			
//				String realImgPath = imgPath + "/" + realImgName;
										
				title = mr.getParameter("title");
				category = mr.getParameter("category");
				price = mr.getParameter("price");
				content = mr.getParameter("content");
				id = mvo.getId();
										
				bvo.setImg(realImgName.toString()); // 실제파일명 들어가야함
				bvo.setTitle(title);
				bvo.setCategory(category);
				bvo.setPrice(price);
				bvo.setContent(content);
				bvo.setId(id);			
				
				System.out.println("bvo: " + bvo);
				
				boardDAO.insertBoard(bvo);
											
				path = "boardcontrol?type=viewList&cPage=1";			
			}	
		}
										
	
		
		return path;
	}
	
	
}
