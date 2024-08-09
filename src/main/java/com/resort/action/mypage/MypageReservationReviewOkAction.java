package com.resort.action.mypage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.resort.action.Action;
import com.resort.action.ActionForward;
import com.resort.action.StaticArea;
import com.resort.model.ReviewBoardDTO;
import com.resort.model.TotalDAO;
import com.resort.model.UserDTO;

public class MypageReservationReviewOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		StaticArea.checkUserDTO(request, response);

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("dto");

		String saveFolder = "D:\\JSP\\Project_Resort\\src\\main\\webapp\\upload_images";

		int fileSize = 10 * 1024 * 1024; // 10MB

		MultipartRequest file = new MultipartRequest(request, // 일반적인 request 객체
				saveFolder, // 첨부파일이 저장될 경로
				fileSize, // 업로드할 첨부파일의 최대 크기
				"UTF-8", // 문자 인코딩 방식
				new DefaultFileRenamePolicy() // 첨부파일의 이름이 같은 경우 중복이 안되게 설정
		);

		String writer = dto.getUser_id();
		float point = Float.parseFloat(file.getParameter("point"));
		String review_board_con = file.getParameter("cont").trim();
		String res_no = file.getParameter("Res_no");
		File review_file = file.getFile("file");

		ReviewBoardDTO boarddto = new ReviewBoardDTO();
		if (review_file != null) {

			// getName(): 첨부파일의 이름을 문자열로 반환하는 메서드,
			String reviewName = review_file.getName();

			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			// 날짜 정보 month와 day를 2자리로 맞추어주는 메서드
			String month = StaticArea.getMonth(cal.get(Calendar.MONTH) + 1);
			String day = StaticArea.getDay(cal.get(Calendar.DAY_OF_MONTH));

			String ymd = year + "-" + month + "-" + day;

			String homedir = saveFolder + "/" + "review";

			// 날짜 폴더 생성
			File path = new File(homedir);

			if (!path.exists()) { // 폴더가 존재하지 않는 경우
				path.mkdir(); // 실제 폴더를 만들어 주는 메서드

			}

			// 파일을 생성 -> 예) 차량번호_날짜_파일명
			String reFileName = "review_" + ymd + "_" + reviewName;

			review_file.renameTo(new File(homedir + "/" + reFileName));

			String fileDBName = "review/" + reFileName;

			boarddto.setReview_board_file(fileDBName);

		}

		boarddto.setReview_board_writer_id(writer);
		boarddto.setReview_board_point(point);
		boarddto.setReview_board_cont(review_board_con);
		boarddto.setReview_board_res_no(res_no);

		TotalDAO dao = TotalDAO.getInstance();

		int check = dao.ReservationReviewOk(boarddto);

		PrintWriter out = response.getWriter();

		if (check > 0) {
			
			dao.updateReviewStatus(res_no);
			
			out.println("<script>");
			out.println("alert('리뷰 등록에 성공했습니다.')");
			out.println("location.href='mypage_reservation'");
			out.println("</script>");
			out.close();
			
		} else {
			out.println("<script>");
			out.println("alert('리뷰 등록에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}

		return null;
	}
}