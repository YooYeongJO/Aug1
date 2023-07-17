package com.jose1593.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

@Service("boardService") 
// 이 BoardService라는 클래스가 저 소문자 boardService라는 이름으로 등록 시킬게요.

public class BoardService {
	// 로직들을 여기다 적는다.
	
	@Inject // @Repositoty("boardDAO")를 주입한다.
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList();
			
			}

	public BoardDTO detail(String bno) { // String bno 값이 넘어온다.
		
		return boardDAO.detail(bno);
	}
			
	}

