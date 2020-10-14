package community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired private CommunityDAO dao;

	//글 목록
	@Override
	public CommunityPage community_list(CommunityPage page) {
		return dao.community_list(page);
	}
	
	//글 상세보기
	@Override
	public CommunityVO community_detail(int id) {
		return dao.community_detail(id);
	}

	//글 쓰기
	@Override
	public int community_insert(CommunityVO vo) {
		return dao.community_insert(vo);
	}
	
	//글 삭제하기
	@Override
	public int community_delete(int id) {
		return dao.community_delete(id);
	}
	

}
