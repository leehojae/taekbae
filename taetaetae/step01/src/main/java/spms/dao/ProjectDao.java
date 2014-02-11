package spms.dao;

import java.util.ArrayList;

import spms.vo.Project;

public interface ProjectDao {
	public ArrayList<Project> selectList() throws Exception;
	public Project selectOne(int no) throws Exception;
	public int insert(Project project) throws Exception;
	public int update(Project project) throws Exception;
	public int delete(int no) throws Exception;
}







