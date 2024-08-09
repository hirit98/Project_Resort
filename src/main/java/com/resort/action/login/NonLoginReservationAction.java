package com.resort.action.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.ReservationDTO;
import com.resort.model.TotalDAO;

public class NonLoginReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String res_no = request.getParameter("res_no").trim();

		String phone = request.getParameter("res_phone").trim();

		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7, 11);

		phone = phone1 + "-" + phone2 + "-" + phone3;

		TotalDAO dao = TotalDAO.getInstance();

		ReservationDTO dto = dao.getReservationContent(res_no, phone);

		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/room/room_reservation_check.jsp");

		return forward;

	}
}