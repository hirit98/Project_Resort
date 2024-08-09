<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 사이드바</title>
<link rel="stylesheet" href="css/reservation_side/reservation_side.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="js/calendar.js"></script>
</head>
<body>
    <aside>
        <button><img src="./img/arrow.png" alt="빠른예약"></button>
        <div class="reservation">
            <form method="post" action="pick_reservation">
                <input type="submit" class="re_txt" value="RESERVATION">
                <input type="text" name="datetimes" autocomplete="off" readonly/>                
            </form>
        </div>
    </aside>
    <script src="js/main.js"></script>
</body>
</html>