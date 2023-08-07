package com.jose1593.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import com.jose1593.board.BoardService;
import com.jose1593.login.LoginService;
import com.jose1593.util.Util;

@RestController // ﻿@RestController는 @Controller에 @ResponseBody가 추가된 것
public class ResttController {
	@Autowired
	private LoginService loginService; // Autowired는 한 줄만 적용된다 
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Util util;
	
	
	// 아이디 중복검사 2023-08-02
		@PostMapping("/checkID")
		public String checkID(@RequestParam("id") String id) { // 필수로 값이 들어와야 한다
			// System.out.println("id : " + id);
			
			int result = loginService.checkID(id);
			
			// json 생성하기
			JSONObject json = new JSONObject(); // json 객체 생성
			json.put("result", result);
			
			
			return json.toString(); // 이미 가입되어 있으면 1, 없으면 0
		}
		
		//자바스크립트로 만든 것.
		@PostMapping("/checkID2")
		public String checkID2(@RequestParam("id") String id) {
			int result = loginService.checkID(id);
			return result+"";
		}
		
		// boardList2
		@GetMapping(value = "/boardList2", produces = "application/json; charset=UTF-8")// 한글 처리
		// value가 적어줘야 produces를 사용할 수 있다.
		
		public String boardList2(@RequestParam("pageNo") int pageNo) {
			// System.out.println("jq가 보내주는 : " + pageNo);
			
			List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);  
			// 해당 리스트에 내용을 받아서 Map타입으로 온다.
			JSONObject json = new JSONObject();
			JSONArray arr = new JSONArray(list); // list를 json 배열형태로 만들어준다.
			json.put("totalCount", loginService.totalCount()); // DB에 한 번더 물어보겠습니다.
			json.put("pageNo", pageNo);
			json.put("list", arr);
			// System.out.println(json.toString());
			
			return json.toString();
			// 서로 통신하기 위해서는 서로 접점이 있어야 하는데 list는 배열형태라 
			// jsonarray를 감싸서 json이 다시 포장해서 tostring으로 출력
			
			/* 커다란 Object 안{}에 값이 있는데 list 출력 
			 * boardList2 = { totalCount : 128, 
			 * 					pageNo: 1, 
			 * 					list = [
			 *  						{bno:1, btitle:....}
			 *  						{bno:1, btitle:....},
			 *  						{bno:1, btitle:....},
			 * 	              	       ] 
			 * 				}
			 *  객체 : {키 : 값, 이름 : 값, ............} 값이란 부분에 Object가 들어갈 수 있다.
			 */
			
			
				
			}
		
			@PostMapping("/cdelR") // detail.jsp ajax문에서 넘어온 값
			public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
				// if문 추가하기
				
				int result = 0;
				if(session.getAttribute("mid") != null) {
					 // 값 들어왔는지 여부 검사
				
					 if(map.containsKey("bno") && map.get("cno") != null &&
							 
					 	!(map.get("bno").equals("")) && !(map.get("cno").equals("")) && 	
						// map이라는 객체에서 "bno"과 "cno" 두 개의 키에 해당하는 값이 
						// 빈 문자열이 아닌 경우에 참(True)이 됩니다. 
						// 즉, 두 값 모두가 빈 문자열이 아니어야 조건식이 참
						util.isNum(map.get("bno")) && util.isNum(map.get("cno"))) {
					
						map.put("mid", session.getAttribute("mid"));
					 	System.out.println(map);
						result = boardService.cdel(map);			
								
						}
				}
				JSONObject json = new JSONObject();
				json.put("result", result);
			
				return json.toString();
			
}
}
			
		


