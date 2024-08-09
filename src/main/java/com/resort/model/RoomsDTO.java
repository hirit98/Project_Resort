package com.resort.model;

public class RoomsDTO {
	private String room_no;
	private String room_type;
	private boolean room_status;
	private RoomInfoDTO roomInfoDTO;

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public boolean isRoom_status() {
		return room_status;
	}

	public void setRoom_status(boolean room_status) {
		this.room_status = room_status;
	}

	public RoomInfoDTO getRoomInfoDTO() {
		return roomInfoDTO;
	}

	public void setRoomInfoDTO(RoomInfoDTO roomInfoDTO) {
		this.roomInfoDTO = roomInfoDTO;
	}

}
