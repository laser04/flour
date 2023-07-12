<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="style.css">
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
}

</style>
<body style="background-color: #F2F2F2">
	<div class="main-container">
		<div class="main-wrap">
			<div class="login-form-background">
			<header>
				<div class="logo-wrap" onclick="window.location.href='../view/index.jsp'" style="cursor: pointer;">
					<img src="../resources/img/common/logo.png">
				</div>
			</header>
			<section class="login-input-section-wrap">
				<div class="login-input-wrap">	
					<input placeholder="아이디" type="text"></input>
				</div>
				<div class="login-input-wrap password-wrap">	
					<input placeholder="비밀번호" type="password"></input>
				</div>
				<div class="login-button-wrap">
					<button>로그인</button>
				</div>
				<div class="login-stay-sign-in">
					<i class="far fa-check-circle"></i>
					<span style="font-size:14px">로그인 유지</span>
				</div>
			</section>
			
			<footer class="footer">
			  <div class="footer-info">
			    <section id="sign-up"><a href="./join.jsp">회원가입</a></section>	
			    <section id="find-pw"><a href="./find_pw.jsp">비밀번호 찾기</a></section>
			  </div>
			</footer>
			</div>
		</div>
	</div>
</body>