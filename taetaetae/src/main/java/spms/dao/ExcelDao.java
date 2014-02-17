package spms.dao;

import java.util.List;

import spms.vo.Excel;

public interface ExcelDao {
	void addExcel(List<Excel> list);
	public List<Excel> selectList() throws Exception;
}
