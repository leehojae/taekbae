package spms.controls;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.OfficeDao;
import spms.vo.JsonResult;
import spms.vo.Office;

@Controller
@RequestMapping("/office")
public class OfficeControl {
	Logger log = Logger.getLogger(OfficeControl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required=false)
	OfficeDao officeDao;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String form() {
		return "office/addForm";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(
			Office office, 
			
			Model model) throws Exception {

		
		int count = officeDao.insert(office);
		if (count > 0) {
			model.addAttribute("message", "등록 성공입니다!");
		} else {
			model.addAttribute("message", "등록 실패입니다!");
		}
		
		return "office/add";
	}
	
	@RequestMapping("/delete")
	public String delete(int no, Model model) throws Exception {
		officeDao.delete(no);
		return "redirect:list.do";
	}
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		model.addAttribute("offices", officeDao.selectList());
		return "office/list";
	}
	
	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Office office = officeDao.selectOne(no);
		model.addAttribute("office", office);
		return "office/updateForm";
	}
	
//	@RequestMapping(value="/ajax/updateOffice",method=RequestMethod.POST)
//  public String update(Office office,
//  		Model model) throws Exception {
//		
//		
//		 officeDao.update(office);
//		int count = officeDao.update(office);
//		if (count > 0) {
//			model.addAttribute("message", "변경 성공입니다!");
//		} else {
//			model.addAttribute("message", "해당 번호의 점소 정보를 찾을 수 없습니다!");
//		}
//		return "office/update";
//  }
//	
	
	@RequestMapping(value="/ajax/updateOffice", method=RequestMethod.POST, 
			produces="application/json")
	public Object update(Office office) throws Exception {
		try {
			 officeDao.update(office);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}



	
	@RequestMapping(value="/ajax/addOffice", method=RequestMethod.POST, 
			produces="application/json")
	public Object ajaxAdd(Office office) throws Exception {
		try {
			
			System.out.println("1  :" +  office.getOfficeName());
			System.out.println("2  :" +  office.getOfficeName());
			officeDao.insert(office);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	
	
	@RequestMapping(value="/ajax/readOffice", produces="application/json")
	public Object ajaxRead(int no) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(officeDao.selectOne(no));
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/officeList.do", produces="application/json")
	public Object ajaxList() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(officeDao.selectList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
		
	}
	
	
	
	@RequestMapping(value="/ajax/deleteOffice", produces="application/json")
	public String ajaxDelete(int no) throws Exception {
		try {
			officeDao.delete(no);
			//return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			return "redirect:/office/list.do";
			
		} catch (Throwable ex) {
			//return new JsonResult().setResultStatus(JsonResult.FAILURE)
			//		.setError(ex.getMessage());
			return "redirect:/office/list.do";
		}
	}

}
