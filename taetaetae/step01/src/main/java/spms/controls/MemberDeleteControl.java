package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;

@Component("/member/delete.do")
public class MemberDeleteControl implements PageControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@Override
	public String execute(Map<String, Object> paramMap,
	    Map<String, Object> resultMap) throws Exception {
		int count = memberDao.delete(
				Integer.parseInt( (String)paramMap.get("no") ));
		if (count > 0) {
			resultMap.put("message", "삭제 성공입니다.");
		} else {
			resultMap.put("message", "해당 번호의 회원 정보가 없습니다!");
		}
		
		resultMap.put("Refresh", "1;url=list.do");
		resultMap.put("pageTitle", "회원 삭제");
		return "/member/delete.jsp";
	}

}




