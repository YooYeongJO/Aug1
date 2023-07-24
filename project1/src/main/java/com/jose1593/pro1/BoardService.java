package com.jose1593.pro1;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService") 
// 이 BoardService라는 클래스가 저 소문자 boardService라는 이름으로 등록 시킬게요.

public class BoardService {
	// 로직들을 여기다 적는다.
	
	@Inject // @Repositoty("boardDAO")를 주입한다.
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	@Autowired // util 불러오기
	private Util util;
	
	
	// 보드 리스트 불러오는 메소드
	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
			
			}

	public BoardDTO detail(BoardDTO dto2) { // String bno 값이 넘어온다.
		BoardDTO dto = boardDAO.detail(dto2);
		//     나오는값             파라미터 값
		
						
			// 검사 : .이 없거나, null이면 실행하지 않게 해주세요세요.
			if(dto.getBip() != null && dto.getBip().indexOf(".") != -1 ) {
					
				// 여기서 ip 뽑아올 수 있죠??
				 String ip = dto.getBip();
				// ip 중간에 하트 넣어주실 수 있죠??
				 String[] ipArr = ip.split("[.]"); // ("\\.")
				 ipArr[1] = "♡";
				
				// 그거 다시 ip에 저장하실 수 있죠??
				  dto.setBip(String.join(".", ipArr));
				// 끝.
			
			// 172.30.1.53 ---> 172.♡.1.53
			
			// 번외 (ip주소 전체 변경)
			// 검사 : .이 없거나, null이면 실행하지 않게 해주세요세요.
			// if(dto.getBip() != null && dto.getBip().indexOf(".") != -1 ) {
				  // 여기서 ip 뽑아올 수 있죠??
						// String ip = dto.getBip();
				  // ip 중간에 하트 넣어주실 수 있죠??
						// ip = ip.replaceAll("\\d", "♡"); 
						
				  // 그거 다시 ip에 저장하실 수 있죠??
						// dto.setBip(ip);
				  // 끝.
				  
			// 172.30.1.53 ---> ♡.♡.♡.♡
					
			
		}
		return dto;
	}

	public void write(BoardDTO dto) { // wrtie => db에 글쓰는 녀석
		// btitle을 꺼내줍니다. dto.getBtitle();
		String btitle = dto.getBtitle();
	      
	    // 값을 변경하겠습니다. replace() -> &lt( < ),   -> &gt ( > )
	    // btitle = btitle.replaceAll("<", "&lt;");
	    // btitle = btitle.replaceAll(">", "&gt;");
	    
		btitle = util.exchange(btitle);
	      
	    dto.setBtitle(btitle);
	    // 다시 저장해주세요.
	    // dto.setBtitle(null);
	    
	    dto.setBip(util.getIp()); // 얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
	      
	    boardDAO.write(dto); // 실행만 시키고 결과를 받지 않습니다.
		// select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.
		
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
		
	}

	public void edit(BoardDTO dto) {
		
		boardDAO.edit(dto);
		
	}
}

