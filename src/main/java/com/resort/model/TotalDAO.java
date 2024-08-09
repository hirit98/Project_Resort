package com.resort.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.resort.action.StaticArea;

public class TotalDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// TotalDAO 객체를 싱글톤 방식으로 만든다.

	// 1. TotalDAO 객체를 정적(static) 멤버로 선언 해 준다.
	private static TotalDAO instance = null;

	// 2. 기본 생성자를 private 로 선언한다.
	private TotalDAO() {
	}

	// 3. 기본 생성자 대신 instance 를 return 해 주는 getInstance() 매서드 선언.
	public static TotalDAO getInstance() {

		if (instance == null) {
			instance = new TotalDAO();
		}

		return instance;
	} // getInstance() end.

	// JDBC 방식이 아닌 DBCP 방식으로 DB와 연동 작업 진행.
	public void openConn() {

		try {

			// 1. JNDI 서버 객체 생성.
			// 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결 해 주는 개념이 Context 객체이며
			// , InitialContext 객체는 네이밍 서비스를 이용하기 위한 시작점이 된다.
			Context initCtx = new InitialContext();

			// 2. Context 객체를 얻어와야 함.
			// "java:comp/env" 라는 이름의 인수로 Context 객체를 얻어옴.
			// "java:comp/env" 는 현재 웹 애플리케이션에서 네이밍 서비스를 이용시 루트 디렉토리라고 생각하면 됨.
			// 즉, 현재 웹 애플리케이션이 사용 할 수 있는 모든 자원은 "java:comp/env" 아래에 위치를 하게 됨.
			Context ctx = (Context) initCtx.lookup("java:comp/env");

			// 3. lookup() 매서드를 이용하여 매칭되는 커넥션을 찾아옴.
			// "java:comp/env" 아래에 위치한 "jdbc/mysql" 자원을 얻어옴
			// 이 자원이 바로 데이터 소스(커넥션 풀)임.
			// 여기서 "jdbc/mysql" 은 context.xml 파일에 추가했던
			// <Resource> 태그 안에 있던 name 속성의 값임.
			DataSource ds = (DataSource) ctx.lookup("jdbc/mysql");

			// 4. DataSource 객체를 이용하여 커넥션을 하나 가져오면 됨.
			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // openConn() end.

	// DB에 연결된 자원을 종료하는 매서드.
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {

			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // closeConn() end.

	public void closeConn(PreparedStatement pstmt, Connection con) {

		try {

			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // closeConn() end.

	// 무결성검사 시 외래키 검사 설정 켜기
	public void fkCheckOn() {

		try {

			sql = "set foreign_key_checks = 1";

			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 무결성검사 시 외래키 검사 설정 끄기
	public void fkCheckOff() {

		try {

			sql = "set foreign_key_checks = 0";

			pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원가입 기능 매서드.
	public int insertUserInfo(UserDTO dto) {

		int result = 0, cnt = 0;

		try {

			openConn();

			sql = "select count(user_no) from user where user_no like ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_no() + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1) + 1;
			}

			sql = "insert into user values(?, ?, ?, ?, ?, ?, default, default, default)";

			pstmt = con.prepareStatement(sql);

			if (cnt < 10) {
				pstmt.setString(1, dto.getUser_no() + "00" + cnt);
			} else if (cnt < 100) {
				pstmt.setString(1, dto.getUser_no() + "0" + cnt);
			} else {
				pstmt.setString(1, dto.getUser_no() + cnt);
			}
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getUser_pwd());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_email());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertUserInfo() end.

	// User 테이블 아이디 중복체크 매서드.
	public int checkUserId(String userId) {

		int result = 0;

		try {

			openConn();

			sql = "select * from user where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = -1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	// User 테이블 이메일 중복체크 매서드
	public int checkUserEmail(String email) {

		int result = 0;

		try {

			openConn();

			sql = "select * from user where user_email = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = -1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	} // checkUserEmail() end.

	// countUserList()
	public int countUserList() {
		int cnt = 0;

		try {
			openConn();

			sql = "select count(user_no) from user";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}// countUserList()

	// getUserList(page, rowsize)
	public List<UserDTO> getUserList(int page, int rowsize) {

		List<UserDTO> list = new ArrayList<UserDTO>();

		int offset = (page - 1) * rowsize;

		try {

			UserDTO dto = null;

			openConn();

			sql = "select * from user order by user_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new UserDTO();

				dto.setUser_no(rs.getString("user_no"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_mileage(rs.getInt("user_mileage"));
				dto.setUser_grade(rs.getString("user_grade"));
				dto.setUser_regdate(rs.getString("user_regdate"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getUserList(page, rowsize)

	// updateUser(dto);
	public int updateUser(UserDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "update user set user_name=?, user_id=?, user_pwd=?, user_phone=?, user_email=?, user_grade=? where user_no=?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getUser_pwd());
			pstmt.setString(4, dto.getUser_phone());
			pstmt.setString(5, dto.getUser_email());
			pstmt.setString(6, dto.getUser_grade());
			pstmt.setString(7, dto.getUser_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	}// updateUser(dto);

	// deleteUser(no)
	public int deleteUser(String no) {

		int result = 0;

		try {

			openConn();

			fkCheckOff();

			// 사용자를 삭제하는 SQL 쿼리 작성
			sql = "delete from user where user_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, no);

			// 쿼리 실행 후 결과 반환
			result = pstmt.executeUpdate();

			fkCheckOn();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	// deleteUser(no)

	// countUserSearchList
	public int countUserSearchList(String field, String keyword) {
		int cnt = 0;

		openConn();

		if (field.equals("전체")) {
			try {
				sql = "select count(*) from user where user_name like ? or user_phone like ? or user_grade like ? or user_email like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setString(4, "%" + keyword + "%");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("이름")) {

			try {

				sql = "select count(*) from user where user_name like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("연락처")) {

			try {

				sql = "select count(*) from user where user_phone like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("이메일")) {

			try {

				sql = "select count(*) from user where user_email like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("등급")) {

			try {

				sql = "select count(*) from user where user_grade like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return cnt;
	}// countUserSearchList

	// searchUserList *
	public List<UserDTO> searchUserList(String field, String keyword, int page, int rowsize) {

		List<UserDTO> list = new ArrayList<UserDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select * from user where " + "user_name like ? or user_phone like ? or "
						+ "user_email like ? or user_grade like ? " + "order by user_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setString(4, "%" + keyword + "%");
				pstmt.setInt(5, offset);
				pstmt.setInt(6, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					UserDTO dto = new UserDTO();

					dto.setUser_no(rs.getString("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_mileage(rs.getInt("user_mileage"));
					dto.setUser_regdate(rs.getString("user_regdate"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("이름")) {

			try {

				sql = "select * from user where " + "user_name like ? " + "order by user_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					UserDTO dto = new UserDTO();

					dto.setUser_no(rs.getString("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_mileage(rs.getInt("user_mileage"));
					dto.setUser_regdate(rs.getString("user_regdate"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("연락처")) {

			try {

				sql = "select * from user where " + "user_phone like ?" + "order by user_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					UserDTO dto = new UserDTO();

					dto.setUser_no(rs.getString("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_mileage(rs.getInt("user_mileage"));
					dto.setUser_regdate(rs.getString("user_regdate"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("이메일")) {

			try {

				sql = "select * from user where " + "user_email like ? " + "order by user_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					UserDTO dto = new UserDTO();

					dto.setUser_no(rs.getString("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_mileage(rs.getInt("user_mileage"));
					dto.setUser_regdate(rs.getString("user_regdate"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("등급")) {

			try {

				sql = "select * from user where " + "user_grade like ? " + "order by user_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					UserDTO dto = new UserDTO();

					dto.setUser_no(rs.getString("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_mileage(rs.getInt("user_mileage"));
					dto.setUser_regdate(rs.getString("user_regdate"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;
	}

	// userMypageModify Start(dto)
	public int checkUserPwd(UserDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "select * from user where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (dto.getUser_pwd().equals(rs.getString("user_pwd"))) {
					result = 1; // 비밀번호 일치
				} else {
					result = -1; // 비밀번호 불일치
				}
			} else {
				result = 0; // 회원이 존재하지 않음
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	// userMypageModifyEnd(dto)

	// userMypageModifyStart(dto)
	public int updateUserInfo(UserDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "update user set user_pwd = ?, user_phone = ?, user_email = ? where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_pwd());
			pstmt.setString(2, dto.getUser_phone());
			pstmt.setString(3, dto.getUser_email());
			pstmt.setString(4, dto.getUser_id());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	}
	// userMypageModifyEnd(dto)

	// 문의하기 insertQnaBoard(dto)
	public int insertQnaBoard(QnaBoardDTO dto) {
		int result = 0, cnt = 0;

		try {

			openConn();

			sql = "select max(qna_board_no) from qna_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

			sql = "insert into qna_board (qna_board_no, qna_board_writer_id, qna_board_type, qna_board_title, qna_board_cont, qna_board_file) VALUES (?, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt + 1);
			pstmt.setString(2, dto.getQna_board_writer_id());
			pstmt.setString(3, dto.getQna_board_type());
			pstmt.setString(4, dto.getQna_board_title());
			pstmt.setString(5, dto.getQna_board_cont());
			pstmt.setString(6, dto.getQna_board_file());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// insertQnaBoard(dto)

	// countQnaList()
	public int countQnaList() {
		int cnt = 0;

		try {
			openConn();

			sql = "select count(qna_board_no) from qna_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}// countQnaList() End

	// getQnaList()
	public List<QnaBoardDTO> getQnaList(int page, int rowsize, String id) {

		List<QnaBoardDTO> list = new ArrayList<QnaBoardDTO>();

		int offset = (page - 1) * rowsize;

		try {

			QnaBoardDTO dto = null;

			openConn();

			sql = "select * from qna_board where qna_board_writer_id = ? order by qna_board_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new QnaBoardDTO();

				dto.setQna_board_no(rs.getInt("qna_board_no"));
				dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
				dto.setQna_board_answer_id(rs.getString("qna_board_answer_id"));
				dto.setQna_board_type(rs.getString("qna_board_type"));
				dto.setQna_board_title(rs.getString("qna_board_title"));
				dto.setQna_board_cont(rs.getString("qna_board_cont"));
				dto.setQna_board_answer(rs.getString("qna_board_answer"));
				dto.setQna_board_date(rs.getString("qna_board_date"));
				dto.setQna_board_update(rs.getString("qna_board_update"));
				dto.setQna_board_file(rs.getString("qna_board_file"));
				dto.setQna_board_status(rs.getBoolean("qna_board_status"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	// getQnaList()End

	// getQnaList()
	public List<QnaBoardDTO> getQnaList(int page, int rowsize) {

		List<QnaBoardDTO> list = new ArrayList<QnaBoardDTO>();

		int offset = (page - 1) * rowsize;

		try {

			QnaBoardDTO dto = null;

			openConn();

			sql = "select * from qna_board order by qna_board_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new QnaBoardDTO();

				dto.setQna_board_no(rs.getInt("qna_board_no"));
				dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
				dto.setQna_board_answer_id(rs.getString("qna_board_answer_id"));
				dto.setQna_board_type(rs.getString("qna_board_type"));
				dto.setQna_board_title(rs.getString("qna_board_title"));
				dto.setQna_board_cont(rs.getString("qna_board_cont"));
				dto.setQna_board_answer(rs.getString("qna_board_answer"));
				dto.setQna_board_date(rs.getString("qna_board_date"));
				dto.setQna_board_update(rs.getString("qna_board_update"));
				dto.setQna_board_file(rs.getString("qna_board_file"));
				dto.setQna_board_status(rs.getBoolean("qna_board_status"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	// getQnaList()End

	// getQnaContent(no)
	public QnaBoardDTO getQnaContent(int no) {

		QnaBoardDTO dto = null;

		try {

			openConn();

			sql = "select * from qna_board where qna_board_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new QnaBoardDTO();

				dto.setQna_board_no(rs.getInt("qna_board_no"));
				dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
				dto.setQna_board_answer_id(rs.getString("qna_board_answer_id"));
				dto.setQna_board_type(rs.getString("qna_board_type"));
				dto.setQna_board_title(rs.getString("qna_board_title"));
				dto.setQna_board_cont(rs.getString("qna_board_cont"));
				dto.setQna_board_answer(rs.getString("qna_board_answer"));
				dto.setQna_board_date(rs.getString("qna_board_date"));
				dto.setQna_board_update(rs.getString("qna_board_update"));
				dto.setQna_board_file(rs.getString("qna_board_file"));
				dto.setQna_board_status(rs.getBoolean("qna_board_status"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// getQnaContent(no)

	public int answerQnaBoard(QnaBoardDTO dto) {

		int result = 0;

		try {
			openConn();

			sql = "update qna_board set qna_board_answer_id = ?, qna_board_answer = ?, qna_board_status = true where qna_board_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getQna_board_answer_id());
			pstmt.setString(2, dto.getQna_board_answer());
			pstmt.setInt(3, dto.getQna_board_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	}

	public int countQnaSearchList(String field, String keyword) {

		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {
				sql = "select count(*)from qna_board where qna_board_writer_id like ? or qna_board_title like ? or qna_board_type like ? or qna_board_date like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setString(4, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("고객ID")) {

			try {
				sql = "select count(*)from qna_board where qna_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {
				sql = "select count(*)from qna_board where qna_board_title like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("문의유형")) {

			try {
				sql = "select count(*)from qna_board where qna_board_type like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("문의날짜")) {

			try {
				sql = "select count(*)from qna_board where qna_board_date like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return cnt;
	}

	public List<QnaBoardDTO> searchQnaList(String field, String keyword, int page, int rowsize) {

		List<QnaBoardDTO> list = new ArrayList<QnaBoardDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (field.equals("전체")) {

			try {
				sql = "select *from qna_board where qna_board_writer_id like ? or qna_board_title like ? or qna_board_type like ? or qna_board_date like ?"
						+ "order by qna_board_no limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setString(4, "%" + keyword + "%");
				pstmt.setInt(5, offset);
				pstmt.setInt(6, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();

					dto.setQna_board_no(rs.getInt("qna_board_no"));
					dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
					dto.setQna_board_title(rs.getString("qna_board_title"));
					dto.setQna_board_type(rs.getString("qna_board_type"));
					dto.setQna_board_date(rs.getString("qna_board_date"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("고객ID")) {

			try {
				sql = "select *from qna_board where qna_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				while (rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();

					dto.setQna_board_no(rs.getInt("qna_board_no"));
					dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
					dto.setQna_board_title(rs.getString("qna_board_title"));
					dto.setQna_board_type(rs.getString("qna_board_type"));
					dto.setQna_board_date(rs.getString("qna_board_date"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {
				sql = "select *from qna_board where qna_board_title like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				while (rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();

					dto.setQna_board_no(rs.getInt("qna_board_no"));
					dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
					dto.setQna_board_title(rs.getString("qna_board_title"));
					dto.setQna_board_type(rs.getString("qna_board_type"));
					dto.setQna_board_date(rs.getString("qna_board_date"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("문의유형")) {

			try {
				sql = "select *from qna_board where qna_board_type like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				while (rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();

					dto.setQna_board_no(rs.getInt("qna_board_no"));
					dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
					dto.setQna_board_title(rs.getString("qna_board_title"));
					dto.setQna_board_type(rs.getString("qna_board_type"));
					dto.setQna_board_date(rs.getString("qna_board_date"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("문의날짜")) {

			try {
				sql = "select *from qna_board where qna_board_date like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				while (rs.next()) {
					QnaBoardDTO dto = new QnaBoardDTO();

					dto.setQna_board_no(rs.getInt("qna_board_no"));
					dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
					dto.setQna_board_title(rs.getString("qna_board_title"));
					dto.setQna_board_type(rs.getString("qna_board_type"));
					dto.setQna_board_date(rs.getString("qna_board_date"));

					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return list;
	}// searchQnaList(String field, String keyword, int page, int rowsize) end
		// 문의하기

	// Event DAO
	// insertEventBoard(dto)
	public int insertEventBoard(EventBoardDTO dto) {

		int result = 0, cnt = 0;

		try {

			openConn();

			sql = "select max(event_board_no) from event_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

			sql = "insert into event_board values(?, ?, ?, ?, default, null, default, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt + 1);
			pstmt.setString(2, dto.getEvent_board_writer_id());
			pstmt.setString(3, dto.getEvent_board_title());
			pstmt.setString(4, dto.getEvent_board_cont());
			pstmt.setString(5, dto.getEvent_board_file());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	// insertEventBoard(dto)

	// countEventList()
	public int countEventList() {
		int cnt = 0;

		try {
			openConn();

			sql = "select count(event_board_no) from event_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}// countEventList()

	// getEventList(page, rowsize);
	public List<EventBoardDTO> getEventList(int page, int rowsize) {

		List<EventBoardDTO> list = new ArrayList<EventBoardDTO>();

		int offset = (page - 1) * rowsize;

		try {

			EventBoardDTO dto = null;

			openConn();

			sql = "select * from event_board order by event_board_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new EventBoardDTO();

				dto.setEvent_board_no(rs.getInt("event_board_no"));
				dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
				dto.setEvent_board_title(rs.getString("event_board_title"));
				dto.setEvent_board_cont(rs.getString("event_board_cont"));
				dto.setEvent_board_hit(rs.getInt("event_board_hit"));
				dto.setEvent_board_date(rs.getString("event_board_date"));
				dto.setEvent_board_update(rs.getString("event_board_update"));
				dto.setEvent_board_file(rs.getString("event_board_file"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	// getEventList(page, rowsize);

	// getEventContent(no);
	public EventBoardDTO getEventContent(int no) {

		EventBoardDTO dto = null;

		try {

			openConn();

			sql = "select * from event_board where event_board_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new EventBoardDTO();

				dto.setEvent_board_no(rs.getInt("event_board_no"));
				dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
				dto.setEvent_board_title(rs.getString("event_board_title"));
				dto.setEvent_board_cont(rs.getString("event_board_cont"));
				dto.setEvent_board_hit(rs.getInt("event_board_hit"));
				dto.setEvent_board_date(rs.getString("event_board_date"));
				dto.setEvent_board_update(rs.getString("event_board_update"));
				dto.setEvent_board_file(rs.getString("event_board_file"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}// getEventContent(no);

	// countEventSearchList(field, keyword);
	public int countEventSearchList(String field, String keyword) {

		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select count(*) from event_board where event_board_title like ? or event_board_cont like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {

				sql = "select count(*) from event_board where event_board_title like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("내용")) {

			try {

				sql = "select count(*) from event_board where event_board_cont like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("작성자")) {

			try {

				sql = "select count(*) from event_board where event_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return cnt;
	}// countEventSearchList(field, keyword);

	// dao.searchEventList(field, keyword, page, rowsize);
	public List<EventBoardDTO> searchEventList(String field, String keyword, int page, int rowsize) {

		List<EventBoardDTO> list = new ArrayList<EventBoardDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select * from event_board where "
						+ "event_board_title like ? or event_board_writer_id like ? or " + "event_board_cont like ? "
						+ "order by event_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setInt(4, offset);
				pstmt.setInt(5, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					EventBoardDTO dto = new EventBoardDTO();

					dto.setEvent_board_no(rs.getInt("event_board_no"));
					dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
					dto.setEvent_board_title(rs.getString("event_board_title"));
					dto.setEvent_board_cont(rs.getString("event_board_cont"));
					dto.setEvent_board_date(rs.getString("event_board_date"));
					dto.setEvent_board_update(rs.getString("event_board_update"));
					dto.setEvent_board_hit(rs.getInt("event_board_hit"));
					dto.setEvent_board_file(rs.getString("event_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {

				sql = "select * from event_board where " + "event_board_title like ? "
						+ "order by event_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					EventBoardDTO dto = new EventBoardDTO();

					dto.setEvent_board_no(rs.getInt("event_board_no"));
					dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
					dto.setEvent_board_title(rs.getString("event_board_title"));
					dto.setEvent_board_cont(rs.getString("event_board_cont"));
					dto.setEvent_board_date(rs.getString("event_board_date"));
					dto.setEvent_board_update(rs.getString("event_board_update"));
					dto.setEvent_board_hit(rs.getInt("event_board_hit"));
					dto.setEvent_board_file(rs.getString("event_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("내용")) {

			try {

				sql = "select * from event_board where " + "event_board_cont like ? "
						+ "order by event_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					EventBoardDTO dto = new EventBoardDTO();

					dto.setEvent_board_no(rs.getInt("event_board_no"));
					dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
					dto.setEvent_board_title(rs.getString("event_board_title"));
					dto.setEvent_board_cont(rs.getString("event_board_cont"));
					dto.setEvent_board_date(rs.getString("event_board_date"));
					dto.setEvent_board_update(rs.getString("event_board_update"));
					dto.setEvent_board_hit(rs.getInt("event_board_hit"));
					dto.setEvent_board_file(rs.getString("event_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("작성자")) {

			try {

				sql = "select * from event_board where " + "event_board_writer_id like ? "
						+ "order by event_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					EventBoardDTO dto = new EventBoardDTO();

					dto.setEvent_board_no(rs.getInt("event_board_no"));
					dto.setEvent_board_writer_id(rs.getString("event_board_writer_id"));
					dto.setEvent_board_title(rs.getString("event_board_title"));
					dto.setEvent_board_cont(rs.getString("event_board_cont"));
					dto.setEvent_board_date(rs.getString("event_board_date"));
					dto.setEvent_board_update(rs.getString("event_board_update"));
					dto.setEvent_board_hit(rs.getInt("event_board_hit"));
					dto.setEvent_board_file(rs.getString("event_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;
	}// dao.searchEventList(field, keyword, page, rowsize);

	// modifyEventBoard(EventBoardDTO dto)
	public int modifyEventBoard(EventBoardDTO dto) {

		int result = 0;

		try {

			openConn();

			if (dto.getEvent_board_file() != null) {

				sql = "update event_board set event_board_title = ?, event_board_cont = ?, event_board_update = now() ,event_board_file = ? where event_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getEvent_board_title());
				pstmt.setString(2, dto.getEvent_board_cont());
				pstmt.setString(3, dto.getEvent_board_file());
				pstmt.setInt(4, dto.getEvent_board_no());

			} else if (dto.getEvent_board_file() == null) {

				sql = "update event_board set event_board_title = ?, event_board_cont = ?, event_board_update = now() where event_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getEvent_board_title());
				pstmt.setString(2, dto.getEvent_board_cont());
				pstmt.setInt(3, dto.getEvent_board_no());

			}

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}// modifyEventBoard(EventBoardDTO dto)

	// deleteEventBoard(no)
	public int deleteEventBoard(int no) {
		int result = 0;

		try {
			openConn();

			con.setAutoCommit(false);

			sql = "delete from event_board where event_board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

			if (result > 0) {
				sql = "update event_board set event_board_no = event_board_no - 1 where event_board_no > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeConn(rs, pstmt, con);
		}
		return result;
	}// deleteEventBoard(no)

	public void uploadEventHit(int no) {
		try {
			openConn();
			sql = "update event_board set event_board_hit = event_board_hit + 1 where event_board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
	}
	// Event DAO

	// Notice DAO
	public int insertNoticeBoard(NoticeBoardDTO dto) {

		int result = 0, cnt = 0;

		try {

			openConn();

			sql = "select max(notice_board_no) from notice_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

			sql = "insert into notice_board values(?, ?, ?, ?, default, null, default, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt + 1);
			pstmt.setString(2, dto.getNotice_board_writer_id());
			pstmt.setString(3, dto.getNotice_board_title());
			pstmt.setString(4, dto.getNotice_board_cont());
			pstmt.setString(5, dto.getNotice_board_file());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	public int countNoticeList() {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(notice_board_no) from notice_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}

	public List<NoticeBoardDTO> getNoticeList(int page, int rowsize) {

		List<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();

		int offset = (page - 1) * rowsize;

		try {

			NoticeBoardDTO dto = null;

			openConn();

			sql = "select * from notice_board order by notice_board_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new NoticeBoardDTO();

				dto.setNotice_board_no(rs.getInt("notice_board_no"));
				dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
				dto.setNotice_board_title(rs.getString("notice_board_title"));
				dto.setNotice_board_cont(rs.getString("notice_board_cont"));
				dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
				dto.setNotice_board_date(rs.getString("notice_board_date"));
				dto.setNotice_board_update(rs.getString("notice_board_update"));
				dto.setNotice_board_file(rs.getString("notice_board_file"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	public NoticeBoardDTO getNoticeContent(int no) {

		NoticeBoardDTO dto = null;

		try {

			openConn();

			sql = "select * from notice_board where notice_board_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new NoticeBoardDTO();

				dto.setNotice_board_no(rs.getInt("notice_board_no"));
				dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
				dto.setNotice_board_title(rs.getString("notice_board_title"));
				dto.setNotice_board_cont(rs.getString("notice_board_cont"));
				dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
				dto.setNotice_board_date(rs.getString("notice_board_date"));
				dto.setNotice_board_update(rs.getString("notice_board_update"));
				dto.setNotice_board_file(rs.getString("notice_board_file"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}

	public int countNoticeSearchList(String field, String keyword) {

		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select count(*) from notice_board where notice_board_title like ? or notice_board_cont like ? or notice_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {

				sql = "select count(*) from notice_board where notice_board_title like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("내용")) {

			try {

				sql = "select count(*) from notice_board where notice_board_cont like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("작성자")) {

			try {

				sql = "select count(*) from notice_board where notice_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return cnt;
	}

	public List<NoticeBoardDTO> searchNoticeList(String field, String keyword, int page, int rowsize) {

		List<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select * from notice_board where "
						+ "notice_board_title like ? or notice_board_writer_id like ? or " + "notice_board_cont like ? "
						+ "order by notice_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setInt(4, offset);
				pstmt.setInt(5, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					NoticeBoardDTO dto = new NoticeBoardDTO();

					dto.setNotice_board_no(rs.getInt("notice_board_no"));
					dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
					dto.setNotice_board_title(rs.getString("notice_board_title"));
					dto.setNotice_board_cont(rs.getString("notice_board_cont"));
					dto.setNotice_board_date(rs.getString("notice_board_date"));
					dto.setNotice_board_update(rs.getString("notice_board_update"));
					dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
					dto.setNotice_board_file(rs.getString("notice_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {

				sql = "select * from notice_board where " + "notice_board_title like ? "
						+ "order by notice_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					NoticeBoardDTO dto = new NoticeBoardDTO();

					dto.setNotice_board_no(rs.getInt("notice_board_no"));
					dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
					dto.setNotice_board_title(rs.getString("notice_board_title"));
					dto.setNotice_board_cont(rs.getString("notice_board_cont"));
					dto.setNotice_board_date(rs.getString("notice_board_date"));
					dto.setNotice_board_update(rs.getString("notice_board_update"));
					dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
					dto.setNotice_board_file(rs.getString("notice_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("내용")) {

			try {

				sql = "select * from notice_board where " + "notice_board_cont like ? "
						+ "order by notice_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					NoticeBoardDTO dto = new NoticeBoardDTO();

					dto.setNotice_board_no(rs.getInt("notice_board_no"));
					dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
					dto.setNotice_board_title(rs.getString("notice_board_title"));
					dto.setNotice_board_cont(rs.getString("notice_board_cont"));
					dto.setNotice_board_date(rs.getString("notice_board_date"));
					dto.setNotice_board_update(rs.getString("notice_board_update"));
					dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
					dto.setNotice_board_file(rs.getString("notice_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("작성자")) {

			try {

				sql = "select * from notice_board where " + "notice_board_writer_id like ? "
						+ "order by notice_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					NoticeBoardDTO dto = new NoticeBoardDTO();

					dto.setNotice_board_no(rs.getInt("notice_board_no"));
					dto.setNotice_board_writer_id(rs.getString("notice_board_writer_id"));
					dto.setNotice_board_title(rs.getString("notice_board_title"));
					dto.setNotice_board_cont(rs.getString("notice_board_cont"));
					dto.setNotice_board_date(rs.getString("notice_board_date"));
					dto.setNotice_board_update(rs.getString("notice_board_update"));
					dto.setNotice_board_hit(rs.getInt("notice_board_hit"));
					dto.setNotice_board_file(rs.getString("notice_board_file"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;
	}

	public int modifyNoticeBoard(NoticeBoardDTO dto) {

		int result = 0;

		try {

			openConn();

			if (dto.getNotice_board_file() != null) {

				sql = "update notice_board set notice_board_title = ?, notice_board_cont = ?, notice_board_update = now() ,notice_board_file = ? where notice_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getNotice_board_title());
				pstmt.setString(2, dto.getNotice_board_cont());
				pstmt.setString(3, dto.getNotice_board_file());
				pstmt.setInt(4, dto.getNotice_board_no());

			} else if (dto.getNotice_board_file() == null) {

				sql = "update notice_board set notice_board_title = ?, notice_board_cont = ?, notice_board_update = now() where notice_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getNotice_board_title());
				pstmt.setString(2, dto.getNotice_board_cont());
				pstmt.setInt(3, dto.getNotice_board_no());

			}

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	}

	public int deleteNoticeBoard(int no) {
		int result = 0;

		try {
			openConn();

			con.setAutoCommit(false);

			sql = "delete from notice_board where notice_board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

			if (result > 0) {
				sql = "update notice_board set notice_board_no = notice_board_no - 1 where notice_board_no > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeConn(null, pstmt, con);
		}
		return result;
	}

	public void uploadHit(int no) {
		try {
			openConn();
			sql = "update notice_board set notice_board_hit = notice_board_hit + 1 where notice_board_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
	}

	// Notice DAO

	// 사용자가 입력한 id와 pwd 가 유효한 값인지 check 하는 매서드.
	public int checkUserLogin(UserDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "select * from user where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_id());

			rs = pstmt.executeQuery();

			if (rs.next()) { // 입력받은 아이디와 일치한 아이디가 DB에 존재할 경우
				if (dto.getUser_pwd().equals(rs.getString("user_pwd"))) { // 아이디가 존재하고, 입력받은 pwd가 일치 할 경우
					result = 1;
				} else { // 일치하는 아이디가 DB에 존재하지만 입력한 비밀번호가 틀린경우
					result = -1;
				}
			} else { // 입력받은 아이디가 DB에 존재하지 않을 경우.
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	} // checkUserLogin(dto) end.

	// 로그인 페이지에서 유효성 검사를 통과 후 관련 회원 정보를 모두 불러오는 매서드.
	public UserDTO getUserContent(UserDTO dto) {

		UserDTO cont = new UserDTO();

		try {

			openConn();

			sql = "select * from user where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {

				cont.setUser_no(rs.getString("user_no"));
				cont.setUser_id(rs.getString("user_id"));
				cont.setUser_pwd(rs.getString("user_pwd"));
				cont.setUser_name(rs.getString("user_name"));
				cont.setUser_phone(rs.getString("user_phone"));
				cont.setUser_email(rs.getString("user_email"));
				cont.setUser_mileage(rs.getInt("user_mileage"));
				cont.setUser_grade(rs.getString("user_grade"));
				cont.setUser_regdate(rs.getString("user_regdate"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cont;
	} // userContent(dto) end.

	// User_no 으로 회원정보를 조회하는 매서드(오버로딩).
	public UserDTO getUserContent(String user_no) {

		UserDTO cont = new UserDTO();

		try {

			openConn();

			sql = "select * from user where user_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, user_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cont.setUser_no(rs.getString("user_no"));
				cont.setUser_id(rs.getString("user_id"));
				cont.setUser_pwd(rs.getString("user_pwd"));
				cont.setUser_name(rs.getString("user_name"));
				cont.setUser_phone(rs.getString("user_phone"));
				cont.setUser_email(rs.getString("user_email"));
				cont.setUser_mileage(rs.getInt("user_mileage"));
				cont.setUser_grade(rs.getString("user_grade"));
				cont.setUser_regdate(rs.getString("user_regdate"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cont;
	} // userContent(user_no) end.

	// 회원가입 시 로그 남기는 메서드
	public void remainSignup(String id) {

		String log_type = "signup";

		try {
			openConn();

			sql = "insert into log values(default, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, log_type);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

	} // remainSignup(id) end.

	// 오늘 로그인 기록이 있는지 확인하는 메서드
	public String checkLoginToday(String user_id) {

		String log_type = "login";
		String result = null;

		try {
			openConn();

			// 회원번호의 가장 최근 로그인 기록 조회
			sql = "select max(date_format(log_date, '%Y%m%d')) from log where log_user_id like ? and log_type like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, log_type);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	// 사용자 로그아웃 시 log 남기는 매서드.
	public void remainLogout(String user_no) {

		String user_id = null;
		String log_type = "logout";

		try {
			openConn();

			sql = "select user_id from user where user_no like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user_id = rs.getString(1);
			}

			sql = "insert into log values(default, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, log_type);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	// 사용자 로그아웃 시 log 남기는 매서드.
	public void remainAdminLogout(String admin_no) {

		String admin_id = null;
		String log_type = "logout";

		try {
			openConn();

			sql = "select admin_id from admin where admin_no like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				admin_id = rs.getString(1);
			}

			sql = "insert into log values(default, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, log_type);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	// 회원가입 마일리지 적립 메서드
	public void setMileageSignup(String id) {

		int mileage = 10000; // 회원가입 시 적립할 마일리지
		String mileage_cont = "회원가입 적립금"; // 마일리지 적립 내용
		String mileage_type = mileage >= 0 ? "+" : "-"; // +, - 구분
		int user_mileage = 0;
		String user_grade = null;

		try {
			openConn();

			// 회원 DB에 마일리지 적립
			sql = "update user set user_mileage = user_mileage + ? where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mileage);
			pstmt.setString(2, id);

			pstmt.executeUpdate();

			// 마일리지 적립 후 회원의 마일리지 상태 가져오기
			sql = "select user_mileage from user where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user_mileage = rs.getInt(1);
			}

			// 마일리지 상태에 따라 등급을 나눠주는 메서드
			user_grade = StaticArea.getUserGrade(user_mileage);

			// 마일리지 상태에 맞게 등급을 user 테이블에 적용시켜주는 메서드
			sql = "update user set user_grade = ? where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_grade);
			pstmt.setString(2, id);

			pstmt.executeUpdate();

			// 마일리지 테이블에 마일리지 적립 내역 저장
			sql = "insert into mileage values(?, default, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, mileage_cont);
			pstmt.setString(3, mileage_type);
			pstmt.setInt(4, mileage);
			pstmt.setInt(5, user_mileage);
			pstmt.setString(6, user_grade);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	// 회원번호로 마일리지 내역 조회하는 메서드
	public List<MileageDTO> getUserMileage(String user_no) {

		List<MileageDTO> list = new ArrayList<>();

		try {
			openConn();

			sql = "select * from mileage where mileage_user_no like ? order by mileage_date";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MileageDTO dto = new MileageDTO();

				dto.setMileage_user_id(rs.getString("mileage_user_id"));
				dto.setMileage_date(rs.getString("mileage_date"));
				dto.setMileage_cont(rs.getString("mileage_cont"));
				dto.setMileage_type(rs.getString("mileage_type"));
				dto.setMileage_amount(rs.getInt("mileage_amount"));
				dto.setMileage_status(rs.getInt("mileage_status"));
				dto.setMileage_grade(rs.getString("mileage_grade"));

				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	// 로그인 마일리지 적립 메서드
	public void setMileageLogin(String user_id) {

		int mileage = 100; // 로그인 시 적립할 마일리지
		String mileage_cont = "로그인 적립금"; // 적립 내용
		String mileage_type = mileage >= 0 ? "+" : "-"; // +, - 구분
		int user_mileage = 0;
		String user_grade = null;

		try {
			openConn();

			// 로그인 시 입력받은 아이디로 마일리지 적립
			sql = "update user set user_mileage = user_mileage + ? where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mileage);
			pstmt.setString(2, user_id);

			pstmt.executeUpdate();

			// 회원 아이디로 회원번호, 적립 후 마일리지 조회
			sql = "select user_no, user_mileage from user where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user_mileage = rs.getInt("user_mileage");
			}

			// 마일리지에 따라 등급을 나누는 메서드
			user_grade = StaticArea.getUserGrade(user_mileage);

			// 등급 변경 후 user 테이블의 등급 변경
			sql = "update user set user_grade = ? where user_id like ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_grade);
			pstmt.setString(2, user_id);

			pstmt.executeUpdate();

			// mileage 테이블에 마일리지 적립 내역 저장
			sql = "insert into mileage values(?, default, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, mileage_cont);
			pstmt.setString(3, mileage_type);
			pstmt.setInt(4, mileage);
			pstmt.setInt(5, user_mileage);
			pstmt.setString(6, user_grade);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	// 로그인 시 로그 남기는 메서드
	public void remainLogin(String user_id) {

		String log_type = "login";

		try {
			openConn();

			sql = "insert into log values(default, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, log_type);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	// 로그인 시 로그 남기는 메서드
	public void remainAdminLogin(String id) {

		String log_type = "login";

		try {
			openConn();

			sql = "insert into log values(default, ?, ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, log_type);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}

	public int checkAdminLogin(AdminDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "select * from admin where admin_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getAdmin_id());

			rs = pstmt.executeQuery();

			if (rs.next()) { // 입력받은 아이디와 일치한 아이디가 DB에 존재할 경우
				if (dto.getAdmin_pwd().equals(rs.getString("admin_pwd"))) { // 아이디가 존재하고, 입력받은 pwd가 일치 할 경우
					result = 1;
				} else { // 일치하는 아이디가 DB에 존재하지만 입력한 비밀번호가 틀린경우
					result = -1;
				}
			} else { // 입력받은 아이디가 DB에 존재하지 않을 경우.
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}

	public AdminDTO getAdminContent(AdminDTO dto) {

		AdminDTO cont = new AdminDTO();

		try {

			openConn();

			sql = "select * from admin where admin_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getAdmin_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cont.setAdmin_no(rs.getString("admin_no"));
				cont.setAdmin_id(rs.getString("admin_id"));
				cont.setAdmin_pwd(rs.getString("admin_pwd"));
				cont.setAdmin_name(rs.getString("admin_name"));
				cont.setAdmin_phone(rs.getString("admin_phone"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cont;
	}

	// 관리자페이지 객실현황 페이지에 DB에 저장된 RoomInfo의 리스트를 가져오는 매서드.
	public List<RoomInfoDTO> getRoomInfoList(String date) {

		List<RoomInfoDTO> list = new ArrayList<RoomInfoDTO>();

		try {

			openConn();

			sql = "select ri.room_type, ri.room_area, ri.room_maximum, ri.room_price, ri.room_total, coalesce(ar.available_rooms, 0) as available_rooms "
					+ "from room_info ri " + "left join (" + "select r.room_type, count(*) as available_rooms "
					+ "from rooms r " + "where r.room_no not in (" + "select res_room_no " + "from reservation "
					+ "where ? between res_in_date and res_out_date) " + "group by r.room_type "
					+ ") ar on ri.room_type = ar.room_type";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, date);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				RoomInfoDTO dto = new RoomInfoDTO();

				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_area(rs.getDouble("room_area"));
				dto.setRoom_maximum(rs.getInt("room_maximum"));
				dto.setRoom_price(rs.getInt("room_price"));
				dto.setRoom_total(rs.getInt("room_total"));
				dto.setRoom_available(rs.getInt("available_rooms"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getRoomInfoList() end.

	// 관리자페이지 객실현황 페이지에 DB에 저장된 RoomInfo의 리스트를 가져오는 매서드.
	public List<RoomInfoDTO> getRoomInfoList(String date, String type) {

		List<RoomInfoDTO> list = new ArrayList<RoomInfoDTO>();

		try {

			openConn();

			sql = "select ri.room_type, ri.room_area, ri.room_maximum, ri.room_price, ri.room_total, coalesce(ar.available_rooms, 0) as available_rooms "
					+ "from room_info ri " + "left join (" + "select r.room_type, count(*) as available_rooms "
					+ "from rooms r " + "where r.room_no not in (" + "select res_room_no " + "from reservation "
					+ "where ? between res_in_date and res_out_date) " + "group by r.room_type "
					+ ") ar on ri.room_type = ar.room_type where ri.room_type = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, date);
			pstmt.setString(2, type);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				RoomInfoDTO dto = new RoomInfoDTO();

				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_total(rs.getInt("room_total"));
				dto.setRoom_available(rs.getInt("available_rooms"));
				dto.setRoom_area(rs.getDouble("room_area"));
				dto.setRoom_maximum(rs.getInt("room_maximum"));
				dto.setRoom_price(rs.getInt("room_price"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getRoomInfoList() end.

	// DB에 저장된 Room_type의 리스트를 가져오는 매서드
	public List<String> getRoomTypeList() {

		List<String> list = new ArrayList<String>();

		try {

			openConn();

			sql = "select room_type from room_info order by room_price desc";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getRoomTypeList() end.

	// 가져온 객실 타입에 대한 rooms 테이블의 리스트를 가져오는 매서드.
	public List<RoomsDTO> getRoomsList(String date, String type, int page, int rowsize) {

		List<RoomsDTO> list = new ArrayList<RoomsDTO>();

		int offset = (page - 1) * rowsize;

		try {

			openConn();

			sql = "select * from rooms where room_no not in (select res_room_no from reservation where (? between res_in_date and res_out_date)) and room_type = ? order by room_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, date);
			pstmt.setString(2, type);
			pstmt.setInt(3, offset);
			pstmt.setInt(4, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				RoomsDTO dto = new RoomsDTO();

				dto.setRoom_no(rs.getString("room_no"));
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_status(rs.getBoolean("room_status"));

				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getRoomsList() end.

	public List<String> getRoomNoList(String type) {

		List<String> list = new ArrayList<String>();

		String no = null;

		try {

			openConn();

			sql = "select * from rooms where room_type = ? order by room_no desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, type);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				no = rs.getString("room_no");

				list.add(no);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getRoomsList() end.

	// 가져온 객실 타입에 대한 rooms 테이블의 리스트를 가져오는 페이지에서 페이징 처리를 위한 카운트 매서드.
	public int countRoomTypeList(String date, String type) {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(room_no) from rooms where room_no not in (select res_room_no from reservation where (? between res_in_date and res_out_date)) and room_type = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, date);
			pstmt.setString(2, type);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cnt;
	} // countRoomTypeList() end.

	// 관리자 페이지에서 객실 타입별 해당 월에 예약한 예약수를 카운트 하는 매서드
	public List<Integer> countRoomTypeMonthList(String date) {

		List<Integer> list = new ArrayList<Integer>();

		try {

			openConn();

			sql = "SELECT COALESCE(COUNT(r.res_no), 0) AS reservations_count " + "FROM room_info ri "
					+ "LEFT JOIN rooms rm ON ri.room_type = rm.room_type "
					+ "LEFT JOIN reservation r ON rm.room_no = r.res_room_no AND MONTH(r.res_regdate) = MONTH(NOW()) "
					+ "GROUP BY ri.room_type order by room_price desc";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt("reservations_count"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // countRoomTypeList() end.

	// 메인 페이지 공지사항 테이블에 최근 공지사항 게시글 5개만 가져오는 매서드.
	public List<NoticeBoardDTO> printNoticeMain() {

		List<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();

		try {

			openConn();

			sql = "select * from notice_board order by notice_board_no desc limit 6";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();

				dto.setNotice_board_no(rs.getInt("notice_board_no"));
				dto.setNotice_board_title(rs.getString("notice_board_title"));
				dto.setNotice_board_date(rs.getString("notice_board_date"));
				dto.setNotice_board_update(rs.getString("notice_board_update"));

				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // printNoticeMain() end.

	// 관리자 페이지에서 조회한 room_info의 상세정보를 가져오는 매서드.
	public RoomInfoDTO getRoomInfoContent(String type) {

		RoomInfoDTO dto = null;

		try {

			openConn();

			sql = "select * from room_info where room_type = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, type);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new RoomInfoDTO();

				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_total(rs.getInt("room_total"));
				dto.setRoom_available(rs.getInt("room_available"));
				dto.setRoom_maximum(rs.getInt("room_maximum"));
				dto.setRoom_area(rs.getDouble("room_area"));
				dto.setRoom_price(rs.getInt("room_price"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	} // getRoomInfoContent() end.

	// Review DAO
	// 페이징 처리를 위한 ReviewBoard 카운트 매서드.
	public int countReviewList() {

		int cnt = 0;

		try {
			openConn();

			sql = "select count(review_board_no) from review_board";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);

		}
		return cnt;
	}// countReviewList() end

	public List<ReviewBoardDTO> getReviewList(int page, int rowsize) {

		List<ReviewBoardDTO> list = new ArrayList<ReviewBoardDTO>();

		int offset = (page - 1) * rowsize;

		try {

			ReviewBoardDTO dto = null;

			openConn();

			sql = "select * from review_board order by review_board_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ReviewBoardDTO();

				dto.setReview_board_no(rs.getInt("review_board_no"));
				dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
				dto.setReview_board_res_no(rs.getString("review_board_res_no"));
				dto.setReview_board_cont(rs.getString("review_board_cont"));
				dto.setReview_board_date(rs.getString("review_board_date"));
				dto.setReview_board_update(rs.getString("review_board_update"));
				dto.setReview_board_file(rs.getString("review_board_file"));
				dto.setReview_board_hit(rs.getInt("review_board_hit"));
				dto.setReview_board_point(rs.getFloat("review_board_point"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;

	}// getReviewList(int page,int rowsize) end

	public ReviewBoardDTO getReviewContent(int no) {

		ReviewBoardDTO dto = null;

		try {

			openConn();

			sql = "select * from review_board where review_board_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ReviewBoardDTO();

				dto.setReview_board_no(rs.getInt("review_board_no"));
				dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
				dto.setReview_board_res_no(rs.getString("review_board_res_no"));
				dto.setReview_board_cont(rs.getString("review_board_cont"));
				dto.setReview_board_date(rs.getString("review_board_date"));
				dto.setReview_board_update(rs.getString("review_board_update"));
				dto.setReview_board_file(rs.getString("review_board_file"));
				dto.setReview_board_hit(rs.getInt("review_board_hit"));
				dto.setReview_board_point(rs.getFloat("review_board_point"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}

	public int modifyReviewBoard(ReviewBoardDTO dto) {

		int result = 0;

		try {
			openConn();

			if (dto.getReview_board_file() != null) {

				sql = "update review_board set review_board_cont = ?, review_board_update = now() ,review_board_file = ? where review_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getReview_board_cont());
				pstmt.setString(2, dto.getReview_board_file());
				pstmt.setInt(3, dto.getReview_board_no());

			} else if (dto.getReview_board_file() == null) {

				sql = "update review_board set review_board_cont = ?, review_board_update = now() where review_board_no = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dto.getReview_board_cont());
				pstmt.setInt(2, dto.getReview_board_no());

			}

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;

	}// modifyReviewBoard(ReviewBoardDTO dto) end

	public int deleteReviewBoard(int no) {

		int result = 0;

		try {
			openConn();

			con.setAutoCommit(false);

			sql = "delete from review_board where review_board_no = ? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

			if (result > 0) {

				sql = "update review_board set review_board_no = review_board_no - 1 where review_board_no > ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeConn(pstmt, con);
		}
		return result;
	}// deleteReviewBoard(int no) end

	public int countReviewSearchList(String field, String keyword) {

		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select count(*) from review_board where review_board_writer_id like ? or review_board_res_no like ? or review_board_point = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("작성자")) {

			try {

				sql = "select count(*) from review_board where review_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("예약번호")) {

			try {

				sql = "select count(*) from review_board where review_board_res_no like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("별점")) {

			try {

				sql = "select count(*) from review_board where review_board_point like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return cnt;
	}// countReviewSearchList(String field, String keyword);

	public List<ReviewBoardDTO> searchReviewList(String field, String keyword, int page, int rowsize) {

		List<ReviewBoardDTO> list = new ArrayList<ReviewBoardDTO>();

		int offset = (page - 1) * rowsize;

		if (field.equals("전체")) {

			try {

				openConn();

				sql = "select * from review_board where "
						+ "review_board_writer_id like ? or review_board_res_no like ? or review_board_point = ? "
						+ "order by review_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setInt(4, offset);
				pstmt.setInt(5, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					ReviewBoardDTO dto = new ReviewBoardDTO();

					dto.setReview_board_no(rs.getInt("review_board_no"));
					dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
					dto.setReview_board_res_no(rs.getString("review_board_res_no"));
					dto.setReview_board_cont(rs.getString("review_board_cont"));
					dto.setReview_board_date(rs.getString("review_board_date"));
					dto.setReview_board_update(rs.getString("review_board_update"));
					dto.setReview_board_file(rs.getString("review_board_file"));
					dto.setReview_board_hit(rs.getInt("review_board_hit"));
					dto.setReview_board_point(rs.getFloat("review_board_point"));

					list.add(dto);

				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("작성자")) {

			try {

				openConn();

				sql = "select * from review_board where review_board_writer_id like ? "
						+ "order by review_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReviewBoardDTO dto = new ReviewBoardDTO();

					dto.setReview_board_no(rs.getInt("review_board_no"));
					dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
					dto.setReview_board_res_no(rs.getString("review_board_res_no"));
					dto.setReview_board_cont(rs.getString("review_board_cont"));
					dto.setReview_board_date(rs.getString("review_board_date"));
					dto.setReview_board_update(rs.getString("review_board_update"));
					dto.setReview_board_file(rs.getString("review_board_file"));
					dto.setReview_board_hit(rs.getInt("review_board_hit"));
					dto.setReview_board_point(rs.getFloat("review_board_point"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("예약번호")) {

			try {

				openConn();

				sql = "select * from review_board where review_board_res_no like ? "
						+ "order by review_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReviewBoardDTO dto = new ReviewBoardDTO();

					dto.setReview_board_no(rs.getInt("review_board_no"));
					dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
					dto.setReview_board_res_no(rs.getString("review_board_res_no"));
					dto.setReview_board_cont(rs.getString("review_board_cont"));
					dto.setReview_board_date(rs.getString("review_board_date"));
					dto.setReview_board_update(rs.getString("review_board_update"));
					dto.setReview_board_file(rs.getString("review_board_file"));
					dto.setReview_board_hit(rs.getInt("review_board_hit"));
					dto.setReview_board_point(rs.getFloat("review_board_point"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("별점")) {

			try {

				openConn();

				sql = "select * from review_board where review_board_point like ? "
						+ "order by review_board_no desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					ReviewBoardDTO dto = new ReviewBoardDTO();

					dto.setReview_board_no(rs.getInt("review_board_no"));
					dto.setReview_board_writer_id(rs.getString("review_board_writer_id"));
					dto.setReview_board_res_no(rs.getString("review_board_res_no"));
					dto.setReview_board_cont(rs.getString("review_board_cont"));
					dto.setReview_board_date(rs.getString("review_board_date"));
					dto.setReview_board_update(rs.getString("review_board_update"));
					dto.setReview_board_file(rs.getString("review_board_file"));
					dto.setReview_board_hit(rs.getInt("review_board_hit"));
					dto.setReview_board_point(rs.getFloat("review_board_point"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return list;
	} // searchReviewList(String field, String keyword, int page, int rowsize) end

	// Activity Part
	public int countActivityList() {

		int cnt = 0;

		try {
			openConn();

			sql = "select count(activity_id) from activity_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);

		}
		return cnt;

	}// countActivityList() end

	public List<ActivityInfoDTO> getActivityList(int page, int rowsize) {

		List<ActivityInfoDTO> list = new ArrayList<ActivityInfoDTO>();

		int offset = (page - 1) * rowsize;

		ActivityInfoDTO dto = null;

		try {
			openConn();

			sql = "select * from activity_info order by activity_id desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new ActivityInfoDTO();

				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_type(rs.getString("activity_type"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setActivity_start_time(rs.getString("activity_start_time"));
				dto.setActivity_end_time(rs.getString("activity_end_time"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}// getActivityList(int page, int rowsize) end

	public int insertActivityBoard(ActivityInfoDTO dto) {

		int result = 0, cnt = 0;

		try {
			openConn();

			sql = "select max(activity_id) from activity_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

			sql = "insert into activity_info values(?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt + 1);
			pstmt.setString(2, dto.getActivity_type());
			pstmt.setString(3, dto.getActivity_name());
			pstmt.setString(4, dto.getActivity_start_time());
			pstmt.setString(5, dto.getActivity_end_time());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	}// insertActivityBoard(ActivityInfoDTO dto) end

	public ActivityInfoDTO getActivityContent(int no) {

		ActivityInfoDTO dto = null;

		try {
			openConn();

			sql = "select * from activity_info where activity_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ActivityInfoDTO();

				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_type(rs.getString("activity_type"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setActivity_start_time(rs.getString("activity_start_time"));
				dto.setActivity_end_time(rs.getString("activity_end_time"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}

	public int modifyActivityBoard(ActivityInfoDTO dto) {

		int result = 0;

		try {
			openConn();

			sql = "update activity_info set activity_type = ?, activity_name = ?, activity_start_time = ?, activity_end_time = ?"
					+ "where activity_id=? ";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getActivity_type());
			pstmt.setString(2, dto.getActivity_name());
			pstmt.setString(3, dto.getActivity_start_time());
			pstmt.setString(4, dto.getActivity_end_time());
			pstmt.setInt(5, dto.getActivity_id());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;

	}// modifyActivityBoard(ActivityInfoDTO dto) end

	public List<String> getActivityTypeList() {

		List<String> list = new ArrayList<String>();

		try {
			openConn();

			sql = "select distinct(activity_type) from activity_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString("activity_type"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// getActivity_type() end

	public int deleteActivityBoard(int no) {

		int result = 0;

		try {
			openConn();

			con.setAutoCommit(false);

			sql = "delete from activity_info where activity_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

			if (result > 0) {
				sql = "update activity_info set activity_id = activity_id - 1 where activity_id > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeConn(pstmt, con);
		}

		return result;

	}// deleteActivityBoard(int no) end

	public int countActivitySearchList(String activity_type) {

		int cnt = 0;

		openConn();

		if (activity_type.equals("전체")) {

			try {

				sql = "select count(*)from activity_info";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else {

			try {

				sql = "select count(*) from activity_info where activity_type = ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, activity_type);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return cnt;
	}// countActivitySearchList(field, keyword);

	public List<ActivityInfoDTO> searchActivityList(String type, int page, int rowsize) {

		List<ActivityInfoDTO> list = new ArrayList<ActivityInfoDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (type.equals("전체")) {

			try {
				sql = "select * from activity_Info order by activity_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, offset);
				pstmt.setInt(2, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					ActivityInfoDTO dto = new ActivityInfoDTO();

					dto.setActivity_id(rs.getInt("activity_id"));
					dto.setActivity_type(rs.getString("activity_type"));
					dto.setActivity_name(rs.getString("activity_name"));
					dto.setActivity_start_time(rs.getString("activity_start_time"));
					dto.setActivity_end_time(rs.getString("activity_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else {

			try {
				sql = "select * from activity_Info where activity_type = ? order by activity_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, type);
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					ActivityInfoDTO dto = new ActivityInfoDTO();

					dto.setActivity_id(rs.getInt("activity_id"));
					dto.setActivity_type(rs.getString("activity_type"));
					dto.setActivity_name(rs.getString("activity_name"));
					dto.setActivity_start_time(rs.getString("activity_start_time"));
					dto.setActivity_end_time(rs.getString("activity_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;
	}// dao.searchActivityList(field, keyword, page, rowsize);

	// 고객이 선택한 날짜에 예약이 가능한 룸 타입을 조회하는 매서드.
	public List<RoomInfoDTO> checkScheduleRoom(ReservationDTO dto) {

		List<RoomInfoDTO> list = new ArrayList<RoomInfoDTO>();

		try {

			openConn();

			sql = "select distinct(room_type) from rooms "
					+ "where room_no not in (select res_room_no from reservation where "
					+ "(res_in_date < ? and res_out_date > ?))";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getRes_out_date());
			pstmt.setString(2, dto.getRes_in_date());

			rs = pstmt.executeQuery();

			while (rs.next()) {

				RoomInfoDTO cont = new RoomInfoDTO();

				cont.setRoom_type(rs.getString("room_type"));

				list.add(cont);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // checkScheduleRoom() end.

	// 고객의 예약 정보를 DB에 insert 하는 매서드.
	public int insertReservationInfo(ReservationDTO dto) {

		int result = 0, cnt = 0;

		try {

			openConn();

			sql = "select count(res_no) from reservation where res_no like ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getRes_no() + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1) + 1;
			}

			sql = "insert into reservation values(?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default)";

			pstmt = con.prepareStatement(sql);

			if (dto.getRes_user_id() != null) {

				if (cnt < 10) {
					pstmt.setString(1, dto.getRes_no() + "00" + cnt);
				} else if (cnt < 100) {
					pstmt.setString(1, dto.getRes_no() + "0" + cnt);
				} else {
					pstmt.setString(1, dto.getRes_no() + cnt);
				}
				pstmt.setString(2, dto.getRes_user_id());
				pstmt.setString(3, dto.getRes_room_no());
				pstmt.setString(4, dto.getRes_room_type());
				pstmt.setString(5, dto.getRes_user_phone());
				pstmt.setInt(6, dto.getRes_peoples());
				pstmt.setString(7, dto.getRes_in_date());
				pstmt.setString(8, dto.getRes_out_date());

				result = pstmt.executeUpdate();
			} else {
				result = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;
	} // insertReservationInfo() end.

	// 고객이 선택한 날짜와 룸 타입으로 예약 가능한 방 번호를 조회후 리스트로 가져오는 매서드.
	public String getRoomNo(ReservationDTO dto) {

		String room_no = null;

		try {

			openConn();

			sql = "select room_no from rooms where room_no not in (select res_room_no from reservation where "
					+ "(res_in_date < ? and res_out_date > ?)) and room_type = ? order by room_no";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getRes_out_date());
			pstmt.setString(2, dto.getRes_in_date());
			pstmt.setString(3, dto.getRes_room_type());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				room_no = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return room_no;
	} // getRoomNo() end.

	// 예약 확인 페이지에 보여줄 정보를 가져오기 위해 해당 유저의 아이디로 조회후 가장 최근 예약정보를 가져오는 매서드.
	public String getRecentReservationNo(String id) {

		String res_no = null;

		try {

			openConn();

			sql = "select * from reservation where res_user_id = ? order by res_regdate desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				res_no = rs.getString("res_no");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res_no;
	} // getRecentReservationNo() end.

	// 예약확인 페이지에 보여줄 정보를 가져오는 매서드.
	public ReservationDTO getReservationContent(String res_no) {

		ReservationDTO dto = null;

		try {

			openConn();

			sql = "select * from reservation where res_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, res_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_user_id(rs.getString("res_user_id"));
				dto.setRes_room_no(rs.getString("res_room_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_user_phone(rs.getString("res_user_phone"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_payment_status(rs.getBoolean("res_payment_status"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	} // getReservationContent() end.

	public ReservationDTO getReservationContent(String res_no, String phone) {

		ReservationDTO dto = null;

		try {

			openConn();

			sql = "select * from reservation where res_no = ? and res_user_phone = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, res_no);
			pstmt.setString(2, phone);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_user_id(rs.getString("res_user_id"));
				dto.setRes_room_no(rs.getString("res_room_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_user_phone(rs.getString("res_user_phone"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_payment_status(rs.getBoolean("res_payment_status"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return dto;
	}

	// 마이페이지 예약 내역
	// countReservationList
	public int countReservationList(String userId) {
		
		int cnt = 0;

		try {
			openConn();

			sql = "select count(res_no) from reservation where res_user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}// countReservationList

	// List<ReservationDTO> getReservation
	public List<ReservationDTO> searchReservation(int page, int rowsize, String userId) {
		List<ReservationDTO> list = new ArrayList<>();
		
		int offset = (page - 1) * rowsize;

		try {
			openConn();

			sql = "select * from reservation where res_user_id = ? order by res_no desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// List<ReservationDTO> getReservation

	// 마이페이지 예약 내역
	// countReservationList(String field, String user_id)
	public int countReservationList(String field, String res_user_id) {

		int cnt = 0;

		openConn();

		try {

			if (field.equals("6월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-06%' AND res_user_id = ?";
			} else if (field.equals("5월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-05%' AND res_user_id = ?";
			} else if (field.equals("4월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-04%' AND res_user_id = ?";
			} else if (field.equals("3월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-03%' AND res_user_id = ?";
			} else if (field.equals("2월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-02%' AND res_user_id = ?";
			} else if (field.equals("1월")) {
				sql = "SELECT COUNT(*) FROM reservation WHERE res_regdate LIKE '2024-01%' AND res_user_id = ?";
			}

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, res_user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}// countReservationList(String field, String user_id)

	// List<ReservationDTO> searchReservation(String field, int page, int rowsize,
	// String user_id
	public List<ReservationDTO> searchReservation(String field, int page, int rowsize, String res_user_id) {
		List<ReservationDTO> list = new ArrayList<>();
		int offset = (page - 1) * rowsize;

		openConn();

		try {
			String sql = "";
			if (field.equals("6월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-06%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			} else if (field.equals("5월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-05%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			} else if (field.equals("4월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-04%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			} else if (field.equals("3월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-03%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			} else if (field.equals("2월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-02%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			} else if (field.equals("1월")) {
				sql = "SELECT * FROM reservation WHERE res_regdate LIKE '2024-01%' AND res_user_id = ? ORDER BY res_regdate DESC LIMIT ?, ?";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, res_user_id);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReservationDTO dto = new ReservationDTO();
				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate")); // res_regdate 설정 추가
				dto.setRes_review_status(rs.getBoolean("res_review_status"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// List<ReservationDTO> searchReservation(String field, int page, int rowsize,
		// String user_id
		// 마이페이지 예약 내역

	// 전체 관리자 수를 카운트 하는 매서드.
	public int countAdminList() {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(admin_no) from admin";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cnt;
	} // countAdminList() end.

	// 관리자 리스트 페이징 후 리스트 가져오는 매서드.
	public List<AdminDTO> getAdminUserList(int page, int rowsize) {

		List<AdminDTO> list = new ArrayList<AdminDTO>();

		int offset = (page - 1) * rowsize;

		try {

			openConn();

			sql = "select * from admin order by admin_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				AdminDTO dto = new AdminDTO();

				dto.setAdmin_no(rs.getString("admin_no"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_phone(rs.getString("admin_phone"));
				dto.setAdmin_job(rs.getString("admin_job"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getAdminUserList() end.

	// getAdminJobList
	public List<String> getAdminJobList() {

		List<String> list = new ArrayList<String>();

		try {

			openConn();

			sql = "select distinct(admin_job) from admin";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				String job = rs.getString("admin_job");

				list.add(job);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // getAdminJobList

	// insertAdmin(AdminDTO dto)
	public int insertAdmin(AdminDTO dto) {

		int result = 0, no = 0;

		try {
			openConn();

			sql = "select count(admin_no) from admin";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				no = rs.getInt(1) + 1;
			}

			sql = "insert into admin values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			if (no < 10) {
				pstmt.setString(1, "A00" + no);
			} else if (no < 100) {
				pstmt.setString(1, "A0" + no);
			} else {
				pstmt.setString(1, "A" + no);
			}

			pstmt.setString(2, dto.getAdmin_id());
			pstmt.setString(3, dto.getAdmin_pwd());
			pstmt.setString(4, dto.getAdmin_name());
			pstmt.setString(5, dto.getAdmin_job());
			pstmt.setString(6, dto.getAdmin_phone());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	// insertAdmin(AdminDTO dto)

	// getAdminContent(String no)
	public AdminDTO getAdminContent(String no) {

		AdminDTO dto = new AdminDTO();

		try {

			openConn();

			sql = "select * from admin where admin_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setAdmin_no(rs.getString("admin_no"));
				dto.setAdmin_id(rs.getString("admin_id"));
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_job(rs.getString("admin_job"));
				dto.setAdmin_phone(rs.getString("admin_phone"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// getAdminContent(String no)

	public int updateAdmin(AdminDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "update admin set admin_pwd = ?, admin_name = ?, admin_job = ?, admin_phone = ?  where admin_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getAdmin_pwd());
			pstmt.setString(2, dto.getAdmin_name());
			pstmt.setString(3, dto.getAdmin_job());
			pstmt.setString(4, dto.getAdmin_phone());
			pstmt.setString(5, dto.getAdmin_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	public int deleteAdmin(String no) {

		int result = 0;

		try {
			openConn();

			sql = "DELETE FROM admin WHERE admin_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, no);

			result = pstmt.executeUpdate();

			if (result > 0) {
				sql = "UPDATE admin SET admin_no = CONCAT('A', LPAD(SUBSTR(admin_no, 2) - 1, 3, '0')) WHERE admin_no > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	public List<AdminDTO> searchAdminList(String field, String keyword, int page, int rowsize) {

		List<AdminDTO> list = new ArrayList<AdminDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select * from admin where admin_name like ? or admin_phone like ? or admin_job like ? limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");
				pstmt.setInt(4, offset);
				pstmt.setInt(5, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					AdminDTO dto = new AdminDTO();

					dto.setAdmin_no(rs.getString("admin_no"));
					dto.setAdmin_phone(rs.getString("admin_phone"));
					dto.setAdmin_name(rs.getString("admin_name"));
					dto.setAdmin_job(rs.getString("admin_job"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setAdmin_pwd(rs.getString("admin_pwd"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("이름")) {

			try {

				sql = "select * from admin where admin_name like ? limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					AdminDTO dto = new AdminDTO();

					dto.setAdmin_no(rs.getString("admin_no"));
					dto.setAdmin_phone(rs.getString("admin_phone"));
					dto.setAdmin_name(rs.getString("admin_name"));
					dto.setAdmin_job(rs.getString("admin_job"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setAdmin_pwd(rs.getString("admin_pwd"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("연락처")) {

			try {

				sql = "select * from admin where admin_phone like ? limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					AdminDTO dto = new AdminDTO();

					dto.setAdmin_no(rs.getString("admin_no"));
					dto.setAdmin_phone(rs.getString("admin_phone"));
					dto.setAdmin_name(rs.getString("admin_name"));
					dto.setAdmin_job(rs.getString("admin_job"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setAdmin_pwd(rs.getString("admin_pwd"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("직책")) {

			try {

				sql = "select * from admin where admin_job like ? limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					AdminDTO dto = new AdminDTO();

					dto.setAdmin_no(rs.getString("admin_no"));
					dto.setAdmin_phone(rs.getString("admin_phone"));
					dto.setAdmin_name(rs.getString("admin_name"));
					dto.setAdmin_job(rs.getString("admin_job"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setAdmin_pwd(rs.getString("admin_pwd"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return list;
	}

	// countAdminSearchList
	public int countAdminSearchList(String field, String keyword) {

		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {
				sql = "select count(*) from admin where admin_name like ? or admin_phone like ? or admin_job like ?";

				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("이름")) {

			try {

				sql = "select count(*) from admin where admin_name like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("연락처")) {

			try {

				sql = "select count(*) from admin where admin_phone like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (field.equals("직책")) {

			try {

				sql = "select count(*) from admin where admin_job like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return cnt;
	}// countAdminSearchList

	// DB의 Room_info 테이블의 방 타입에 관한 정보를 update하는 매서드.
	public int updateRoomModify(RoomInfoDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "update room_info set room_area = ?, room_maximum = ?, room_price = ?, room_total = ? where room_type = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setDouble(1, dto.getRoom_area());
			pstmt.setInt(2, dto.getRoom_maximum());
			pstmt.setInt(3, dto.getRoom_price());
			pstmt.setInt(4, dto.getRoom_total());
			pstmt.setString(5, dto.getRoom_type());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	} // updateRoomModify() end.

	// DB에서 해당 type의 RoomInfo 컬럼을 삭제하는 매서드.
	public int deleteRoomInfo(String type) {

		int result = 0;

		try {

			openConn();

			fkCheckOff();

			sql = "delete from room_info where room_type = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, type);

			result = pstmt.executeUpdate();

			fkCheckOn();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	} // deleteRoomInfo() end.

	// 예약에 성공 후 결제정보 테이블에 예약번호, 결제금액 등을 추가하는 매서드.
	public void insertPaymentInfo(PaymentInfoDTO payment) {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(payment_no) from payment_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1) + 1;
			}

			sql = "insert into payment_info(payment_no, payment_res_no, payment_user_id, payment_price) values(?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt);
			pstmt.setString(2, payment.getPayment_res_no());
			pstmt.setString(3, payment.getPayment_user_id());
			pstmt.setInt(4, payment.getPayment_price());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

	} // insertPaymentInfo() end.

	public void updatePaymentInfo(PaymentInfoDTO payment) {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(payment_no) from payment_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1) + 1;
			}

			sql = "insert into payment_info values(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt);
			pstmt.setString(2, payment.getPayment_res_no());
			pstmt.setString(3, payment.getPayment_user_id());
			pstmt.setString(4, payment.getPayment_date());
			pstmt.setInt(5, payment.getPayment_price());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

	} // insertPaymentInfo() end.

	// 관리자페이지 예약 현황 페이지 리스트 뽑는 매서드.
	public List<ReservationDTO> getReservationList(int page, int rowsize) {

		List<ReservationDTO> list = new ArrayList<ReservationDTO>();

		ReservationDTO dto = null;

		int offset = (page - 1) * rowsize;

		try {

			openConn();

			sql = "select * from reservation order by res_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_user_id(rs.getString("res_user_id"));
				dto.setRes_room_no(rs.getString("res_room_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_user_phone(rs.getString("res_user_phone"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_status(rs.getString("res_status"));
				dto.setRes_payment_status(rs.getBoolean("res_payment_status"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));

				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	} // getReservationList() end.

	// 관리자 페이지 예약 현황 리스트의 페이징 처리를 위한 카운트 매서드.
	public int countReservationList() {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(res_no) from reservation";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cnt;
	} // countReservationList() end.

	// 관리자 페이지 검색 후 예약 현황 리스트의 페이징 처리를 위한 카운트 매서드.
	public int countReservationList(ReservationSearchDTO dto) {

		int cnt = 0;

		try {

			openConn();

			sql = "select count(res_no) from reservation where 1 = 1 ";

			if (dto.getField().equals("전체")) {
				sql += "and (res_no like ? or res_user_id like ? or res_user_phone like ?) ";
			} else if (dto.getField().equals("예약번호")) {
				sql += "and res_no like ? ";
			} else if (dto.getField().equals("예약자")) {
				sql += "and res_user_id like ? ";
			} else if (dto.getField().equals("연락처")) {
				sql += "and res_user_phone like ? ";
			}

			if (dto.getStart_regdate() != null && !dto.getStart_regdate().isEmpty()) {
				if (dto.getEnd_regdate() != null && !dto.getEnd_regdate().isEmpty()) {
					sql += "and (res_regdate between ? and ?) ";
				} else {
					sql += "and res_regdate >= ? ";
				}
			}
			if (dto.getEnd_regdate() != null && !dto.getEnd_regdate().isEmpty()) {
				if (dto.getStart_regdate().equals("") && dto.getStart_regdate().isEmpty()) {
					sql += "and res_regdate <= ? ";
				}
			}

			if (dto.getStatus().equals("대기")) {
				sql += "and res_status = ? ";
			} else if (dto.getStatus().equals("체크인")) {
				sql += "and res_status = ? ";
			} else if (dto.getStatus().equals("체크아웃")) {
				sql += "and res_status = ? ";
			}

			pstmt = con.prepareStatement(sql);

			int index = 1;

			if (dto.getField().equals("전체")) {
				pstmt.setString(index++, "%" + dto.getKeyword() + "%");
				pstmt.setString(index++, "%" + dto.getKeyword() + "%");
				pstmt.setString(index++, "%" + dto.getKeyword() + "%");
			} else {
				pstmt.setString(index++, "%" + dto.getKeyword() + "%");
			}

			if (dto.getStart_regdate() != null && !dto.getStart_regdate().isEmpty()) {
				if (dto.getEnd_regdate() != null && !dto.getEnd_regdate().isEmpty()) {
					pstmt.setString(index++, dto.getStart_regdate());
					pstmt.setString(index++, dto.getEnd_regdate());
				} else {
					pstmt.setString(index++, dto.getStart_regdate());
				}
			}
			if (dto.getEnd_regdate() != null && !dto.getEnd_regdate().isEmpty()) {
				if (dto.getStart_regdate().equals("") && dto.getStart_regdate().isEmpty()) {
					pstmt.setString(index++, dto.getEnd_regdate());
				}
			}

			if (dto.getStatus().equals("대기")) {
				pstmt.setString(index++, dto.getStatus());
			} else if (dto.getStatus().equals("체크인")) {
				pstmt.setString(index++, dto.getStatus());
			} else if (dto.getStatus().equals("체크아웃")) {
				pstmt.setString(index++, dto.getStatus());
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return cnt;
	} // countReservationList() end.

	// 관리자 페이지 검색 후 예약 현황 리스트를 가져오는 매서드.
	public List<ReservationDTO> getReservationList(ReservationSearchDTO search, int page, int rowsize) {

		List<ReservationDTO> list = new ArrayList<ReservationDTO>();

		ReservationDTO dto = null;

		int offset = (page - 1) * rowsize;

		try {

			openConn();

			sql = "select * from reservation where 1 = 1 ";

			if (search.getField().equals("전체")) {
				sql += "and (res_no like ? or res_user_id like ? or res_user_phone like ?) ";
			} else if (search.getField().equals("예약번호")) {
				sql += "and res_no like ? ";
			} else if (search.getField().equals("예약자")) {
				sql += "and res_user_id like ? ";
			} else if (search.getField().equals("연락처")) {
				sql += "and res_user_phone like ? ";
			}

			if (search.getStart_regdate() != null && !search.getStart_regdate().isEmpty()) {
				if (search.getEnd_regdate() != null && !search.getEnd_regdate().isEmpty()) {
					sql += "and (res_regdate between ? and ?) ";
				} else {
					sql += "and res_regdate >= ? ";
				}
			}
			if (search.getEnd_regdate() != null && !search.getEnd_regdate().isEmpty()) {
				if (search.getStart_regdate().equals("") && search.getStart_regdate().isEmpty()) {
					sql += "and res_regdate <= ? ";
				}
			}

			if (search.getStatus().equals("대기")) {
				sql += "and res_status = ? ";
			} else if (search.getStatus().equals("체크인")) {
				sql += "and res_status = ? ";
			} else if (search.getStatus().equals("체크아웃")) {
				sql += "and res_status = ? ";
			}

			sql += "order by res_no desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			int index = 1;

			if (search.getField().equals("전체")) {
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
			} else if (search.getField().equals("예약번호")) {
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
			} else if (search.getField().equals("예약자")) {
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
			} else if (search.getField().equals("연락처")) {
				pstmt.setString(index++, "%" + search.getKeyword() + "%");
			}

			if (search.getStart_regdate() != null && !search.getStart_regdate().isEmpty()) {
				if (search.getEnd_regdate() != null && !search.getEnd_regdate().isEmpty()) {
					pstmt.setString(index++, search.getStart_regdate());
					pstmt.setString(index++, search.getEnd_regdate());
				} else {
					pstmt.setString(index++, search.getStart_regdate());
				}
			}
			if (search.getEnd_regdate() != null && !search.getEnd_regdate().isEmpty()) {
				if (search.getStart_regdate().equals("") && search.getStart_regdate().isEmpty()) {
					pstmt.setString(index++, search.getEnd_regdate());
				}
			}

			if (search.getStatus().equals("대기")) {
				pstmt.setString(index++, search.getStatus());
			} else if (search.getStatus().equals("체크인")) {
				pstmt.setString(index++, search.getStatus());
			} else if (search.getStatus().equals("체크아웃")) {
				pstmt.setString(index++, search.getStatus());
			}

			pstmt.setInt(index++, offset);
			pstmt.setInt(index++, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_user_id(rs.getString("res_user_id"));
				dto.setRes_room_no(rs.getString("res_room_no"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_user_phone(rs.getString("res_user_phone"));
				dto.setRes_peoples(rs.getInt("res_peoples"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_status(rs.getString("res_status"));
				dto.setRes_payment_status(rs.getBoolean("res_payment_status"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	public List<String> getRoomTypeArrayList() {

		List<String> list = new ArrayList<String>();

		String type = null;

		try {

			openConn();

			sql = "select room_type from room_info order by room_price desc";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				type = rs.getString(1);

				list.add("'" + type + "'");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return list;
	}

	public int updateReservationInfo(ReservationDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "update reservation set res_room_no = ?, res_room_type = ?, res_user_phone = ?, res_peoples = ?, res_in_date = ?, res_out_date = ?, res_status = ? where res_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getRes_room_no());
			pstmt.setString(2, dto.getRes_room_type());
			pstmt.setString(3, dto.getRes_user_phone());
			pstmt.setInt(4, dto.getRes_peoples());
			pstmt.setString(5, dto.getRes_in_date());
			pstmt.setString(6, dto.getRes_out_date());
			pstmt.setString(7, dto.getRes_status());
			pstmt.setString(8, dto.getRes_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	// 회원 등급
	// List<Integer> countMemberGradeList()
	public List<Integer> countMemberGradeList() {
		List<Integer> list = new ArrayList<>();

		try {
			openConn();

			String sql = "SELECT COALESCE(SUM(CASE WHEN LOWER(user_grade) = 'bronze' THEN 1 ELSE 0 END), 0) AS bronze_count, "
					+ "COALESCE(SUM(CASE WHEN LOWER(user_grade) = 'silver' THEN 1 ELSE 0 END), 0) AS silver_count, "
					+ "COALESCE(SUM(CASE WHEN LOWER(user_grade) = 'gold' THEN 1 ELSE 0 END), 0) AS gold_count, "
					+ "COALESCE(SUM(CASE WHEN LOWER(user_grade) = 'vip' THEN 1 ELSE 0 END), 0) AS vip_count "
					+ "FROM user";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list.add(rs.getInt("bronze_count"));
				list.add(rs.getInt("silver_count"));
				list.add(rs.getInt("gold_count"));
				list.add(rs.getInt("vip_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// List<Integer> countMemberGradeList()
		// 관리자 관리 페이지

	public int countFacilityList() {
		int cnt = 0;

		try {
			openConn();

			sql = "select count(facility_id) from facility_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return cnt;
	}

	public List<FacilityinfoDTO> getFacilityList(int page, int rowsize) {

		List<FacilityinfoDTO> list = new ArrayList<FacilityinfoDTO>();

		int offset = (page - 1) * rowsize;

		FacilityinfoDTO dto = null;

		try {
			openConn();

			sql = "select * from facility_info fi order by fi.facility_id desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, offset);
			pstmt.setInt(2, rowsize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new FacilityinfoDTO();

				dto.setFacility_id(rs.getInt("facility_id"));
				dto.setFacility_type(rs.getString("facility_type"));
				dto.setFacility_name(rs.getString("facility_name"));
				dto.setFacility_start_time(rs.getString("facility_start_time"));
				dto.setFacility_end_time(rs.getString("facility_end_time"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// getFacilityList(int page, int rowsize) end

	public int insertFacilityBoard(FacilityinfoDTO dto) {

		int result = 0, cnt = 0;

		try {
			openConn();

			sql = "select max(facility_id) from facility_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

			sql = "insert into facility_info values(?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, cnt + 1);
			pstmt.setString(2, dto.getFacility_type());
			pstmt.setString(3, dto.getFacility_name());
			pstmt.setString(4, dto.getFacility_start_time());
			pstmt.setString(5, dto.getFacility_end_time());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertFacilityBoard(FacilityinfoDTO dto) end

	public FacilityinfoDTO getFacilityContent(int no) {

		FacilityinfoDTO dto = null;

		try {
			openConn();

			sql = "select * from facility_info where facility_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new FacilityinfoDTO();

				dto.setFacility_id(rs.getInt("facility_id"));
				dto.setFacility_type(rs.getString("facility_type"));
				dto.setFacility_name(rs.getString("facility_name"));
				dto.setFacility_start_time(rs.getString("facility_start_time"));
				dto.setFacility_end_time(rs.getString("facility_end_time"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;

	}// getFacilityContent(int no) end

	public int modifyFacilityBoard(FacilityinfoDTO dto) {

		int result = 0;

		try {
			openConn();

			sql = "update facility_info set facility_type = ?, facility_name = ?, facility_start_time = ?, facility_end_time = ?"
					+ "where facility_id=? ";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getFacility_type());
			pstmt.setString(2, dto.getFacility_name());
			pstmt.setString(3, dto.getFacility_start_time());
			pstmt.setString(4, dto.getFacility_end_time());
			pstmt.setInt(5, dto.getFacility_id());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}

		return result;
	}

	public List<FacilityinfoDTO> getFacility_type() {

		List<FacilityinfoDTO> list = new ArrayList<FacilityinfoDTO>();
		FacilityinfoDTO dto = null;

		try {
			openConn();

			sql = "select distinct(facility_type) from facility_info";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new FacilityinfoDTO();

				dto.setFacility_type(rs.getString("facility_type"));
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}// getFacility_type() end

	public int deleteFacilityBoard(int no) {

		int result = 0;

		try {
			openConn();

			con.setAutoCommit(false);

			sql = "delete from facility_info where facility_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

			if (result > 0) {
				sql = "update facility_info set facility_id = facility_id - 1 where facility_id >?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

				con.commit();
			} else {
				con.rollback();
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			closeConn(pstmt, con);
		}

		return result;

	}

	public int countFacilitySearchList(String type) {
		int cnt = 0;

		openConn();

		if (type.equals("전체")) {

			try {

				sql = "select count(*) from facility_info";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (type.equals("음식점")) {

			try {

				sql = "select count(*) from facility_info where facility_type like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (type.equals("주류점")) {

			try {

				sql = "select count(*) from facility_info where facility_type like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (type.equals("편의시설")) {

			try {

				sql = "select count(*) from facility_info where facility_type like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (type.equals("기타")) {

			try {

				sql = "select count(*) from facility_info where facility_type not in ('음식점','주류점')";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return cnt;
	}// countFacilitySearchList(type);

	public List<FacilityinfoDTO> searchFacilityList(String type, int page, int rowsize) {

		List<FacilityinfoDTO> list = new ArrayList<FacilityinfoDTO>();

		int offset = (page - 1) * rowsize;

		openConn();

		if (type.equals("전체")) {

			try {
				sql = "select * from facility_Info order by facility_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, offset);
				pstmt.setInt(2, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					FacilityinfoDTO dto = new FacilityinfoDTO();

					dto.setFacility_id(rs.getInt("facility_id"));
					dto.setFacility_type(rs.getString("facility_type"));
					dto.setFacility_name(rs.getString("facility_name"));
					dto.setFacility_start_time(rs.getString("facility_start_time"));
					dto.setFacility_end_time(rs.getString("facility_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (type.equals("음식점")) {

			try {
				sql = "select * from facility_Info where facility_type like ? order by facility_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					FacilityinfoDTO dto = new FacilityinfoDTO();

					dto.setFacility_id(rs.getInt("facility_id"));
					dto.setFacility_type(rs.getString("facility_type"));
					dto.setFacility_name(rs.getString("facility_name"));
					dto.setFacility_start_time(rs.getString("facility_start_time"));
					dto.setFacility_end_time(rs.getString("facility_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (type.equals("주류점")) {

			try {

				sql = "select * from facility_Info where facility_type like ? order by facility_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					FacilityinfoDTO dto = new FacilityinfoDTO();

					dto.setFacility_id(rs.getInt("facility_id"));
					dto.setFacility_type(rs.getString("facility_type"));
					dto.setFacility_name(rs.getString("facility_name"));
					dto.setFacility_start_time(rs.getString("facility_start_time"));
					dto.setFacility_end_time(rs.getString("facility_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (type.equals("편의시설")) {

			try {

				sql = "select * from facility_Info where facility_type like ? order by facility_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + type + "%");
				pstmt.setInt(2, offset);
				pstmt.setInt(3, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					FacilityinfoDTO dto = new FacilityinfoDTO();

					dto.setFacility_id(rs.getInt("facility_id"));
					dto.setFacility_type(rs.getString("facility_type"));
					dto.setFacility_name(rs.getString("facility_name"));
					dto.setFacility_start_time(rs.getString("facility_start_time"));
					dto.setFacility_end_time(rs.getString("facility_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		} else if (type.equals("기타")) {

			try {

				sql = "select * from facility_Info where facility_type not in ('음식점','주류점','편의시설') order by facility_id desc limit ?, ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, offset);
				pstmt.setInt(2, rowsize);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					FacilityinfoDTO dto = new FacilityinfoDTO();

					dto.setFacility_id(rs.getInt("facility_id"));
					dto.setFacility_type(rs.getString("facility_type"));
					dto.setFacility_name(rs.getString("facility_name"));
					dto.setFacility_start_time(rs.getString("facility_start_time"));
					dto.setFacility_end_time(rs.getString("facility_end_time"));

					list.add(dto);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}

		return list;

	} // searchFacilityList(String type, int page, int rowsize) end
		// FacilityDAO end

	public int deleteReservationInfo(String no) {

		int result = 0;

		try {

			openConn();

			fkCheckOff();

			sql = "delete from reservation where res_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, no);

			result = pstmt.executeUpdate();

			fkCheckOn();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
		return result;
	}

	public List<ReservationDTO> getReservationList() {

		List<ReservationDTO> list = new ArrayList<ReservationDTO>();

		ReservationDTO dto = null;

		try {

			openConn();

			sql = "select * from reservation where res_payment_status = true order by res_no";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new ReservationDTO();

				dto.setRes_no(rs.getString("res_no"));
				dto.setRes_user_id(rs.getString("res_user_id"));
				dto.setRes_room_type(rs.getString("res_room_type"));
				dto.setRes_in_date(rs.getString("res_in_date"));
				dto.setRes_out_date(rs.getString("res_out_date"));
				dto.setRes_regdate(rs.getString("res_regdate"));
				dto.setRes_review_status(rs.getBoolean("res_review_status"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}

	public List<Integer> getMonthlyRevenue() {

		List<Integer> revenueList = new ArrayList<>();

		try {

			openConn();

			String sql = "select sum(payment_price) as revenue from payment_info where payment_date is not null group by MONTH(payment_date) order by MONTH(payment_date)";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				revenueList.add(rs.getInt("revenue"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return revenueList;
	}

	public String getRoomType(String room_no) {

		String type = null;

		try {

			openConn();

			sql = "select room_type from rooms where room_no = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, room_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				type = rs.getString("room_type");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return type;
	}

	// searchQnaBoard
	public int countQnaBoardSearchList(String field, String keyword) {
		int cnt = 0;

		openConn();

		if (field.equals("전체")) {

			try {

				sql = "select count(*) from qna_board where qna_board_title like ? or qna_board_cont like ? or qna_board_writer_id like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("제목")) {

			try {

				sql = "select count(*) from qna_board where qna_board_title like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}

		} else if (field.equals("내용")) {

			try {

				sql = "select count(*) from qna_board where qna_board_cont like ?";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, "%" + keyword + "%");

				rs = pstmt.executeQuery();

				if (rs.next()) {
					cnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		return cnt;
	}

	public List<QnaBoardDTO> searchQnaBoard(String field, String keyword, String user_id, int page, int rowsize) {
		List<QnaBoardDTO> list = new ArrayList<>();
		int offset = (page - 1) * rowsize;
		openConn();

		try {
			if (field.equals("전체")) {
				sql = "SELECT * FROM qna_board WHERE " + "(qna_board_title LIKE ? OR qna_board_cont LIKE ?) AND "
						+ "qna_board_writer_id = ? " + "ORDER BY qna_board_no DESC LIMIT ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setString(3, user_id);
				pstmt.setInt(4, offset);
				pstmt.setInt(5, rowsize);
			} else if (field.equals("제목")) {
				sql = "SELECT * FROM qna_board WHERE " + "qna_board_title LIKE ? AND " + "qna_board_writer_id = ? "
						+ "ORDER BY qna_board_no DESC LIMIT ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, user_id);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, rowsize);
			} else if (field.equals("내용")) {
				sql = "SELECT * FROM qna_board WHERE " + "qna_board_cont LIKE ? AND " + "qna_board_writer_id = ? "
						+ "ORDER BY qna_board_no DESC LIMIT ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, user_id);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, rowsize);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaBoardDTO dto = new QnaBoardDTO();

				dto.setQna_board_no(rs.getInt("qna_board_no"));
				dto.setQna_board_writer_id(rs.getString("qna_board_writer_id"));
				dto.setQna_board_answer_id(rs.getString("qna_board_answer_id"));
				dto.setQna_board_type(rs.getString("qna_board_type"));
				dto.setQna_board_title(rs.getString("qna_board_title"));
				dto.setQna_board_cont(rs.getString("qna_board_cont"));
				dto.setQna_board_answer(rs.getString("qna_board_answer"));
				dto.setQna_board_date(rs.getString("qna_board_date"));
				dto.setQna_board_update(rs.getString("qna_board_update"));
				dto.setQna_board_file(rs.getString("qna_board_file"));
				dto.setQna_board_status(rs.getBoolean("qna_board_status"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	// searchQnaBoard

	public int ReservationReviewOk(ReviewBoardDTO boarddto) {
		int count = 0, result = 0;

		try {
			openConn();

			// 리뷰 번호 최대값 가져오기
			sql = "SELECT MAX(review_board_no) FROM review_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

			// 리뷰 삽입 쿼리
			sql = "INSERT INTO review_board VALUES (?, ?, ?, ?, DEFAULT, null, ?, DEFAULT, ?)";
			pstmt = con.prepareStatement(sql);

			// 파라미터 설정
			pstmt.setInt(1, count + 1);
			pstmt.setString(2, boarddto.getReview_board_writer_id());
			pstmt.setString(3, boarddto.getReview_board_res_no());
			pstmt.setString(4, boarddto.getReview_board_cont());
			pstmt.setString(5, boarddto.getReview_board_file());
			pstmt.setFloat(6, boarddto.getReview_board_point());

			// 쿼리 실행
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	// 예약 리뷰
	// 마이페이지 예약 내역

	// 회원 탈퇴
	public int deleteUserPwd(UserDTO dto) {

		int result = 0;

		try {

			openConn();

			sql = "select * from user where user_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getUser_id());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (dto.getUser_pwd().equals(rs.getString("user_pwd"))) {

					fkCheckOff();

					sql = "delete from user where user_id = ? ";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, dto.getUser_id());

					result = pstmt.executeUpdate();

					fkCheckOn();

					System.out.println("통과 1");

				} else {
					result = -1; // 비밀번호 불일치
				}
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// deleteUserPwd
		// 회원 탈퇴

	public void updateReviewStatus(String res_no) {
		
		try {

			openConn();
			
			sql = "update reservation set res_review_status = true where res_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, res_no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(pstmt, con);
		}
	}

} // class end.
