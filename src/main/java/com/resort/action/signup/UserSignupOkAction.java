package com.resort.action.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class UserSignupOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("user_name").trim();
		String id = request.getParameter("user_id").trim();
		String pwd = request.getParameter("user_pwd").trim();

		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		String email = request.getParameter("user_email").trim();

		// 비밀번호 유효성 검사
		if (!isPasswordValid(pwd)) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호는 8자리 이상 16자리 미만이어야 하며, 특수문자를 하나 이상 포함해야 합니다.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}

		UserDTO dto = new UserDTO();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());

		dto.setUser_no("U" + date);
		dto.setUser_id(id);
		dto.setUser_pwd(pwd);
		dto.setUser_name(name);
		dto.setUser_phone(phone);
		dto.setUser_email(email);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.insertUserInfo(dto);

		PrintWriter out = response.getWriter();

		ActionForward forward = new ActionForward();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('회원가입에 성공했습니다.')");
			out.println("location.href='main'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다. 입력한 정보를 다시한번 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

	// 비밀번호 유효성 검사 함수
	private boolean isPasswordValid(String pwd) {
		if (pwd == null || pwd.length() < 8 || pwd.length() >= 16) {
			return false;
		}
		// 특수문자 포함 여부 확인
		Pattern specialCharPattern = Pattern.compile("[!@#$%.*^&+=]");
		if (!specialCharPattern.matcher(pwd).find()) {
			return false;
		}
		return true;
	}
}