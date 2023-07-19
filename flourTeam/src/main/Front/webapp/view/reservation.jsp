<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- TOAST Calendar -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />

<!-- TOAST Date Picker -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />

<script
	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<script
	src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>

<style>
.nav-tabs .nav-link.active{
  color: #0D6EFD;
}
.nav-tabs .nav-link{
  color: #495057;
}
.shadowWrap {
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}
</style>

</head>
<body>
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="background-image: url('https://i.imgur.com/XDyxuBN.jpg'); height: 300px; background-repeat: no-repeat; background-size: cover;">
		<div class="fs-1 fw-bolder text-white">예약</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div class="mt-4 fs-4 fw-bold">
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active col-6" id="nav-room-tab"
					data-bs-toggle="tab" data-bs-target="#nav-room" type="button"
					role="tab" aria-controls="nav-room" aria-selected="true">회의실</button>
				<button class="nav-link col-6" id="nav-car-tab" data-bs-toggle="tab"
					data-bs-target="#nav-car" type="button" role="tab"
					aria-controls="nav-car" aria-selected="false">차량</button>
			</div>
		</div>
		<div class="tab-content mt-4">
			<!-- 회의실 -->
			<div class="tab-pane fade show active fs-5 fw-bold" id="nav-room"
				role="tabpanel" aria-labelledby="nav-room-tab">
				
				<div class="nav nav-tabs" id="room-tab" role="tablist">
					<button class="nav-link active col-3" id="roomAll-tab"
						data-bs-toggle="tab" data-bs-target="#roomAll" type="button"
						role="tab" aria-controls="roomAll" aria-selected="true">전체</button>
					<button class="nav-link col-3" id="room1-tab" data-bs-toggle="tab"
						data-bs-target="#room1" type="button" role="tab"
						aria-controls="room1" aria-selected="false">회의실1</button>
						<button class="nav-link col-3" id="room2-tab" data-bs-toggle="tab"
						data-bs-target="#room2" type="button" role="tab"
						aria-controls="room2" aria-selected="false">회의실2</button>
						<button class="nav-link col-3" id="room3-tab" data-bs-toggle="tab"
						data-bs-target="#room3" type="button" role="tab"
						aria-controls="room3" aria-selected="false">회의실3</button>
				</div>

				<div class="text-center d-flex" style="margin-top: 80px;">
					<div class="col-4"></div>
					<div class="col-4 text-center d-flex justify-content-center">
						<div class="d-flex align-items-center">
							<button class="btn btn-light" id="prevBtn">&#60;</button>
						</div>
						<div class="my-auto">
							<div class="fs-4 mx-3 fw-bold" id="yearAndMonth"></div>
							<div class="btn btn-primary fw-bold p-1 px-2 mt-2"
							onclick="onClickTodayBtn()">Today</div>
						</div>
						<div class="d-flex align-items-center">
							<button class="btn btn-light" id="nextBtn">&#62;</button>
						</div>
					</div>
					<div class="col-4 text-end btn-group mt-5" role="group"
						aria-label="Basic radio toggle button group" style="height:40px;">
						<div class="col-6"></div>
						<input type="radio" class="btn-check col-3" name="btnRadioView"
						id="weekViewBtn" autocomplete="off" checked> 
						<label
						class="btn btn-outline-primary fw-bold mx-1 rounded-3"
						for="weekViewBtn">주간</label> 
						<input type="radio"
						class="btn-check col-3" name="btnRadioView" id="monthViewBtn"
						autocomplete="off"> 
						<label
						class="btn btn-outline-primary fw-bold mx-1 rounded-3"
						for="monthViewBtn">월간</label>
					</div>
				</div>
				<div class="mt-4 border" id="calendar" style="height: 600px;"></div>
			</div>
			<!-- 차량 -->
			<div class="tab-pane fade" id="nav-car" role="tabpanel"
				aria-labelledby="nav-car-tab">
				<div class="d-flex" style="margin-top: 80px;">
					<div class="col-3 p-2">
						<div class="shadowWrap">
							<div class="p-3">
								<div class="rounded"
									style="height: 200px; background-image: url('https://img.freepik.com/free-photo/white-luxury-sport-sedan-car-standing-race-trace-front-side-view_114579-1161.jpg?size=626&amp;ext=jpg&amp;ga=GA1.2.1966614627.1689728520&amp;semt=ais'); background-repeat: no-repeat; background-size: cover;"></div>
								<div class="fs-5 fw-bold p-1 mt-3">11하 1111</div>
								<div class="mt-2">
									<span>신청자 사번 : </span> <span>20010001</span>
								</div>
								<div>
									<span>예약날짜 : </span> <span>07월 19일</span>
								</div>
								<div>
									<span>신청시간 : </span> <span>09:00 ~ 12:00</span>
								</div>
								<div class="btn btn-primary mt-2 w-100 fw-bold fs-5"
								data-bs-toggle="modal" data-bs-target="#adminModal">처리대기</div>
							</div>
						</div>
					</div>
					<div class="col-3 p-2">
						<div class="shadowWrap">
							<div class="p-3">
								<div class="rounded"
									style="height: 200px; background-image: url('https://img.freepik.com/free-photo/black-luxury-sedan-road_114579-5072.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.1966614627.1689728520&amp;semt=ais'); background-repeat: no-repeat; background-size: cover;"></div>
								<div class="fs-5 fw-bold p-1 mt-3">22하 2222</div>
								<div class="mt-2">
									<span>신청자 사번 : </span> <span></span>
								</div>
								<div>
									<span>예약날짜 : </span> <span></span>
								</div>
								<div>
									<span>신청시간 : </span> <span></span>
								</div>
								<div class="btn btn-success mt-2 w-100 fw-bold fs-5"
									data-bs-toggle="modal" data-bs-target="#applicationModal">
									신청</div>
							</div>
						</div>
					</div>
					<div class="col-3 p-2">
						<div class="shadowWrap">
							<div class="p-3">
								<div class="rounded"
									style="height: 200px; background-image: url('https://img.freepik.com/free-photo/yellow-sport-car-with-black-autotuning-road_114579-5051.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.1966614627.1689728520&amp;semt=ais'); background-repeat: no-repeat; background-size: cover;"></div>
								<div class="fs-5 fw-bold p-1 mt-3">33하 3333</div>
								<div class="mt-2">
									<span>신청자 사번 : </span> <span>20010004</span>
								</div>
								<div>
									<span>예약날짜 : </span> <span>07월 21일</span>
								</div>
								<div>
									<span>신청시간 : </span> <span>13:00 ~ 14:00</span>
								</div>
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5">승인완료
								</div>
							</div>
						</div>
					</div>
					<div class="col-3 p-2">
						<div class="shadowWrap">
							<div class="p-3">
								<div class="rounded"
									style="height: 200px; background-image: url('https://img.freepik.com/free-photo/white-mini-coupe-road_114579-5082.jpg?size=626&amp;ext=jpg&amp;ga=GA1.2.1966614627.1689728520&amp;semt=ais'); background-repeat: no-repeat; background-size: cover;"></div>
								<div class="fs-5 fw-bold p-1 mt-3">44하 4444</div>
								<div class="mt-2">
									<span>신청자 사번 : </span> <span>20010007</span>
								</div>
								<div>
									<span>예약날짜 : </span> <span>07월 29일</span>
								</div>
								<div>
									<span>신청시간 : </span> <span>09:00 ~ 18:00</span>
								</div>
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5">승인완료
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<!-- 신청 -->
	<div class="modal fade" id="applicationModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약 신청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div>사번</div>
						<div class="form-control">session에 유저정보 중 사번</div>
					</div>
					<div class="mt-2">
						<div>예약 시작일</div>
						<%
							long time = System.currentTimeMillis();
						SimpleDateFormat date = new SimpleDateFormat("MM-dd hh:mm");
						String today = date.format(new Date(time));
						%>
						<input type="date" class="form-control" id="createDateStart"
							min="<%=today%>">
					</div>
					<div class="mt-2">
						<div>예약 종료일</div>
						<input type="date" class="form-control" id="createDateEnd"
							min="<%=today%>">
					</div>
					<div class="mt-2">
						<div>용도</div>
						<div class="form-floating" id="applicationTextareaBox">
							<textarea class="form-control" id="applicationTextarea"
								style="height: 100px;"></textarea>
							<label for="applicationTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-target="#applicationModalFail" data-bs-toggle="modal" 
						data-bs-dismiss="modal">신청</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 신청성공 -->
	<div class="modal fade" id="applicationModalSuccess" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-success d-flex justify-content-center">
						<i class="bi bi-check-circle" style="font-size: 100px;"></i>
					</div>
					<div class="m-2 text-wrap text-center">
						<h3>신청되었습니다.</h3>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 신청실패 -->
	<div class="modal fade" id="applicationModalFail" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-danger d-flex justify-content-center">
						<i class="bi bi-x-circle" style="font-size: 100px;"></i>
					</div>
					<div class="m-2 text-wrap text-center">
						<h3>예약에 실패했습니다.<br>다시 시도해주세요.</h3>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 관리자 승인 모달 -->
	<div class="modal fade" id="adminModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">승인 대기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div>사번</div>
						<div class="form-control">신청자 사번</div>
					</div>
					<div class="mt-2">
						<div>시작일</div>
						<div class="form-control">00-00 00:00</div>
					</div>
					<div class="mt-2">
						<div>종료일</div>
						<div class="form-control">00-00 00:00</div>
					</div>
					<div class="mt-2">
						<div>용도</div>
						<div class="form-control" style="height: 100px;">내용</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" 
						data-bs-dismiss="modal">승인</button>
					<button type="button" class="btn btn-danger"
						data-bs-target="#adminModalDetail" data-bs-toggle="modal" 
						data-bs-dismiss="modal">반려</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 반려 사유 선택 -->
	<div class="modal fade" id="adminModalDetail" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">반려 사유 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>반려 사유 선택</div>
					<select class="form-select" aria-label="Default select example">
					  <option selected>먼저 승인된 일정이 있습니다.</option>
					  <option value="1">수리, 보수 등으로 사용불가 상태입니다.</option>
					  <option value="2">일정관리자에게 유선문의 부탁드립니다.</option>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">거절사유 입력</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script
		src="https:/cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
	<script>
				// 캘린더를 생성하기 위해 tui-calendar 객체와 스타일 코드 삽입

					// TOAST Calendar
					const Calendar = tui.Calendar;
