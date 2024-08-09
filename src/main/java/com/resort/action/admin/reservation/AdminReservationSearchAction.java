package com.resort.action.admin.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReservationDTO;
import com.resort.model.ReservationSearchDTO;
import com.resort.model.TotalDAO;

public class AdminReservationSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		String start = null; 
		String end = null;
		String keyword = request.getParameter("keyword").trim();
		String field = request.getParameter("field").trim();
		String status = null;
		
		if(request.getParameter("start") != null) {
			start = request.getParameter("start").trim();
		}
		if(request.getParameter("end") != null) {
			end = request.getParameter("end").trim();
		}
		if(request.getParameter("status") != null) {
			status = request.getParameter("status").trim();
		}
		
		ReservationSearchDTO search = new ReservationSearchDTO();
		
		search.setStart_regdate(start);
		search.setEnd_regdate(end);
		search.setField(field);
		search.setKeyword(keyword);
		search.setStatus(status);
		
		TotalDAO dao = TotalDAO.getInstance();

		int cnt = 0;
		int rowsize = 10;
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
		int endNo = (page * rowsize);
		int startBlock = (((page - 1) / block) * block) + 1;
		int endBlock = (((page - 1) / block) * block) + block;

		cnt = dao.countReservationList(search);

		allPage = (int) Math.ceil(cnt / (double) rowsize);

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		boolean is_Search = true;

		List<ReservationDTO> list = dao.getReservationList(search, page, rowsize);

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
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("status", status);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/reservation/admin_reservation_list.jsp");

		return forward;
	}

}
