package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ViewForward;
import dao.BoardDao;
import dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	@Override
	public ViewForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		BoardDto bDto = BoardDao.getInstance().selectBybNo(bNo);
		int totalRecord = BoardDao.getInstance().selectBoardCount();
		
		request.setAttribute("bDto", bDto);
		request.setAttribute("page", page);
		request.setAttribute("totalRecord", totalRecord);
		
		// controlling views (+ bHit)
		HttpSession session = request.getSession();
		String open = (String) session.getAttribute("open");
		
		if (open == null || open.isEmpty()) {
			session.setAttribute("open", "yes");
			BoardDao.getInstance().boardUpdatebHit(bNo);
		}
		
		ViewForward vf = new ViewForward();
		if (bDto != null) {
			vf.setPath("board/boardView.jsp");
			vf.setRedirect(false);
		} else {
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('We could not read your post.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return vf;
	}

}
