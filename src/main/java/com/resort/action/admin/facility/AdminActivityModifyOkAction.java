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

public class AdminActivityModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int id = Integer.parseInt(request.getParameter("id").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		String activity_type = request.getParameter("type").trim();

		if (activity_type.equals("선택안함")) {
			activity_type = request.getParameter("input_type");
		}

		String activity_name = request.getParameter("name").trim();
		String activity_start_time = request.getParameter("open").trim();
		String activity_end_time = request.getParameter("close").trim();

		ActivityInfoDTO dto = new ActivityInfoDTO();

		dto.setActivity_id(id);
		dto.setActivity_type(activity_type);
		dto.setActivity_name(activity_name);
		dto.setActivity_start_time(activity_start_time);
		dto.setActivity_end_time(activity_end_time);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.modifyActivityBoard(dto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('액티비티 수정에 성공했습니다.')");
			out.println("location.href='admin_activity_modify?id=" + id + "&page=" + page + "'");
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
