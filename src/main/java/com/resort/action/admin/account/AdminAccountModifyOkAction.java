package com.resort.action.admin.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.AdminDTO;
import com.resort.model.TotalDAO;

public class AdminAccountModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);

		String adminNo = request.getParameter("no");
		String adminName = request.getParameter("name");
		String adminId = request.getParameter("id");
		String adminPwd = request.getParameter("pwd");
		String adminJob = request.getParameter("type");
		String adminPhone = request.getParameter("phone");

		AdminDTO dto = new AdminDTO();

		dto.setAdmin_no(adminNo);
		dto.setAdmin_name(adminName);
		dto.setAdmin_id(adminId);
		dto.setAdmin_pwd(adminPwd);
		dto.setAdmin_job(adminJob);
		dto.setAdmin_phone(adminPhone);

		TotalDAO dao = TotalDAO.getInstance();

		PrintWriter out = response.getWriter();

		int check = dao.updateAdmin(dto);

		if (check > 0) {
			out.println("<script>");
			out.println("alert('관리자 수정 완료했습니다.')");
			out.println("location.href='admin_account_modify?no=" + adminNo + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('관리자 수정 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}
}