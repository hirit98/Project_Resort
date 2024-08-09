$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "print_notice_list",
        dataType: "json",
        success: function(response) {
            if (response.length === 0) {
            } else {
                printNotices(response);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error:", error);
        }
    });
})

function printNotices(notices) {
    var noticesHtml = "";

    $.each(notices, function(index, notice) {
		noticesHtml += "<tr class='table-row' onclick='location.href=" + '"main_notice_content?no=' + notice.no + '"' + "'>";
		noticesHtml += "<td>" + notice.no + "</td>";
		noticesHtml += "<td>" + notice.title + "</td>";
		if(notice.update == null) {
			noticesHtml += "<td>" + notice.date.substring(0, 10) + "</td>";
		} else if(notice.update != null){
			noticesHtml += "<td>" + notice.update.substring(0, 10) + "</td>";
		}
		noticesHtml += "</tr>";
    });

	$("#section4 .main_notice tbody").html(noticesHtml);
}