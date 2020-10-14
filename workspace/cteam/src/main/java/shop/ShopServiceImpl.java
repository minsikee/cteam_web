package shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired private ShopDAO dao;

	@Override
	public int shop_insert(ShopVO vo) {
		return 0;
	}

	@Override
	public ShopPage shop_list(ShopPage page) {
		return dao.shop_list(page);
	}

	@Override
	public ShopVO shop_detail(int item_num) {
		return dao.shop_detail(item_num);
	}

	@Override
	public int shop_update(ShopVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int shop_delete(int item_num) {
		return dao.shop_delete(item_num);
	}

}
