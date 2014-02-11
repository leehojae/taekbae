package spms.controls;

import java.util.Map;

import org.springframework.stereotype.Component;

@Component("/auth/logout.do")
public class LogoutControl implements PageControl {

	@Override
  public String execute(Map<String, Object> paramMap,
      Map<String, Object> resultMap) throws Exception {
		resultMap.put("Refresh", "1;url=" + 
				(String)paramMap.get("contextPath") + "/auth/login.do");
		resultMap.put("pageTitle", "로그아웃");
		return "/auth/logout.jsp";
  }
}










