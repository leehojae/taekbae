package spms.controls;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spms.dao.MemberDao;
import spms.dao.OfficeDao;
import spms.vo.JsonResult;
import spms.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberControl {
	Logger log = Logger.getLogger(MemberControl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required=false)
	MemberDao memberDao;
	
	@Autowired(required=false)
	OfficeDao officeDao;
	
	
	@Autowired(required=false)
	ExcelControl excelControl;
	
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String form() {
		
		//return "member/addForm";
		return "member/add";
	}
	@RequestMapping(value="/addtest",method=RequestMethod.GET)
	public String formTest() {
		//return "member/addForm";
		return "member/addtest";
	}
	
//	@RequestMapping(value="/add",method=RequestMethod.POST)
//	public String add(
//			Member member, 
//			@RequestParam("photoFile") MultipartFile photoFile,
//			Model model) throws Exception {
//
//		member.setPhoto(saveFile(photoFile));
//		
//		int count = memberDao.insert(member);
//		if (count > 0) {
//			model.addAttribute("message", "등록 성공입니다!");
//		} else {
//			model.addAttribute("message", "등록 실패입니다!");
//		}
//		
//		return "member/add";
//	}
	
	@RequestMapping(value="/setPhoto",method=RequestMethod.POST)
	public String setPhoto(
			Member member, 
			@RequestParam("file1") MultipartFile photoFile,
			Model model) throws Exception {
		System.err.println("asdfasdf");
		saveFile(photoFile);
		
		return "member/add";
	}
	@RequestMapping(value="/updatePhoto",method=RequestMethod.POST)
	public String updatePhoto(
			Member member, 
			@RequestParam("file1") MultipartFile photoFile,
			Model model) throws Exception {
		saveFile(photoFile);
		
		return "member/memberList";
	}
	
	@RequestMapping("/delete")
	public String delete(int no, Model model) throws Exception {
		memberDao.delete(no);
		return "redirect:list.do";
	}
	@RequestMapping("/addImage")
	public String addImage( ) throws Exception {
		
		return "member/add_image";
	}
	@RequestMapping("/searchCompany")
	public String searchCompany( ) throws Exception {
		
		return "member/searchCompany";
	}
	@RequestMapping("/updateImage")
	public String updateImage( ) throws Exception {
		
		return "member/update_image";
	}
	
	
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
	//	model.addAttribute("members", memberDao.selectList());
		return "member/list";
	}
	
	
	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Member member = memberDao.selectOne(no);
		model.addAttribute("member", member);
		return "member/updateForm";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
  public String update(Member member, 
  		@RequestParam(value="photoFile",required=false) MultipartFile photoFile,
  		Model model) throws Exception {
		
		if (photoFile.getSize() > 0) {
			member.setPhoto( saveFile(photoFile) );
		}
		
		int count = memberDao.update(member);
		if (count > 0) {
			model.addAttribute("message", "변경 성공입니다!");
		} else {
			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
		}
		return "member/update";
  }

	private String saveFile(MultipartFile photoFile) throws IOException {
	  String originFilename = photoFile.getOriginalFilename();
	  log.debug("업로드 파일:" + photoFile.getName() + "=" + originFilename);
	  
	  String ext = originFilename.substring(
		  		originFilename.lastIndexOf("."));
	  
	  Date dt = new Date();
	  System.out.println(dt.toString());
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_hh:mm:ss a"); 
	  System.out.println(sdf.format(dt).toString());
	  
	  String newFilename = sdf.format(dt).toString() + "_" +
		  		this.getFileCount() + ext;
	  
//	  String newFilename = System.currentTimeMillis() + "_" +
//			  this.getFileCount() + ext;
//	  
	  photoFile.transferTo(new File(servletContext.getRealPath(
	  		"/files/" + newFilename)));
	  
	  return newFilename; 
  }
	
	int fileCount = 0;
	synchronized private int getFileCount() {
		if (fileCount > 1000) {
			fileCount = 0;
		}
		return ++fileCount;
	}
	
	
	@RequestMapping(value="/ajax/update", method=RequestMethod.POST, 
			produces="application/json")
	public Object ajaxUpdate(Member member) throws Exception {
		try {
			memberDao.update(member);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}

	@RequestMapping(value="/ajax/delete", produces="application/json")
	public String ajaxDelete(int[] no) throws Exception {
		try {
			System.out.println("dddd : "+ no.length);
			
			for(int i = 0; i< no.length; i++)
			{	
				memberDao.delete(no[i]);
			}
			return "redirect:/member/memberList.do";
			
		} catch (Throwable ex) {
			return "redirect:/member/memberList.do";
		}
	}
	
	@RequestMapping(value="/ajax/read", produces="application/json")
	public Object ajaxRead(int no) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(memberDao.selectOne(no));
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping(value="/ajax/list", produces="application/json")
	public Object ajaxList() throws Exception {
		try {
			int mno = excelControl.staticId;
			
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(memberDao.selectList(mno ));
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
		
	}
	
	
	@RequestMapping(value="/ajax/officeList.do", produces="application/json")
	public Object ajaxListmem() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(officeDao.selectList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
		
	}
	
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) throws Exception {
		return "member/memberList";
	}
	@RequestMapping("/memberAddForm.do")
	public String officeList(Model model) throws Exception {
		return "member/addForm";
	}
	
	
	
	
	@RequestMapping(value="/ajax/addMember", method=RequestMethod.POST, 
			produces="application/json")
	public String ajaxAdd(Member member) throws Exception {
		try {
			
			memberDao.insert(member);
			
			if(  member.getRank().equals("100") )
			{
				return "redirect:/successAddOffice.jsp";
			}
			
			return "redirect:/successMember.jsp";
			
		} catch (Throwable ex) {
			return "redirect:/failMember.jsp";
		}
	}

}










