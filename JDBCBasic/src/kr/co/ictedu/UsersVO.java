package kr.co.ictedu;

public class UsersVO {
	/*
	 * VO / DTO - VO클래스는 웹서버와 DB간의 데이터 송수신을 돕는 자바 클래스 파일 - VO클래스를 설계할 때는 DB컬럼 갯수만큼
	 * 1:1로 자료형, 이름 등이 매칭되는 멤버변수를 선언
	 * 
	 * - VO클래스 내부 변수들은 private 접근 제한자를 걸어 데이터 접근 제어
	 */
	private String uid;
	private String upw;
	private String uname;
	private String email;

	public UsersVO() {
	}
	
	// VO클래스는 기본생성자와 모든 멤버변수를 초기화하는 생성자를 선언
	public UsersVO(String uid, String upw, String uname, String email) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.email = email;
	}

	// Getter Setter선언
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UsersVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", email=" + email + "]";
	}

}
