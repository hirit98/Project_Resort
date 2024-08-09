package com.resort.action.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.PaymentInfoDTO;
import com.resort.model.ReservationDTO;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class InsertReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();

		UserDTO user_dto = (UserDTO) session.getAttribute("dto");

		String start_date = request.getParameter("start_date").trim();
		String end_date = request.getParameter("end_date").trim();
		String room_type = request.getParameter("room-type").trim();
		int guests = Integer.parseInt(request.getParameter("guests").trim());
		String user_id = user_dto.getUser_id();
		String user_phone = user_dto.getUser_phone();
		int total_price = 0;

		ReservationDTO dto = new ReservationDTO();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());

		dto.setRes_no("R" + date);
		dto.setRes_user_id(user_id);
		dto.setRes_room_type(room_type);
		dto.setRes_user_phone(user_phone);
		dto.setRes_peoples(guests);
		dto.setRes_in_date(start_date);
		dto.setRes_out_date(end_date);

		SimpleDateFormat diff = new SimpleDateFormat("yyyy-MM-dd");

		TotalDAO dao = TotalDAO.getInstance();
		
		try {
			
			RoomInfoDTO roomInfo = dao.getRoomInfoContent(room_type);
			
			int price = roomInfo.getRoom_price();			// 객실 1박 가격
			
			Date startDate = diff.parse(start_date);
			Date endDate = diff.parse(end_date);

			long diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);	// 숙박일 계산 ex) 1박, 2박

			int service = (int)(price * 0.1);				// 봉사료  (숙박료의 10%)
			
			int amount = (price + service) * (int)diffDay;	// 총 숙박료 (숙박일 * 객실가격)

			int surtax = (int)(amount * 0.1);				// 부과세액  (총 숙박료의 10%)

			total_price = amount + surtax;				// 총 금액 (총 숙박료 + 부과세액)
			
			if(total_price % 2 == 1) {
				total_price = total_price + 5;
			}
			
			request.setAttribute("diffDay", diffDay);
			request.setAttribute("service", service);
			request.setAttribute("amount", amount);
			request.setAttribute("surtax", surtax);
			request.setAttribute("total_price", total_price);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String room_no = dao.getRoomNo(dto);
		dto.setRes_room_no(room_no);

		int check = dao.insertReservationInfo(dto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			
			String res_no = dao.getRecentReservationNo(user_id);

			PaymentInfoDTO payment = new PaymentInfoDTO();
			
			payment.setPayment_res_no(res_no);
			payment.setPayment_price(total_price);
			payment.setPayment_user_id(user_id);
			
			dao.insertPaymentInfo(payment);

			ReservationDTO res_dto = dao.getReservationContent(res_no);

			request.setAttribute("dto", res_dto);

			ActionForward forward = new ActionForward();

			forward.setPath("/WEB-INF/views/public/room/room_reservation_ok.jsp");

			return forward;
		} else {
			out.println("<script>");
			out.println("alert('예약에 실패했습니다. 다시 확인해주세요!')");
			out.println("history.back()");
			out.println("</script>");
		}

		return null;
	}

}
