<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<!-- icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
	
	<!-- 달력 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"/>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<style>
		
		.index-wrap{
			width:1350px;
			margin: 0 auto;
		}
		.text-ellipsis {
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		.icon-wrap{
			cursor: pointer;
		}
		.table-bordered {
		    border-color: #E8D4A2; /* 표의 테두리색 변경 */
		}
		.table-bordered th,
		.table-bordered td {		    
		    background-color: #F5F5DC; /* 셀의 배경색 변경 */
		}
		/* 달력 */
		.card {
			justify-content: center;
			align-items: center;
			
			width: 100%;
			height: 100%;
			background-color: #FFFFFF;
			border-radius: 15px;
		}
		
		.calendar-toolbar {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 20px;
			padding-bottom: 15px;
			border-bottom: 1px solid #efefef;
		}
		
		.calendar-toolbar > .current-month {
			font-size: 20px;
			font-weight: bold;
			color: #19181a;
		}
		
		.calendar-toolbar > [class$="month-btn"] {
			width: 40px;
			aspect-ratio: 1;
			text-align: center;
			line-height: 40px;
			font-size: 14px;
			color: #19181a;
			background: #f8f7fa;
			border: none;
			border-radius: 15px;
		}
		
		.weekdays,
		.calendar-days {
			display: flex;
			flex-wrap: wrap;
			padding-inline: 18px;
		}
		.weekdays {
			padding-top: 12px;
		}
		.calendar-days {
			padding-bottom: 12px;
		}
		
		.weekday-name,
		[class$="-day"] {
			width: 40px;
			height: 40px;
			color: #19181a;
			text-align: center;
			line-height: 40px;
			font-weight: 500;
			font-size: 1rem;
		}
		
		.weekday-name {
			color: #19181a;
			font-weight: 700;
		}
		
		.current-day {
			background-color: rgb(112, 71, 235);
			color: #f8f7fa;
			border-radius: 15px;
			font-weight: 700;
			transition: 0.5s;
			cursor: pointer;
		}
		
		.padding-day {
			color: #a5a5a5;
			user-select: none;
		}
		
		.calendar-toolbar > [class$="month-btn"]:hover,
		.month-day:hover,
		.btn:hover {
			border-radius: 15px;
			background-color: #f8f7fa;
			color: rgb(112, 71, 235);
			transition: 0.1s;
			cursor: pointer;
			box-shadow: inset 0px 0px 0px 1.5px rgb(112, 71, 235);
		}
		
		.calendar-toolbar > [class$="month-btn"]:focus,
		.month-day:focus,
		.btn:focus {
			border-radius: 15px;
			background-color: rgb(112, 71, 235);
			color: #f8f7fa;
		}
		
		.goto-buttons {
			border-top: 1px solid #efefef;
			padding-block: 18px;
			display: flex;
			justify-content: space-evenly;
		}
		
		.btn_today {
			background: #f8f7fa;
			border: none;
			border-radius: 15px;
			padding: 11px 13px;
			color: #19181a;
			font-weight: 600;
			font-size: 0.9rem;
			margin-right: 1px;
			box-shadow: 0px 0px 0px #efefef;
		}
		/*이미지 슬라이드  */
		
		/*공지,뉴스 테이블  */
		.table {
		    background-color: #f7ecce; /* 베이지 배경 */
		    border: 1px solid #BDAD84; /* 테두리 */
		    color: #8B4513; /* 글자 색 (적당한 갈색 톤) */
		}
		
		.table th, .table td {
		    padding: 7px; /* 테이블 내용에 약간의 공간 추가 */
		}
		
		.rounded {
		    padding: 3px 10px; /* 라벨에 패딩 추가 */
		}
			
	</style>
</head>

<body>
	<div class="d-flex p-3 index-wrap"
		id="maincontentdiv">
	
		<!-- left -->
		<div class="d-inline mt-2 w-25">
			<div class="p-2 bg-white" style="height:500px; border-radius: 12px;
  				 box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
				<div class="rounded" style="height: 484px; background-color:#F7ECCE;">
					<div class="d-flex justify-content-center pt-4">
						<div>
							<i class="bi bi-person-circle" style="font-size: 60px;"></i>
						</div>
						<div class="d-inline align-self-center">
							<div class="m-2">
								<%-- <%=request.getSession("NAME") %> --%>
								00님 접속을 환영합니다.
							</div>
							<div class="m-2">최종접속 : 2023/07/03 11:52</div>
						</div>
					</div>
					<div class="mt-2 w-75 d-flex " style="margin: 0 auto;">
						<div class="col-3 icon-wrap" onclick="window.location.href = 'attitude.jsp';" style="color: #8B4513">
							<div class="mx-auto rounded-circle bg-white d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
								<div style="position: relative;">
									<i class="bi bi-clock" style="font-size: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								</div>
							</div>
							<div class="text-center" >
								출/퇴근
							</div>
						</div>
						<div class="col-3 icon-wrap" style="color: #8B4513">
							<div class="mx-auto rounded-circle bg-white d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
								<div style="position: relative;">
									<i class="bi bi-file-text" style="font-size: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								</div>
							</div>
							<div class="text-center">
								결재
							</div>
						</div>
						<div class="col-3 icon-wrap" style="color: #8B4513">
							<div class="mx-auto rounded-circle bg-white d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
								<div style="position: relative;">
									<i class="bi bi-briefcase" style="font-size: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								</div>
							</div>
							<div class="text-center">
								일정
							</div>
						</div>
						<div class="col-3 icon-wrap" style="color: #8B4513">
							<div class="mx-auto rounded-circle bg-white d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
								<div style="position: relative;">
									<i class="bi bi-chat-dots" style="font-size: 25px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								</div>
							</div>
							<div class="text-center">
								채팅
							</div>
						</div>
					</div>
					<div class="my-4 w-85" style="margin:0 auto; text-align: center;">
						<table class="w-100 table-bordered border-white">
							<tr>
								<th class="col-4">결재대기</th>
								<td class="col-3 text-end">휴가</td>
								<td class="col-1 text-center">0</td>
								<td class="col-3 text-end">출장</td>
								<td class="col-1 text-center">0</td>
							</tr>
							<tr>
								<th>예약대기</th>
								<td class="text-end">회의실</td>
								<td class="text-center">0</td>
								<td class="text-end">차량</td>
								<td class="text-center">0</td>
							</tr>
						</table>
						<!-- 날씨 -->
						<div class="mt-4" style="background-color:skyblue; width: 270px; height:170px; margin:0 auto;">
							날씨 공간
						</div>
					</div>
				</div>
			</div>
		
			<div class="p-2 bg-white" style="height:300px;
						border-radius: 12px;box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
				<div class="rounded" style="height: 284px; background-color:#f7ecce;">
					<div class="card">
						<div class="calendar-toolbar">
							<button class="prev month-btn">
								<i class="fas fa-chevron-left"></i>
							</button>
							<div class="current-month"></div>
							<button class="next month-btn">
								<i class="fas fa-chevron-right"></i>
							</button>
						</div>
						<div class="calendar">
						<div class="weekdays">
							<div class="weekday-name">Su</div>
							<div class="weekday-name">Mo</div>
							<div class="weekday-name">Tu</div>
							<div class="weekday-name">We</div>
							<div class="weekday-name">Th</div>
							<div class="weekday-name">Fr</div>
							<div class="weekday-name">Sa</div>
						</div>
						<div class="calendar-days"></div>
						</div>
						<div class="goto-buttons">
							<button type="button" class="btn_today today">Today</button>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<div class="d-inline w-75 p-2 ms-3" >
		<div class="p-2 bg-white carousel slide" data-bs-ride="carousel"
			 style="border-radius: 12px;box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);"
			 id="carouselExampleAutoplaying">
			 <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
			 </div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../resources/img/index/사무실4.png" class="d-block w-100" alt="사무실4" style="height: 300px">
 			</div>
 			<div class="carousel-item">
				<img src="../resources/img/index/사무실5.png" class="d-block w-100" alt="사무실5" style="height: 300px">
 			</div>
 			<div class="carousel-item">
				<img src="../resources/img/index/사무실6.png" class="d-block w-100" alt="사무실6" style="height: 300px">
 			</div>
 		</div>
 			 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>				
 		</div>

			<div class="my-4 w-100 rounded bg-white pt-3"			
				 style="border-radius: 12px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
				<table class="table text-center" >
					<tr >
						<th colspan="4" class="fs-2" style="color: gray">공지</th>
				<!-- 	<td colspan="1">
							<div class="d-flex justify-content-end">
								<button class="btn btn-secondary" onclick="writeText()">글쓰기</button>
							</div>
						</td> -->
					</tr>
					<tr>
						<td class="col-1">구분</td>
						<td class="col-6">내용</td>
						<td class="col-2">작성자</td>
						<td class="col-3">일자</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-danger text-white">긴급</div>
						</td>
						<td class="text-ellipsis text-start" style="max-width:450px;">내용1 </td>
						<td>김직원</td>
						<td>2022-12-12</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-success text-white">공지</div>
						</td>
						 <td class="text-ellipsis text-start" style="max-width:450px;">내용2</td>
						<td>정대리</td>
						<td>2022-12-13</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-secondary text-white">안내</div>
						</td>
						<td class="text-ellipsis text-start" style="max-width:450px;">내용3</td>
						<td>김팀장</td>
						<td>2012-12-12</td>
					</tr>
				</table>
			</div>
			
			<div class="my-3 w-100 rounded bg-white pt-3"
				style="border-radius: 12px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
				<table class="table text-center">
					<tr>
						<th colspan="4" class="fs-3">뉴스</th>
						<!-- <th colspan="1">
							<div class="d-flex justify-content-end">
								<button class="btn btn-secondary" onclick="writeText2()">글쓰기</button>
							</div>
						</th> -->
					</tr>
					<tr>
						<td class="col-1">구분</td>
						<td class="col-6">내용</td>
						<td class="col-2">작성자</td>
						<td class="col-3">일자</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-secondary text-white">안내</div>
						</td>
						<td class="text-ellipsis text-start" style="max-width:450px;">뉴스1</td>
						<td>최사원</td>
						<td>2022-12-12</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-success text-white">공지</div>
						</td>
						<td class="text-ellipsis text-start" style="max-width:450px;">뉴스2</td>
						<td>안사장</td>
						<td>2022-12-13</td>
					</tr>
					<tr>
						<td>
							<div class="rounded bg-danger text-white">긴급</div>
						</td>
						<td class="text-ellipsis text-start" style="max-width:450px;">뉴스3</td>
						<td>마경리</td>
						<td>2012-12-12</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


<script>
	function writeText() {
		// 버튼이 클릭되면 실행되는 함수
		alert("새 공지글을 작성하시겠습니까?");
	}

	function writeText2() {
		// 버튼이 클릭되면 실행되는 함수
		alert("새 뉴스글을 작성하시겠습니까?");
	}
	
	/* 달력 */
	let currentMonth = document.querySelector(".current-month");
	let calendarDays = document.querySelector(".calendar-days");
	let today = new Date();
	let date = new Date();


	currentMonth.textContent = date.toLocaleDateString("ko-KR", {day:'numeric', month:'long', year:'numeric'});
	today.setHours(0,0,0,0);
	renderCalendar();

	function renderCalendar(){
		const prevLastDay = new Date(date.getFullYear(),date.getMonth(),0).getDate();
		const totalMonthDay = new Date(date.getFullYear(),date.getMonth()+1,0).getDate();
		const startWeekDay = new Date(date.getFullYear(),date.getMonth(),0).getDate();

		calendarDays.innerHTML = "";

		let totalCalendarDay = 6 * 7;
		for (let i = 0; i < totalCalendarDay; i++) {
			let day = i-startWeekDay;

			if(i <= startWeekDay){
				// adding previous month days
				calendarDays.innerHTML += `${prevLastDay-i}`;
			}else if(i <= startWeekDay+totalMonthDay){
				// adding this month days
				date.setDate(day);
				date.setHours(0,0,0,0);
				
				let dayClass = date.getTime()===today.getTime() ? 'current-day' : 'month-day';
				calendarDays.innerHTML += `${day}`;
			}else{
				// adding next month days
				calendarDays.innerHTML += `${day-totalMonthDay}`;
			}
		}
	}

	document.querySelectorAll(".month-btn").forEach(function (element) {
		element.addEventListener("click", function () {
			date = new Date(currentMonth.textContent);
			date.setMonth(date.getMonth() + (element.classList.contains("prev") ? -1 : 1));
			currentMonth.textContent = date.toLocaleDateString("ko-KR", {day:'numeric', month:'long', year:'numeric'});
			renderCalendar();
		});
	});

	document.querySelectorAll(".btn").forEach(function (element) {
		element.addEventListener("click", function () {
			let btnClass = element.classList;
			date = new Date(currentMonth.textContent);
			if(btnClass.contains("today"))
				date = new Date();
			else if(btnClass.contains("prev-year"))
				date = new Date(date.getFullYear()-1, 0, 1);
			else
				date = new Date(date.getFullYear()+1, 0, 1);

			currentMonth.textContent = date.toLocaleDateString("ko-KR", {day:'numeric', month:'long', year:'numeric'});
			renderCalendar();
		});
	});
</script>
</body>
</html>
