package com.resort.action.admin.facility;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;

public class AdminRoomTotalListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());
		
		List<RoomInfoDTO> list = dao.getRoomInfoList(date);
		List<String> type_list = dao.getRoomTypeList();
		
		boolean is_Search = false;
		
		request.setAttribute("list", list);
		request.setAttribute("type_list", type_list);
		request.setAttribute("is_Search", is_Search);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_room_total_list.jsp");

		return forward;
	}

}
