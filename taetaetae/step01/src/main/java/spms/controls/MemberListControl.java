package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;

@Component("/member/list.do")
public class MemberListControl implements PageControl {
	@Autowired(required=false)
	MemberDao memberDao;

	@Override
	public String execute(
			Map<String, Object> paramMap, Map<String, Object> resultMap)
	    throws Exception {
		
		resultMap.put("members", memberDao.selectList());
		resultMap.put("pageTitle", "회원 목록");
		
		return "/member/list.jsp";
	}

}






