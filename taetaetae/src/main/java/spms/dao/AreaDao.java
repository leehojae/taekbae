package spms.dao;

import java.util.List;

import spms.vo.Area;

public interface AreaDao {
	public List<Area> selectList() throws Exception;
	public Area selectOne(int no) throws Exception;
	public int insert(Area member) throws Exception;
	public int update(Area member) throws Exception;
	public int delete(int no) throws Exception;
}







