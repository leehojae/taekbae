package spms.controls;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.AreaDao;
import spms.vo.Area;
import spms.vo.JsonResult;

@Controller
@RequestMapping("/area")
public class AreaControl {
	Logger log = Logger.getLogger(AreaControl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required=false)
	AreaDao areaDao;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String form() {
		return "area/addForm";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(
			Area area,
			Model model) throws Exception {

		int count = areaDao.insert(area);
		if (count > 0) {
			model.addAttribute("message", "등록 성공입니다!");
		} else {
			model.addAttribute("message", "등록 실패입니다!");
		}
		
		return "area/add";
	}
	
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		model.addAttribute("areas", areaDao.selectList());
		return "area/list";
	}
	
	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Area area = areaDao.selectOne(no);
		model.addAttribute("area", area);
		return "area/updateForm";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
  public String update(Area area,
  		Model model) throws Exception {
		
		int count = areaDao.update(area);
		if (count > 0) {
			model.addAttribute("message", "변경 성공입니다!");
		} else {
			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
		}
		return "area/update";
  }

	
//	@RequestMapping("/projectAreas")
//	public void projectAreas(int no, Model model) throws Exception {
//		model.addAttribute("areas", areaDao.selectListByProject(no));
//	}
	
	@RequestMapping(value="/ajax/update", method=RequestMethod.POST, 
			produces="application/json")
	public Object ajaxUpdate(Area area) throws Exception {
		try {
			areaDao.update(area);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/add", method=RequestMethod.POST, 
			produces="application/json")
	public Object ajaxAdd(Area area) throws Exception {
		try {
			areaDao.insert(area);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/delete", produces="application/json")
	public Object ajaxDelete(int no) throws Exception {
		try {
			areaDao.delete(no);
			return "redirect:/area/areaList.do";
//			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return "redirect:/area/areaList.do";
//			return new JsonResult().setResultStatus(JsonResult.FAILURE)
//					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/read", produces="application/json")
	public Object ajaxRead(int no) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(areaDao.selectOne(no));
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/list", produces="application/json")
	public Object ajaxList() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(areaDao.selectList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
		
	}
	
	
	@RequestMapping("/areaList.do")  //chell
	public String areaList(Model model) throws Exception {
		return "area/areaList";
	}
	

}










