package com.resort.action.admin.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

public class AdminPaymentUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);

		TotalDAO dao = TotalDAO.getInstance();
		
		SimpleDateFormat diff = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		String date = diff.format(c1.getTime());
		
		List<ReservationDTO> resList = dao.getReservationList();
		List<RoomInfoDTO> roomInfoList = dao.getRoomInfoList(date);

		PaymentInfoDTO dto = null;

		try {

			for (ReservationDTO res : resList) {
				for (RoomInfoDTO info : roomInfoList) {
					if (res.getRes_room_type().equals(info.getRoom_type())) {

						int price = info.getRoom_price();

						Date startDate = diff.parse(res.getRes_in_date());
						Date endDate = diff.parse(res.getRes_out_date());

						long diffDay = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000); // 숙박일 계산 ex)

						int service = (int) (price * 0.1); // 봉사료 (숙박료의 10%)

						int amount = (price + service) * (int) diffDay; // 총 숙박료 (숙박일 * 객실가격)

						int surtax = (int) (amount * 0.1); // 부과세액 (총 숙박료의 10%)

						int total_price = amount + surtax; // 총 금액 (총 숙박료 + 부과세액)

						dto = new PaymentInfoDTO();

						dto.setPayment_res_no(res.getRes_no());
						dto.setPayment_user_id(res.getRes_user_id());
						dto.setPayment_date(res.getRes_regdate());
						dto.setPayment_price(total_price);

						dao.updatePaymentInfo(dto);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('업데이트 완료.')");
		out.println("location.href='admin_reservation_list'");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
