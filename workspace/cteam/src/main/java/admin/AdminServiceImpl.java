package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import member.MemberVO;
import order.ItemVO;
import order.OrderListVO;

@Service
public class AdminServiceImpl implements AdminService {
@Autowired private AdminDAO dao;
	@Override
	public int item_insert(SellVO vo) {
		// TODO Auto-generated method stub
		return dao.item_insert(vo);
	}
	
	@Override
	public ListPage list(ListPage vo) {
		// TODO Auto-generated method stub
		return dao.list(vo);
	}
	
	@Override
	public MemberListPage member_list(MemberListPage vo) {

		return dao.member_list(vo);
	}
	
	@Override
	public MemberVO member_detail(String member_id) {
		// TODO Auto-generated method stub
		return dao.member_detail(member_id);
	}

	@Override
	public List<OrderListVO> order_list() {
		// TODO Auto-generated method stub
		return dao.order_list();
	}


}
