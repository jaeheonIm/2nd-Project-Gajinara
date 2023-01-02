package com.gaji.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gaji.board.vo.BoardVO;
import com.gaji.member.vo.MemberVO;
import com.gaji.mybatis.DBService;
import com.gaji.qna.vo.QnaVO;


public class QnaDAO {
	//게시글의 전체 건수 조회
		public static int getTotalCount() { //static : list.jsp에서 객체생성 안하고도 클래스명 DAO. 으로 사용가능
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("admin.totalCountQna"); //mapper namespace = BBS
			ss.close();
			return totalCount;
		}
	
	//페이지에 해당하는 글목록 가져오기(조회)
	public static List<QnaVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);//키값으로 begin저장
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> list = ss.selectList("admin.pageQnaList", map); //map데이터전달 -> list전달받음
		ss.close();
		return list;
	}
	
	
	// 전체 게시글 조회
	public static List<QnaVO> getAllBoard() {
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> qnaList = ss.selectList("admin.allQna");
		ss.close();
		return qnaList;
	}
	//qna입력
	public static void insertQna(QnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //COMMIT필수
		ss.insert("admin.insertQna", qvo);
		ss.close();
	}
	
	//idx로 조회 - 게시물 상세보기
	public static QnaVO getSearchIdx(String qnaIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		QnaVO qvo = ss.selectOne("admin.qnaSearchIdx", qnaIdx);
		ss.close();
		return qvo;
	}
	

	public QnaVO searchIdx(String qnaIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		QnaVO qvo = ss.selectOne("admin.qnaSearchIdx", qnaIdx);
		ss.close();
		return qvo;
	}
	
	//게시물 수정
	public static void getUpdate(QnaVO vo) { //id로 검색하여 수정
		SqlSession ss = DBService.getFactory().openSession(true); //commit 필수
		ss.update("admin.qnaUpdate", vo);
		ss.close();	
	}

	public static void increaseSeq() {
		SqlSession ss = DBService.getFactory().openSession(); //commit 필수
		ss.selectOne("admin.increaseSeq");
		ss.close();	
	}

	public static void updateSeq(String qnaIdx) {
		SqlSession ss = DBService.getFactory().openSession(true); //commit 필수
		ss.update("admin.updateSeq", qnaIdx);
		ss.close();	
	}
	// 답글입력
	public static void insertReQna(QnaVO qvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //COMMIT필수
		ss.insert("admin.insertReQna", qvo);
		ss.close();
	}
	
	//검색
	public static List<QnaVO> getSearch(String search){
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> qnaList = ss.selectList("admin.searchQna", search);
		ss.close();
		System.out.println("qnaList : "+qnaList.toString());
		return qnaList;
	}
	
	//조회수
	public static void qnaCnt(String qnaIdx) {
		SqlSession ss = DBService.getFactory().openSession(true); //COMMIT필수
		ss.insert("admin.cntUp", qnaIdx);
		ss.close();
	}

	
	//삭제(업데이트)
	public static void getDelete(QnaVO qvo) { 
		SqlSession ss = DBService.getFactory().openSession(true); 
		ss.update("admin.qnaDelete", qvo);
		ss.close();
	}
}
	


	

