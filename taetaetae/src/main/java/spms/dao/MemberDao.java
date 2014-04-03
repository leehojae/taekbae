package spms.dao;

import java.util.List;
import java.util.Map;

import spms.vo.Member;

public interface MemberDao {
	public List<Member> selectList(int no) throws Exception;
	public List<Member> carlessMember(int no) throws Exception;
	public List<Member> carNessMember(int no) throws Exception;
	public Member selectOne(int no) throws Exception;
	public int rankUpdate(int no) throws Exception;
	public Member searchid(String id) throws Exception;
	public int insert(Member member) throws Exception;
	public int update(Member member) throws Exception;
	public int delete(int no) throws Exception;
	public Member selectByIdPassword(Map<String,String> paramMap)  
			throws Exception;
	public List<Member> selectListByProject(int projectNo); 	
}







