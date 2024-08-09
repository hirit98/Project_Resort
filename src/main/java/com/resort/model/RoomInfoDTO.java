package com.resort.model;

public class RoomInfoDTO {

	private String room_type;
	private int room_total;
	private int room_available;
	private double room_area;
	private int room_maximum;
	private int room_price;

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getRoom_total() {
		return room_total;
	}

	public void setRoom_total(int room_total) {
		this.room_total = room_total;
	}

	public int getRoom_available() {
		return room_available;
	}

	public void setRoom_available(int room_available) {
		this.room_available = room_available;
	}

	public double getRoom_area() {
		return room_area;
	}

	public void setRoom_area(double room_area) {
		this.room_area = room_area;
	}

	public int getRoom_maximum() {
		return room_maximum;
	}

	public void setRoom_maximum(int room_maximum) {
		this.room_maximum = room_maximum;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

}
