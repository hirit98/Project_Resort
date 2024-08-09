package com.resort.action.admin.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.PaymentInfoDTO;
import com.resort.model.ReservationDTO;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;

public class AdminReservationDayOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		String start = request.getParameter("start").trim();
		String end = request.getParameter("end").trim();
		String type = request.getParameter("type").trim();
		String id = request.getParameter("res_id").trim();
		String room_no = request.getParameter("room_no").trim();
		String phone = request.getParameter("phone").trim();
		int peoples = Integer.parseInt(request.getParameter("peoples").trim());
		int total_price = 0;
		
		TotalDAO dao = TotalDAO.getInstance();
		
		ReservationDTO dto = new ReservationDTO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());

		dto.setRes_no("R" + date);
		dto.setRes_in_date(start);
		dto.setRes_out_date(end);
		dto.setRes_room_type(type);
		dto.setRes_user_id(id);
		dto.setRes_user_phone(phone);
		dto.setRes_peoples(peoples);
		
		SimpleDateFormat diff = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			
			RoomInfoDTO roomInfo = dao.getRoomInfoContent(type);
			
			int price = roomInfo.getRoom_price();			// 객실 1박 가격
			
			Date startDate = diff.parse(start);
			Date endDate = diff.parse(end);

			long diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);	// 숙박일 계산 ex) 1박, 2박

			int service = (int)(price * 0.1);				// 봉사료  (숙박료의 10%)
			
			int amount = (price + service) * (int)diffDay;	// 총 숙박료 (숙박일 * 객실가격)

			int surtax = (int)(amount * 0.1);				// 부과세액  (총 숙박료의 10%)

			total_price = amount + surtax;				// 총 금액 (총 숙박료 + 부과세액)
			
			if(total_price % 2 == 1) {
				total_price = total_price + 5;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		dto.setRes_room_no(room_no);

		int check = dao.insertReservationInfo(dto);

		PrintWriter out = response.getWriter();
		
		if (check > 0) {
			
			String res_no = dao.getRecentReservationNo(id);

			PaymentInfoDTO payment = new PaymentInfoDTO();
			
			payment.setPayment_res_no(res_no);
			payment.setPayment_price(total_price);
			payment.setPayment_user_id(id);
			
			dao.insertPaymentInfo(payment);

			out.println("<script>");
			out.println("alert('예약 등록에 성공했습니다!!')");
			out.println("location.href='admin_reservation_list'");
			out.println("</script>");
			
		} else {
			out.println("<script>");
			out.println("alert('예약에 실패했습니다. 다시 확인해주세요!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
