package admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.ItemVO;

@Service
public class AdminServiceImpl implements AdminService {
@Autowired private AdminDAO dao;
	@Override
	public int item_insert(SellVO vo) {
		// TODO Auto-generated method stub
		return dao.item_insert(vo);
	}
	
}
