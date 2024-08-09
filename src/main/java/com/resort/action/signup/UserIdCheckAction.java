package com.resort.action.signup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.model.TotalDAO;

public class UserIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("paramId").trim();

		TotalDAO dao = TotalDAO.getInstance();

		int res = dao.checkUserId(userId);

		PrintWriter out = response.getWriter();

		out.println(res);

		return null;
	}

}
