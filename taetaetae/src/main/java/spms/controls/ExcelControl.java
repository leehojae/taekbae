package spms.controls;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spms.dao.ExcelDao;
import spms.services.RestRequest;
import spms.vo.Excel;
import spms.vo.JsonResult;
import spms.vo.Member;

@Controller
@RequestMapping("/excel")
public class ExcelControl {
	Logger log = Logger.getLogger(ExcelControl.class);

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	RestRequest restRequest = new RestRequest();
	private static List<Excel> list = new ArrayList<Excel>();
	
	@Autowired
	DataSource ds; // 의존 객체(dependencies)
	
	@Autowired
	ServletContext servletContext;

	@Autowired(required = false)
	ExcelDao excelDao;
	
	@RequestMapping("/delete")
	public String delete(Model model) throws Exception {
		excelDao.delete();
		return "redirect:../main.do";
	}

	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		model.addAttribute("excels", excelDao.selectList());
		return "excel/list";
	}

	@RequestMapping(value = "/ajax/list", produces = "application/json")
	public Object ajaxList() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS)
					.setData(excelDao.selectList());

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String showForm(Excel excel, ModelMap model) {
		model.addAttribute("excel", excel);
		return "excel/addForm";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processForm(
			@RequestParam("excelFile") MultipartFile excelFile, Excel excel,
			BindingResult result) throws Exception {
		if (!result.hasErrors()) {

			// save & load location
			String filePath = excelFile.getOriginalFilename();
			System.out.println(filePath);

			// //save
			excelFile
					.transferTo(new File(servletContext.getRealPath(filePath)));
			// load
			FileInputStream file = new FileInputStream(new File(
					servletContext.getRealPath(filePath)));

			XSSFWorkbook workbook = new XSSFWorkbook(file);
			XSSFSheet sheet = workbook.getSheetAt(0);

			Iterator<Row> rowIterator = sheet.iterator();

			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();

				if (row.getRowNum() == 0) {
					System.out.println("====Excel to DB Insert====");
				} else {

					list.add(new Excel(
							(long) (row.getCell(0).getNumericCellValue()), 
							(long) (row.getCell(1).getNumericCellValue()), 
							row.getCell(2).getStringCellValue(), 
							sdf.format(row.getCell(3).getDateCellValue()), 
							sdf.format(row.getCell(4).getDateCellValue()), 
							row.getCell(5).getStringCellValue(), 
							row.getCell(6).getStringCellValue(), 
							row.getCell(7).getStringCellValue(), 
							row.getCell(8).getStringCellValue(), 
							row.getCell(9).getStringCellValue(), 
							row.getCell(10).getStringCellValue(), 
							row.getCell(11).getStringCellValue(), 
							row.getCell(12).getStringCellValue(), 
							row.getCell(13).getStringCellValue(), 
							row.getCell(14).getStringCellValue(), 
							row.getCell(15).getStringCellValue(), 
							row.getCell(16).getStringCellValue(), 
							(int) (row.getCell(17).getNumericCellValue()), 
							row.getCell(18).getStringCellValue(), 
							(int) (row.getCell(19).getNumericCellValue()), 
							row.getCell(20).getStringCellValue(), 
							(int) (row.getCell(21).getNumericCellValue()), 
							(int) (row.getCell(22).getNumericCellValue())
							));
				}
			}
			file.close();
			
			excelDao.addExcel(list);
			ArrayList<Excel> addrList = (ArrayList<Excel>)excelDao.selectAddr();
			ArrayList<String> addrResult = new ArrayList<String>();
			ArrayList<String> encodeResult = new ArrayList<String>();
			ArrayList<Excel> requestResult = new ArrayList<Excel>();
			for (int i = 0; i < addrList.size(); i++){
				addrResult.add(addrList.get(i).getReceiverAddr());
				System.out.println(addrResult.get(i));
				encodeResult.add(URLEncoder.encode(addrResult.get(i), "UTF-8"));
				System.out.println(encodeResult.get(i));
				requestResult.add(restRequest.requests(encodeResult.get(i)));
				requestResult.get(i).setTrcno(addrList.get(i).getTrcno());
			}
			
//			for (int i = 0; i < addrList.size(); i++){
//			}
			
			for (Excel e : requestResult) {
				System.out.println(e.getTrcno());
				System.out.println(e.getLat());
				System.out.println(e.getLng());
				update(e);
			}
			
			//excelDao.addLatLngs(requestResult);
			
			requestResult.clear();
			encodeResult.clear();
			addrResult.clear();
			addrList.clear();
			list.clear();
			
			return "redirect:../main.do";
		}
		return "redirect:../main.do";
	}
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	
	public void update(Excel excel) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET LAT=?,LNG=? WHERE TRCNO=?");
			stmt.setDouble(1, excel.getLat());
			stmt.setDouble(2, excel.getLng());
			stmt.setLong(3, excel.getTrcno());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}		
	}
	
}
