package com.resort.action.admin.reservation;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReservationDTO;
import com.resort.model.TotalDAO;

public class AdminReservationDayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		ReservationDTO dto = new ReservationDTO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat res_date = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		
		String start = sdf.format(c1.getTime());
		String date = res_date.format(c1.getTime());
		
		c1.add(Calendar.DATE, 1);
		String end = sdf.format(c1.getTime());
		
		String room_no = request.getParameter("no").trim();
		String room_type = dao.getRoomType(room_no);
		
		dto.setRes_no("R"+date);
		dto.setRes_room_no(room_no);
		dto.setRes_room_type(room_type);
		dto.setRes_in_date(start);
		dto.setRes_out_date(end);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/reservation/admin_reservation_day.jsp");

		return forward;
	}

}
