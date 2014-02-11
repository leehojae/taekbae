package spms.dao.mssql;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spms.dao.MemberDao;
import spms.vo.Member;

@Component
public class MemberDaoImp implements MemberDao {
	@Autowired(required=false)
	SqlSessionFactory sqlSessionFactory;

	public List<Member> selectList() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectList("spms.dao.MemberDao.selectList");
		} finally {
			sqlSession.close();
		}
	}
	
	public Member selectOne(int no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne("spms.dao.MemberDao.selectOne", no);
		} finally {
			sqlSession.close();
		}
	}
	
	public int insert(Member member) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.insert("spms.dao.MemberDao.insert", member);
			sqlSession.commit();
			
			return count;
		} finally {
			sqlSession.close();
		}
	}
	
	public int update(Member member) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.update("spms.dao.MemberDao.update", member);
			sqlSession.commit();
			
			return count;
		} finally {
			sqlSession.close();
		}
	}
	
	public int delete(int no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.delete("spms.dao.MemberDao.delete", no);
			sqlSession.commit();
			
			return count;
		} finally {
			sqlSession.close();
		}
	}
	
	public Member selectByEmailPassword(Map<String,String> paramMap) 
			throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			return sqlSession.selectOne(
					"spms.dao.MemberDao.selectByEmailPassword", paramMap);
		} finally {
			sqlSession.close();
		}
	}
	
}







