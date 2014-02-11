package spms.controls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spms.dao.MemberDao;
import spms.vo.Member;

//@Controller 
public class MemberReadControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@RequestMapping("/member/read")
	public String execute(int no, Model model) throws Exception {
		Member member = memberDao.selectOne(no);
		
		model.addAttribute("member", member);
		model.addAttribute("pageTitle", "회원 정보");
		return "member/updateForm";
	}
	/*
	@RequestMapping("/member/read")
	public String execute(@RequestParam("no") int n, Model model) throws Exception {
		Member member = memberDao.selectOne(n);
		
		model.addAttribute("member", member);
		model.addAttribute("pageTitle", "회원 정보");
		return "member/updateForm";
	}
	*/

}










