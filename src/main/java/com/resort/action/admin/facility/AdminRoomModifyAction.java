package com.resort.action.admin.facility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;

public class AdminRoomModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String type = request.getParameter("type").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		RoomInfoDTO dto = dao.getRoomInfoContent(type);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_room_modify.jsp");

		return forward;
	}

}
