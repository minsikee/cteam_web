package qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO implements QnaService {
	
	@Autowired private SqlSession sql;

	@Override
	public List<QnaVO> qna_list() {
		return sql.selectList("qna.mapper.qna_list");
	}

}