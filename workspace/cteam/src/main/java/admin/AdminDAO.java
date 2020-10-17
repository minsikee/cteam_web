package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;
import order.ItemVO;

@Repository
	public class AdminDAO implements AdminService {
	@Autowired private SqlSession sql;
	@Override
	public int item_insert(SellVO vo) {
		// TODO Auto-generated method stub
		sql.insert("admin.mapper.item_insert", vo);
		System.out.println(vo.getItem_num());
		return sql.insert("admin.mapper.item_option_insert", vo);
	}
	
	@Override
	public ListPage list(ListPage page) {
		page.setTotalList(
			(Integer) sql.selectOne("admin.mapper.total",page));	
		page.setList(sql.selectList("admin.mapper.list",page));
		return page;
	}
	
	@Override
	public List<MemberVO> member_list() {
		// TODO Auto-generated method stub
		return sql.selectList("admin.mapper.memberList");
	}
	
	@Override
	public MemberVO member_detail(String member_id) {
		return sql.selectOne("admin.mapper.detail",member_id);
}
}
