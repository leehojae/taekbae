package spms.dao;

import java.util.List;

import spms.vo.Excel;

public interface ExcelDao {
	public void addExcel(List<Excel> list) throws Exception;
	public List<Excel> selectList() throws Exception;
	public void delete() throws Exception;
}