const container = document.getElementById('calendar');

const options = {
  defaultView: 'week',          // 캘린더가 초기에 그려지는 뷰 타입을 주간 뷰로 지정
   useDetailPopup: true,
   useFormPopup: true, 	// 이런 *** 너 때문에 몇 시간 날린거야
  week: {                       // 주간 뷰 시간 지정
    hourStart: 9,
    hourEnd: 18,
	taskView:false, 
  },
  month:{
	visibleEventCount: 2,
  },
  usageStatistics: false,
  calendars: [
		{
		  id: 'room1',
		  name: '회의실1',
		  backgroundColor: 'red',
		},
		{
		  id: 'room2',
		  name: '회의실2',
		  backgroundColor: 'skyblue',
		},
		{
		  id: 'room3',
		  name: '회의실3',
		  backgroundColor: 'yellowgreen',
		},
	  ],
};

const calendar = new Calendar(container, options);  // 캘린더 인스턴스 생성

calendar.setTheme({
	common:{
gridSelection:{
	backgroundColor:'rgba(255, 193, 7, 0.05)',
	border:'2px dotted orange',
},
	},
  week: {
    today: {
    },
  },
});

calendar.setOptions({
	template: {
		time(event) {
      return '<span class="fs-6 ms-2">'+event.title+'</span>';
    },
		popupIsAllday() {
      return '종일';
    },
	titlePlaceholder() {
      return '기획팀 팀장 왕감자';
    },
	popupStateFree() {
      return '일반';
    },
	popupStateBusy() {
      return '중요';
    },
	popupSave() {
      return '신청';
    },
	popupUpdate() {
      return '수정';
    },
	popupEdit() {
      return '일정수정';
    },
	popupDelete() {
      return '일정 삭제';
    },
  },
})


