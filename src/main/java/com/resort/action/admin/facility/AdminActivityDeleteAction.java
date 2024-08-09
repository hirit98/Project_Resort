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

public class AdminActivityDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int id = Integer.parseInt(request.getParameter("id").trim());

		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.deleteActivityBoard(id);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('액티비티를 삭제 했습니다!')");
			out.println("location.href='admin_activity_list?page=" + page + "'");
			out.println("</script>");
		} else if (check == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 액티비티 입니다!!')");
			out.println("location.href='admin_activity_list?page=" + page + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('액티비티 삭제에 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
