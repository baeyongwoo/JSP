package kr.co.ictedu;

import java.io.IOException;
import kr.co.ictedu.board.service.BoardDeleteService;
import kr.co.ictedu.board.service.BoardDetailService;
import kr.co.ictedu.board.service.BoardListService;
import kr.co.ictedu.board.service.BoardUpdateService;
import kr.co.ictedu.board.service.BoardWriteService;
import kr.co.ictedu.board.service.IBoardService;
import kr.co.ictedu.user.service.IUserService;
import kr.co.ictedu.user.service.UserJoinService;
import kr.co.ictedu.user.service.UserLoginService;
import kr.co.ictedu.user.service.UserLogoutService;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class PatternServlet
 */
// *.do로 잡힌 패턴은 .do로 끝나는 접속주소를 모두 잡아온다
// /빼고 작성
@WebServlet("*.do")
public class PatternServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatternServlet() {
		super();
		System.out.println("확장자 패턴 생성");
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("확장자 패턴 실행");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("확장자 패턴 종료");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doRequest(request, response);
	}

	// 만약 요청 메서드(get, post) 상관없이 처리하게 만들고 싶다면
	// 메서드 하나를 더 만들어서 요청
	protected void doRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 서비스 호출을 위해 모든 서비스 자료형을 받는 인터페이스 생성
		IBoardService sv = null;
		IUserService usv = null;
		// 해당 로직을 실행한 뒤에 넘어갈 .jsp파일 지정
		String ui = null;

		// 경로 저장시 / 는 WebContent폴더가 기본으로 잡혀있음
		ui = "/board/board_list.jsp";
		// 경로 저장 후에는 페이지 강제이동(forward)를 수행

		String uri = request.getRequestURI();
		System.out.println("uri패턴 : " + uri);

		// 콘솔이 아닌 사용가자 확인할 수 있도록 .jsp화면에
		// 변수에 담긴 자료를 찍는 out.print(); 사용을 위한
		// 사전 준비
		response.setContentType("text/html charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = null;
		// 아래 코드까지 적어야 세션이 기능합니다.
		session = request.getSession();
		
		if (uri.equals("/MyFirstWeb/join.do")) {
			System.out.println("회원가입 요청 확인");
			usv = new UserJoinService();
			usv.execute(request, response);
			ui = "users/user_login.jsp";
		} else if (uri.equals("/MyFirstWeb/login.do")) {
			System.out.println("로그인 요청 확인");
			usv = new UserLoginService();
			usv.execute(request, response);

			String result = (String)session.getAttribute("login");
			System.out.println(result);
			if (result != null && result.equals("fail")) {
				session.invalidate();
				ui = "users/user_login.jsp";
			} else {
				ui = "/boardlist.do";
			}
		} else if(uri.equals("/MyFirstWeb/userlogout.do")) {
				usv = new UserLogoutService();
				usv.execute(request, response);
				ui = "users/user_login.jsp";
		} else if (uri.equals("/MyFirstWeb/userupdate.do")) {
			System.out.println("수정 요청 확인");
		} else if (uri.equals("/MyFirstWeb/userdelete.do")) {
			System.out.println("삭제 요청 확인");
		}
		// PatternServlet2의 패턴을 .do로 고쳐서 여기 옮기기
		else if (uri.equals("/MyFirstWeb/boardwrite.do")) {
			System.out.println("글쓰기 창으로 이동합니다.");
			sv = new BoardWriteService();
			// BoardWriteService의 execute를 호출하면
			// 복잡한 서비스 로직을 이 파일에는 한 줄만 기입해서 처리
			sv.execute(request, response);
			ui = "/board/board_list.jsp";

		} else if (uri.equals("/MyFirstWeb/boardupdate.do")) {
			System.out.println("글 수정 창로 이동합니다.");

			sv = new BoardDetailService();
			sv.execute(request, response);
			ui = "/board/board_update_form.jsp";

		} else if (uri.equals("/MyFirstWeb/boarddelete.do")) {
			System.out.println("글 삭제 창으로 이동합니다. ");

			sv = new BoardDeleteService();
			sv.execute(request, response);
			ui = "/board/board_delete.jsp";

		} else if (uri.equals("/MyFirstWeb/boardlist.do")) {
			System.out.println("글 조회창으로 이동합니다.");
			// 글 조회창 로직을 실행하도록 하는 코드
			sv = new BoardListService();
			sv.execute(request, response);
			ui = "/board/board_list.jsp";
		} else if (uri.equals("/MyFirstWeb/boarddetail.do")) {
			System.out.println("글 상세보기 창으로 이동합니다.");
			ui = "/board/board_detail.jsp";
			sv = new BoardDetailService();
			sv.execute(request, response);
		} else if (uri.equals("/MyFirstWeb/boardupdateok.do")) {
			System.out.println("글 수정 창로 이동합니다.");
			sv = new BoardUpdateService();

			String strbId = request.getParameter("bId");
			ui = "/boarddetail.do?bid=" + strbId;

			sv.execute(request, response);
		} else {
			out.print("잘못된 패턴입니다.");
		}
		// 포워드 로직은 조건문이 모두 작동한 뒤에 실행
		// RequestDispatcher를 사용해 포워딩을 하면
		// request, response및 자료를 jsp페이지에 전달할 수 있음
		// 모델2 방식은 스크립틀릿을 쓰지 않기 때문에
		// 컨트롤러단에서 출력에 필요한 데이터를 받아놨다
		// 포워드로 .jsp에 전달
		RequestDispatcher dp = request.getRequestDispatcher(ui);
		dp.forward(request, response);
	}
}
