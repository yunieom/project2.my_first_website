package command.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import common.ViewForward;
import dao.BoardDao;
import dto.BoardDto;

public class MyBoardListCommand implements BoardCommand {

	@Override
	public ViewForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String mId = request.getParameter("mId");
		
		String page = request.getParameter("page");
		if (page == null || page.isEmpty()) {
			page = "1";
		}
		
		int recordPerPage = 5;
		int begin = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin + ""); // type changes to String from int
		map.put("end", end + "");
		map.put("mId", mId);
		
		List<BoardDto> list = BoardDao.getInstance().selectMyBoardList(map);
		int totalMyRecord = BoardDao.getInstance().selectMyBoardCount(map);
		
		String paging = Paging.getPaging("/MYHOME_P/myBoardList.board?mId=" + mId, Integer.parseInt(page), recordPerPage, totalMyRecord);
		
		// data for boardList.jsp
		request.setAttribute("list", list);
		request.setAttribute("totalRecord", totalMyRecord);
		request.setAttribute("paging", paging);
		request.setAttribute("page", page);
		
		HttpSession session = request.getSession();
		if (session.getAttribute("open") != null) {
			session.removeAttribute("open");
		}
		
		ViewForward vf = new ViewForward();
		vf.setPath("board/boardList.jsp");
		vf.setRedirect(false);  // forward
		
		return vf;
	}

}
