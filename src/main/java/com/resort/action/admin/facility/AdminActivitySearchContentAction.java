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

public class AdminActivitySearchContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		int id = Integer.parseInt(request.getParameter("id").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		String type = request.getParameter("type").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		ActivityInfoDTO dto = dao.getActivityContent(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("type", type);
	
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_activity_content.jsp");

		return forward;
	}

}
