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
<!-- Datepicker -->




<style>
div {
	/* border:1px solid black; */
	
}
</style>

</head>
<body>
	<script
		src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="fs-1 fw-bolder text-white">예약</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-room-tab"
					data-bs-toggle="tab" data-bs-target="#nav-room" type="button"
					role="tab" aria-controls="nav-room" aria-selected="true">회의실</button>
				<button class="nav-link" id="nav-car-tab" data-bs-toggle="tab"
					data-bs-target="#nav-car" type="button" role="tab"
					aria-controls="nav-car" aria-selected="false">차량</button>
			</div>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="nav-room" role="tabpanel"
				aria-labelledby="nav-room-tab">
				<div>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-all-tab"
							data-bs-toggle="tab" data-bs-target="#nav-all" type="button"
							role="tab" aria-controls="nav-all" aria-selected="true">전체</button>
						<button class="nav-link" id="nav-room1-tab" data-bs-toggle="tab"
							data-bs-target="#nav-room1" type="button" role="tab"
							aria-controls="nav-room1" aria-selected="false">회의실1</button>
						<button class="nav-link" id="nav-room2-tab" data-bs-toggle="tab"
							data-bs-target="#nav-room2" type="button" role="tab"
							aria-controls="nav-room2" aria-selected="false">회의실2</button>
						<button class="nav-link" id="nav-room3-tab" data-bs-toggle="tab"
							data-bs-target="#nav-room3" type="button" role="tab"
							aria-controls="nav-room3" aria-selected="false">회의실3</button>
					</div>
				</div>
				<button class="btn rounded" onclick="onClickTodayBtn()">Today</button>
				<button id="prevBtn">이전</button>
				<span class="navbar--range"></span>
				<button id="nextBtn">다음</button>
				<button id="weekViewBtn">주간</button>
				<button id="monthViewBtn">월간</button>

				<div id="tui-datepicker" style="margin-top: -1px;"></div>

				<div id="calendar" style="height: 600px;"></div>

			</div>
			<div class="tab-pane fade" id="nav-car" role="tabpanel"
				aria-labelledby="nav-car-tab">
				<h3>회원탈퇴 폼</h3>
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
   useFormPopup:true, 	// 이런 *** 너 때문에 몇 시간 날린거야
  week: {                       // 주간 뷰 시간 지정
    hourStart: 9,
    hourEnd: 18,
	taskView:false, 
  },
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
	  ]
};

const calendar = new Calendar(container, options);  // 캘린더 인스턴스 생성

/* 이동 및 뷰 타입 버튼 이벤트 핸들러 */
nextBtn.addEventListener('click', () => {
  calendar.next();                          // 현재 뷰 기준으로 다음 뷰로 이동
});

prevBtn.addEventListener('click', () => {
  calendar.prev();                          // 현재 뷰 기준으로 이전 뷰로 이동
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
}


//등록
calendar.createEvents([
	  {
		// userId:null;
		id: 'event1',					//일정 ID
		calendarId: 'room1',			//캘린더 ID(css 설정)
		title: '주간 회의',				//제목
		start: '2023-07-10T09:00:00',	//시작 시간
		end: '2023-07-10T10:00:00',		//종료 시간
	  },
	  {
		id: 'event2',
		calendarId: 'room2',
		title: '점심 약속',
		start: '2023-07-11T12:00:00',
		end: '2023-07-11T13:00:00',
	  },
	  {
		id: 'event3',
		calendarId: 'room3',
		title: '숨쉬기운동',
		start: '2023-07-11T10:00:00',
		end: '2023-07-11T11:30:00',
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

  alert('일정 생성 완료');
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

	</script>
</body>
</html>