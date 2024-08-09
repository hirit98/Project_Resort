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
import com.resort.model.UserDTO;

public class AdminUserModifyOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
        String no = request.getParameter("no").trim();
        int page = Integer.parseInt(request.getParameter("page").trim());
        String user_name = request.getParameter("name").trim();
        String user_id = request.getParameter("id").trim();
        String user_pwd = request.getParameter("pwd").trim();
        String user_phone = request.getParameter("phone").trim();
        String user_email = request.getParameter("email").trim();
        String user_grade = request.getParameter("grade").trim();

        UserDTO dto = new UserDTO();

        dto.setUser_no(no);
        dto.setUser_name(user_name);
        dto.setUser_id(user_id);
        dto.setUser_pwd(user_pwd);
        dto.setUser_phone(user_phone);
        dto.setUser_email(user_email);
        dto.setUser_grade(user_grade);

        TotalDAO dao = TotalDAO.getInstance();

        PrintWriter out = response.getWriter();

        int check = dao.updateUser(dto);
        if (check > 0) {
            out.println("<script>");
            out.println("alert('회원 수정 완료했습니다.')");
            out.println("location.href='admin_user_content?no=" + no + "&page=" + page + "'");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('회원 수정 실패했습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }
        return null;
    }
}