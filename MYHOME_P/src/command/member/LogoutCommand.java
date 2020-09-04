package command.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ViewForward;
import dto.MemberDto;

public class LogoutCommand implements MemberCommand {

	@Override
	public ViewForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		
		ViewForward vf = new ViewForward();
		
		//session reset
		if (loginUser != null) {
			session.invalidate();
			vf.setPath("index.jsp");
			vf.setRedirect(true);
		} else { // wrong access + js expression code
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('there is no logged in user')");
			out.print("history.back()");
			out.print("</script>");
		}
		return vf;
	}

	

}
