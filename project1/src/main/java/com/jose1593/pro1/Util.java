package com.jose1593.pro1;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.condition.RequestConditionHolder;

// controller Service Repository
// component 객체

@Component
public class Util {
	// 문자열이 들어오면 숫자로 변경하기 
	public int strToInt(String str) {
		// 숫자로 바꿀 수 있는 경우 숫자로, 만약 숫자로 못 바꾼다면??
		// "156" -> 156          "156번" -> 156
		int result = 0;
		
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			// String re = ""; // 숫자인것만 모을 스트링입니다.
			StringBuilder sb = new StringBuilder(); // StringBuilder 생성 
			for (int i = 0; i < str.length(); i++) { // length 길이만큼 반복한다.
				if(Character.isDigit(str.charAt(i))) { //charAt(i) 해당 위치에 있는 값이 나와요
					 // re += str.charAt(i);
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString()); // 숫자로 만들어서
		}
		return result;
	}
	
	public String exchange(String str) {
		str = str.replaceAll("<", "&lt;"); // 수정해주세요 제발
	    str = str.replaceAll(">", "&gt;"); // 수정해주세요 제발
		return str;
		
	}

	public String getIp() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		// 상대방 ip가져오기 2023-07-19
		String ip = null; // 192.168.0.0 -> HttpServletRequest가 있어야 합니다.
		ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			// ip 값이 없거나, Header 값이 없다면?
			// equalsIgnoreCase (문자열 비교, 대소문자 구분 X)
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			// ip 값이 없거나, Header 값이 없다면?
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		// 서로 다르게 동작하기 위해 else-if를 사용하지 않는다.

	
	return ip;
}
}
