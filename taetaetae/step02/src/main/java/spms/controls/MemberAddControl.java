package spms.controls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.MemberDao;
import spms.vo.Member;

//@Controller
//@RequestMapping("/member/add") //방법1.
@RequestMapping("/member") //방법3.
public class MemberAddControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	//@RequestMapping(method=RequestMethod.GET) //방법1.
	//@RequestMapping(value="/member/add",method=RequestMethod.GET) //방법2.
	@RequestMapping(value="/add",method=RequestMethod.GET) //방법3.
	public String form() {
		return "member/addForm";
	}
	
	
	
	//@RequestMapping(method=RequestMethod.POST) //방법1.
	//@RequestMapping(value="/member/add",method=RequestMethod.POST) //방법2.
	@RequestMapping(value="/add",method=RequestMethod.POST) //방법3.
	public String execute(Member member, Model model) throws Exception {
		int count = memberDao.insert(member);
		if (count > 0) {
			model.addAttribute("message", "등록 성공입니다!");
		} else {
			model.addAttribute("message", "등록 실패입니다!");
		}
		
		return "member/add";
	}
	
	/*
	//@RequestMapping(method=RequestMethod.POST) //방법1.
	//@RequestMapping(value="/member/add",method=RequestMethod.POST) //방법2.
	@RequestMapping(value="/add",method=RequestMethod.POST) //방법3.
	public String execute(
			String name,
			String email,
			String tel,
			int age,
			Model model) throws Exception {
		
		Member member = new Member();
		member.setName( name);
		member.setEmail( email );
		member.setTel( tel );
		member.setAge( age );
		
		int count = memberDao.insert(member);
		if (count > 0) {
			model.addAttribute("message", "등록 성공입니다!");
		} else {
			model.addAttribute("message", "등록 실패입니다!");
		}
		
		return "member/add";
	}
	*/

}
