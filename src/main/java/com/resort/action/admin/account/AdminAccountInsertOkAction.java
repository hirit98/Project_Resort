package com.resort.action.admin.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.AdminDTO;
import com.resort.model.TotalDAO;

public class AdminAccountInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String admin_name = request.getParameter("name").trim();
		String admin_id = request.getParameter("id").trim();
		String admin_pwd = request.getParameter("pwd").trim();
		String admin_phone = request.getParameter("phone").trim();
		String admin_job = request.getParameter("type").trim();

		if (admin_job.equals("선택없음")) {
			admin_job = request.getParameter("input_type").trim();
		}

		AdminDTO dto = new AdminDTO();

		dto.setAdmin_name(admin_name);
		dto.setAdmin_id(admin_id);
		dto.setAdmin_pwd(admin_pwd);
		dto.setAdmin_phone(admin_phone);
		dto.setAdmin_job(admin_job);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.insertAdmin(dto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('관리자 등록 성공!!')");
			out.println("location.href='admin_main'");
			out.println("</script>");

		} else {
			out.println("<script>");
			out.println("alert('관리자 등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}

}
