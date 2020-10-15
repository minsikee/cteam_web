package admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import order.ItemVO;

@Repository
public class AdminDAO implements AdminService {
@Autowired private SqlSession sql;

	@Override
	public int item_insert(SellVO vo) {
		// TODO Auto-generated method stub
		sql.insert("admin.mapper.item_insert", vo);
		System.out.println(vo.getItem_num());
		return sql.insert("admin.mapper.item_option_insert", vo);
	}

}
