package com.resort.action.admin.account;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.AdminDTO;
import com.resort.model.TotalDAO;

public class AdminAccountModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);

		String no = request.getParameter("no");

		TotalDAO dao = TotalDAO.getInstance();

		List<String> jobList = dao.getAdminJobList();

		request.setAttribute("jobList", jobList);

		AdminDTO dto = dao.getAdminContent(no);

		request.setAttribute("dto", dto);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/account/admin_account_modify.jsp");

		return forward;
	}

}
