package spms.controls;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import spms.dao.ProjectDao;
import spms.vo.Member;
import spms.vo.Project;

@Controller
@RequestMapping("/project")
@SessionAttributes("loginUser")
public class ProjectControl {
	@Autowired(required=false)
	ProjectDao projectDao;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String form() {
		return "project/addForm";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(
			Project project, 
			Model model) throws Exception {
		int count = projectDao.insert(project);
		if (count > 0) {
			model.addAttribute("message", "등록 성공입니다!");
		} else {
			model.addAttribute("message", "등록 실패입니다!");
		}
		
		return "project/add";
	}
	
	@RequestMapping("/delete")
	public String delete(int no, Model model) throws Exception {
		projectDao.delete(no);
		return "redirect:list.do";
	}
	
	@RequestMapping("/list")
	public String list(String search, String keyword, 
			Model model) throws Exception {
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		if (search != null && keyword != null) {
			paramMap.put("search", search);
			String[] keywordList = keyword.split("\\s+");
			paramMap.put("keywords", keywordList);
		}
		model.addAttribute("projects", projectDao.selectList(paramMap));
		
		return "project/list";
	}
	
	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Project project = projectDao.selectOne(no);
		model.addAttribute("project", project);
		return "project/updateForm";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
  public String update(Project project, Model model) throws Exception {
		Project origin = projectDao.selectOne(project.getNo());
		int updateCount = 6;
		if (origin.getTitle().equals(project.getTitle())) {
			project.setTitle(null); updateCount--;
		}
		if (origin.getDescription().equals(project.getDescription())) {
			project.setDescription(null); updateCount--;
		}
		if (origin.getStartDate().equals(project.getStartDate())) {
			project.setStartDate(null); updateCount--;
		}
		if (origin.getEndDate().equals(project.getEndDate())) {
			project.setEndDate(null); updateCount--;
		}
		if (origin.getTags().equals(project.getTags())) {
			project.setTags(null); updateCount--;
		}
		if (origin.getState() == project.getState()) {
			project.setState(-1); updateCount--;
		}
		
		if (updateCount == 0) {
			return "redirect:list.do";
		}
		
		int count = projectDao.update(project);
		if (count > 0) {
			model.addAttribute("message", "변경 성공입니다!");
		} else {
			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
		}
		return "project/update";
  }
	
	@RequestMapping("/myProjects")
	public String myProjects(
			@ModelAttribute("loginUser") Member loginUser,
			Model model) throws Exception {
		model.addAttribute("projects", 
				projectDao.selectMyProjects(loginUser.getNo()));
		
		return "project/myProjects";
	}
	
	@RequestMapping("/desc")
	public String desc(int no, Model model) throws Exception {
		Project project = projectDao.selectOne(no);
		model.addAttribute("project", project);
		return "project/desc";
	}
	
}

















