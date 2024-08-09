package com.resort.action.admin.facility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;

public class AdminRoomInfoDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		String type = request.getParameter("type").trim();
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.deleteRoomInfo(type);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('"+ type +"의 정보를 삭제하는데 성공했습니다.')");
			out.println("location.href='admin_room_total_list'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('해당 정보를 삭제하는데 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}

}
