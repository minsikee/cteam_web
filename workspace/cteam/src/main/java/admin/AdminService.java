package admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import member.MemberVO;
import order.ItemVO;
import order.OrderListVO;

@Service
public interface AdminService {
	int item_insert(SellVO vo);		//상품등록
	ListPage list(ListPage vo);			//모든상품 가져오기
	MemberListPage member_list (MemberListPage vo);	//회원정보조회(10/16)
	MemberVO member_detail(String member_id);	//회원정보 상세조회
	List<OrderListVO> order_list();				//주문내역 조회
}
