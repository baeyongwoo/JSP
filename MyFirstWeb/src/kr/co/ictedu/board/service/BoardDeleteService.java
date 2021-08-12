package kr.co.ictedu.board.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ictedu.board.model.BoardDAO;

public class BoardDeleteService implements IBoardService {

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
		String bId = request.getParameter("bId");

		BoardDAO board = BoardDAO.getInstance();

		board.deleteBoardDetail(bId);

		request.setAttribute("board", board);

		int resultCode = board.deleteBoardDetail(bId);

		if (resultCode == 1) {
			System.out.println("DB에 정상적으로 삭제반영");
		} else if (resultCode == 0) {
			System.out.println("에러 발생으로 삭제반영x");
		}

	}
}
