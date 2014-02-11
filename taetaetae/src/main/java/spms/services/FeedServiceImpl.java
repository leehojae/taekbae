package spms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import spms.dao.FeedDao;
import spms.vo.AttachFile;
import spms.vo.Feed;

@Service
public class FeedServiceImpl implements FeedService{
	@Autowired
	FeedDao feedDao;
	
	// 자동 commit						//transaction propagation 정책참조.
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED)
	public void addFeed(Feed feed) throws Exception {
		feedDao.insert(feed);
		
		if(feed.getFiles()!=null){
			for(AttachFile file : feed.getFiles()){
				file.setFeedNo(feed.getNo());
				feedDao.insertFile(file);
			}
		}
	}

}
