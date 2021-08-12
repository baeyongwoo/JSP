package kr.co.ictedu.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ictedu.user.model.UsersDAO;
import kr.co.ictedu.user.model.UsersVO;

public class UserJoinService implements IUserService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String uid = (String)request.getParameter("uId");
		String upw = (String)request.getParameter("uPw");
		String uname = (String)request.getParameter("uName");
		String email = (String)request.getParameter("email");
		
		
		UsersDAO dao = UsersDAO.getInstance();
		UsersVO user = new UsersVO();
		user.setUid(uid);
		user.setUpw(upw);
		user.setUname(uname);
		user.setemail(email);
		
		dao.joinUsers(user);
		
	}

}
