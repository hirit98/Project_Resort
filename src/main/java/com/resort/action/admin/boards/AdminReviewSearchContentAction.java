package com.resort.action.admin.boards;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReviewBoardDTO;
import com.resort.model.TotalDAO;

public class AdminReviewSearchContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		String field = request.getParameter("field").trim();
		String keyword = request.getParameter("keyword").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		ReviewBoardDTO dto = dao.getReviewContent(no);
		
		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("/WEB-INF/views/admin/boards/admin_review_content.jsp");
		
		return forward;
	}

}
