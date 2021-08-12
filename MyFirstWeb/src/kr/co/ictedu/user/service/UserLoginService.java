package kr.co.ictedu.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ictedu.user.model.UsersDAO;
import kr.co.ictedu.user.model.UsersVO;

public class UserLoginService implements IUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 세션 쓰는 법
		HttpSession Session = null;
		Session = request.getSession();
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String uId = (String) request.getParameter("uId");
			String uPw = (String) request.getParameter("uPw");

			UsersDAO dao = UsersDAO.getInstance();

			UsersVO user = new UsersVO();
			user.setUid(uId);
			user.setUpw(uPw);

			int resultCode = dao.userLogin(user);

			if (resultCode == 1) {
				Session.setAttribute("i_s", uId);
				Session.setAttribute("p_s", uPw);
				System.out.println(uId + "님 로그인 성공");
			} else if (resultCode == 0) {
				System.out.println(uId + "님 로그인 실패");
				Session.setAttribute("login", "fail");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
