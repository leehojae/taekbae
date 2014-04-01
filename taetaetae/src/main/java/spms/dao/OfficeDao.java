package spms.dao;

import java.util.List;
import java.util.Map;

import spms.vo.Office;

public interface OfficeDao {
	public List<Office> selectAllList() throws Exception;
	public List<Office> selectList() throws Exception;
	public List<Office> selectNewList() throws Exception;
	public Office selectOne(int no) throws Exception;
	public int insert(Office Office) throws Exception;
	public int update(Office Office) throws Exception;
	public int delete(int no) throws Exception;
	public int approvalOffice(int no) throws Exception;
	public int approval(int no) throws Exception;
}







