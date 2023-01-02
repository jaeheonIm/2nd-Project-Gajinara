package com.gaji.dongnae.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gaji.dongnae.dao.Dongnae_BoardDAO;
import com.gaji.dongnae.vo.CategoryVO;

public class Dongane_detailUpadteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
		List<CategoryVO> list = dao.getCategory();
		request.setAttribute("categoryList", list);
		return "./update.jsp";
	}

}
