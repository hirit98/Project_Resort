package com.resort.action.footer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;

public class FooterProcessingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		forward.setPath("/WEB-INF/views/public/processing/processing.jsp");

		return forward;
	}

}
