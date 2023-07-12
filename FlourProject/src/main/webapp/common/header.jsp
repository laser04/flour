<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<!-- JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- AOS -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
* {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

body {
	font: 'IBM Plex Sans KR', sans-serif;
	margin: 0 auto;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

header {
	box-shadow: 0 1px 8px rgba(79, 92, 99, 0.3);
	background-color: white;
}

.nav-link {
	font-weight: bold;
}

.nav-link:hover {
	text-decoration: none;
	color: #007BFF;
}

.btn_log input {
	font-weight: bold;
	background-color: #007BFF;
	color: white;
	border: 0;
	padding: 8px 12px;
	border-radius: 4px;
}

.btn_log input:hover {
	background-color: #0056b3;
}
</style>
</head>

<body>
	<header class="p-3">
		<div class="container-xxl">
			<div class="d-flex align-items-center justify-content-start">
				<a href="../view/index.jsp"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<img src="../resources/img/common/logo.png" alt="밀가루였다카더라"
					width="160px;">
				</a>
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 mb-md-0"
					style="font-size: 20px; margin-left: 15px; margin-top: 7px;">
					<li><a href="../view/introduce.jsp"
						class="nav-link px-2 link-dark">회사 소개</a></li>
					<li class="dropdown"><a href="#"
						class="nav-link px-2 link-dark dropdown-toggle"
						id="dropdownDepartment" data-bs-toggle="dropdown"
						aria-expanded="false">기획팀</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownDepartment">
							<li><a class="dropdown-item" href="../view/teamIntroduce.jsp">팀원 소개</a></li>
							<li><a class="dropdown-item" href="../view/department.jsp">부서 페이지</a></li>
						</ul>						
						</li>
					<li class="dropdown"><a href="#"
						class="nav-link px-2 link-dark dropdown-toggle"
						id="dropdownReservation" data-bs-toggle="dropdown"
						aria-expanded="false"> 예약 </a>
						<ul class="dropdown-menu" aria-labelledby="dropdownReservation">
							<li><a class="dropdown-item" href="../view/reservation.jsp">회의실</a></li>
							<li><a class="dropdown-item" href="../view/reservation.jsp">차량</a></li>
						</ul></li>
					<li><a href="../view/board.jsp"
						class="nav-link px-2 link-dark">게시판</a></li>
					<li class="dropdown"><a href="#"
						class="nav-link px-2 link-dark dropdown-toggle"
						id="dropdownMyPage" data-bs-toggle="dropdown"
						aria-expanded="false"> 마이페이지 </a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMyPage">
							<li><a class="dropdown-item" href="../view/myPage.jsp">내
									정보</a></li>
							<li><a class="dropdown-item" href="../view/myWork.jsp">내
									업무</a></li>
						</ul></li>
				</ul>
				<div class="d-flex align-items-center">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="./resources/img/head/KakaoTalk_20230629_183906924.png"
						alt="유저사진" width="50px" height="32" class="rounded-circle">
					</a>
					<div class="me-3">${userName}님</div>
					<div class="btn_log">
						<c:choose>
							<c:when test="${not empty userName }">
								<div>
									<input type='button' class='log_box' value='로그아웃'
										onclick='log(this)'>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<input type='button' class='log_box' value='로그인'
										onclick="window.location.href = '../log/login.jsp';">
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
