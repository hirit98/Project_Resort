package com.resort.action.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class MypageSecessionCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("dto");

		// 사용자 ID와 입력된 비밀번호 가져오기
		String user_id = user.getUser_id();
		String user_pwd = request.getParameter("user_pwd").trim();

		// 삭제할 사용자 정보 설정
		UserDTO delete_dto = new UserDTO();
		delete_dto.setUser_id(user_id);
		delete_dto.setUser_pwd(user_pwd);

		// DAO 객체 생성 및 사용자 삭제 시도
		TotalDAO dao = TotalDAO.getInstance();
		int check = dao.deleteUserPwd(delete_dto);

		// 출력 스트림 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 삭제 성공 여부에 따라 처리
		if (check > 0) {
			// 세션 무효화
			session.invalidate();
			// JavaScript를 사용하여 알림창 출력 후 메인 페이지로 리디렉션
			out.println("<script>");
			out.println("alert('회원정보를 삭제했습니다.');");
			out.println("location.href='main';");
			out.println("</script>");
		} else {
			// 비밀번호가 일치하지 않을 경우 알림창 출력 후 이전 페이지로 돌아감
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}

		out.close();

		return null;
	}
}