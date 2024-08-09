package com.resort.action.admin.facility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ActivityInfoDTO;
import com.resort.model.TotalDAO;

public class AdminActivityInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String activity_type = request.getParameter("type");
		String activity_name = request.getParameter("name");
		String activity_start_time = request.getParameter("open");
		String activity_end_time = request.getParameter("close");

		ActivityInfoDTO dto = new ActivityInfoDTO();

		if (activity_type.equals("선택안함")) {
			activity_type = request.getParameter("input_type");
		}
		dto.setActivity_type(activity_type);
		dto.setActivity_name(activity_name);
		dto.setActivity_start_time(activity_start_time);
		dto.setActivity_end_time(activity_end_time);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.insertActivityBoard(dto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('액티비티 등록에 성공했습니다.')");
			out.println("location.href='admin_activity_list'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('액티비티 등록에 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}

		return null;
	}

}
