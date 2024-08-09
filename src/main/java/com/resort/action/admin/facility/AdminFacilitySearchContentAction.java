package com.resort.action.admin.facility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.FacilityinfoDTO;
import com.resort.model.TotalDAO;

public class AdminFacilitySearchContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		String type = request.getParameter("facility_type").trim();

		TotalDAO dao = TotalDAO.getInstance();

		FacilityinfoDTO dto = dao.getFacilityContent(no);

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("facility_type", type);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_facility_content.jsp");

		return forward;

	}

}
