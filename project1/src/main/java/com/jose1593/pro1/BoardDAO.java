package com.jose1593.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> boardList() {
		return sqlSession.selectList("board.boardList");
		// select는 값 1개 가져올때 사용
		// selectlist는 값 여러개 가져올때 사용
	}

	public BoardDTO detail(int bno) {
		
		return sqlSession.selectOne("board.detail", bno); // 앞에는 네임스페이스.아이디, 값
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto); // 네임스페이스.아이디, 값
		// board.write를 실행할 때 값을 dto가 다 가지고 있다.
		 
		
	}
	public void delete(BoardDTO dto) {
		sqlSession.delete("board.delete", dto); // 네임스페이스.아이디, 값
		
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
		
	}
	
	
	
	

}
