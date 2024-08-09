package com.resort.action.admin.boards;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.NoticeBoardDTO;
import com.resort.model.TotalDAO;

public class AdminNoticeModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkAdminDTO(request, response);
		
		String saveFolder = "D:\\JSP\\Project_Resort\\src\\main\\webapp\\upload_images";

		int fileSize = 10 * 1024 * 1024; // 10MB

		MultipartRequest multi = new MultipartRequest(request, // 일반적인 request 객체
				saveFolder, // 첨부파일이 저장될 경로
				fileSize, // 업로드할 첨부파일의 최대 크기
				"UTF-8", // 문자 인코딩 방식
				new DefaultFileRenamePolicy() // 첨부파일의 이름이 같은 경우 중복이 안되게 설정
		);

		int board_no = Integer.parseInt(multi.getParameter("no").trim());
		int page = Integer.parseInt(multi.getParameter("page").trim());
		String admin_no = multi.getParameter("id").trim();
		String title = multi.getParameter("title").trim();
		String content = multi.getParameter("cont").trim();

		File notice_file = multi.getFile("file");

		NoticeBoardDTO dto = new NoticeBoardDTO();

		if (notice_file != null) { // 첨부파일이 존재하는 경우

			// getName(): 첨부파일의 이름을 문자열로 반환하는 메서드,
			String fileName = notice_file.getName();

			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			// 날짜 정보 month와 day를 2자리로 맞추어주는 메서드
			String month = StaticArea.getMonth(cal.get(Calendar.MONTH) + 1);
			String day = StaticArea.getDay(cal.get(Calendar.DAY_OF_MONTH));

			String ymd = year + "-" + month + "-" + day;

			String homedir = saveFolder + "/" + admin_no;

			// 날짜 폴더 생성
			File path = new File(homedir);

			if (!path.exists()) { // 폴더가 존재하지 않는 경우
				path.mkdir(); // 실제 폴더를 만들어 주는 메서드
			}

			// 파일을 생성
			String reFileName = "notice_modify_" + ymd + "_" + fileName;

			notice_file.renameTo(new File(homedir + "/" + reFileName));

			// 실제로 DB의 file 컬럼에 들어가는 파일 이름
			String fileDBName = admin_no + "/" + reFileName;

			dto.setNotice_board_file(fileDBName);
		}
		
		dto.setNotice_board_no(board_no);
		dto.setNotice_board_writer_id(admin_no);
		dto.setNotice_board_title(title);
		dto.setNotice_board_cont(content);
		
		TotalDAO dao = TotalDAO.getInstance();
		
		int check = dao.modifyNoticeBoard(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('공지사항 수정에 성공했습니다.')");
			out.println("location.href='admin_notice_content?no="+ board_no +"&page=" + page + "'");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('공지사항 등록에 실패했습니다!!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
