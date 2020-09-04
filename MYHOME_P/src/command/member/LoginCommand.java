package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ViewForward;
import dao.MemberDao;
import dto.MemberDto;

public class LoginCommand implements MemberCommand {

	@Override
	public ViewForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDto mDto = new MemberDto();
		mDto.setmId(mId);
		mDto.setmPw(mPw);
		
		//login user
		MemberDto loginUser = MemberDao.getInstance().selectBymIdmPw(mDto);
		HttpSession session = request.getSession();
		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
		}
		
		ViewForward vf = new ViewForward();
		vf.setPath("index.jsp");
		vf.setRedirect(true);
		
		return vf;
		
	}

}
