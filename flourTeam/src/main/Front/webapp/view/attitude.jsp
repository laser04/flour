<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>

<body>
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="fs-1 fw-bolder text-white">근태관리</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div class="w-100 d-flex p-4 justify-content-between">
			<div class="d-inline" style="width: 23%;">
				<div class="p-2"
					style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
					<div class="text-center fs-4 text-success mt-3 fw-bold"
						id="current-date"></div>
					<div class="text-center fs-4 text-success mt-3 fw-bold"
						id="current-time"></div>
					<div class="text-center my-3" role="group"
						aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="btnradio" id="commute"
							autocomplete="off"> <label
							class="btn btn-outline-warning w-25 mx-1 fw-bold" for="commute"
							data-bs-toggle="modal" data-bs-target="#commuteModal">출근</label>

						<input type="radio" class="btn-check" name="btnradio" id="finish"
							autocomplete="off"> <label
							class="btn btn-outline-warning w-25 mx-1 fw-bold" for="finish"
							data-bs-toggle="modal" data-bs-target="#finishModal">퇴근</label>
					</div>
				</div>
				<div class="mt-4 p-2"
					style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
					<div class="text-center mt-3 text-success fw-bold fs-5">이번 주
						근로시간</div>
					<div class="text-center mt-3">
						<span>2023-07-03</span> ~ <span>2023-07-07</span>
					</div>
					<div class="text-center mt-3">
						<span>20시간 30분</span>
					</div>
					<div class="progress w-50 mx-auto my-3">
						<div class="progress-bar bg-success" role="progressbar"
							aria-label="Success example" style="width: 80%"
							aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>

			<div class="w-75 d-inlie">
				<div class="d-flex justify-content-center p-3"
					style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
					<div class="col-4"></div>
					<div class="col-4 fs-3 text-center fw-bold">근태관리</div>
					<div class="col-4 d-flex align-items-end justify-content-end">
						<span class="mx-4 p-2">부장</span> <span class="mx-4 p-2">왕감자</span>
					</div>
				</div>
				<div class="mt-4 p-3"
					style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
					<div class="">
						<div class="btn w-100 bg-success bg-opacity-25 fw-bold p-1">Excel
							다운</div>
					</div>
					<div class="mt-4">
						<table class="table text-center">
							<tr>
								<th class="col-4">날짜</th>
								<th class="col-2">성명</th>
								<th class="col-2">출근시간</th>
								<th class="col-2">퇴근시간</th>
								<th class="col-2">근무시간</th>
							</tr>
							<!-- sample -->
							<tr>
								<td>07-07</td>
								<td>왕감자</td>
								<td>08:58</td>
								<td>21:50</td>
								<td>12:58</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 - 출근버튼 -->
	<div class="modal fade" id="commuteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-dark d-flex justify-content-center">
						<i class="bi bi-person-workspace" style="font-size: 100px;"></i>
					</div>
					<div class="m-2 text-wrap text-center">
						<h3>출근 체크하시겠습니까?</h3>
						<div>
							현재시간 : <span id="current-time-commute"></span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">출근</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal" onclick="cancleRadio()">취소</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 모달 - 퇴근버튼 -->
	<div class="modal fade" id="finishModal" tabindex="-1" role="dialog"
		aria-labelledby="finishModalLabel" aria-hidden="true"
		data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-dark d-flex justify-content-center">
						<i class="bi bi-house" style="font-size: 100px;"></i>
					</div>
					<div class="m-2 text-wrap text-center">
						<h3>퇴근 체크하시겠습니까?</h3>
						<div>
							현재시간 : <span id="current-time-finish"></span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						data-bs-dismiss="modal">퇴근</button>
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal" onclick="cancleRadio()">취소</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		// 현재 날짜와 시간을 업데이트하는 함수
		function updateDateTime() {
			var currentDateTime = new Date();
			var currentDate = currentDateTime.toLocaleDateString('ko-KR');
			var currentTime = currentDateTime.toLocaleTimeString('ko-KR');

			document.getElementById('current-date').textContent = currentDate;
			document.getElementById('current-time').textContent = currentTime;
			document.getElementById('current-time-commute').textContent = currentTime;
			document.getElementById('current-time-finish').textContent = currentTime;
		}

		// 출근 버튼을 클릭했을 때 호출되는 함수
		function clockIn() {
			var startTime = new Date().toLocaleTimeString('ko-KR');
			document.getElementById('start-time').textContent = startTime;
		}

		// 퇴근 버튼을 클릭했을 때 호출되는 함수
		function clockOut() {
			var endTime = new Date().toLocaleTimeString('ko-KR');
			document.getElementById('end-time').textContent = endTime;
		}

		// 초기화 및 주기적으로 날짜와 시간을 업데이트하는 함수
		function initialize() {
			updateDateTime();
			setInterval(updateDateTime, 1000);
		}

		initialize();

		function getCurrentDay() {
			const days = [ '일', '월', '화', '수', '목', '금', '토' ];
			const now = new Date();
			return days[now.getDay()];
		}

		// 데이터베이스에서 근로시간을 가져와 합산하는 함수
		function calculateWeeklyHours() {
			const mondayHours = 8;
			const tuesdayHours = 9;
			const wednesdayHours = 7;
			const thursdayHours = 9;
			const fridayHours = 9;
			const saturdayHours = 8;
			const sundayHours = 7;
			const currentDay = getCurrentDay();
			let weeklyHours = 100;

			// 현재 요일까지의 근로시간 합산
			switch (currentDay) {
			case '월':
				weeklyHours = mondayHours;
				break;
			case '화':
				weeklyHours = mondayHours + tuesdayHours;
				break;
			case '수':
				weeklyHours = mondayHours + tuesdayHours + wednesdayHours;
				break;
			case '목':
				weeklyHours = mondayHours + tuesdayHours + wednesdayHours
						+ thursdayHours;
				break;
			case '금':
				weeklyHours = mondayHours + tuesdayHours + wednesdayHours
						+ thursdayHours + fridayHours;
				break;
			case '토':
				weeklyHours = mondayHours + tuesdayHours + wednesdayHours
						+ thursdayHours + fridayHours + saturdayHours;
				break;
			case '일':
				weeklyHours = mondayHours + tuesdayHours + wednesdayHours
						+ thursdayHours + fridayHours + saturdayHours
						+ sundayHours;
				break;
			// ...
			}

			return weeklyHours;
		}

		// 진행도를 계산하여 progress bar를 업데이트하는 함수
		function updateProgressBar() {
			const weeklyHours = calculateWeeklyHours();
			const currentHours = 40; // 예시

			const progressBar = document.getElementById('progress-bar-fill');
			const progressPercentage = (currentHours / weeklyHours) * 100;

			progressBar.style.width = progressPercentage + '%';
		}

		// 페이지가 로드되었을 때 실행되는 함수
		window.onload = function() {
			// 현재 날짜와 시간 표시
			const currentDate = new Date().toLocaleDateString();
			const currentTime = new Date().toLocaleTimeString();

			document.getElementById('current-date').textContent = currentDate;
			document.getElementById('current-time').textContent = currentTime;

			// 근로시간과 진행도 업데이트
			updateProgressBar();
		};

		//모달 취소 버튼 클릭 시 radio check 해제
		function cancleRadio() {
			$("input:radio[name=btnradio]").prop('checked', false);
		}
	</script>
</body>
</html>