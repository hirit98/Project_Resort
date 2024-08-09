package com.resort.model;

public class FacilityinfoDTO {

	private int facility_id;
	private String facility_name;
	private String facility_type;
	private String facility_start_time;
	private String facility_end_time;

	public int getFacility_id() {
		return facility_id;
	}

	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}

	public String getFacility_name() {
		return facility_name;
	}

	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}

	public String getFacility_type() {
		return facility_type;
	}

	public void setFacility_type(String facility_type) {
		this.facility_type = facility_type;
	}

	public String getFacility_start_time() {
		return facility_start_time;
	}

	public void setFacility_start_time(String facility_start_time) {
		this.facility_start_time = facility_start_time;
	}

	public String getFacility_end_time() {
		return facility_end_time;
	}

	public void setFacility_end_time(String facility_end_time) {
		this.facility_end_time = facility_end_time;
	}

}
