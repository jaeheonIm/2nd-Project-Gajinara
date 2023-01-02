package com.gaji.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gaji.board.vo.BoardVO;
import com.gaji.mybatis.DBService;


public class BoardDAO {
	
	//게시글의 전체 건수 조회
		public static int getTotalCount() { //static : list.jsp에서 객체생성 안하고도 클래스명 DAO. 으로 사용가능
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("admin.totalCountBoard"); 
			ss.close();
			return totalCount;
		}
	//페이지에 해당하는 글목록 가져오기(조회)
	public static List<BoardVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);//키값으로 begin저장
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("admin.pageBoardList", map); //map데이터전달 -> list전달받음
		ss.close();
		return list;
	}	
	
	//전체 게시글 조회
		public static List<BoardVO> getAllBoard(){
		SqlSession ss = DBService.getFactory().openSession(); 
		List<BoardVO> productList = ss.selectList("admin.productList");		
		ss.close();
		return productList;		
		}
		
	//판매글 동적 검색
		
		public static List<BoardDAO> getSearch(String id, String title, String status, String category) {
			Map<String, String> map = new HashMap<>();
			map.put("id", id); 
			map.put("title", title); 
			map.put("status", status); 
			map.put("category", category); 
			
			SqlSession ss = DBService.getFactory().openSession();
			List<BoardDAO> productList = ss.selectList("admin.productSearch", map);
			
			ss.close();
			return productList;
		}
		//idx로 검색
		public static BoardVO getSearchIdx(String idx) {
			SqlSession ss = DBService.getFactory().openSession();
			BoardVO bvo = ss.selectOne("admin.productIdx", idx);
			ss.close();
			return bvo;
		}	
		
		//id로 검색
		public static BoardVO getSearchId(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			BoardVO bvo = ss.selectOne("admin.productId", id);
			ss.close();
			return bvo;
		}
		
		public static void getUpdate(BoardVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true); 
			ss.update("admin.productUpdate", vo);
			ss.close();	
		}
		
		//삭제(업데이트)
		public static void getDelete(BoardVO vo) { 
			System.out.println("dao delete" + vo);
			SqlSession ss = DBService.getFactory().openSession(true); 
			ss.update("admin.productDelete", vo);
			System.out.println("dao delete");
			ss.close();
		}
}
