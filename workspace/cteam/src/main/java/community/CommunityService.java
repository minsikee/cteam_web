package community;

import java.util.List;

public interface CommunityService {
	
	CommunityPage community_list(CommunityPage page);	//게시판 글 목록
	CommunityVO community_detail(int id);				//글상세
	int community_insert(CommunityVO vo);				//글쓰기
	int community_delete(int id);						//글삭제

}