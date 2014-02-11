package spms.controls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spms.dao.MemberDao;

//@Controller 
public class MemberListControl {
	@Autowired(required=false)
	MemberDao memberDao;

	@RequestMapping("/member/list")
	public String execute(Model model) throws Exception {
		
		model.addAttribute("members", memberDao.selectList());
		model.addAttribute("pageTitle", "회원 목록");
		
		return "member/list";
	}

}






