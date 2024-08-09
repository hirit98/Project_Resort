package com.resort.action.admin.facility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.RoomInfoDTO;
import com.resort.model.TotalDAO;

public class AdminRoomModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkAdminDTO(request, response);
		
		String type = request.getParameter("type").trim();
		double area = Double.parseDouble(request.getParameter("area").trim());
		int maximum = Integer.parseInt(request.getParameter("maximum").trim());
		int price = Integer.parseInt(request.getParameter("price").trim());
		int total = Integer.parseInt(request.getParameter("total").trim());
		
		RoomInfoDTO dto = new RoomInfoDTO();
		
		dto.setRoom_type(type);
		dto.setRoom_area(area);
		dto.setRoom_maximum(maximum);
		dto.setRoom_price(price);
		dto.setRoom_total(total);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.updateRoomModify(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('룸 정보를 성공적으로 수정했습니다.')");
			out.println("location.href='admin_room_modify?type=" + type +"'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('룸 정보를 수정하는데 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
