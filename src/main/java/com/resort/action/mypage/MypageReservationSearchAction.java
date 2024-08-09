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

public class MypageReservationSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("dto");

		TotalDAO dao = TotalDAO.getInstance();

		String field = request.getParameter("field").trim();

		int cnt = dao.countReservationList(field, dto.getUser_id());

		int rowsize = 2; // 한 페이지에 표시할 예약 정보 개수

		int page = 1; // 기본 페이지 번호

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
			if (page < 1) {
				page = 1;
			}
		}

		int startNo = (page - 1) * rowsize + 1; // 시작 번호 계산
		int endNo = page * rowsize; // 끝 번호 계산

		List<ReservationDTO> list = dao.searchReservation(field, page, rowsize, dto.getUser_id());

		// 전체 페이지 수 계산
		int allPage = (int) Math.ceil(cnt / (double) rowsize);

		// 페이징 처리를 위한 시작 블록과 끝 블록 계산
		int block = 3; // 한 번에 보여질 페이지 블록 수
		int startBlock = ((page - 1) / block) * block + 1;
		int endBlock = startBlock + block - 1;
		if (endBlock > allPage) {
			endBlock = allPage;
		}

		// 검색 여부 설정
		boolean is_Search = true;

		// 속성 설정
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
		request.setAttribute("field", field);
		request.setAttribute("is_Search", is_Search);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/mypage/mypage_reservation.jsp");

		return forward;

	}

}
