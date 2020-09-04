package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewForward;
import dao.BoardDao;
import dto.BoardDto;

public class ReplyInsertCommand implements BoardCommand {

	@Override
	public ViewForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bIp = request.getRemoteAddr();
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		// reply info
		BoardDto rDto = new BoardDto();
		rDto.setmId(mId);
		rDto.setbTitle(bTitle);
		rDto.setbContent(bContent);
		rDto.setbIp(bIp);
		
		// the original post of the reply
		BoardDto bDto = BoardDao.getInstance().selectBybNo(bNo);
		
		rDto.setbGroup(bDto.getbGroup());
		rDto.setbGroupOrd(bDto.getbGroupOrd() + 1);
		rDto.setbDepth(bDto.getbDepth() + 1);
		
		// +1 original bGroupOrd of original reply
		BoardDao.getInstance().replyUpdatebGroupOrd(bDto);
		
		// insert reply
		int result = BoardDao.getInstance().replyInsert(rDto);
		
		ViewForward vf = new ViewForward();
		if (result > 0) {
			vf.setPath("/MYHOME_P/boardList.board?page=" + page);
			vf.setRedirect(true);
		} else {
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Your comment has not be inserted.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		
		return vf;
	}

}
