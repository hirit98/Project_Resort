$(document).ready(function() {
	// input 태그의 값이 변할 때 발생하는 이벤트 핸들러 설정
	$('input[type=date]').change(function() {
		// 변경된 날짜 값을 가져오기
		var startDate = $("#checkIn").val();
		var endDate = $("#checkOut").val();

		if (startDate && endDate) {
			updateRoomTypes(startDate, endDate);
		}
	});

	// 선택한 날짜를 Ajax를 사용해 예약 가능한 RoomType을 조회 하여 List로 받아오는 함수.
	function updateRoomTypes(startDate, endDate) {
		var datas = { startDate: startDate, endDate: endDate };

		$.ajax({
			type: "POST",
			url: "get_room_type",
			dataType: "json",
			success: function(totalList) {
				$.ajax({
					type: "POST",
					url: "checking_schedule",
					data: JSON.stringify(datas),
					contentType: "application/json",
					dataType: "json",
					success: function(list) {
						populateSelect(totalList, list);
					},
					error: function(xhr, status, error) {
						alert("Error while checking schedule: " + error);
					}
				});
			},
			error: function(xhr, status, error) {
				alert("Error while getting room types: " + error);
			}
		});
	}

	// RoomType을 비교하여 적절한 옵션으로 select 태그를 채우는 함수
	function populateSelect(totalList, list) {

		var selectElement = $('#room-type');

		selectElement.empty();

		totalList.forEach(function(item) {
			
			if (list.some(function(scheduleItem) { return scheduleItem.type === item.type; })) {
				selectElement.append($('<option>', {
					value: item.type,
					text: item.type + "  (예약가능)"
				}));
			} else {
				selectElement.append($('<option>', {
					value: item.type,
					text: item.type + "  (예약불가)",
					class: "type_none",
					disabled: true
				}));
			}
		});
	}
});