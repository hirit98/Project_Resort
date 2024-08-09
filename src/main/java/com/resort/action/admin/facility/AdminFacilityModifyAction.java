package com.resort.action.admin.facility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.FacilityinfoDTO;
import com.resort.model.TotalDAO;

public class AdminFacilityModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		FacilityinfoDTO dto = dao.getFacilityContent(no);

		List<FacilityinfoDTO> dto1 = dao.getFacility_type();

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("dto1", dto1);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_facility_modify.jsp");

		return forward;
	}

}
