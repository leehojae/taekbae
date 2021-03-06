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
//	TmapCarLeadTime tmapCarLeadTime = new TmapCarLeadTime();
	private static List<Excel> list = new ArrayList<Excel>();
	
	public static int staticId = 0;
	
	
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
	@RequestMapping("/deleveryMember")
	public String deleveryMember(Model model) throws Exception {
		model.addAttribute("excels", excelDao.selectList());
		return "delevery/deleveryMember";
	}
	
	public void stateUpdate (int id, int count, int state) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET STATE=? WHERE ID = ? AND STATE != 0 AND STATE = ?");
			stmt.setInt(1, count);
			stmt.setInt(2, id);
			stmt.setInt(3, state);
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
	public String updateRefresh(int id, int count, String[] updateList) throws Exception {
			System.out.println(id);
			System.out.println(count);
			System.err.println(updateList.length);
			for (String s : updateList){
				System.out.println(s);
				stateReUpdate(Long.parseLong(s));
			}
			
			for (int i = 0; i < count; i++) {
				stateUpdate(id, i+1, i+1+updateList.length);
			}
		
		return null;
	}
	
	@RequestMapping(value = "/lngsSmsSend", method = RequestMethod.POST, 
			produces="application/json")
	public void lngsSmsSend(String[] lngs) throws Exception {
		ArrayList<String> telList = new ArrayList<String>();
		
		for (int i = 0; i < lngs.length; i++) {
			for (int j = 0; j < excelDao.getTelFromLngs((Double.parseDouble(lngs[i]))).size(); j++){
				telList.add(excelDao.getTelFromLngs((Double.parseDouble(lngs[i]))).get(j).getReceiverTel2());
			}
		}
		for (String s : telList) {
			System.err.println(s);
		}
		
//		tmapCarLeadTime.requests();
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		// 발급 받은 개발자 Key 와 Api_Secret 를 입력 String auth_key = "개발자 키를 넣어주세요";
		// String auth_secret = "비밀키를 넣어주세요";
//		String auth_key = "2FKuieS1nQwRYE807KNXDuq3H7uwPyIUlKB939FShAyO0RbH20";
//		String auth_secret = "sodh50ncgSU9KlIZyBD08pHqPiBFZrlCm2XDIVsDrr7ZlVaz3d";
//		// api id 설정
//		String apiId = "1.0.SMS.MAKE";
//		// https 이용 여부 설정 false 로 기본 설정. boolean bSSL = false;
//		boolean bSSL = false;
//		// Make Parameters
//		HashMap<String, String> params = new HashMap<String, String>();
//		params.put("sender", "01047311909");
//		params.put("receivers", "01047311909");
//		params.put("receivers", "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909, "
//							  + "01047311909");
//		params.put("displayaddress", "01047311909");
//		params.put("text", "문자메시지 내용을 넣어주세요");
//		// make xauth params
//		HashMap<String, String> xauth_params = new HashMap<String, String>();
//		xauth_params.put("username", "");
//		xauth_params.put("password", "");
//		
//		Class.forName("com.kt.openplatform.sdk.KTOpenApiHandler");
//		
//		KTOpenApiHandler handler = KTOpenApiHandler.createHandler(auth_key,	auth_secret);
//
//		HashMap<?, ?> r = handler.call(apiId, params, xauth_params, bSSL);
//
//		System.out.println("RESULT==>" + r);
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
//		smsSendService.smsSend();
		
//		return null;
		
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
//					System.err.println(row.getCell(0).getNumericCellValue());	
//					System.err.println(row.getCell(1).getNumericCellValue());	
//					System.err.println(row.getCell(2).getStringCellValue());	
//					System.err.println(row.getCell(3).getDateCellValue());	
//					System.err.println(row.getCell(4).getDateCellValue());	
//					System.err.println(row.getCell(5).getStringCellValue());	
//					System.err.println(row.getCell(6).getStringCellValue());	
//					System.err.println(row.getCell(7).getStringCellValue());	
//					System.err.println(row.getCell(8).getStringCellValue());	
//					System.err.println(row.getCell(9).getStringCellValue());	
//					System.err.println(row.getCell(10).getStringCellValue());	
//					System.err.println(row.getCell(11).getStringCellValue());	
//					System.err.println(row.getCell(12).getStringCellValue());	
//					System.err.println(row.getCell(13).getStringCellValue());	
//					System.err.println(row.getCell(14).getNumericCellValue());	
//					System.err.println(row.getCell(15).getNumericCellValue());	
//					System.err.println(row.getCell(16).getStringCellValue());	
//					System.err.println(row.getCell(17).getStringCellValue());	
//					System.err.println(row.getCell(18).getStringCellValue());	
//					System.err.println(row.getCell(19).getStringCellValue());	
//					System.err.println(row.getCell(20).getStringCellValue());	
//					System.err.println(row.getCell(21).getStringCellValue());	
//					System.err.println(row.getCell(22).getStringCellValue());	
//					System.err.println(row.getCell(23).getNumericCellValue());	
//					System.err.println(row.getCell(24).getStringCellValue());	
//					System.err.println(row.getCell(25).getNumericCellValue());	
//					System.err.println(row.getCell(26).getStringCellValue());	
//					System.err.println(row.getCell(27).getNumericCellValue());	
//					System.err.println(row.getCell(28).getNumericCellValue());	
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
			System.err.println("moji");
			file.close();
			
			excelDao.addExcel(list);
			ArrayList<Excel> addrList = (ArrayList<Excel>)excelDao.selectAddr();
			ArrayList<String> addrResult = new ArrayList<String>();
			ArrayList<String> encodeResult = new ArrayList<String>();
			ArrayList<Excel> requestResult = new ArrayList<Excel>();
			for (int i = 0; i < addrList.size(); i++){
				if (addrList.get(i).getReceiverAddrName() != null) {
					addrResult.add(addrList.get(i).getReceiverAddrRoad()
							+ String.valueOf(addrList.get(i)
									.getReceiverAddrBun())
							+ "-"+ String.valueOf(addrList.get(i)
									.getReceiverAddrJi())
							+ addrList.get(i).getReceiverAddrName());
				} else {
					addrResult.add(addrList.get(i).getReceiverAddrRoad()
							+ String.valueOf(addrList.get(i)
									.getReceiverAddrBun())
							+ String.valueOf(addrList.get(i)
									.getReceiverAddrJi()));
				}
				System.out.println(addrResult.get(i));
				encodeResult.add(URLEncoder.encode(addrResult.get(i), "UTF-8"));
				System.out.println(encodeResult.get(i));
				requestResult.add(restRequest.requests(encodeResult.get(i)));
				System.out.println(i + ": lat : " + requestResult.get(i).getLat() + " : lng : " + requestResult.get(i).getLng());
				requestResult.get(i).setTrcno(addrList.get(i).getTrcno());
			}
			
			for (Excel e : requestResult) {
				update(e);
			}
			
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
	
	private double d2r = Math.PI / 180;

	public double distance(double startPointLon, double startPointLat,
			double endPointLon, double endPointLat) throws Exception {
		double dLon = (endPointLon - startPointLon) * d2r;
		double dLat = (endPointLat - startPointLat) * d2r;

		double a = Math.pow(Math.sin(dLat / 2.0), 2)
				+ Math.cos(startPointLat * d2r) * Math.cos(endPointLat * d2r)
				* Math.pow(Math.sin(dLon / 2.0), 2);

		double c = Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)) * 2;

		double distance = c * 6378;

		return distance;
	}
	
	@RequestMapping(value = "/searchUser", method = RequestMethod.POST, 
			produces="application/json")
	public Object searchUser(String trcno) throws Exception {
		System.err.println(trcno);
		
		return new JsonResult().setResultStatus(JsonResult.SUCCESS)
				.setData(excelDao.searchUser(Long.parseLong(trcno)));
	}
	
	@RequestMapping(value = "/getDelayTime", method = RequestMethod.POST,
			produces = "application/json")
	public Object getDelayTime(String trcno) throws Exception {
		System.err.println(trcno);
		
		System.out.println(excelDao.getDelayTime(Long.parseLong(trcno)));
		
		return excelDao.getDelayTime(Long.parseLong(trcno));
	}
	
	
	@RequestMapping(value = "/insertTime", method = RequestMethod.POST,
			produces = "application/json")
	public void updateTime(String trcno, String delayTime, String stateNum) throws Exception{
		System.err.println(trcno);
		System.err.println(delayTime);
		System.err.println(stateNum);
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET STATE=?, DELAY_TIME=? WHERE TRCNO=?");
			stmt.setString(1, stateNum);
			stmt.setString(2, delayTime);
			stmt.setString(3, trcno);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}
	}
	
	
	@RequestMapping(value = "/divide", method = RequestMethod.POST, 
			produces="application/json")
	public ArrayList<Excel> divideForm(Excel excel) throws Exception{

//		Excel temp = null;
		
		updateDivide(excel);
		ArrayList<Excel> coordList = (ArrayList<Excel>)excelDao.selectByIdCoord(excel.getId());
		
//		for (int j = 0; j < coordList.size()-1; j++){
//			for (int i = 0; i < coordList.size()-j-1; i++){
//				if((distance(127.02801704406481, 37.494539069596186, coordList.get(i).getLng(), coordList.get(i).getLat()) > 
//				(distance(127.02801704406481, 37.494539069596186, coordList.get(i+1).getLng(), coordList.get(i+1).getLat())))){
//					temp = coordList.get(i+1);
//					coordList.set(i+1, coordList.get(i));
//					coordList.set(i, temp);
//				}
//			}
//		}
//		
//		for (int i = 0; i < coordList.size(); i++){
//			System.out.println(coordList.get(i).setState(i+1).getState());
//			updateState(coordList.get(i));
//		}
//		
//		coordList.clear();
		
		return coordList;
	}
	public void updateState(Excel excel) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET STATE=? WHERE TRCNO=?");
			stmt.setInt(1, excel.getState());
			stmt.setLong(2, excel.getTrcno());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		} finally {
			try {stmt.close();} catch (Exception e) {}
			try {if(conn != null) conn.close();} catch (Exception e) {}
		}		
	}
	
	public void updateDivide(Excel excel) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE EXCEL_UPLOAD SET ID=? WHERE RECEIVER_ADDR_ROAD LIKE ?");
			stmt.setInt(1, excel.getId());
//			stmt.setString(2, excel.getReceiverAddrRoad());
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
