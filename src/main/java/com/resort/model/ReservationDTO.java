package com.resort.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.DayOfWeek;

public class ReservationDTO {

	private String res_no;
	private String res_user_id;
	private String res_room_no;
	private String res_room_type;
	private String res_user_phone;
	private String res_in_date;
	private String res_out_date;
	private String res_regdate;
	private int res_peoples;
	private String res_status;
	private boolean res_payment_status;
	private boolean res_review_status;

	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	// Getters and Setters...

	public LocalDate getResInLocalDate() {
		return LocalDate.parse(res_in_date, formatter);
	}

	public LocalDate getResOutLocalDate() {
		return LocalDate.parse(res_out_date, formatter);
	}

	public String getDayOfWeekIn() {
		return convertDayOfWeekToKorean(getResInLocalDate().getDayOfWeek());
	}

	public String getDayOfWeekOut() {
		return convertDayOfWeekToKorean(getResOutLocalDate().getDayOfWeek());
	}

	public long getNights() {
		return ChronoUnit.DAYS.between(getResInLocalDate(), getResOutLocalDate());
	}

	private String convertDayOfWeekToKorean(DayOfWeek dayOfWeek) {
		switch (dayOfWeek) {
		case MONDAY:
			return "월";
		case TUESDAY:
			return "화";
		case WEDNESDAY:
			return "수";
		case THURSDAY:
			return "목";
		case FRIDAY:
			return "금";
		case SATURDAY:
			return "토";
		case SUNDAY:
			return "일";
		default:
			return "";
		}
	}

	// Other getters and setters...

	public String getRes_no() {
		return res_no;
	}

	public void setRes_no(String res_no) {
		this.res_no = res_no;
	}

	public String getRes_user_id() {
		return res_user_id;
	}

	public void setRes_user_id(String res_user_id) {
		this.res_user_id = res_user_id;
	}

	public String getRes_room_no() {
		return res_room_no;
	}

	public void setRes_room_no(String res_room_no) {
		this.res_room_no = res_room_no;
	}

	public String getRes_room_type() {
		return res_room_type;
	}

	public void setRes_room_type(String res_room_type) {
		this.res_room_type = res_room_type;
	}

	public String getRes_user_phone() {
		return res_user_phone;
	}

	public void setRes_user_phone(String res_user_phone) {
		this.res_user_phone = res_user_phone;
	}

	public String getRes_in_date() {
		return res_in_date;
	}

	public void setRes_in_date(String res_in_date) {
		this.res_in_date = res_in_date;
	}

	public String getRes_out_date() {
		return res_out_date;
	}

	public void setRes_out_date(String res_out_date) {
		this.res_out_date = res_out_date;
	}

	public String getRes_regdate() {
		return res_regdate;
	}

	public void setRes_regdate(String res_regdate) {
		this.res_regdate = res_regdate;
	}

	public int getRes_peoples() {
		return res_peoples;
	}

	public void setRes_peoples(int res_peoples) {
		this.res_peoples = res_peoples;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public boolean isRes_payment_status() {
		return res_payment_status;
	}

	public void setRes_payment_status(boolean res_payment_status) {
		this.res_payment_status = res_payment_status;
	}

	public boolean isRes_review_status() {
		return res_review_status;
	}

	public void setRes_review_status(boolean res_review_status) {
		this.res_review_status = res_review_status;
	}
}
