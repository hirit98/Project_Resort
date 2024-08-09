package com.resort.action.admin.facility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.ActivityInfoDTO;
import com.resort.model.TotalDAO;

public class AdminActivityModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		ActivityInfoDTO dto = dao.getActivityContent(id);
		
		List<String> typeList = dao.getActivityTypeList();

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("typeList", typeList);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_activity_modify.jsp");

		return forward;
	}

}
