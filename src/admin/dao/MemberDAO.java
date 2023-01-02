package com.gaji.admin.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gaji.member.vo.MemberVO;
import com.gaji.mybatis.DBService;

public class MemberDAO {
	
	//게시글의 전체 건수 조회
	public static int getTotalCount() { //static : list.jsp에서 객체생성 안하고도 클래스명 DAO. 으로 사용가능
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("admin.totalCntMemebr"); 
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록 가져오기(조회)
		public static List<MemberVO> getList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);//키값으로 begin저장
			map.put("end", end);
			
			SqlSession ss = DBService.getFactory().openSession();
			List<MemberVO> list = ss.selectList("admin.pageMemberList", map); //map데이터전달 -> list전달받음
			ss.close();
			return list;
		}
	
	
//--------------------------------------------
	
	
	
	
	//전체 회원 목록 조회
	public static List<MemberVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("admin.list"); //mapper파일 -namespace: gajinara / id : list
		ss.close();
		return list;
	}
	//동적 검색
	public static List<MemberVO> getSearch(String id, String name, String status, String grade){
		Map<String, String> map = new HashMap<>();
		map.put("id", id); 
		map.put("name", name); 
		map.put("status", status); 
		map.put("grade", grade); 
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("admin.search", map);
		
		ss.close();
		return list;
		
	}
	//id로 검색
	//public static List<MemberVO> getSearchId(String id) {
	public static MemberVO getSearchId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("admin.searchId", id);
		ss.close();
		return mvo;
	}
	
	//idx로 조회
	public static MemberVO getSearchIdx(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("admin.searchIdx", idx);
		ss.close();
		return mvo;
	}
	
	//수정
	public static void getUpdate(MemberVO vo) { //id로 검색하여 수정
		SqlSession ss = DBService.getFactory().openSession(true); //commit 필수
		System.out.println("vo : " + vo);
		ss.update("admin.memberUpdate", vo);
		ss.close();	
	}
	
	
	//-------------------------------------------
	public static void getDelete(MemberVO vo) { 
		SqlSession ss = DBService.getFactory().openSession(true); //commit 필수

		ss.update("admin.memberDelete", vo);
		ss.close();
	}

}
