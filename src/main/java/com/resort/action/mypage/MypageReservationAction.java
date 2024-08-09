package com.resort.action.mypage;

import java.io.IOException;
import java.util.List;

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

public class MypageReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("dto");

		TotalDAO dao = TotalDAO.getInstance();

		int cnt = 0;

		int rowsize = 2;

		int block = 3;

		int allPage = 0;

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
			if (page < 1) {
				page = 1;
			}
		}

		int startNo = (page * rowsize) - (rowsize - 1);

		int endNo = Math.min(page * rowsize, cnt);

		int startBlock = (((page - 1) / block) * block) + 1;

		int endBlock = (((page - 1) / block) * block) + block;

		cnt = dao.countReservationList(dto.getUser_id());

		allPage = (int) Math.ceil(cnt / (double) rowsize);

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		boolean is_Search = false;

		List<ReservationDTO> list = dao.searchReservation(page, rowsize, dto.getUser_id());

		// Calculate day of week and nights for each reservation
		for (ReservationDTO reservation : list) {
			reservation.getDayOfWeekIn();
			reservation.getDayOfWeekOut();
			reservation.getNights();
		}

		request.setAttribute("cnt", cnt);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("is_Search", is_Search);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/mypage/mypage_reservation.jsp");

		return forward;
	}

}
