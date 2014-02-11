package spms.controls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spms.dao.MemberDao;

//@Controller
public class MemberDeleteControl {
	@Autowired(required=false)
	MemberDao memberDao;
	
	@RequestMapping("/member/delete")
	public String execute(int no, Model model) throws Exception {
		memberDao.delete(no);
		return "redirect:list.do";
	}
}




