package mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import member.MemberVO;
import order.OrderListVO;
import order.StateVO;

@Service
public interface MypageService {
	StateVO my_state(String member_id);				//나의 주문상태 조
	List<OrderListVO> order_list(String member_id);	//나의 주문내역 조회
	void mypage_update(MemberVO vo);				//내정보 수정
	List<WrtieVO> my_write(String member_id);		//내가 쓴 글, 댓글 조회
}
