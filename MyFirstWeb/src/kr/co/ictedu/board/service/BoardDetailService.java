package kr.co.ictedu.board.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ictedu.board.model.BoardDAO;
import kr.co.ictedu.board.model.BoardVO;

public class BoardDetailService implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = null;
		session = request.getSession();
		
		String idSession = (String)session.getAttribute("i_s");
		
		if(idSession == null) {
			try {
				//서비스 내부에서 포워딩을 시키면 리다이렉트가 아니여서 실행됨
				String ui = "/users/user_login.jsp";
				RequestDispatcher dp = request.getRequestDispatcher(ui);
				dp.forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		// url에 묻어온 글 번호를 getParmeter를 이용해 얻기
		String bid = request.getParameter("bid");
		// DAO를 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.upHit(bid);
		// DAO에 글 번호를 넘겨서 detail페이지 데이터를 얻어오기
		BoardVO board = dao.getBoardDetail(bid);
		
		// 포워딩을 위해 setAttribute()로 데이터를 실어주기
		request.setAttribute("board", board);
		
		System.out.println(board);
	}
}
