package spms.controls;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.CarDao;
import spms.dao.DivideDao;
import spms.dao.ExcelDao;
import spms.vo.Car;
import spms.vo.Excel;

@Controller
@RequestMapping("/divide")
public class DivideControl {
	
	Logger log = Logger.getLogger(DivideControl.class);
	
	@Autowired
	DataSource ds;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired(required = false)
	DivideDao divideDao;
	
	@Autowired(required = false)
	ExcelDao excelDao;
	
	@Autowired(required=false)
	CarDao carDao;
	
	@RequestMapping(value="ajax/execute",method=RequestMethod.GET, 
			produces="application/json")
	public String execute() throws Exception {
		List<Excel> excelList = new ArrayList<Excel>();
		List<Car> carList = new ArrayList<Car>();
		
		int carCount = 0;
		int excelCount = 0;
		
		excelList = excelDao.selectList();
		carList = carDao.selectList();
		
		for (Excel e : excelList) {
			System.out.println(e.getWeight());
		}
		
		for (Car c : carList) {
			System.out.println(c.getNo());
		}
		
		carCount = carList.size();
		excelCount = excelList.size();
		
		System.out.println(carCount/excelCount);
		
		return null;
	}
	
}
