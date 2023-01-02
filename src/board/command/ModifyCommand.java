package com.gaji.board.command;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "";
		String id, title, category, price, content;
		
		// 작성하러 가는 곳
		String boardIdx = request.getParameter("boardIdx");
		// 보드번호로 디비에서 불러와서 어트리뷰트 세팅해두기 -그래서 수정하는 곳에서 불러와서 수정해야함
		String cPage = request.getParameter("cPage");
		String ok = request.getParameter("ok");	
		
		BoardVO bvo = boardDAO.getOneBoard(boardIdx);
		
		
		if (bvo.getImg() != null) {
			StringTokenizer st = new StringTokenizer(bvo.getImg(), " ");
			
			Map<String, String> map = new HashMap<String, String>();
			Integer i = 1;
			
			while(st.hasMoreTokens()) {
				map.put("thumb"+ i.toString(), st.nextToken());
				i++;
			}
			request.setAttribute("map", map);
		}
				
		request.setAttribute("bvo", bvo);				
		path = "/board/modifyBoard.jsp?boardIdx=" + boardIdx + "&cPage="+cPage ;
		
		if(ok.equals("ok")) {
			
			String imgPath = request.getServletContext().getRealPath("/upload"); // 업로드의 실제 패스값을 저장 리얼패스임
			
			request.setAttribute("imgPath", imgPath);
			
			//파일 업로드와 객체 등록
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
//			String realImgPath = imgPath + "/" + realImgName;
									
			title = mr.getParameter("title");
			category = mr.getParameter("category");
			price = mr.getParameter("price");
			content = mr.getParameter("content");
			id = bvo.getId();
									
			bvo.setImg(realImgName.toString()); // 실제파일명 들어가야함
			bvo.setTitle(title);
			bvo.setCategory(category);
			bvo.setPrice(price);
			bvo.setContent(content);
			bvo.setId(id);			
			
			System.out.println("bvo: " + bvo);
			
			boardDAO.modifyBoard(bvo);
						
			path = "boardcontrol?type=viewcon&boardIdx="+boardIdx+"&cPage="+cPage; // 완료했을 때 가야하는 곳
		}
		
		
		return path;
	}

}
