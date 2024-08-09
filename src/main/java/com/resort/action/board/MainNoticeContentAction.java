package com.resort.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.NoticeBoardDTO;
import com.resort.model.TotalDAO;

public class MainNoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no").trim());
		
		TotalDAO dao = TotalDAO.getInstance();
		
		dao.uploadHit(no);
		
		NoticeBoardDTO dto = dao.getNoticeContent(no);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/board/board_notice_content.jsp");

		return forward;
	}

}
