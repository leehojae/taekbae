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
import spms.vo.Office;

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
		return "member/memberList";
	}
	
	@RequestMapping("/addImage")
	public String addImage( ) throws Exception {
		
		return "member/add_image";
	}
	@RequestMapping("/searchCompany")
	public String searchCompany( ) throws Exception {
		
		return "member/searchCompany";
	}
	
	
	
	@RequestMapping("/idCheck")
	public String idCheck( String id   ,   Model model) throws Exception {
		
		Member member = memberDao.searchid(  id );
		
		model.addAttribute("member", member);

		return "member/idCheck";
		
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
  		Model model) throws Exception {
		System.err.println(member);

		int count = memberDao.update(member);
//		if (count > 0) {
//			model.addAttribute("message", "변경 성공입니다!");
//		} else {
//			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
//		}
		return "member/memberList";
		//return "member/update";
  }
//	
//	@RequestMapping(value="/update",method=RequestMethod.POST)
//	public String update(Member member, 
//			@RequestParam(value="photoFile",required=false) MultipartFile photoFile,
//			Model model) throws Exception {
//		System.err.println(member);
//		System.err.println(photoFile);
//		if (photoFile.getSize() > 0) {
//			member.setPhoto( saveFile(photoFile) );
//		}
//		
//		int count = memberDao.update(member);
//		if (count > 0) {
//			model.addAttribute("message", "변경 성공입니다!");
//		} else {
//			model.addAttribute("message", "해당 번호의 회원 정보를 찾을 수 없습니다!");
//		}
//		return "member/update";
//	}

	private String saveFile(MultipartFile photoFile) throws IOException {
	  String originFilename = photoFile.getOriginalFilename();
	  log.debug("업로드 파일:" + photoFile.getName() + "=" + originFilename);
	  
	  String ext = originFilename.substring(
		  		originFilename.lastIndexOf("."));
	  
	  Date dt = new Date();
	  System.out.println(dt.toString());
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_hh_mm_ss"); 
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
			
			if(  member.getRank().equals("3") )
			{
				return "redirect:/member/memberList.do";
			}
			return "redirect:/member/memberList.do";
//			return "redirect:../list.do";
			
		} catch (Throwable ex) {
			return "redirect:/member/memberList.do";
		}
	}

}










