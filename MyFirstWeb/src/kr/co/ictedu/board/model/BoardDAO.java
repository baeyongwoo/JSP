package kr.co.ictedu.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class BoardDAO {
	// 싱글톤 패턴과 커넥션풀을 적용해서
	// DAO의 연결부(생성자, getInstance())까지 작성
	private DataSource ds;

	public static final int SUCCESS = 1;
	public static final int FAIL = 0;

	private BoardDAO() {

		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static BoardDAO dao = new BoardDAO();

	public static BoardDAO getInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}

	public int write(BoardVO board) {
		// Connection, PreparedStatement 객체 선언
		Connection con = null;
		PreparedStatement pstmt = null;

		int resultCode;
		// 구문 작성
		// bId는 auto_increment가 붙어있으므로 입력 x
		// bName, bTitle, bContent는 폼에서 날려준걸 넣음
		// bDate는 자동으로 입력
		// bHit는 자동으로 0을 입력
		String sql = "INSERT INTO jspboard VALUES(null, ?, ?, ?, now(), 0)";

		try {
			// 커넥션 생성 및 pstmt에 쿼리문 넣고 완성시켜서 실행까지 하고 close까지 회수
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getbName());
			pstmt.setString(2, board.getbTitle());
			pstmt.setString(3, board.getbContent());
			pstmt.executeUpdate();

			return resultCode = SUCCESS;

		} catch (Exception e) {
			System.out.println("에러 : " + e);
			return resultCode = FAIL;
		} finally {
			try {
				if (con != null && con.isClosed()) {
					con.close();
				}
				if (pstmt != null && pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				return resultCode = FAIL;
			}
		}

	}// writeEnd

	// 모든 게시글의 정보를 DB로부터 얻어올 메서드
	public List<BoardVO> getBoardList() {
		// 내부에서 사용할 변수 선언
		List<BoardVO> boardList = new ArrayList<BoardVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// SQL문 작성
		String sql = "SELECT * FROM jspboard order by bId DESC";

		try {
			// 커넥션 연결 후 DB에 쿼리를 쏴주고
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			// boardList에 DB내 모든 글을 저장
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setbId(rs.getInt("bid"));
				board.setbName(rs.getString("bname"));
				board.setbTitle(rs.getString("btitle"));
				board.setbContent(rs.getString("bcontent"));
				board.setbDate(rs.getTimestamp("bdate"));
				board.setbHit(rs.getInt("bhit"));

				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return boardList;
	}// getBoardListEnd

	// 글 하나에 대한 상세 정보를 가져오는 로직
	public BoardVO getBoardDetail(String bId) {
		// bId에 해당하는 글 정보를 가져와서 리턴하도록 로직작성
		BoardVO board = new BoardVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// SQL문 작성
		String sql = "SELECT * FROM jspboard WHERE bid=?";

		try {
			// 커넥션 연결 후 DB에 쿼리를 쏴주고
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setbId(rs.getInt("bid"));
				board.setbName(rs.getString("bname"));
				board.setbTitle(rs.getString("btitle"));
				board.setbContent(rs.getString("bcontent"));
				board.setbDate(rs.getTimestamp("bdate"));
				board.setbHit(rs.getInt("bhit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}// getBoardDetailEnd

	
	public int deleteBoardDetail(String bId) {
		// bId에 해당하는 글 정보를 가져와서 리턴하도록 로직작성
		Connection con = null;
		PreparedStatement pstmt = null;

		// SQL문 작성
		String sql = "delete FROM jspboard WHERE bid=?";

		try {
			// 커넥션 연결 후 DB에 쿼리를 쏴주고
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bId);
			
			pstmt.executeUpdate();
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//url패턴이 저렇게 잡혀서 제 생각에 url패턴 else구문으로 빠져서 매칭없음으로 가서 그런듯합니다.
			try {
				if(con != null && con.isClosed()) {
					con.close();
				}
				if(pstmt != null && pstmt.isClosed()) {
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return  FAIL;
	}// getBoardDetailEnd
	
	public int updateBoard(BoardVO board) {
		// Connection, PreparedStatement 객체 선언
		Connection con = null;
		PreparedStatement pstmt = null;

		int resultCode;
		String sql = "Update jspboard set bcontent=?, btitle=? WHERE bid=?";
		System.out.println("test : " +  board);
		
		try {
			// 커넥션 생성 및 pstmt에 쿼리문 넣고 완성시켜서 실행까지 하고 close까지 회수
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getbContent());
			pstmt.setString(2, board.getbTitle());
			pstmt.setInt(3, board.getbId());
			pstmt.executeUpdate();

			return resultCode = SUCCESS;

		} catch (Exception e) {
			System.out.println("에러 : " + e);
			return resultCode = FAIL;
		} finally {
			try {
				if (con != null && con.isClosed()) {
					con.close();
				}
				if (pstmt != null && pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				return resultCode = FAIL;
			}
		}

	}//updateBoardEnd
	
	//글 조회수를 상승시키는 메서드
	public void upHit(String bId) {
		//필요 변수들 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//특정 글의 조회수를 1 올리는 쿼리문
		String sql = "UPDATE jspboard SET bHit = bHit + 1 WHERE bId = ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bId);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null && !con.isClosed()) {
					con.close();
				}
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}//upHitEnd
	
}
