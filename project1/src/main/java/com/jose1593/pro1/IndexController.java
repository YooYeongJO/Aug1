package com.jose1593.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	//첫화면 로딩 : index.jsp호출
	@GetMapping(value = { "/", "/index" }) 
	// value값을 넣어주면 "/"와 "index" 둘다 처리해준다. 여러개 처리 가능
	
	public String index() {
		return "index"; // 데이터 붙임 없이 index.jsp페이지만 보여줍니다.
	}

}
