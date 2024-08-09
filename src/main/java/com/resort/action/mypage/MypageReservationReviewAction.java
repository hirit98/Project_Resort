package com.resort.action.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReservationDTO;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class MypageReservationReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();

		String no = request.getParameter("no").trim();

		TotalDAO dao = TotalDAO.getInstance();

		// 예약 정보 가져오기
		ReservationDTO reservationDTO = dao.getReservationContent(no);

		request.setAttribute("res_dto", reservationDTO);

		// 사용자 정보 가져오기
		UserDTO dto = (UserDTO) session.getAttribute("dto");

		request.setAttribute("dto", dto);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/mypage/mypage_reservation_review.jsp");

		return forward;
	}
}