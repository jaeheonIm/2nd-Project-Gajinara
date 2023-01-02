package com.gaji.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gaji.board.vo.BoardVO;
import com.gaji.board.vo.CommentVO;
import com.gaji.dongnae.vo.UriCommentVO;
import com.gaji.member.vo.MemberVO;
import com.gaji.mybatis.DBService;

public class MemberDAO {
	
	// 회원 가입
	public static int join(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int join = ss.insert("mypage.join", mvo);
		ss.close();
		return join;
	}
	
	//아이디 중복 체크
	public static List<MemberVO> idCheck (String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<MemberVO> list = ss.selectOne("mypage.idCheck", id);
		ss. close();
		return list;
	}


	// 로그인
	public static MemberVO getOneMember(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		MemberVO mvo = ss.selectOne("mypage.getOneMember", id);
		ss.close();				
		return mvo;
	}
	
	//pwd 조회
	public static List<MemberVO> getPwdMember(String pwd) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<MemberVO> getpwd = ss.selectList("mypage.getPwdMember", pwd);
		ss.close();
		return getpwd;
	}
	
	// 회원 정보 조회
	public static List<MemberVO> infoList (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("mypage.infoList", id);
		ss. close();
		return list;
	}
	
	// 회원 정보 수정
	public static int modify(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int modify = ss.update("mypage.modify", mvo);
		ss.close();
		return modify;
	}

	// 회원 정보 삭제
	public static int delete(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int delete = ss.delete("mypage.delete", mvo);
		ss.close();
		return delete;
	}
	
	// 구매완료 목록 조회
	public static List<BoardVO> buyList (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("mypage.buyList", id);
		ss. close();
		return list;
	} 
	
	// 판매중인 상품 조회
	public static List<BoardVO> saleList (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("mypage.saleList", id);
		ss. close();
		return list;
	} 
	
	// 판매완료 목록 조회
	public static List<BoardVO> soldOutList (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("mypage.soldOutList", id);
		ss. close();
		return list;
	} 
	
	// 찜목록 조회
	public static List<BoardVO> wishList (String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("mypage.wishList", id);
		ss. close();
		return list;
	} 
	
	// 게시글의 작성 댓글
	public static List<CommentVO> commentList (String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentVO> list = ss.selectList("mypage.commentList", id);
		ss. close();
		return list;
	}
	
	// 동네 생활의 작성 댓글
	public static List<UriCommentVO> uriCommentList (String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<UriCommentVO> list = ss.selectList("mypage.uriCommentList", id);
		ss. close();
		return list;
	}

	// 전화번호로 아이디 찾기
	public static MemberVO findId_Phone(String phone) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO getId1 = ss.selectOne("mypage.findId_Phone", phone);	
		ss.close();
		return getId1;
	}
	
	//이메일로 아이디 찾기
	public static MemberVO findId_Email(String email) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO getId2 = ss.selectOne("mypage.findId_Email", email);
		ss.close();
		return getId2;
	}
	
	//아이디로 비밀번호 찾기
	public static MemberVO findPwd_Id(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO getPwd1 = ss.selectOne("mypage.findPwd_Id", id);
		ss.close();
		return getPwd1;
	}
	
	//전화번호로 비밀번호 찾기
	public static MemberVO findPwd_Phone(String phone) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO getPwd2 = ss.selectOne("mypage.findPwd_Phone", phone);	
		ss.close();
		return getPwd2;
	}
	
	//이메일로 비밀번호 찾기
	public static MemberVO findPwd_Email(String email) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO getPwd3 = ss.selectOne("mypage.findPwd_Email", email);	
		ss.close();
		return getPwd3;
	}
	
	

//	public boolean idCheck(String id) {
//		SqlSession ss = DBService.getFactory().openSession(true);
//		return (Integer)ss.selectOne("mypage.idCheck", id) == 1;
//	}
	
	
	// 패스워드 체크
//	public boolean checkPw(String id, String pw) {
//		SqlSession ss = DBService.getFactory().openSession(true);
//		boolean result = false;
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("id", id);
//		map.put("pw", pw);
//		int count = ss.selectOne("mypage.checkPw", map);
//		if(count == 1) result = true;
//		return result;
//	}

//	public int userCheck( String id, String pw) {
//        int ri = 0;
//        String dbPw;
//        
//        Connection connection = null;
//        PreparedStatement pstmt = null;
//        ResultSet set = null;
//        String query = "select pw from members where id = ?";
//        
//        try {
//            connection = getConnection();
//            pstmt = connection.prepareStatement(query);
//            pstmt.setString(1, id);
//            set = pstmt.executeQuery();
//            
//            if(set.next()) {
//                dbPw = set.getString("pw");
//                if(dbPw.equals(pw)) {
//                    ri = 1;        // 로그인 Ok
//                } else {
//                    ri = 0;        // 비번 X
//                }
//            } else {
//                ri = -1;        // 회원 X    
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                set.close();
//                pstmt.close();
//                connection.close();
//            } catch (Exception e2) {
//                e2.printStackTrace();
//            }
//        }
//        return ri;
//    }
}