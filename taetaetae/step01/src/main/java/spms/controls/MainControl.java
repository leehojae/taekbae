package spms.controls;

import java.util.Map;

import org.springframework.stereotype.Component;

@Component("/main.do")
public class MainControl implements PageControl {

	@Override
  public String execute(Map<String, Object> paramMap,
      Map<String, Object> resultMap) throws Exception {
		resultMap.put("pageTitle", "SPMS 메인");
		return "/main.jsp";
  }
}










