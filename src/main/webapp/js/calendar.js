$(function() {
	$('input[name="datetimes"]').daterangepicker({
		timePicker: true,
		startDate: moment().startOf('hour'),
		endDate: moment().startOf('hour').add(32, 'hour'),
		locale: {
			format: 'YYYY-MM-DD'
		}
	});

	$("input").on("click", function() {
		$(".daterangepicker").addClass("fixed");
		$("aside").addClass("fixed");
	});

	/*aside-----------------------------------------------------------------------*/
	$("aside").on("mouseover", function() {
		$(this).stop().animate({ marginRight: 0 });
		$("#fp-nav").stop().fadeOut();

	});

	$(".reservation input").on("click", function() {
		$(".daterangepicker").fadeIn("fast");
	});


	$(".swiper,section").on("mouseover", function() {
		$(".daterangepicker").fadeOut("fast");
		$("aside").stop().animate({ marginRight: "-550px" });
		$("#fp-nav").stop().fadeIn();

	});
	$('input[name="datetimes"]').on('apply.daterangepicker', function(ev, picker) {
		let startDate = picker.startDate;
		let endDate = picker.endDate;
		let separator = ' ~ ';

		// 변경된 포맷으로 날짜 범위를 다시 설정합니다.
		$(this).val(startDate.format('YYYY-MM-DD') + separator + endDate.format('YYYY-MM-DD') + '   ' + '(' + endDate.diff(startDate, 'days') + '박)');
	});
});
// .daterangepicker