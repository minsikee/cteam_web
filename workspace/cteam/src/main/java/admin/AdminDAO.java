package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;
import order.ItemVO;
import order.OrderListVO;

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
	public MemberListPage member_list(MemberListPage page) {
		page.setTotalList(
				(Integer) sql.selectOne("admin.mapper.membertotal",page));	
			page.setList(sql.selectList("admin.mapper.memberlist",page));
			return page;
	}
	
	@Override
	public MemberVO member_detail(String member_id) {
		
		return sql.selectOne("admin.mapper.detail",member_id);
}

	@Override
	public List<OrderListVO> order_list() {
	List<OrderListVO>  orderlist = sql.selectList("admin.mapper.orderlist");
		
		for(OrderListVO order : orderlist ) {
			List<ItemVO> items = sql.selectList("admin.mapper.orderlist_item", order.getOrder_num());
			order.setOrder_item(items);
		}
		
		return orderlist;
	}


}
