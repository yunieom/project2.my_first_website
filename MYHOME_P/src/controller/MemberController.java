package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.AjaxCommand;
import command.member.EmailCheckCommand;
import command.member.FindIdCommand;
import command.member.FindPwCommand;
import command.member.IdCheckCommand;
import command.member.JoinCommand;
import command.member.LeaveCommand;
import command.member.LoginCommand;
import command.member.LogoutCommand;
import command.member.MemberCommand;
import command.member.UpdateInfoCommand;
import command.member.UpdatePwCommand;
import common.ViewForward;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberController() {
        super();
    }

	
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String mapping = requestURI.substring(contextPath.length());
		
		//mvc 패턴 처리
		MemberCommand memberCommand = null;
		ViewForward vf = null;
		
		//ajax 처리
		AjaxCommand ajaxCommand = null;
		String result = null;
		
		//mEmail 받아오는 용
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		try {
			
			switch(mapping) {
			
			//MVC 
			case "/login.member" :
				memberCommand = new LoginCommand();
				vf = memberCommand.execute(request, response);
				break;
				
			case "/logout.member" :
				memberCommand = new LogoutCommand();
				vf = memberCommand.execute(request, response);
				break;
				
			//ajax
				
			
			case "/idCheck.member" :
				ajaxCommand = new IdCheckCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/emailCheck.member" :
				ajaxCommand = new EmailCheckCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/join.member" :
				ajaxCommand = new JoinCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/findId.member":
				ajaxCommand = new FindIdCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/findPw.member" :
				ajaxCommand = new FindPwCommand();
				result = ajaxCommand.execute(request, response);
				out.println(result); // $.ajax의 success: function(result){}
				break;	
			case "/updateInfo.member" :
				ajaxCommand = new UpdateInfoCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/updatePw.member":
				ajaxCommand = new UpdatePwCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			case "/leave.member" :
				ajaxCommand = new LeaveCommand();
				result = ajaxCommand.execute(request, response);
				out.print(result);
				break;
			
				
			//ViewForard
			case "/index.member" :
				vf = new ViewForward();
				vf.setPath("member/index.jsp");
				vf.setRedirect(false);
				
			case "/loginPage.member" :
				vf = new ViewForward();
				vf.setPath("member/login.jsp");
				vf.setRedirect(true);
				break;
			case "/joinPage.member" :	
				vf = new ViewForward();
				vf.setPath("member/join.jsp");
				vf.setRedirect(true);
				break;
			case "/findIdPage.member" :
				vf = new ViewForward();
				vf.setPath("member/findId.jsp");
				vf.setRedirect(true);
				break;
			case "/findPwPage.member" :
				vf = new ViewForward();
				vf.setPath("member/findPw.jsp");
				vf.setRedirect(true); 
				break;
			case "/updatePwPage.member":
				vf = new ViewForward();
				vf.setPath("member/updatePw.jsp");
				vf.setRedirect(false); 
				break;
			case "/myPage.member" :
				vf = new ViewForward();
				vf.setPath("member/myPage.jsp");
				vf.setRedirect(false); 
				break;
				
			case "/leavePage.member" :
				vf = new ViewForward();
				vf.setPath("member/leave.jsp");
				vf.setRedirect(true); 
				break;
				
				
			
			}
		} catch(Exception e) {
			
		}
		if (vf != null) {
			if (vf.isRedirect()) { //redirect 
				response.sendRedirect(vf.getPath());
			} else { // forward
				request.getRequestDispatcher(vf.getPath()).forward(request, response);
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
