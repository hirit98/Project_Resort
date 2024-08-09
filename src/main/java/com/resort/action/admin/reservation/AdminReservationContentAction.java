package com.resort.action.admin.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReservationDTO;
import com.resort.model.TotalDAO;

public class AdminReservationContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String no = request.getParameter("no");
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		TotalDAO dao = TotalDAO.getInstance();
		
		ReservationDTO dto = dao.getReservationContent(no);
		
		List<String> statusList = StaticArea.getRoomStatus();
		
		request.setAttribute("dto", dto);
		request.setAttribute("statusList", statusList);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/reservation/admin_reservation_content.jsp");

		return forward;
	}

}
