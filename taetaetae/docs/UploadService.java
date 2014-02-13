package spms.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spms.dao.UploadDao;
import spms.vo.Excel;

@Service
public class UploadService implements IUploadService {
    
	@Autowired
	private UploadDao uploadDao;

	@Override
	public void addExcel(List<Excel> list) {
		uploadDao.addExcel(list);
		
	}

}
