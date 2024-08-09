package com.resort.model;

public class ActivityInfoDTO {

	private int activity_id;
	private String activity_type;
	private String activity_name;
	private String activity_start_time;
	private String activity_end_time;

	public int getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}

	public String getActivity_type() {
		return activity_type;
	}

	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}

	public String getActivity_name() {
		return activity_name;
	}

	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}

	public String getActivity_start_time() {
		return activity_start_time;
	}

	public void setActivity_start_time(String activity_start_time) {
		this.activity_start_time = activity_start_time;
	}

	public String getActivity_end_time() {
		return activity_end_time;
	}

	public void setActivity_end_time(String activity_end_time) {
		this.activity_end_time = activity_end_time;
	}

}
