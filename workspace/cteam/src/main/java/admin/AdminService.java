package admin;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import order.ItemVO;

@Service
public interface AdminService {
	int item_insert(SellVO vo);		//상품등록
	
	
}
