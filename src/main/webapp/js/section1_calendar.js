$(function() {
	// DateRangePicker 초기화.
	$('input[name="datetimes"]').daterangepicker({
		timePicker: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		locale: {
			format: 'YYYY-MM-DD'
		}
	});

	// reservation_sidebar에서 선택한 날짜로 DateRangePicker 초기화.
	if (checkIn && checkOut) {
		$('input[name="datetimes"]').daterangepicker({
			startDate: checkIn,
			endDate: checkOut,
			locale: {
				format: 'YYYY-MM-DD'
			}
		});
	}

	// 날짜를 선택하면 선택한 날짜들로 달력과 RoomTypeList를 업데이트.
	$('input[name="datetimes"]').on('apply.daterangepicker', function(ev, picker) {
		let startDate = picker.startDate;
		let endDate = picker.endDate;

		updateDateRange(startDate, endDate);
		updateRoomTypes(startDate, endDate);
	});

	// reservation_sidebar에서 선택한 날짜들로 달력과 RoomTypeList를 업데이트.
	if (checkIn && checkOut) {
		let startDate = moment(checkIn);
		let endDate = moment(checkOut);

		updateDateRange(startDate, endDate);
		updateRoomTypes(startDate, endDate);

	}

	// "RESERVATION" 버튼 클릭 시 hidden input에 선택된 날짜 저장.
	$("#res_btn").click(function() {
		var start_date = $('input[name="datetimes"]').data('daterangepicker').startDate;
		var end_date = $('input[name="datetimes"]').data('daterangepicker').endDate;

		$(".hidden_start_date").val(start_date.format("YYYY-MM-DD"));
		$(".hidden_end_date").val(end_date.format("YYYY-MM-DD"));

	});

	// DateRangePicker의 값을 변경된 포맷으로 업데이트하는 함수.
	function updateDateRange(startDate, endDate) {
		let separator = ' ~ ';
		let nights = endDate.diff(startDate, 'days');
		$('input[name="datetimes"]').val(startDate.format("YYYY-MM-DD") + separator + endDate.format("YYYY-MM-DD") + '   ' + '(' + nights + '박)');
	}

	// 선택한 날짜를 Ajax를 사용해 예약 가능한 RoomType을 조회 하여 List로 받아오는 함수.
	function updateRoomTypes(startDate, endDate) {

		var datas = { startDate: startDate.format("YYYY-MM-DD"), endDate: endDate.format("YYYY-MM-DD") };

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
						$("#room-type").empty();
						compareAndPopulateSelect(totalList, list);
					},
					error: function(xhr, status, error) {
						alert(error);
					}
				});
			},
			error: function(xhr, status, error) {
				alert(error);
			}
		});

		function compareAndPopulateSelect(totalList, list) {
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
	}

	
});