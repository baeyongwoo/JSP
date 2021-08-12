package kr.co.ictedu.board.service;

import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ictedu.board.model.BoardDAO;
import kr.co.ictedu.board.model.BoardVO;

public class BoardUpdateService implements IBoardService{

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

		try {
			request.setCharacterEncoding("utf-8");
			String bTitle = (String) request.getParameter("bTitle");
			String bContent = (String) request.getParameter("bContent");
			String bWriter = (String) request.getParameter("bWriter");
			int bId = Integer.parseInt(request.getParameter("bId"));
			//String bDate = (String) request.getParameter("bDate");
			Timestamp bDate = Timestamp.valueOf(request.getParameter("bDate"));
			int bHit = Integer.parseInt(request.getParameter("bHit"));
			//dao 생성
			
			BoardDAO dao = BoardDAO.getInstance();
			//vo 생성
			BoardVO board = new BoardVO();
			board.setbTitle(bTitle);
			board.setbContent(bContent);
			board.setbName(bWriter);
			board.setbId(bId);
			board.setbDate(bDate);
			board.setbHit(bHit);
			
			int resultCode = dao.updateBoard(board);
			
			if(resultCode == 1) {
				System.out.println("DB에 정상적으로 반영");
			}else if(resultCode == 0) {
				System.out.println("에러 발생으로 반영x");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
