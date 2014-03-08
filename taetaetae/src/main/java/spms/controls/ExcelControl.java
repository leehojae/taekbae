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

@Controller
@RequestMapping("/excel")
public class ExcelControl {
	Logger log = Logger.getLogger(ExcelControl.class);

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	RestRequest restRequest = new RestRequest();
	private static List<Excel> list = new ArrayList<Excel>();
	
	public static int staticId = 0;
	
	
	@Autowired
	DataSource ds; // 의존 객체(dependencies)
	
	@Autowired
	ServletContext servletContext;

	@Autowired(required = false)
	ExcelDao excelDao;
	
	@RequestMapping("/listUpdate")
	public void listUpdate(List<Excel> lists) {
		
	}
	
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
	@RequestMapping("/deleveryMember")
	public String deleveryMember(Model model) throws Exception {
		model.addAttribute("excels", excelDao.selectList());
		return "delevery/deleveryMember";
	}
	
	public void stateUpdate (int id, int count) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET STATE=? WHERE ID = ? AND STATE != 0");
			stmt.setInt(1, count);
			stmt.setInt(2, id);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}
	}
	
	public void stateReUpdate (long trcno) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET STATE=0 WHERE TRCNO = ?");
			stmt.setLong(1, trcno);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}
	}
	
	@RequestMapping(value = "/stateUpdate", method = RequestMethod.POST, 
			produces="application/json")
	public String updateRefresh(int id, int count, List<Long> updateList) throws Exception {
		
		if (updateList == null) {

			for (int i = 0; i < count; i++) {
				stateUpdate(id, i+1);
			}
			
		} else {
			
			for (Long l : updateList) {
				stateReUpdate(l.longValue());
			}
			
			for (int i = 0; i < count-updateList.size(); i++) {
				stateUpdate(id, i+1);
			}
		}
		
		return null;
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
	@RequestMapping(value = "/ajax/deleveryMember", produces = "application/json")
	public Object deleveryMember() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS)
					.setData(excelDao.selectDeleveryMember(staticId));
			
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
							(int) (row.getCell(14).getNumericCellValue()), 
							(int) (row.getCell(15).getNumericCellValue()), 
							row.getCell(16).getStringCellValue(), 
							row.getCell(17).getStringCellValue(), 
							row.getCell(18).getStringCellValue(), 
							row.getCell(19).getStringCellValue(), 
							row.getCell(20).getStringCellValue(), 
							row.getCell(21).getStringCellValue(), 
							row.getCell(22).getStringCellValue(), 
							(int) (row.getCell(23).getNumericCellValue()), 
							row.getCell(24).getStringCellValue(), 
							(int) (row.getCell(25).getNumericCellValue()), 
							row.getCell(26).getStringCellValue(), 
							(int) (row.getCell(27).getNumericCellValue()), 
							(int) (row.getCell(28).getNumericCellValue())
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
				addrResult.add(addrList.get(i).getReceiverAddrRoad());
				System.out.println(addrResult.get(i));
				encodeResult.add(URLEncoder.encode(addrResult.get(i), "UTF-8"));
				System.out.println(encodeResult.get(i));
				requestResult.add(restRequest.requests(encodeResult.get(i)));
				System.out.println(i + ": lat : " + requestResult.get(i).getLat() + " : lng : " + requestResult.get(i).getLng());
				requestResult.get(i).setTrcno(addrList.get(i).getTrcno());
			}
			
//			List<BigDecimal> testList = new ArrayList<BigDecimal>();
			
			for (Excel e : requestResult) {
				update(e);
//				testList.add(BigDecimal.valueOf(e.getLat()).add(BigDecimal.valueOf(e.getLat())));
			}
			
//			for (BigDecimal d : testList) {
//				System.out.println(d);
//			}
			
			
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
	
	@RequestMapping(value = "/divide", method = RequestMethod.POST, 
			produces="application/json")
	public String divideForm(Excel excel) throws Exception{
		
		updateDivide(excel);
		
		return "redirect:../main.do";
	}
	
	public void updateDivide(Excel excel) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET ID=? WHERE RECEIVER_ADDR_ROAD LIKE ?");
			stmt.setInt(1, excel.getId());
			stmt.setString(2, "%" + excel.getReceiverAddrRoad() + "%");
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}		
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
