package com.resort.action.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.QnaBoardDTO;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class MypageQnaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		StaticArea.checkUserDTO(request, response);
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("dto");
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		TotalDAO dao = TotalDAO.getInstance();
		
		QnaBoardDTO cont = dao.getQnaContent(no);
		
		request.setAttribute("cont", cont);
		request.setAttribute("dto", dto);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();

		forward.setPath("/WEB-INF/views/public/mypage/mypage_qna_content.jsp");

		return forward;
	}

}
