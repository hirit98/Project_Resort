package com.resort.model;

public class ReservationSearchDTO {
	private String start_regdate;
	private String end_regdate;
	private String keyword;
	private String field;
	private String status;

	public String getStart_regdate() {
		return start_regdate;
	}

	public void setStart_regdate(String start_regdate) {
		this.start_regdate = start_regdate;
	}

	public String getEnd_regdate() {
		return end_regdate;
	}

	public void setEnd_regdate(String end_regdate) {
		this.end_regdate = end_regdate;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
