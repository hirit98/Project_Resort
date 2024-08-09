package com.resort.action.admin.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class AdminReservationInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String no = request.getParameter("no").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		UserDTO dto = dao.getUserContent(no);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/reservation/admin_reservation_insert.jsp");

		return forward;
	}

}
