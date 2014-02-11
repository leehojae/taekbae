package spms.controls;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller 
public class LogoutControl {

	@RequestMapping("/auth/logout")
  public String execute(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:login.do";
  }
}










