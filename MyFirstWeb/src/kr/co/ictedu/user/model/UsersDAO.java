package kr.co.ictedu.user.model;

 

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
//임포트 문제였습니다. 설정자체는 문제 없엇어요.


//DAO클래스는 DB연동을 전담해 처리
public class UsersDAO {

	// DB주소 아이디 패스워드 미리 저장
	//private static final String URL = "jdbc:mysql://localhost/ict03";
	//private static final String DBID = "root";
	//private static final String DBPW = "mysql";

	private DataSource ds;
	// 메서드 결과에 따른 리턴값 상수로 표기
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;

	/*
	 * DAO 클래스는 하나의 객체만으로도 DB연동을 수행할 수 있기 때문에 메모리 관리 차원에서 클래스의 객체를 단 1개만 생성하도록 싱글톤
	 * 패턴을 적용하여 클래스를 디자인
	 */

	// 싱글톤 패턴 클래스 디자인 방법
	// 1. 외부에서 객체를 new 키워드로 만들어 쓸 수 없도록 생성자에
	// private를 붙여줌
	private UsersDAO() {
		
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 2. 외부에서 객체생성을 못하기 떄문에 자기 클래스 내부에서 그냥
	// 스스로 자기 자신을 1개 생성(static이용)
	private static UsersDAO dao = new UsersDAO();

	// 3. 외부에서 객체 생성이 필요할 때 public 선언으로 처리한
	// getter를 이용해 2에서 만든 객체를 리턴만 해줌
	// 이러면 UsersDAO는 참조형 변수이기 때문에 주소값만 전달
	public static UsersDAO getInstance() {
		return dao;
	}

	// 회원가입을 처리하는 메서드 선언
	// DB에 들어가는 데이터, 혹은 DB에서 출력되어 나오는 데이터
	// 모두가 UserVO 내부 자료 형식을 벗어날 수 없으므로
	// 대다수 입출력은 전부 VO를 매개로 진행
	public int joinUsers(UsersVO user) {
		// users_join.jsp에서 가져온 코드를 붙여넣기
		Connection con = null;
		// 쿼리문을 실행을 위한 PreparedStatment 생성
		PreparedStatement pstmt = null;
		

		try {
			
			//con = DriverManager.getConnection(URL, DBID, DBPW);
			
			con = ds.getConnection();
			// 1.쿼리문을 작성
			String sql = "INSERT INTO users VALUES(?,?,?,?)";

			// 2. 만든 쿼리문의 ? 자리에 적용할 자바 변수를 삽입
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUid());
			pstmt.setString(2, user.getUpw());
			pstmt.setString(3, user.getUname());
			pstmt.setString(4, user.getemail());

			// 3. 만든 쿼리문 실행하기
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("에러 : " + e);
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}// end JoinUser

	// userDelete
	// 원래 대다수 DAO는 UsersVO 하나로 모든 처리를 해결할 수 있지만
	// 삭제는 폼에서 날린 비밀번호와 DB에 저장된 비밀번호를 비교해야하기 때문에
	// 폼에서 날린 비밀번호를 추가로 입력받아야함
	public int usersDelete(UsersVO user, String dpw) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			// UserVO에 입력된 비밀번호와 폼에서 날린 dpw를 비교
			if (user.getUpw().equals(dpw)) {

				//con = DriverManager.getConnection(URL, DBID, DBPW);
				con = ds.getConnection();
				String sql = "DELETE FROM users WHERE uid=?";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user.getUid());

				pstmt.executeUpdate();
				// 내부적으로 session, response 등 내장 객체에 대한
				// 처리를 할 수 없으므로, 결과 정보만 리턴
				return SUCCESS;
			} else {
				// 비밀번호 틀리게 입력한 경우
				return FAIL;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 상단 try 블럭 내에서 로직이 처리가 안되어서 여기까지가 코드가
		// 도달했다는 자체로 이미 뭔가 실행이 누락되었다는 것을 알리기 위해 0리턴
		return FAIL;

	} // userDelete end

	public int userLogin(UsersVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//con = DriverManager.getConnection(URL, DBID, DBPW);
			con = ds.getConnection();
			// 1. select 쿼리문을 작성
			// 입력받은 id가 실제로 DB에 존재하는지 조회하는 쿼리문
			String sql = "SELECT uid, upw FROM users WHERE uid=?";

			// 2. 쿼리문의 ?자리에 적용할 변수를 삽입
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUid());

