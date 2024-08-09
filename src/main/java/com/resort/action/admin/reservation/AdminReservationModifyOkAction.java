package com.resort.action.admin.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReservationDTO;
import com.resort.model.TotalDAO;

public class AdminReservationModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		String res_no = request.getParameter("no").trim();
		int page = Integer.parseInt(request.getParameter("page").trim()); 
		String user_id = request.getParameter("id").trim();
		String room_type = request.getParameter("room_type").trim();
		String room_no = request.getParameter("room_no").trim();
		String checkIn = request.getParameter("checkIn").trim();
		String checkOut = request.getParameter("checkOut").trim();
		String phone = request.getParameter("phone").trim();
		int peoples = Integer.parseInt(request.getParameter("peoples").trim());
		String status = request.getParameter("modify_status").trim();
		
		ReservationDTO dto = new ReservationDTO();
		
		dto.setRes_no(res_no);
		dto.setRes_user_id(user_id);
		dto.setRes_room_type(room_type);
		dto.setRes_room_no(room_no);
		dto.setRes_in_date(checkIn);
		dto.setRes_out_date(checkOut);
		dto.setRes_user_phone(phone);
		dto.setRes_peoples(peoples);
		dto.setRes_status(status);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.updateReservationInfo(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('예약 정보 수정완료!!')");
			out.println("location.href='admin_reservation_list?page="+page+"'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('예약정보 수정에 실패했습니다~!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
