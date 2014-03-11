package spms.dao;

import java.util.List;

import spms.vo.Excel;

public interface ExcelDao {
	public void addExcel(List<Excel> list) throws Exception;
	public List<Excel> selectList() throws Exception;
	public void delete() throws Exception;
	public List<Excel> selectAddr() throws Exception;
	public void addLatLngs(List<Excel> requestResult) throws Exception;
	public List<Excel> selectDeleveryMember(int staticId) throws Exception;
	public List<Excel> selectByIdCoord(int id) throws Exception;
	public List<Excel> searchUser(long trcno) throws Exception;
}
