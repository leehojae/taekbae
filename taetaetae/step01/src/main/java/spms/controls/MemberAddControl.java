package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/member/add.do")
public class MemberAddControl implements PageControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@Override
	public String execute(Map<String, Object> paramMap,
	    Map<String, Object> resultMap) throws Exception {
		String email = (String)paramMap.get("email");
		
		if (email == null) { //GET 요청
			resultMap.put("pageTitle", "회원 등록폼");
			return "/member/addForm.jsp";
			
		} else {
			Member member = new Member();
			member.setName( (String)paramMap.get("name") );
			member.setEmail( (String)paramMap.get("email") );
			member.setTel( (String)paramMap.get("tel") );
			member.setAge( Integer.parseInt((String)paramMap.get("age")) );
			
			int count = memberDao.insert(member);
			if (count > 0) {
				resultMap.put("message", "등록 성공입니다!");
			} else {
				resultMap.put("message", "등록 실패입니다!");
			}
			
			resultMap.put("Refresh", "1;url=list.do");
			resultMap.put("pageTitle", "회원 등록");
			return "/member/add.jsp";
		}
	}

}
