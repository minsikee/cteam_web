package community;

import java.util.List;

public interface CommunityService {
	
	CommunityPage community_list(CommunityPage page);	//게시판 글 목록 - 페이징
	CommunityVO community_detail(int id);				//글상세

}
