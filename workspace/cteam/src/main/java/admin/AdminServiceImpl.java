package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.MemberVO;
import order.ItemVO;

@Service
public class AdminServiceImpl implements AdminService {
@Autowired private AdminDAO dao;
	@Override
	public int item_insert(SellVO vo) {
		// TODO Auto-generated method stub
		return dao.item_insert(vo);
	}
	
	@Override
	public List<ItemListVO> list_item() {
		// TODO Auto-generated method stub
		return dao.list_item();
	}
	
	@Override
	public List<MemberVO> member_list() {
		// TODO Auto-generated method stub
		return dao.member_list();
	}
	
	@Override
	public MemberVO member_detail(String member_id) {
		// TODO Auto-generated method stub
		return dao.member_detail(member_id);
	}
}
