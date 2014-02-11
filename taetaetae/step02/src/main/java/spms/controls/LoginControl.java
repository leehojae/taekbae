package spms.controls;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.MemberDao;
import spms.vo.Member;

//@Controller 
public class LoginControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@RequestMapping(value="/auth/login",method=RequestMethod.GET)
	public String form(@CookieValue(required=false) String email, Model model) {
  		if (email != null) {
  			model.addAttribute("email", email);
  			model.addAttribute("checkSaveEmail", "checked");
  		}
  		return "auth/login";
	}
	
	@RequestMapping(value="/auth/login",method=RequestMethod.POST)
	public String login(String email, String password, String saveEmail,
			HttpServletRequest request,
			HttpServletResponse response, 
			HttpSession session, 
			Model model) throws Exception {
		
		Cookie cookie = null;
		if (saveEmail != null) {
			cookie = new Cookie("email", email);
			cookie.setMaxAge(60 * 60 * 24 * 3);
		} else {
			cookie = new Cookie("email", null);
			cookie.setMaxAge(0);
  		}
		response.addCookie(cookie);
		
		HashMap<String,String> sqlparamMap = new HashMap<String,String>();
		sqlparamMap.put("email", email);
		sqlparamMap.put("password", password);
		
		Member member = memberDao.selectByEmailPassword(sqlparamMap);
		
		if (member != null) {
			session.setAttribute("loginUser", member);
			return "redirect:../main.do";
		} else {
			return "auth/loginFail";
		}
  }
}










