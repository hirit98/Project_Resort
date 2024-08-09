package com.resort.action.admin.management;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.AdminDTO;
import com.resort.model.QnaBoardDTO;
import com.resort.model.TotalDAO;

public class AdminQnaAnswerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		StaticArea.checkAdminDTO(request, response);
		
		int qna_no =Integer.parseInt(request.getParameter("qna_no").trim());
		String answer =request.getParameter("answer_cont").trim();
		
		HttpSession session = request.getSession(false);
		
		AdminDTO admin = (AdminDTO) session.getAttribute("dto"); 
		
		QnaBoardDTO dto = new QnaBoardDTO();
		
		dto.setQna_board_no(qna_no);
		dto.setQna_board_answer(answer);
		dto.setQna_board_answer_id(admin.getAdmin_id());
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.answerQnaBoard(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('답변 등록완료')");
			out.println("location.href='admin_qna_list?no=" + qna_no + "'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('답변 등록실패')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	
		
		return null;
	
	}

}