// 버튼그룹
var yearAndMonth = document.getElementById("yearAndMonth");
var date = calendar.getDate();
yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);

/* 이동 및 뷰 타입 버튼 이벤트 핸들러 */
nextBtn.addEventListener('click', () => {
  calendar.next();                          // 현재 뷰 기준으로 다음 뷰로 이동
  var date = calendar.getDate();
yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);
});

prevBtn.addEventListener('click', () => {
  calendar.prev();                          // 현재 뷰 기준으로 이전 뷰로 이동
  var date = calendar.getDate();
yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);
});

weekViewBtn.addEventListener('click', () => {
  calendar.changeView('week', true);        // 주간 뷰 보기
});

monthViewBtn.addEventListener('click', () => {
  calendar.changeView('month', true);       // 월간 뷰 보기
});

	  //today button
	  function onClickTodayBtn() { 
  calendar.today();
  var date = calendar.getDate();
yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);

}


//등록
calendar.createEvents([
	  {
		// userId:null;
		id: 'event1',					//일정 ID
		calendarId: 'room1',			//캘린더 ID(css 설정)
		title: '감자깎기',				//제목
		start: '2023-07-18T09:00:00',	//시작 시간
		end: '2023-07-18T10:00:00',		//종료 시간
	  },
	  {
		id: 'event2',
		calendarId: 'room2',
		title: '점심 약속',
		start: '2023-07-19T12:00:00',
		end: '2023-07-19T13:00:00',
	  },
	  {
		id: 'event3',
		calendarId: 'room3',
		title: '숨쉬기운동',
		start: '2023-07-19T10:00:00',
		end: '2023-07-19T11:30:00',
	  }
	]);


	//일정 생성
	calendar.on('beforeCreateEvent', eventData => {
  const event = {
    id: String(Math.random() * 100000000000000000),
    calendarId: eventData.calendarId,
    title: eventData.title,
    start: eventData.start,
    end: eventData.end,
  };

  calendar.createEvents([event]);
});



