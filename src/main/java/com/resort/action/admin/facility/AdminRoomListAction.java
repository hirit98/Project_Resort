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
import com.resort.model.RoomsDTO;
import com.resort.model.TotalDAO;

public class AdminRoomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		TotalDAO dao = TotalDAO.getInstance();

		int cnt = 0;
		int rowsize = 10;
		int block = 3;
		int allPage = 0;
		int page = 1;
		
		String type = request.getParameter("type").trim();

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

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());
		
		cnt = dao.countRoomTypeList(date, type);

		allPage = (int) Math.ceil(cnt / (double) rowsize);

		if (endBlock > allPage) {
			endBlock = allPage;
		}
		
		List<RoomsDTO> list = dao.getRoomsList(date, type, page, rowsize);
		List<String> roomsList = dao.getRoomNoList(type);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("list", list);
		request.setAttribute("roomsList", roomsList);
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("type", type);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/facility/admin_room_list.jsp");

		return forward;
	}

}
