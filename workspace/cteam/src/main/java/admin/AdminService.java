package admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import member.MemberVO;
import order.ItemVO;

@Service
public interface AdminService {
	int item_insert(SellVO vo);		//상품등록
	List<ItemListVO> list_item();			//모든상품 가져오기
	List<MemberVO> member_list();	//회원정보조회(10/16)
	MemberVO member_detail(String member_id);	//회원정보 상세조회
}
