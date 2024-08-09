package com.resort.action.admin.facility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;

public class AdminActivityInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		List<String> typeList = dao.getActivityTypeList();
		
		request.setAttribute("typeList", typeList);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_activity_insert.jsp");

		return forward;
	}

}
