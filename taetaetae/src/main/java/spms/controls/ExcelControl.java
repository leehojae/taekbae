package spms.controls;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spms.dao.ExcelDao;
import spms.vo.Excel;
import spms.vo.JsonResult;

@Controller
@RequestMapping("/excel")
public class ExcelControl {
	Logger log = Logger.getLogger(ExcelControl.class);
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required=false)
	ExcelDao excelDao;
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		model.addAttribute("excels", excelDao.selectList());
		return "excel/list";
	}
	
	@RequestMapping(value="/ajax/list", produces="application/json")
	public Object ajaxList() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS) 
					.setData(excelDao.selectList());
			
		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
		
	}
	
	private static List<Excel> list = new ArrayList<Excel>();
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String showForm(Excel excel, ModelMap model){
		model.addAttribute("excel", excel);
		return "excel/addForm";
	}

	@RequestMapping(value="/add",method=RequestMethod.POST)
	
	public String processForm(@RequestParam("excelFile") MultipartFile excelFile, Excel excel, BindingResult result) throws IOException{
		if(!result.hasErrors()){
			//list.removeAll(list);
			list.clear();
			//save & load location
			String filePath = excelFile.getOriginalFilename();
			System.out.println(filePath);
			
//			//save
//			outputStream = new FileOutputStream(new File(filePath));
//			outputStream.write(excel.getFile().getFileItem().get());
//			System.out.println("123");
			
			excelFile.transferTo(new File(servletContext.getRealPath(filePath)));
			//load
	        FileInputStream file = new FileInputStream(new File(servletContext.getRealPath(filePath)));

	        XSSFWorkbook workbook = new XSSFWorkbook(file);
	        XSSFSheet sheet = workbook.getSheetAt(0);
	            

	        Iterator<Row> rowIterator = sheet.iterator();

	        HashMap<String,String> map = new HashMap<String,String>();
	        
	        while (rowIterator.hasNext()) 
	        {
	        	Row row = rowIterator.next();
	            System.out.println(row.getRowNum());
	            
	            
	            if(row.getRowNum()==0){
	            	System.out.println("====Excel to DB Insert====");
                }else{
                
                if(map.containsKey(row.getCell(1).getStringCellValue())){
                	
                }else{
                	list.add(new Excel(row.getCell(0).getStringCellValue(), row.getCell(1).getStringCellValue()));
                	System.out.println(list);
                }
    	        map.put(row.getCell(1).getStringCellValue(),row.getCell(0).getStringCellValue());

                }
	            
            }
            file.close();
            
	        excelDao.addExcel(list);
            
	        list.clear();
	        
   		return "redirect:../main.do";
	}
	return "excel/addForm";
}	

//	@Override
//	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception exception) {
//		Map<Object, Object> model = new HashMap<Object, Object>();
//        if (exception instanceof FileNotFoundException)
//        {
//            model.put("errors", "FileNotFoundException");
//        } else
//        {
//            model.put("errors", "Unexpected error: " + exception.getMessage());
//        }
//        model.put("excel", new Excel());
//        return new ModelAndView("/excel/addForm", (Map) model);
//	}
}
