package com.resort.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.model.AdminDTO;
import com.resort.model.UserDTO;


public class StaticArea {

	// jsp 파일에서 반복적으로 사용될 리스트

	public static List<String> cardCops = new ArrayList<>(
			Arrays.asList("KB국민", "NH농협", "BC비씨", "신한", "삼성", "롯데", "현대", "우리", "하나", "카카오뱅크", "토스뱅크"));

	public static List<String> roomStatus = new ArrayList<>(
			Arrays.asList("대기", "체크인", "체크아웃"));
	
	public static List<String> memGrade = new ArrayList<>(
			Arrays.asList("'Bronze'", "'Silver'", "'Gold'", "'VIP'"));
	
	public static List<String> getCardCops() {
		return cardCops;
	}
	
	public static List<String> getRoomStatus() {
		return roomStatus;
	}
	
	public static List<String> getMemGrade() {
		return memGrade;
	}
	
	// 날짜 정보 month를 2자리로 맞추기 위한 메서드
	public static String getMonth(int month) {
		if (month < 10) {
			return "0" + String.valueOf(month);
		} else {
			return String.valueOf(month);
		}
	}

	// 날짜 정보 day를 2자리로 맞추기 위한 메서드
	public static String getDay(int day) {
		if (day < 10) {
			return "0" + String.valueOf(day);
		} else {
			return String.valueOf(day);
		}
	}

	// 마일리지 상태에 따라 유저 등급 나눠주는 메서드
	public static String getUserGrade(int mileage) {
		
		String grade = "Bronze";

		if (mileage >= 80000) {
			grade = "VIP";
		} else if (mileage >= 50000) {
			grade = "Gold";
		} else if (mileage >= 30000) {
			grade = "Silver";
		}

		return grade;
	}

	public static void checkUserDTO(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("dto");

		if (dto == null) {

			session.invalidate();
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.')");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();

		}

	}

	public static void checkAdminDTO(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		AdminDTO dto = (AdminDTO) session.getAttribute("dto");

		if (dto == null) {

			session.invalidate();
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 종료되었습니다. 다시 로그인 해주세요.')");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();

		}

	}
	
	public static void adminLoginStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		AdminDTO dto = (AdminDTO) session.getAttribute("dto");

		if (dto != null) {

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인 했습니다!!!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();

		}

	}
}