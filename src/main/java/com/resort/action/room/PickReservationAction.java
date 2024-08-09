package com.resort.action.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;

public class PickReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String datetimes = request.getParameter("datetimes").trim();
		
		String checkIn = datetimes.substring(0, 10).trim();
		String checkOut = datetimes.substring(13, 23).trim();
		
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/room/room_reservation.jsp");

		return forward;
	}

}
