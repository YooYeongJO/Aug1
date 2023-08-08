package com.jose1593.board;

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
	
	public List<BoardDTO> boardList(PageDTO page) {
		return sqlSession.selectList("board.boardList", page);
		// select는 값 1개 가져올때 사용
		// selectlist는 값 여러개 가져올때 사용
	}

	public BoardDTO detail(BoardDTO dto2) {
		
		return sqlSession.selectOne("board.detail", dto2); // 앞에는 네임스페이스.아이디, 값
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto); // 네임스페이스.아이디, 값
		// board.write를 실행할 때 값을 dto가 다 가지고 있다.
		 
		
	}
	public void delete(BoardDTO dto) {
		sqlSession.update("board.delete", dto); // 네임스페이스.아이디, 값
		
	}

	public void edit(BoardDTO dto) {
		sqlSession.update("board.edit", dto);
		
	}
	
	public void likeUp(BoardDTO dto2) {
		sqlSession.update("board.likeUp", dto2);
	}

	public int totalCount() {
		return sqlSession.selectOne("board.totalCount");
	}

	public List<Map<String, Object>> commentList(int bno) {
		
		return sqlSession.selectList("board.commentList", bno);
	}

	public int cdel(Map<String, Object> map) {
		
		return sqlSession.update("board.cdel", map);
	}

	public int cedit(Map<String, Object> map) {
		// public int cedit(Map<String, Object> map) - 이 메서드는 Map<String, Object> 형태의 
		// 매개변수를 받는다고 정의되어 있습니다. 
		// 이 메서드는 정수(int) 값을 반환하며, 매개변수로 받은 맵을 사용하여 
		// 데이터베이스 업데이트 작업을 수행할 것으로 예상됩니다.
		
		return sqlSession.update("board.cedit", map);
	
		// return sqlSession.update("board.cedit", map); - 이 코드는 MyBatis의 sqlSession 객체를 사용하여 
		// "board.cedit"라는 SQL 매핑을 호출하여 데이터베이스 업데이트 작업을 실행합니다. 
		// MyBatis는 XML 또는 어노테이션을 사용하여 SQL 문을 매핑하는 프레임워크입니다. 
		// 여기서 "board.cedit"는 매핑된 SQL의 식별자(identifier)를 나타내며, 이에 대응하는 SQL 쿼리를 실행합니다.

		// 따라서 이 코드는 주어진 매개변수를 사용하여 MyBatis를 통해 데이터베이스 업데이트 작업을 실행하고, 
		// 그 결과로 업데이트된 레코드 수를 반환합니다. 
		// 코드 내부에서 호출하는 sqlSession.update("board.cedit", map)은 
		// "board.cedit"라는 SQL 매핑을 가진 SQL을 실행하여 데이터베이스 업데이트 작업을 수행합니다.
	}

	
	
	
	
	

}
