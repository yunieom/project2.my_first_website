package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class FindIdCommand implements AjaxCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mEmail = request.getParameter("mEmail");
		
		MemberDto mDto = MemberDao.getInstance().selectBymEmail(mEmail);
		
		
		// 결과 JSON 생성
		JSONObject obj = new JSONObject();
		if (mDto==null) {
			obj.put("resultId","none");
		}else {
			obj.put("resultId", mDto.getmId());
		}
		
		return obj.toJSONString();
	}

}