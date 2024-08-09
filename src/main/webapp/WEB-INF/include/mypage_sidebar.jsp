<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
</head>
<body>
    <section>
        <div class="my_page">
            <div class="wrap">
                <div class="l_area">
                    <h2>My Page</h2>
                    <ul>
                        <li class="on"><a href="mypage_main">${dto.getUser_name() } 님</a></li>
                        <li><a href="mypage_reservation">예약 관리</a></li>
                        <li><a href="mypage_modify">개인정보 수정</a></li>
                        <li><a href="mypage_qna_board">1:1 문의함</a></li>
                        <li><a href="mypage_secession">탈&nbsp;&nbsp;&nbsp;퇴</a></li>
                    </ul>