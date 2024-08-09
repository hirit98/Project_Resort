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

public class MypagePwdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkUserDTO(request, response);
		
		HttpSession session = request.getSession();
		
		UserDTO user_dto = (UserDTO) session.getAttribute("dto");

		String user_id = user_dto.getUser_id();
		String user_pwd = request.getParameter("user_pwd").trim();

		UserDTO update_dto = new UserDTO();

		update_dto.setUser_id(user_id);
		update_dto.setUser_pwd(user_pwd);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.checkUserPwd(update_dto);

		PrintWriter out = response.getWriter();

		if (check == 1) {
			UserDTO dto = dao.getUserContent(update_dto);
			request.setAttribute("dto", dto);
			
			ActionForward forward = new ActionForward();
			
			forward.setPath("/WEB-INF/views/public/mypage/mypage_modify.jsp");

			return forward;
		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}
