package com.resort.action.admin.statistics;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;

public class AdminStatisticsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);

		TotalDAO dao = TotalDAO.getInstance();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		String date = sdf.format(c1.getTime());

		Calendar cal = Calendar.getInstance();
		int month = Integer.parseInt(StaticArea.getMonth(cal.get(Calendar.MONTH) + 1));

		List<String> monthList = new ArrayList<String>();
		List<Integer> priceList = dao.getMonthlyRevenue();

		for (int i = 1; i <= month; i++) {
			monthList.add("'" + i + "월" + "'");
		}

		List<String> roomTypeArrayList = dao.getRoomTypeArrayList();
		List<Integer> countRoomType = dao.countRoomTypeMonthList(date);

		// 회원 등급별 통계 데이터
		List<String> memGradeList = StaticArea.getMemGrade();
		List<Integer> memberCountList = dao.countMemberGradeList();

		request.setAttribute("roomTypeArrayList", roomTypeArrayList);
		request.setAttribute("countRoomType", countRoomType);
		request.setAttribute("memGradeList", memGradeList);
		request.setAttribute("memberCountList", memberCountList);
		request.setAttribute("monthList", monthList);
		request.setAttribute("priceList", priceList);

		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/admin/statistics/admin_statistics.jsp");

		return forward;
	}

}
