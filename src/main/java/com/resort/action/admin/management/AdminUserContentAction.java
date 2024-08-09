package com.resort.action.admin.management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class AdminUserContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String no = request.getParameter("no").trim();
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		TotalDAO dao = TotalDAO.getInstance();
		
		UserDTO dto = dao.getUserContent(no);
		
		request.setAttribute("dto", dto);
		request.setAttribute("page", page);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/management/admin_user_content.jsp");

		return forward;
	}

}
