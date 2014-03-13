package spms.controls;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spms.dao.CarDao;
import spms.vo.Car;
import spms.vo.JsonResult;

@Controller
@RequestMapping("/car")
public class CarControl {
	Logger log = Logger.getLogger(AreaControl.class);

	@Autowired
	ServletContext servletContext;

	@Autowired(required = false)
	CarDao carDao;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String form() {
		return "car/addForm";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Car car, Model model) throws Exception {

		int count = carDao.insert(car);
		if (count > 0) {
			model.addAttribute("message", "챠량등록 성공입니다!");
		} else {
			model.addAttribute("message", "차량등록 실패입니다!");
		}

		return "car/add";
	}

	@RequestMapping("/delete")
	public String delete(int no, Model model) throws Exception {
		carDao.delete(no);
		return "redirect:list.do";
	}

	@RequestMapping("/list") // chell
	public String list(Model model) throws Exception {
		model.addAttribute("cars", carDao.selectList());
		return "car/list";
	}

	@RequestMapping("/read")
	public String read(int no, Model model) throws Exception {
		Car car = carDao.selectOne(no);
		model.addAttribute("car", car);
		return "car/updateForm";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Car car, Model model) throws Exception {

		int count = carDao.update(car);
		if (count > 0) {
			model.addAttribute("message", "변경 성공입니다!");
		} else {
			model.addAttribute("message", "해당 번호의 정보를 찾을 수 없습니다!");
		}
		return "car/update";
	}

	@RequestMapping(value = "/ajax/update", method = RequestMethod.POST, produces = "application/json")
	public Object ajaxUpdate(Car car) throws Exception {
		try {
			carDao.update(car);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}

	@RequestMapping(value = "/ajax/add", method = RequestMethod.POST, produces = "application/json")
	public Object ajaxAdd(Car car) throws Exception {
		try {
			carDao.insert(car);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}

	@RequestMapping(value = "/ajax/delete", produces = "application/json")
	public Object ajaxDelete(int no) throws Exception {
		try {
			carDao.delete(no);
			return new JsonResult().setResultStatus(JsonResult.SUCCESS);

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}

	@RequestMapping(value = "/ajax/read", produces = "application/json")
	public Object ajaxRead(int no) throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS)
					.setData(carDao.selectOne(no));

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}

	@RequestMapping(value = "/ajax/list", produces = "application/json")
	public Object ajaxList() throws Exception {
		try {
			return new JsonResult().setResultStatus(JsonResult.SUCCESS)
					.setData(carDao.selectList());

		} catch (Throwable ex) {
			return new JsonResult().setResultStatus(JsonResult.FAILURE)
					.setError(ex.getMessage());
		}
	}
	
	@RequestMapping("/carList.do")  //chell
	public String carList(Model model) throws Exception {
		//model.addAttribute("offices", officeDao.selectList());
		return "car/carList";
	}
	
}
