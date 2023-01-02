package com.gaji.board.control;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gaji.board.command.ModifyCommand;
import com.gaji.board.command.SectionListCommand;
import com.gaji.board.command.StartCommand;
import com.gaji.board.command.TitConSearchCommand;
import com.gaji.board.command.ViewPageCommand;
import com.gaji.board.command.ViewSectionListCommand;
import com.gaji.board.command.ViewListCommand;
import com.gaji.board.command.WriteBoardCommand;
import com.gaji.board.command.ZzimCommand;
import com.gaji.board.command.removeCmtCommand;
import com.gaji.board.command.removeCommand;
import com.gaji.board.dao.boardDAO;
import com.gaji.board.vo.categoryVO;
import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.gaji.board.command.Command;
import com.gaji.board.command.InsertCmtCommand;

@WebServlet("/boardcontrol")
public class boardcontrol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String type = request.getParameter("type");
		Command command = null;
		
		System.out.println("여기는 보드컨트롤");
		System.out.println("type : " + type);
				
		if (type.equals("writeboard")) {			
			command = new WriteBoardCommand();
		} else if (type.equals("viewcon")) {
			command = new ViewPageCommand();
		} else if (type.equals("insertCmt")) {
			command = new InsertCmtCommand();
		} else if (type.equals("viewList")) {
			command = new ViewListCommand();
		} else if (type.equals("removeBoard")) {
			command = new removeCommand();
		} else if (type.equals("removeCmt")) {
			command = new removeCmtCommand();
		} else if (type.equals("start")) {
			command = new StartCommand();
		} else if (type.equals("modifyView")) {
			command = new ModifyCommand();
		} else if (type.equals("viewSectionList")) {
			command = new ViewSectionListCommand();
		} else if (type.equals("titConSearch")) {
			command = new TitConSearchCommand();
		} else if (type.equals("zzim")) {
			command = new ZzimCommand();
			String oh = command.exec(request, response);
			return;
		} 
		
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<CategoryVO> list = dao.getCategory();
		request.setAttribute("Categories", list);
		
		List<categoryVO> caList = boardDAO.getCategory();
		request.setAttribute("caList", caList);
						
		String path = command.exec(request, response);
		
		
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("두포스트로옴");
		
		request.setCharacterEncoding("UTF-8");						
//		System.out.println("두포스트 컨텐트타입 확인 : "+ request.getContentType());
		doGet(request, response);
	}

}
