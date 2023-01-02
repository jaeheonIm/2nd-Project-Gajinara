package com.gaji.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.CommentVO;
import com.gaji.board.vo.categoryVO;
import com.gaji.member.vo.MemberVO;
import com.gaji.mybatis.DBService;

public class boardDAO {
	
	// 카테고리 리스트 반환
	public static List<categoryVO> getCategory(){
				
		SqlSession ss = DBService.getFactory().openSession();
		List<categoryVO> list = ss.selectList("board.getcategory");		
		ss.close();
				
		return list;		
	}
	
	// 판매중인 전체 게시글 리스트 가져오기
	public static List<BoardVO> getAllBoard(){
		
		SqlSession ss = DBService.getFactory().openSession(); 
		List<BoardVO> list = ss.selectList("board.getallboard");		
		ss.close();
		
		return list;		
	}
//	게시글 입력
	public static void insertBoard(BoardVO bvo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("board.insertboard", bvo);
		ss.close();
		
	}

//	게시글 한개 찾기
	public static BoardVO getOneBoard(String boardIdx) {
		
		System.out.println("게시글 한개 찾는 곳 옴");
		
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO bvo = ss.selectOne("board.selectoneboard", boardIdx);
		ss.close();		
		System.out.println("게시글 한개 찾는 것  마침");
		
		return bvo;
	}

	public static MemberVO getOneMember(String mid) {
		
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("board.selectonemember", mid);
		ss.close();	
		
		return mvo;
	}

	public static List<CommentVO> getComments(String boardIdx) {
				
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentVO> cmtList = ss.selectList("board.getcmtlist", boardIdx);
		ss.close();	
		
		return cmtList;
	}
	
//	코멘트 입력
	public static void inserCmt(HashMap<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("board.insertcmt", map);
		ss.close();			
	}
	
//	게시판 가져오기
	public static List<BoardVO> getList(int begin, int end) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> bbsList = ss.selectList("board.getbbs", map);
		ss.close();
		
		return bbsList;
	}
	
//	전체 게시글 수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.getTotalCount");
		ss.close();
		
		return totalCount;
	}
	
	// 보드 조회 수 올리기
	public static void upBoardHit(String boardIdx) {
		
		System.out.println("조회수 올리기 도착 : " + boardIdx);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("board.upboardhit", boardIdx);
		ss.close();
		
		System.out.println("조회수 올리기 완료");
	}
	
	// 보드 cc 올리기
	public static void upBoardCc(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("board.upboardcc", boardIdx);
		ss.close();	
	}

	// 보드 지우기
	public static void deleteBoard(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("board.deleteboard", boardIdx);
		ss.close();		
	}

	// 코멘트 지우기
	public static void deleteCmt(String commentIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("board.deletecmt", commentIdx);
		ss.close();	
	}

//	섹션별 전체 카운트
	public static int getTotalCount(String section) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.getSectionTotalCount", section);
		ss.close();
		
		return totalCount;
	}

	// 섹션별 페이징한 목록 받기
	public static List<BoardVO> getSectionList(int begin, int end, String section) {
		HashMap<String, String> map = new HashMap<>();
						
		map.put("begin", Integer.toString(begin));
		map.put("end", Integer.toString(end));
		map.put("section", section);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> bbsList = ss.selectList("board.getsectionbbs", map);
		ss.close();
		
		return bbsList;
	}

	// 서치한 전체 카운트
	public static int getTotalSearchCount(String search) {
				
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.getSearchTotalCount", search);		
		ss.close();
		
		return totalCount;
	}

	public static List<BoardVO> getSearchList(int begin, int end, String search) {
		HashMap<String, String> map = new HashMap<>();
						
		map.put("begin", Integer.toString(begin));
		map.put("end", Integer.toString(end));
		map.put("search", search);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> bbsList = ss.selectList("board.getsearchbbs", map);
		ss.close();
		
		return bbsList;
	}

	// 게시판 수정하기
	public static void modifyBoard(BoardVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("board.modifyboard", bvo);
		ss.close();
	}

	public static int isZZim(String boardIdx, String id) {
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("boardIdx", boardIdx);
		map.put("id", id);
		
		SqlSession ss = DBService.getFactory().openSession();
		int zzimCnt = ss.selectOne("board.zzimCnt", map);		
		ss.close();
		
		System.out.println("다오안 zzimCnt : " + zzimCnt);
		
		return zzimCnt;
	}

	public static void zzimOn(String boardIdx, String id) {
		
		System.out.println("찜온에 도착함?");
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("boardIdx", boardIdx);
		map.put("id", id);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("board.zzimOn", map);		
		ss.close();
		
		System.out.println("찜온 마침?");
		
		
	}

	public static void zzimOff(String boardIdx, String id) {
		System.out.println("찜오프에 도착함?");
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("boardIdx", boardIdx);
		map.put("id", id);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("board.zzimOff", map);		
		ss.close();
		
		System.out.println("찜오프 마침?");
		
	}

	
//	멤버 한명 찾기

}
