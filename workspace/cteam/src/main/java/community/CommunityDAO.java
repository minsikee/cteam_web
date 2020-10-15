package community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO implements CommunityService {

	@Autowired private SqlSession sql;
	
	//글 목록
	@Override
	public CommunityPage community_list(CommunityPage page) {
		page.setTotalList(sql.selectOne("community.mapper.list_count", page));
		page.setList(sql.selectList("community.mapper.list", page));
		return page;
		//return sql.selectList("community.mapper.list", page);
	}

	//글 상세보기
	@Override
	public CommunityVO community_detail(int board_num) {
		return sql.selectOne("community.mapper.detail", board_num);
	}
	
	//글 쓰기
	@Override
	public int community_insert(CommunityVO vo) {
		return sql.insert("community.mapper.insert", vo);
	}

	//글 삭제하기
	@Override
	public int community_delete(int board_num) {
		return sql.delete("community.mapper.delete", board_num);
	}


}
