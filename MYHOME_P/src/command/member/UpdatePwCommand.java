package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class UpdatePwCommand implements AjaxCommand {

	@Override
	public String execute (HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String mPw = request.getParameter("mPw");
		String mId = ((MemberDto)session.getAttribute("loginUser")).getmId();
		
		MemberDto mDto = new MemberDto();
		mDto.setmId(mId);
		mDto.setmPw(mPw);
		
		int result = MemberDao.getInstance().memberUpdatePw(mDto);
		JSONObject obj = new JSONObject();
	
		
		if(result>0) {
			obj.put("isSuccess", true);
			// to upload updated Userinfo on session
			MemberDto loginUser =MemberDao.getInstance().selectBymId(mId);
			request.getSession().setAttribute("loginUser", loginUser);
		} else {
			obj.put("isSuccess", false);
		}
		
		
		return obj.toJSONString();
	}

}
