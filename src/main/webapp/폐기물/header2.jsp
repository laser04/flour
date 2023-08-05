<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="tag.jsp"%>
<%@ include file="Auth.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<sec:csrfMetaTags/>
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

.dropdown:hover .dropdown-menu {
	display: block;
}

header {
	font-family: 'IBM Plex Sans KR', sans-serif;
	box-shadow: 0 1px 8px rgba(79, 92, 99, 0.3);
	background-color: white;
	margin: 0 auto;
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
	<header class="p-3">
		<div class="container-xxl">
			<div class="d-flex align-items-center justify-content-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<img src="/img/common/logo.png" alt="밀가루였다카더라"
					width="160px;">
				</a>
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 mb-md-0"
					style="font-size: 20px; margin-left: 15px; margin-top: 7px;">
					<sec:authorize access="isAnonymous()">

					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<c:choose>
						<c:when test="${name ne null && !emailVerified}">
							<li>
								<p class="alert alert-warning py-5 text-center" role="alert"> 입사를 완료하려면 <a href="/check_email" class="alert-link">계정 인증 이메일을 확인</a>하세요.
									인증을 하지 않으면 서비스 이용이 제한적입니다.
								</p>
							</li>
						</c:when>
						<c:otherwise>
						<li><a href="/introduce"
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
						<li><a href="/boardlist"
							   class="nav-link px-2 link-dark">게시판</a></li>
					<li class="dropdown">
						<a href="#" class="nav-link px-2 link-dark dropdown-toggle" id="dropdownMyPage" data-bs-toggle="dropdown"
						   aria-expanded="false"> 마이페이지 </a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMyPage">
							<li><a class="dropdown-item" href="/user/update">내
									정보</a></li>
							<li><a class="dropdown-item" href="/user/">내
									업무</a></li>
						</ul>
						</li>
							<li>
								<a id="chatButton" href="/chat">채팅이다이자식아</a>
							</li>
						</c:otherwise>
						</c:choose>
					</sec:authorize>
				</ul>
				<div class="d-flex align-items-center">
					<sec:authorize access="isAuthenticated()">
					<div class="me-3">${name} 님</div>
					<div class="btn_log">
								<div>
									<form id="logout-form" class="form-inline my-2 my-lg-0" action="/logout" method="post">
										<input type="hidden" name="_csrf_header" value="${_csrf.headerName}">
										<input type="hidden" name="_csrf" value="${_csrf.token}">
									</form>
									<a class="fa fa-sign-out btn btn-primary" id="logout-btn" style="cursor: pointer" aria-hidden="true">로그아웃</a>
								</div>
							<script>
								$("#logout-btn").click(function() {
									$("#logout-form").submit();
								})
							</script>
						</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<input type='button' class='log_box btn btn-primary' value='로그인'
										   onclick="window.location.href = '/login'">
								</sec:authorize>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>