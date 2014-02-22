package spms.controls;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

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
import spms.vo.Excel;
import spms.vo.JsonResult;

@Controller
@RequestMapping("/excel")
public class ExcelControl {
	Logger log = Logger.getLogger(ExcelControl.class);

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

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

	private static List<Excel> list = new ArrayList<Excel>();

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
				System.out.println("dd1 : " + row.getRowNum());

				if (row.getRowNum() == 0) {
					System.out.println("====Excel to DB Insert====");
				} else {

					list.add(new Excel(
							(int) (row.getCell(0).getNumericCellValue()), 
							(int) (row.getCell(1).getNumericCellValue()), 
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

			list.clear();

			return "redirect:../main.do";
		}
		return "excel/addForm";
	}

}
