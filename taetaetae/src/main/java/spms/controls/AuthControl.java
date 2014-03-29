package spms.controls;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import spms.dao.MemberDao;
import spms.vo.Member;
@Controller
@RequestMapping("/auth")
@SessionAttributes("loginUser") // 모델에 들어 있는 값 중에서 loginUser는 세션에 보관하라.
public class AuthControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@Autowired(required=false)
	ExcelControl excelControl;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String form(@CookieValue(required=false) String id, Model model) {
  		if (id != null) {
  			model.addAttribute("id", id);
  			model.addAttribute("checkSaveId", "checked");
  		}
  		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String id, String password, String saveId,
			HttpServletResponse response, 
			Model model) throws Exception {
		
		Cookie cookie = null;
		if (saveId != null) {
			cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 60 * 24 * 3);
		} else {
			cookie = new Cookie("id", null);
			cookie.setMaxAge(0);
  		}
		response.addCookie(cookie);
		
		HashMap<String,String> sqlparamMap = new HashMap<String,String>();
		sqlparamMap.put("id", id);
		sqlparamMap.put("password", password);
		
		Member member = memberDao.selectByIdPassword(sqlparamMap);
		if(member == null)
		{
			return "redirect:/failLogin.jsp";
		}
		System.err.println("dddd : " +  member.getNo());
		{
			excelControl.staticId  = member.getNo();
			model.addAttribute("loginUser", member);
			
			if (member.getRank().equals("1")){
			return "redirect:/main.do";
			} 
			if (member.getRank().equals("100")){
				return "redirect:/office/myOffice.do";
				} 
			else{
				return "redirect:../delivery/deliveryMember.html";
			}
		}
  }
	
	@RequestMapping("/logout")
  public String logout(SessionStatus status) throws Exception {
		status.setComplete();
		return "redirect:/index.jsp";
  }
	
	@RequestMapping("/loginUser")
  public String loginUser() throws Exception {
		return "auth/loginUser";
  }
}










