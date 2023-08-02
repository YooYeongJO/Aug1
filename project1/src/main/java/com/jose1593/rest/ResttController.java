package com.jose1593.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import com.jose1593.board.BoardService;
import com.jose1593.login.LoginService;

@RestController // ﻿@RestController는 @Controller에 @ResponseBody가 추가된 것
public class ResttController {
	@Autowired
	private LoginService loginService; // Autowired는 한 줄만 적용된다 
	
	
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
		
		// boardList2
		@GetMapping("/boardList2")
		public String boardList2() {
			List<Map<String, Object>> list = loginService.boardList2(); 
			// 해당 리스트에 내용을 받아서 Map타입으로 온다.
			System.out.println(list);
			return "";
		}

}