			// 3.쿼리문 실행 및 데이터 받아오기
			rs = pstmt.executeQuery();

			// rs.next()를 통해 데이터가 들어왔는지 안들어왔는지 확인
			if (rs.next()) {
				// 들어왔다면 db쪽 데이터 받기
				String dbId = rs.getString("uid");
				String dbPw = rs.getString("upw");

				System.out.println("사용자 입력 비번 : " + user.getUpw());
				
				//if (dbId.equals(user.getUid()) && dbPw.equals(user.getUpw())) {
				if(user.getUid().equals(dbId) && user.getUpw().equals(dbPw)) {
					return SUCCESS;
				} else {
					return FAIL;
				}
				// 폼에서 보낸 데이터와 db쪽 데이터간 비밀번호 일치여부 비교해서
				// 아이디와 비밀번호 모두 일치시 세션 발급 및 body태그 출력
				// 비밀번호가 틀린경우 user_login_fail.jsp
			} else {
				return FAIL;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 연결 끊기
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return FAIL;
	}// LoginEnd
	
	
	//getUserInfo 메서드
	// 수정 로직을 사용하기 전에 수정할 타켓 아이디의 정보를 얻어오기 위해
	// 사용하는 메서드로 아이디, 비밀번호, 이름, 이메일을 UserVO에 넣어서 리턴
	public UsersVO getUserInfo(UsersVO user) {
		// DB에 연결 후 입력받은 user의 .getUid()를 이용해 조회구문 완성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersVO newData = new UsersVO();
		try {
			//con = DriverManager.getConnection(URL, DBID, DBPW);

			con = ds.getConnection();
			String sql = "SELECT * FROM users WHERE uid=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUid());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 이후 ResultSet에 담겨 있는 자료를 다시 다 꺼내서
				// 새로 선언한 UsersVO 변수에 입력한 후
				//ResultSet에 있던 자료를 입력받은 UsersVo를 리턴
				String dbId = rs.getString("uid");
				String dbPw = rs.getString("upw");
				String dbName = rs.getString("uname");
				String dbEmail = rs.getString("email");
				
				newData.setUid(dbId);
				newData.setUpw(dbPw);
				newData.setUname(dbName);
				newData.setemail(dbEmail);
				
				
			}
		}
			catch (SQLException e) {
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
				} catch (SQLException e) {
					e.printStackTrace();
				}
	
			}
			return newData;
		}//getInfoEnd
	
	
	public int usersUpdate(UsersVO user) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			//con = DriverManager.getConnection(URL, DBID, DBPW);

			con = ds.getConnection();
			String sql = "UPDATE users SET  upw=?, uname=?, email=? WHERE uid=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUpw());
			pstmt.setString(2, user.getUname());
			pstmt.setString(3, user.getemail());
			pstmt.setString(4, user.getUid());
			

			pstmt.executeUpdate();
			
			return SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return FAIL;
	
	}//usersUpdateEnd
	
	// 전체 데이터를 가져오는 getAllUser()
	// 파라미터는 필요없다(조건 없이 전체 유저 목록을 가져옴)
	// UsersVO 1개는 SELECT구문의 row 한 줄을 의미
	// 전체 데이터는 회원 가입 상황에 따라 유동적이므로
	// 고정적 길이는 x
	// 따라서 길이를 가변적으로 맞춰줄 수 있는 ArrayList로 UsersVO를 감싸
	// 조회 결과가 몇 줄이 나오던지 대응할 수 있도록
	
	public ArrayList<UsersVO> getAllUser() {
		// DB에 연결 후 입력받은 user의 .getUid()를 이용해 조회구문 완성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<UsersVO> userList = new ArrayList<>();
		
		try {
			//con = DriverManager.getConnection(URL, DBID, DBPW);

			con = ds.getConnection();
			String sql = "SELECT * FROM users";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {//1row -> 2row
				//ArrayList UsersVO
				UsersVO user = new UsersVO();
				String uid = rs.getString("uid");
				String upw = rs.getString("upw");
				String uname = rs.getString("uname");
				String email = rs.getString("email");
				
				user.setUid(uid);
				user.setUpw(upw);
				user.setUname(uname);
				user.setemail(email);
				
				userList.add(user);
				
				
			}
		}
			catch (SQLException e) {
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
				} catch (SQLException e) {
					e.printStackTrace();
				}
	
			}
			return userList;
			
		}//getAllUserEnd
	
}

