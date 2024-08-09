package com.resort.action.admin.facility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.FacilityinfoDTO;
import com.resort.model.TotalDAO;

public class AdminFacilityModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());

		int id = Integer.parseInt(request.getParameter("id").trim());
		String type = request.getParameter("type").trim();

		if (type.equals(":::선택:::")) {
			type = request.getParameter("input_type");
		}

		String name = request.getParameter("name").trim();
		String start_time = request.getParameter("open").trim();
		String end_time = request.getParameter("close").trim();

		FacilityinfoDTO dto = new FacilityinfoDTO();

		dto.setFacility_id(id);
		dto.setFacility_type(type);
		dto.setFacility_name(name);
		dto.setFacility_start_time(start_time);
		dto.setFacility_end_time(end_time);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.modifyFacilityBoard(dto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('부대시설 수정에 성공했습니다.')");
			out.println("location.href='admin_facility_content?no=" + no + "&page=" + page + "'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('부대시설 등록에 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return null;
	}

}
