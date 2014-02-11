package spms.controls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.MemberDao;
import spms.vo.Member;

//@Controller
public class MemberUpdateControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@RequestMapping(value="/member/update",method=RequestMethod.POST)
  public String execute(Member member, Model model) throws Exception {
		int count = memberDao.update(member);
		if (count > 0) {
			model.addAttribute("message", "변경 성공입니다!");
		} else {
			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
		}
		
		return "member/update";
  }

}







