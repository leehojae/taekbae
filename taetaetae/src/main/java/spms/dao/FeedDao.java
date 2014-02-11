package spms.dao;

import spms.vo.AttachFile;
import spms.vo.Feed;

public interface FeedDao {
	public int insert(Feed task) throws Exception;
	public int insertFile(AttachFile attachFile) throws Exception;	
}







