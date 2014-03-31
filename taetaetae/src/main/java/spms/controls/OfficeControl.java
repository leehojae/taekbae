package spms.controls;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.MemberDao;
import spms.dao.OfficeDao;
import spms.vo.JsonResult;
import spms.vo.Office;
import spms.vo.Member;

@Controller
@RequestMapping("/office")
public class OfficeControl {
	Logger log = Logger.getLogger(OfficeControl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required=false)
	OfficeDao officeDao;
	
	
	@Autowired(required=false)
	MemberDao memberDao;
	
	
	@Autowired(required=false)
	ExcelControl excelControl;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String form() {
		return "office/addForm";
	}

	@RequestMapping(value="/joongso",method=RequestMethod.GET)
	public String formTest() {
		//return "member/addForm";
		return "office/joongso";
	}

	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(
			Office office, 
			
			Model model) throws Exception {

		if( excelControl.staticId == 0)
		{
			return "redirect:/failAccess.jsp";
			
		}
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
		if( excelControl.staticId == 0)
		{
			return "redirect:/failAccess.jsp";
			
		}
		officeDao.delete(no);
		return "redirect:list.do";
	}
	
	@RequestMapping("/officeList.do")
	public String officeList(Model model) throws Exception {
		//model.addAttribute("offices", officeDao.selectList());
		return "office/officeList";
	}
	@RequestMapping("/nonOfficeList.do")
	public String nonOfficeList(Model model) throws Exception {
		//model.addAttribute("offices", officeDao.selectList());
		return "office/nonOfficeList";
	}
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		if( excelControl.staticId == 0)
		{
			return "redirect:/failAccess.jsp";
			
		}
		return "office/list";
	}
	@RequestMapping("/myOffice")
	public String myOffice(Model model) throws Exception {
		if( excelControl.staticId == 0)
		{
			return "redirect:/failAccess.jsp";
			
		}
		return "office/myOffice";
	}
	@RequestMapping("/nonApplist")
	public String nonApplist(Model model) throws Exception {
		if( excelControl.staticId == 0)
		{
			return "redirect:/failAccess.jsp";
			
		}
		return "office/nonApplist";
	}
	
	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Office office = officeDao.selectOne(no);
		model.addAttribute("office", office);
//		return "member/updateForm";
		return "member/addOfficeMember";
		
	}
	
	
	@RequestMapping("/updateOffice")
	public String updateOffice(int no, Model model) throws Exception {
		Office office = officeDao.selectOne(no);
		model.addAttribute("office", office);
//		return "member/updateForm";
		return "office/updateForm";
		
	}
	@RequestMapping("/approval")
	public String approval(Model model) throws Exception {
		//int i = excelControl.staticId;
		
		Member m = memberDao.selectOne(excelControl.staticId);
		
		
		
		Office office = officeDao.selectOne(   m.getOfficeNum() );
		model.addAttribute("office", office);
//		return "member/updateForm";
		return "office/approval";
		
	}
	
	
	@RequestMapping("/searchCompany")
	public String searchCompany(int no   ,   Model model) throws Exception {
		
		Office office = officeDao.selectOne(  no );
		model.addAttribute("office", office);
//		return "member/updateForm";
		return "member/searchCompany";
		
	}

	
	@RequestMapping(value="/ajax/updateOffice", method=RequestMethod.POST, 
			produces="application/json")
	public String  update(Office office) throws Exception {
		try {
			 officeDao.update(office);
			 return "redirect:/office/officeList.do";
			
		} catch (Throwable ex) {
			return "redirect:/office/officeList.do";
		}
	}
	@RequestMapping(value="/ajax/approval",
			method=RequestMethod.GET, 
			produces="application/json")
	public String approval(int[] no)throws Exception {
		try {
			
			
			for(int i = 0; i< no.length; i++)
			{	
				officeDao.approval(no[i]);
			}
			return "redirect:/office/nonOfficeList.do";
		} catch (Throwable ex) {
			return "redirect:/office/nonOfficeList.do";
		}
	}
	



	
	@RequestMapping(value="/ajax/addOffice", method=RequestMethod.POST, 
			produces="application/json")
	public String ajaxAdd(Office office) throws Exception {
		try {
			
			
			 //String ceo  =new String(office.getOfficeCEO().getBytes("8859_1"),"EUC-KR ");

			 String ceo = office.getOfficeCEO();
			
			
			//String url  =  "redirect:/addedOffice.jsp?officeName=" + office.getOfficeName() +  "&ceo="+ ceo+"&no="+ office.getOfficeNum();
			String url  =  "redirect:/office/read.do?no="+ office.getOfficeNum();
			System.out.println("1  :" +  office.getOfficeName());
			System.out.println("2  :" +  office.getOfficeName());
			officeDao.insert(office);
			//return "redirect:/success.jsp";
			return url;
			
		} catch (Throwable ex) {
			return "redirect:/fail.jsp";
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
	
	@RequestMapping(value="/ajax/officeList.do", produces="application/json" )
	public Object ajaxList(String keywordA , String keywordB) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS).setData(officeDao.selectList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	@RequestMapping(value="/ajax/officeNewList.do", produces="application/json" )
	public Object ajaxNewList(String keywordA , String keywordB) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS).setData(officeDao.selectNewList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	
	
	@RequestMapping(value="/ajax/deleteOffice", produces="application/json")
	public String ajaxDelete(int no) throws Exception {
		try {
			officeDao.delete(no);
			return "redirect:/office/officeList.do";
			
		} catch (Throwable ex) {
			if( excelControl.staticId == 0)
			{
				return "redirect:/failAccess.jsp";
				
			}
			return "redirect:/office/officeList.do";
		}
	}

}
