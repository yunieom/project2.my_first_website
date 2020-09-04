package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.board.BoardCommand;
import command.board.BoardDeleteCommand;
import command.board.BoardInsertCommand;
import command.board.BoardListCommand;
import command.board.BoardViewCommand;
import command.board.MyBoardListCommand;
import command.board.QueryBoardListCommand;
import command.board.ReplyInsertCommand;
import common.ViewForward;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String mapping = requestURI.substring(contextPath.length());
		
		BoardCommand boardCommand = null;
		ViewForward vf = null;
		
		try {
			switch (mapping) {
			
			//MVC
			case "/boardList.board":
				boardCommand = new BoardListCommand();
				vf = boardCommand.excute(request, response);
				break;
			
			case "/boardInsert.board":
				boardCommand = new BoardInsertCommand();
				vf = boardCommand.excute(request, response);
				break;
				
			case "/boardView.board" :
				boardCommand = new BoardViewCommand();
				vf = boardCommand.excute(request, response);
				break;
			
			case "/replyInsert.board" : 
				boardCommand = new ReplyInsertCommand();
				vf = boardCommand.excute(request, response);
				break;
				
			case "/boardDelete.board" :
				boardCommand = new BoardDeleteCommand();
				vf = boardCommand.excute(request, response);
				break;
			case "/queryBoardList.board" :
				boardCommand = new QueryBoardListCommand();
				vf = boardCommand.excute(request, response);
				break;
			case "/myBoardList.board" :
				boardCommand = new MyBoardListCommand();
				vf = boardCommand.excute(request, response);
				break;
				
			//View and Forward
			case "/boardInsertPage.board" :
				vf = new ViewForward();
				vf.setPath("board/boardInsert.jsp");
				vf.setRedirect(false);
				break;
			case "/replyInsertPage.board" :
				vf = new ViewForward();
				vf.setPath("board/replyInsert.jsp");
				vf.setRedirect(false);
				break;
			
			}
		} catch (Exception e) {
			
		}
		
		if (vf != null) {
			if (vf.isRedirect()) {
				response.sendRedirect(vf.getPath());
			} else {
				request.getRequestDispatcher(vf.getPath()).forward(request, response);
			}
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
