package mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.MemberVO;
import order.OrderListVO;
import order.ProductVO;
import order.StateVO;

@Repository
public class MypageDAO implements MypageService{
	@Autowired private SqlSession sql;
	@Override
	public List<OrderListVO> order_list(String member_id) {
		List<OrderListVO>  orderlist = sql.selectList("mypage.mapper.orderlist", member_id);
		
		for(OrderListVO order : orderlist ) {
			List<ProductVO> items = sql.selectList("mypage.mapper.orderlist_item", order.getOrder_num());
			order.setOrder_item(items);
		}
		
		return orderlist;
	}

	@Override
	public void mypage_update(MemberVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StateVO my_state(String member_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("mypage.mapper.orderstate", member_id);
	}



}