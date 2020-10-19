package qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired private QnaDAO dao;

	//QnA 목록
	@Override
	public List<QnaVO> qna_list() {
		return dao.qna_list();
	}

}
