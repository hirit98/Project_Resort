package com.resort.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.EventBoardDTO;
import com.resort.model.TotalDAO;

public class BoardEventContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		dao.uploadEventHit(no);

		EventBoardDTO dto = dao.getEventContent(no);

		request.setAttribute("dto", dto);
		request.setAttribute("page", page);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/board/board_event_content.jsp");

		return forward;
	}

}
