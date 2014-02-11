package spms.controls;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/auth/login.do")
public class LoginControl implements PageControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@SuppressWarnings("unchecked")
	@Override
  public String execute(Map<String, Object> paramMap,
      Map<String, Object> resultMap) throws Exception {
		String email = (String)paramMap.get("email");
		if (email == null) { //GET 요청
      Map<String,String> cookieMap = 
					(Map<String,String>)paramMap.get("cookieMap");
		  	String cookieEmail = cookieMap.get("email");
		  	if (cookieEmail != null) {
	  			resultMap.put("email", cookieEmail);
	  			resultMap.put("checkSaveEmail", "checked");
	  		}
		  	resultMap.put("pageTitle", "로그인");
		  	return "/auth/login.jsp";
		  	
		} else { //POST 요청
			String password = (String)paramMap.get("password");
			String saveEmail = (String)paramMap.get("saveEmail");

			if (saveEmail != null) {
	  			resultMap.put("cookie:email", email);
	  		} else {
	  			resultMap.put("cookie:email", "null,0");
	  		}
  		
			HashMap<String,String> sqlparamMap = new HashMap<String,String>();
			sqlparamMap.put("email", email);
			sqlparamMap.put("password", password);
			
			Member member = memberDao.selectByEmailPassword(sqlparamMap);
			resultMap.put("pageTitle", "로그인");
			
			if (member != null) {
				resultMap.put("session:member", member);
				return "redirect:" + 
						(String)paramMap.get("contextPath") + 
						"/main.do";
			} else {
				resultMap.put("Refresh", 
						"1;url=" + 
						(String)paramMap.get("contextPath") + 
						"/auth/login.do");
				return "/auth/loginFail.jsp";
			}
		}
  }
}










