package kr.co.ictedu.board.service;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ictedu.board.model.BoardDAO;
import kr.co.ictedu.board.model.BoardVO;

//구현 클래스이기 때문에 implement를 합니다
public class BoardWriteService implements IBoardService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// getParameter로 폼에서 쏜 데이터 올고 오게 해주세요

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
			String bTitle = (String) request.getParameter("title");
			String bContent = (String) request.getParameter("content");
			String bWriter = (String) request.getParameter("writer");
			//dao 생성
			BoardDAO dao = BoardDAO.getInstance();
			//vo 생성
			BoardVO board = new BoardVO();
			board.setbTitle(bTitle);
			board.setbName(bWriter);
			board.setbContent(bContent);
			
			int resultCode = dao.write(board);
			
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
