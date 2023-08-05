<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<sec:csrfMetaTags/>
	<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jdenticon@3.1.0/dist/jdenticon.min.js"></script>
	<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
</head>
<style>
:root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--naver-green-color: #04c75a;
	--naver-green-border-color: #06b350;
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 120px;
}
.login-form-background {
	margin: 0 auto;
	background-color: white;
	width: 550px;
	height: 600px;
	border-radius: 12px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}
.main-container .main-wrap{
	width:768px;
}
.main-container .main-wrap .logo-wrap{
	padding-top:90px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 300px;
	height: 90px;
}

.main-container .main-wrap header .sel-lang-wrap{
	display:flex;
	justify-content:flex-end;
}

.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button{
	width: 465px;
	height :48px;
	font-size: 18px;
	background: #CC9900;
	color: white;
	border: solid 1px #CC9900;
}
.login-stay-sign-in{
	width: 465px;
	height: 52px;
	
	display: flex;
	font-size: 15px;
	color: #4e4e4e;
	align-items: center;
	justify-content: flex-start;
	border-bottom: solid 1px var(--border-gray-color);
}
.login-stay-sign-in i{
	font-size: 25px;
	color: #9ba1a3;
}
.login-stay-sign-in span{
	padding-left: 5px;
	line-height: 25px;
}

.footer {
  margin: 0 auto;
  margin-top: 10px;
  text-align: center;
  bottom: 5px;
  color: #888888;
  font-size: 14px;
  display: flex;
  justify-content: center; /* 가로 방향으로 내용물을 가운데 정렬합니다 */
  align-items: center; /* 세로 방향으로 내용물을 가운데 정렬합니다 */
}

.footer .footer-info {
  display: flex;
  align-items: center; /* 세로 방향으로 아이템을 가운데 정렬합니다 */
}

.footer section {
  text-align: center;
  margin: 0 10px;
}

.footer section a {
  text-decoration: none;
  color: inherit; /* 부모 요소의 색상을 상속받습니다 */

& input[type="checkbox"] {
	-webkit-appearance: none;
	outline: none;
	position: absolute;
	height: 5rem;
	width: 10rem;
	border: 5px solid var(--body);
	border-radius: 2.5rem;
	cursor: pointer;
	box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5), inset 10px 10px 15px -10px #c3c3c3, inset -10px -10px 15px -10px #fff;
	/* Toggle Indicator */
	/* Label */
	/* Checked Styles */
}
@media (prefers-color-scheme: light) {
	input[type="checkbox"] {
		box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5), inset 10px 10px 15px -10px #c3c3c3, inset -10px -10px 15px -10px #fff;
	}
}
@media (prefers-color-scheme: dark) {
	input[type="checkbox"] {
		box-shadow: -8px -4px 8px 0px rgba(255, 255, 255, 0.05), 8px 4px 12px 0px rgba(0, 0, 0, 0.5), inset -4px -4px 4px 0px rgba(255, 255, 255, 0.05), inset 4px 4px 4px 0px rgba(0, 0, 0, 0.5);
	}
}
	& input[type="checkbox"]::before {
	content: "";
	height: 3.125rem;
	width: 3.125rem;
	background-color: var(--body);
	position: absolute;
	margin: auto;
	top: 0;
	left: 0.9375rem;
	bottom: 0;
	border-radius: 50%;
	box-shadow: 7px 7px 15px #c3c3c3, 9px 9px 16px rgba(189, 189, 189, 0.6);
	transition: 0.15s;
}
@media (prefers-color-scheme: light) {
	input[type="checkbox"]::before {
		box-shadow: 7px 7px 15px #c3c3c3, 9px 9px 16px rgba(189, 189, 189, 0.6);
	}
}
@media (prefers-color-scheme: dark) {
	input[type="checkbox"]::before {
		box-shadow: -8px -4px 8px 0px rgba(255, 255, 255, 0.05), 8px 4px 12px 0px rgba(0, 0, 0, 0.5);
	}
}
	& input[type="checkbox"]::after {
	content: "Off";
	position: absolute;
	font-size: 1.625rem;
	top: 1.25rem;
	right: 1.5625rem;
	color: var(--text-secondary);
	font-family: "SF Pro Text", "Helvetica Neue", "Helvetica", "Arial", sans-serif;
	font-weight: 400;
	letter-spacing: 0.004em;
}
	& input[type="checkbox"]:checked {
	background: #0071e3;
}
@media (prefers-color-scheme: light) {
	input[type="checkbox"]:checked {
		box-shadow: 9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5), inset 10px 10px 15px -10px #0047b9, inset -10px -10px 15px -10px #0047b9;
	}
}
	& input[type="checkbox"]:checked::before {
	left: 5.3125rem;
	box-shadow: none;
}
	& input[type="checkbox"]:checked::after {
	content: "On";
	left: 1.5625rem;
	color: #f5f5f7;
}
</style>
<body style="background-color: #F2F2F2">
	<div class="main-container">
		<div class="main-wrap">
			<div class="login-form-background">
			<header>
				<div class="logo-wrap" onclick="window.location.href=main" style="cursor: pointer;">
					<a href="/"><img src="img/common/logo.png"></a>
				</div>
			</header>
			<form class="login-input-section-wrap needs-validation" action="login" method="post">
				<sec:csrfInput/>
				<div class="login-input-wrap">	
					<input placeholder="사번" type="text" name="username"></input>
				</div>
				<div class="login-input-wrap password-wrap">	
					<input placeholder="비밀번호" type="password" name="password"></input>
				</div>
				<div class="login-button-wrap">
					<button>로그인</button>
				</div>
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me" checked/>
					<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">로그인 유지</label>
				</div>
			</form>
			
			<footer class="footer">
			  <div class="footer-info">
			    <section id="sign-up"><a href="/join">회원가입</a></section>
			    <section id="find-pw"><a href="/find_pw">비밀번호 찾기</a></section>
			  </div>
			</footer>
			</div>
		</div>
		<div class="col-sm-3">
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<div class="alert alert-danger" role="alert">
					<p>사번이나 패스워드가 <br>일치하지 않습니다.</p>
					<p>
						확인 후 다시 입력하거나,<br><strong><u><a href="/find-password">비밀번호 찾기</a></u></strong>를 이용하세요
					</p>
				</div>
				<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
			</c:if>
		</div>
	</div>
</body>