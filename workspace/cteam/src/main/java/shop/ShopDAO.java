package shop;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAO implements ShopService {
@Autowired private SqlSession sql;
	@Override
	public int shop_insert(ShopVO vo) {
		return 0;
	}

	@Override
	public ShopPage shop_list(ShopPage page) {
		page.setTotalList(
				(Integer)sql.selectOne("shop.mapper.total",page));
		System.out.println(page.getKeyword()+page.getSearch());
		page.setList(sql.selectList("shop.mapper.list",page));
		return page;
	}

	@Override
	public ShopVO shop_detail(int item_num) {
		return sql.selectOne("shop.mapper.detail",item_num);
	}

	@Override
	public int shop_update(ShopVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int shop_delete(int item_num) {
		// TODO Auto-generated method stub
		return sql.delete("shop.mapper.delete",item_num);
	}

}
