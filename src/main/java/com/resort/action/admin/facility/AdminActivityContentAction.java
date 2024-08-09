package com.resort.action.admin.facility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ActivityInfoDTO;
import com.resort.model.TotalDAO;

public class AdminActivityContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		ActivityInfoDTO dto = dao.getActivityContent(no);

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_activity_content.jsp");

		return forward;
	}

}
