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

public class AdminFacilityDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());

		int page = Integer.parseInt(request.getParameter("page").trim());

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.deleteFacilityBoard(no);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('게시글 삭제에 성공했습니다!')");
			out.println("location.href='admin_facility_list?page=" + page + "'");
			out.println("</script>");
		} else if (check == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는 게시글 입니다!!')");
			out.println("location.href='admin_facility_list?page=" + page + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시글 삭제에 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
