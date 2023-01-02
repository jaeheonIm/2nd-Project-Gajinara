package com.gaji.dongnae.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gaji.dongnae.vo.UriBoardVO;
import com.gaji.dongnae.vo.CategoryVO;
import com.gaji.dongnae.vo.UriCommentVO;
import com.gaji.dongnae.vo.CategoryPageVO;
import com.gaji.member.vo.MemberVO;
import com.gaji.mybatis.DBService;

public class Dongnae_BoardDAO {
	
	//페이지 갯수 구하는 메소드
	
	public int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("gaji.totalCount");
		ss.close();
		
		return totalCount;
	}
	
	public int getTotalCount(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("gaji.totalCountCategory",category);
		ss.close();
		
		return totalCount;
	}
	
	public List<CategoryVO> getTotalCount_Category_ALL() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CategoryVO> list = ss.selectList("gaji.totalCountCategoryAll");
		ss.close();
		
		return list;
	}
	public int getTotalCountSearch(String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("gaji.totalCountSearch",keyword);
		ss.close();
		
		return totalCount;
	}	
	
	public List<UriBoardVO> getList(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<UriBoardVO> list = ss.selectList("gaji.dongnae_all", map);
		ss.close();
		return list;
	}
	public List<UriBoardVO> getDongnae_category(CategoryPageVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		List<UriBoardVO> list = ss.selectList("gaji.dongnae_category", vo);
		ss.close();
		System.out.println(list);
		return list;		
	}		

	public List<UriBoardVO> getList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<UriBoardVO> list = ss.selectList("gaji.dongnae_all");
		ss.close();
		return list;
	}	

	public List<UriBoardVO> getSearchList(CategoryPageVO svo) {
		SqlSession ss = DBService.getFactory().openSession();
		List<UriBoardVO> list = ss.selectList("gaji.dongnae_search",svo);
		ss.close();
		return list;
	}
	
	public UriBoardVO getOneList(String idx){
		SqlSession ss = DBService.getFactory().openSession();
		UriBoardVO vo = ss.selectOne("gaji.dongnae_one",idx);
		ss.close();
		return vo;
	}
	
	public MemberVO getMember(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("gaji.getMember",id);
		ss.close();
		return vo;
	}

	public void insertBoard(UriBoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("gaji.insertBoard", vo);
		ss.close();
	}
	
	public void updateBoard(UriBoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("gaji.updateBoard", vo);
		ss.close();
	}
	
	public void deleteBoard(UriBoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("gaji.deleteBoard", vo);
		ss.close();
	}	
	
	public void insertComment(UriCommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("gaji.insertComment", vo);
		ss.close();
	}

	public List<UriCommentVO> getCommentList(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<UriCommentVO> list = ss.selectList("gaji.comment_all",boardIdx);
		return list;
	}	
	
	public void updateComment(UriCommentVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("gaji.comment_update",cvo);
		ss.close();
	}
	
	public int deleteComment(String idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("gaji.comment_delete",idx);
		ss.close();
		System.out.println("deleteComment :" + result);
		return result;
	}

	public List<CategoryVO> getCategory() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CategoryVO> list = ss.selectList("gaji.getCategoryList");
		ss.close();
		return list;
	}

	public void updateCC(String uriBoardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("gaji.cc_update",uriBoardIdx);
		ss.close();
	}

	public int updateHit(String uriBoardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("gaji.hit_update",uriBoardIdx);
		ss.close();
		return result;
	}

	public int updateLikes(String uriBoardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("gaji.likes_update",uriBoardIdx);
		ss.close();
		return result;
		
	}

	public int deleteBoardU(UriBoardVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("gaji.deleteBoardU",bvo);
		ss.close();
		return result;
	}
	
	public int deleteCommentU(String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("gaji.comment_deleteU",boardIdx);
		ss.close();
		return result;
	}	

}
