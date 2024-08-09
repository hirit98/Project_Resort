package com.resort.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.EventBoardDTO;
import com.resort.model.TotalDAO;

public class BoardEventSearchContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		String field = request.getParameter("field").trim();
		String keyword = request.getParameter("keyword").trim();

		TotalDAO dao = TotalDAO.getInstance();

		EventBoardDTO dto = dao.getEventContent(no);

		dao.uploadEventHit(no);

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/board/board_event_content.jsp");

		return forward;
	}

}