//일정 편집
calendar.on('beforeUpdateEvent', eventData => {

  const { event } = eventData;
  //const { id, calendarId, ...rest } = event;

  calendar.updateEvent(event.id, event.calendarId, event);
});

//일정 삭제
calendar.on('beforeDeleteEvent', eventData => {
	const {id,calendarId} = eventData;
  calendar.deleteEvent(id, calendarId);
});


//차량 예약
		// 모달
		let applicationTextareaWorkBox = document.getElementById("applicationTextareaWorkBox");
				let applicationTextareaWork = document.getElementById("applicationTextareaWork");
				let applicationModal = document.getElementById("applicationModal");
				let applicationModalCheck = false; 
				
		
				//applicationModal textarea null값 시 이벤트
				applicationTextarea.addEventListener("blur",()=>{
					
					if(applicationTextarea.value === null || applicationTextarea.value.trim()===""){
						applicationTextareaBox.classList.add("is-invalid");
						applicationTextarea.classList.add("is-invalid");
						applicationTextarea.focus();
						applicationModalCheck = false;
					}else{
						applicationTextareaBox.classList.remove("is-invalid");
						applicationTextarea.classList.remove("is-invalid");
						applicationModalCheck = true;
					}
				})
			
				/* 새업무 등록 시작/종료 날짜 */		
				window.addEventListener('DOMContentLoaded', () => {
					const startDateInput = document.getElementById('createDateStart');
					const endDateInput = document.getElementById('createDateEnd');
		
					const today = new Date().toISOString().split('T')[0];
		
					startDateInput.setAttribute('min', today);
					endDateInput.setAttribute('min', today);
		
					startDateInput.addEventListener('input', () => {
						const startDate = new Date(startDateInput.value);
						endDateInput.setAttribute('min', startDate.toISOString().split('T')[0]);
					});
		
					endDateInput.addEventListener('input', () => {
						const endDate = new Date(endDateInput.value);
						startDateInput.setAttribute('max', endDate.toISOString().split('T')[0]);
					});
				});
	</script>
</body>
</html>