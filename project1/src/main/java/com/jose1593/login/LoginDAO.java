package com.jose1593.login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	
//	DAO는 sqlsession 하고 연결되어야 한다.
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		
		
		return sqlSession.selectOne("login.login", dto); // login mapper.
		// selectOne은 값 하나만 저장
	}

	public int join(JoinDTO joinDTO) {
		return sqlSession.insert("login.join", joinDTO);
		
	}

	public List<JoinDTO> members() {
		
		return sqlSession.selectList("login.members");
	}
	

}
