package Basket;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import order.ItemVO;

@Repository
public class BasketDAO implements BasketService {
	
	@Autowired private SqlSession sql;
	
	@Override
	public boolean cart_insert(CartVO vo) {

		return sql.insert("cart.mapper.cart_insert",vo) > 0 ? true : false;
	}

	@Override
	public List<CartVO> cart_select(String member_id) {
		
		List<CartVO> cartlist = sql.selectList("cart.mapper.cart_select", member_id);
		
		for(CartVO cart : cartlist ) {
			ItemVO item = sql.selectOne("cart.mapper.cartlist_item", cart.getItem_num());
			cart.setOrder_item(item);
		}
		
		return cartlist;
	}

}
