package com.gaji.qna.command;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.member.vo.MemberVO;
import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaWriteCommandOk2 implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println(">> QnaWriteCommandOK ---------"); 
		
		MemberVO mvo = null;		
		mvo = (MemberVO) session.getAttribute("mvo");
		
		String imgPath = request.getServletContext().getRealPath("/qna/img"); 
		

		File file = new File(imgPath);
		file.mkdirs();
		
		System.out.println(request.getParameter("title"));
		System.out.println("imgPath : " + imgPath);
					
		MultipartRequest mr = new MultipartRequest(
 			request,
 			imgPath, 
 			10 * 1024 * 1024, 
 			"UTF-8", 
 			new DefaultFileRenamePolicy() //중복시 이름 변경
	 	);

		//StringBuffer realImgName = new StringBuffer();
		
		String qnaImgPath = mr.getFilesystemName("files");						
		//String qnaImgPath2 = mr.getFilesystemName("file2");						
		//String qnaImgPath3 = mr.getFilesystemName("file3");						
		//System.out.println("qnaImgPath1 : " + qnaImgPath1);
		//System.out.println("qnaImgPath2 : " + qnaImgPath2);
		//System.out.println("qnaImgPath3 : " + qnaImgPath3);

		
		//System.out.println("realImgName : " + realImgName);	
		
		String id = mvo.getId();
		System.out.println("id : " + id);
		
		String title = mr.getParameter("title");
		String phone = mr.getParameter("phone");
		String email = mr.getParameter("email");
		String content = mr.getParameter("content");
		String qnaPwd = mr.getParameter("qnaPwd");
		
		QnaVO qvo = new QnaVO();
		qvo.setImg(qnaImgPath);
		//qvo.setImg(realImgName.toString());
		qvo.setId(id);
		qvo.setTitle(title);
		qvo.setContent(content);
		qvo.setQnaPwd(qnaPwd);
		qvo.setPhone(phone);
		qvo.setEmail(email);

		QnaDAO.insertQna(qvo);

		session.setAttribute("qvo", qvo); 
		
		System.out.println(">> QnaWriteCommandOK 끝 ---------"); 
		
		return "/QnaController?type=qnaMain";
	}
}
