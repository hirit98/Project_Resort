package com.resort.action.admin.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;

public class AdminReservationDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);

		String no = request.getParameter("no").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.deleteReservationInfo(no);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('예약을 취소했습니다!')");
			out.println("location.href='admin_reservation_list");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('예약 취소에 실패했습니다~!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
