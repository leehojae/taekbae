package spms.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import spms.dao.UploadDao;
import spms.vo.Excel;

@Repository
public class UploadImple implements UploadDao {

	private String NAMESPACE="Excel.";
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;

	@Override
	public void addExcel(List<Excel> list) {
		sqlMapClientTemplate.insert(NAMESPACE+"addExcel", list);
	}
}
