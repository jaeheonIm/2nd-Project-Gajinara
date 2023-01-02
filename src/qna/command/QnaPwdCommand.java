
package com.gaji.qna.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.qna.dao.QnaDAO;
import com.gaji.qna.vo.QnaVO;



public class QnaPwdCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaPwdCommand---------");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String path = "";
		String qnaIdx = request.getParameter("qnaIdx");
		String qnaPwd = request.getParameter("qnaPwd");
		String qnaId  = request.getParameter("qnaId");
	
		
		System.out.println("qnaIdx : " +  qnaIdx + ", qnaPwd : " + qnaPwd);
		
		HttpSession ss = request.getSession();
		
		QnaDAO qdao = new QnaDAO();
		
		QnaVO qvo = qdao.searchIdx(qnaIdx);
		
			if (qvo != null) {
					if (qvo.getQnaPwd().equals(qnaPwd) || "admin".equals(qnaId)) {
						System.out.println("비밀번호 확인 완료");
						
						if (qvo.getImg() != null) {
							StringTokenizer st = new StringTokenizer(qvo.getImg(), " ");
							
							
							ArrayList<String> array = new ArrayList<String>();	
							while(st.hasMoreTokens()) {
								array.add(st.nextToken());

							}
							System.out.println("array :" + array);
							ss.setAttribute("array", array);
						}
						
						
						//조회수
						QnaDAO.qnaCnt(qnaIdx);
						ss.setAttribute("qvo", qvo);
						
						path="/qna/qnaOneView.jsp";
					} else {
						System.out.println("비밀번호 틀림");
						PrintWriter writer = response.getWriter();
						 writer.println("<script type='text/javascript'>");
					     writer.println("alert('비밀번호가 틀렸습니다. 다시 입력하세요.');");
					     writer.println("history.back();");
					     writer.println("</script>");
					     writer.flush();
						path="/qna/qnaMain.jsp";
			}
		}			
		System.out.println("QnaPwdCommand 끝---------");

		return path;
	}
}
