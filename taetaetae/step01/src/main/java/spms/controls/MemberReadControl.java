package spms.controls;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/member/read.do")
public class MemberReadControl implements PageControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@Override
	public String execute(Map<String, Object> paramMap,
	    Map<String, Object> resultMap) throws Exception {
		int no = Integer.parseInt( (String)paramMap.get("no") );
		Member member = memberDao.selectOne(no);
		
		resultMap.put("member", member);
		resultMap.put("pageTitle", "회원 정보");
		return "/member/updateForm.jsp";
	}

}










