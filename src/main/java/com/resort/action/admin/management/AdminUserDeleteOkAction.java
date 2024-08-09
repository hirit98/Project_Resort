package com.resort.action.admin.management;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.TotalDAO;

public class AdminUserDeleteOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
        String no = request.getParameter("no").trim();
        int page = Integer.parseInt(request.getParameter("page").trim());

        TotalDAO dao = TotalDAO.getInstance();

        int check = dao.deleteUser(no);

        PrintWriter out = response.getWriter();
        if (check > 0) {
            out.println("<script>");
            out.println("alert('회원 삭제했습니다.')");
            out.println("location.href='admin_user_list?page=" + page + "'");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('회원 삭제 실패했습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }
        return null;
    }

}
