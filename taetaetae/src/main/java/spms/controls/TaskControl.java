package spms.controls;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import spms.dao.TaskDao;
import spms.vo.Member;

@Controller
@RequestMapping("/task")
@SessionAttributes("loginUser")
public class TaskControl {
	@Autowired
	TaskDao taskDao;
	
	@RequestMapping("/myTasks")
	public String myTasks(	@ModelAttribute("loginUser") Member loginUser,
			Model model) throws Exception {
		model.addAttribute("tasks", 
				taskDao.selectMyTasks(loginUser.getNo()));
		
		return "task/myTasks";
	}
	
	@RequestMapping("/list")
	public String list(
			@RequestParam(required=false) String search, 
			@RequestParam(required=false) String keyword,
			@RequestParam(required=false,defaultValue="0") int projectNo,
			Model model) throws Exception {
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		if (search != null && keyword != null) {
			paramMap.put("search", search);
			String[] keywordList = keyword.split("\\s+");
			paramMap.put("keywords", keywordList);
		}
		if (projectNo > 0) {
			paramMap.put("projectNo", projectNo);
		}
		
		model.addAttribute("tasks", taskDao.selectList(paramMap));
		
		return "task/list";
	}
	
}






