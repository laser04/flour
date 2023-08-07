<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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
.nav-tabs .nav-link.active {
	color: #0D6EFD;
}

.nav-tabs .nav-link {
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
						aria-label="Basic radio toggle button group" style="height: 40px;">
						<div class="col-6"></div>
						<input type="radio" class="btn-check col-3" name="btnRadioView"
							id="weekViewBtn" autocomplete="off" checked> <label
							class="btn btn-outline-primary fw-bold mx-1 rounded-3"
							for="weekViewBtn">주간</label> <input type="radio"
							class="btn-check col-3" name="btnRadioView" id="monthViewBtn"
							autocomplete="off"> <label
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
				
					<c:forEach items="${carList}" var="car">
					<!-- 모달들에 보낼 carid -->
					<input type="hidden" value="${car.RESERVATIONCARID}" id="carid">
					<div class="col-3 p-2">
						<div class="shadowWrap">
							<div class="p-3">
								<div class="rounded"
									style="height: 200px; background-image: url('${car.RESERVATIONCARIMAGE}'); background-repeat: no-repeat; background-size: cover;"></div>
								<div class="fs-5 fw-bold p-1 mt-3">${car.RESERVATIONCARVALUE}</div>
								<div class="mt-2">
									<span>신청자 사번 : </span> <span>${car.RESERVATIONCARUSERID}</span>
								</div>
								<div>
									<span>예약날짜 : </span> <span>${car.RESERVATIONCARSTARTTIME}
									</span><span>~</span> <span>${car.RESERVATIONCARENDTIME}</span>
								</div>
								<div>
									<span>목적지 : </span> 
									<span>${car.RESERVATIONCARDESTINATION}</span>
								</div>
								<div>
									<span>용도 : </span> 
									<span>${car.RESERVATIONCARUSE}</span>
								</div>
										
								<!--신청 -->		
								<c:if test="${car.RESERVATIONCARSTATUS eq '신청' }">
								 						
									<div
  									class="btn btn-success mt-2 w-100 fw-bold fs-5"
  									data-bs-toggle="modal"
  									data-bs-target="#applicationModal"
  									data-car-id="${car.RESERVATIONCARID}"
  									onClick="sendValues1(this)"
  									>
								${car.RESERVATIONCARSTATUS}</div>
								</c:if>
								
								<!--처리대기 -->
								<!--유저아이디가 관리자면 위에 처리대기버튼 아니면 아래의 처리대기버튼(클릭해도기능없는거)뜨게하기  -->
								<!-- 일단 아이디가 1이 관리자라고 치자 -->
								<c:choose>
								<c:when  test="${car.RESERVATIONCARSTATUS eq '처리대기' 
								&& role	eq 'ADMIN' }">
								<div class="btn btn-primary mt-2 w-100 fw-bold fs-5"
  									data-bs-toggle="modal" data-bs-target="#adminModal"
 									data-car-id="${car.RESERVATIONCARID}"
 									data-user-id="${car.RESERVATIONCARUSERID}"
  									data-start-time="${car.RESERVATIONCARSTARTTIME}"
  									data-end-time="${car.RESERVATIONCARENDTIME}"
  									data-destination="${car.RESERVATIONCARDESTINATION}"
  									data-car-use="${car.RESERVATIONCARUSE}"
  									onClick="sendValues2(this)">
  								처리 대기</div>
  								</c:when >
  								
								<c:when  test="${car.RESERVATIONCARSTATUS eq '처리대기'}">
									<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5">처리대기</div>
								</c:when >	
								</c:choose>
								
								<!-- 승인완료 -->
								<!-- 로그인된 아이디랑 신청한아이디랑 같을때 --><!-- 여기도세션씀 -->
								<c:choose>
								<c:when test="${car.RESERVATIONCARSTATUS eq '승인완료' 
								&&( id eq car.RESERVATIONCARUSERID || 
								role eq 'ADMIN')}">
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5"
								onClick="usecomplete('${car.RESERVATIONCARID}','신청')">
								승인 완료</div>
								</c:when>
								
								<c:when test="${car.RESERVATIONCARSTATUS eq '승인완료' }">
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5">
								승인완료</div>
								</c:when>
								</c:choose>
								
								<!--반려 -->
								<!-- 일단 아이디가 1이 관리자라고 치자 -->
								<c:choose>
								<c:when test="${car.RESERVATIONCARSTATUS eq '반려' 
								&& role eq 'ADMIN'}">
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5"
								onClick="rejectcancel('${car.RESERVATIONCARID}','신청')">
								반 려</div>
								<div>
									<span>반려사유 : </span> <span>${car.RESERVATIONCARREJECTREASON}</span>
								</div>
								</c:when>
								
								<c:when test="${car.RESERVATIONCARSTATUS eq '반려' }">
								<div class="btn btn-secondary mt-2 w-100 fw-bold fs-5">
								반려</div>
								<div>
									<span>반려사유 : </span> <span>${car.RESERVATIONCARREJECTREASON}</span>
								</div>
								</c:when>							
								</c:choose>
							
							
							</div>
						</div>
					</div>
					</c:forEach>
								
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<!-- 신청 -->
	<%  long time = System.currentTimeMillis();
		SimpleDateFormat date = new SimpleDateFormat("MM-dd hh:mm");
		String today = date.format(new Date(time));%>
	<form action="<%=request.getContextPath()%>/reservation/reservationRequest" method="post">
		<sec:csrfInput/>
	<div class="modal fade" id="applicationModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">예약 신청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- 해당 carid -->
				<input type="hidden" name="RESERVATIONCARID" id="carid1">
				<!-- 신청에서 처리대기로 바꾸기위해 보낼때 값을 보냄  -->
				<input type="hidden" name="RESERVATIONCARSTATUS" value="처리대기">
					<div>
						<div>사번</div>
						<input type="text" class="form-control" 
						value="${id}" 
						name="RESERVATIONCARUSERID" readonly>
					</div>
					<div class="mt-2">
						<div>예약 시작일</div>
						<input type="date" class="form-control" id="createDateStart"
							min="<%=today%>"  name="RESERVATIONCARSTARTTIME">
					</div>
					<div class="mt-2">
						<div>예약 종료일</div>
						<input type="date" class="form-control" id="createDateEnd"
							min="<%=today%>" name="RESERVATIONCARENDTIME">
					</div>
					<div class="mt-2">
						<div>목적지</div>
						<input type="text" class="form-control"
						 name="RESERVATIONCARDESTINATION">
					</div>
					
					<div class="mt-2">
						<div>용도</div>
						<div class="form-floating" id="applicationTextareaBox">
							<textarea class="form-control" id="applicationTextarea"
							style="height: 100px;" name="RESERVATIONCARUSE"></textarea>
							<label for="applicationTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
				</div>
				<div class="modal-footer">  <!--class만 살려서 input으로 바꾸기  -->
					<input type="submit" class="btn btn-primary" value="신청"
					data-bs-dismiss="modal">
					
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	</form>

	<!-- 관리자 승인 모달 -->
	<div class="modal fade" id="adminModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">승인 대기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<!-- 해당 carid -->
				<input type="hidden" name="RESERVATIONCARID" id="carid2">
				<!-- 승인대기에서 승인완료로 바꾸기위해 보낼때 값을 보냄  -->
				<input type="hidden" name="RESERVATIONCARSTATUS" id="carstatus2" value="승인완료">
				<div class="modal-body">
					<div>
						<div>사번</div>
						<div class="form-control user"> </div>
					</div>
					<div class="mt-2">
						<div>시작일</div>
						<div class="form-control start"></div>
					</div>
					<div class="mt-2">
						<div>종료일</div>
						<div class="form-control end"> </div>
					</div>
					<div class="mt-2">
						<div>목적지</div>
						<div class="form-control dest"></div>
					</div>
					<div class="mt-2">
						<div>용도</div>
						<div class="form-control use" style="height: 100px;">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<!--승인 반려 각각   다른곳으로 이동(다른 url컨트롤러) 되게하기 
				(반려시 버튼자리에 반려뜨게하고 반려정보 버튼밑에뜨게하기)-->
					<button type="button" class="btn btn-success"
					onClick="sendAcceptData(document.getElementById('carid2').value, document.getElementById('carstatus2').value);">
					승인</button>
					<button type="button" class="btn btn-danger" data-bs-target="#adminModalDetail" 
  					data-bs-toggle="modal" data-bs-dismiss="modal"
  					onclick="document.getElementById('carid3').value = document.getElementById('carid2').value;">
  					반려
						</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 반려 사유 선택 -->
	<!-- 반려테이블 만들기 -->
	<form action="<%=request.getContextPath()%>/reservation/carreject" method="post">
	<sec:csrfInput/>
	<div class="modal fade" id="adminModalDetail" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">반려 사유 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<!-- 해당 carid -->
				<input type="hidden" name="RESERVATIONCARID" id="carid3">
				<!-- 처리대기에서 반려로 바꾸기위함 -->
				<input type="hidden" name="RESERVATIONCARSTATUS" value="반려">
				
				<div class="modal-body">
					<div>반려 사유 선택</div>
					<select class="form-select" aria-label="Default select example"
					name="RESERVATIONCARREJECTREASON">
						<option  value="먼저 승인된 일정이 있습니다." selected>
						먼저 승인된 일정이 있습니다.</option>
						<option value="수리, 보수 등으로 사용불가 상태입니다.">
						수리, 보수 등으로 사용불가 상태입니다.</option>
						<option value="일정관리자에게 유선문의 부탁드립니다.">
						일정관리자에게 유선문의 부탁드립니다.</option>
					</select>
				</div>
				<div class="modal-footer">
				<input type="submit"  class="btn btn-danger"
						data-bs-dismiss="modal" value="거절사유 입력">
				</div>
			</div>
		</div>
	</div>
	</form>
	
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
   useFormPopup: true,
  week: {                       // 주간 뷰 시간 지정
    hourStart: 7,
    hourEnd: 20,
	taskView:false, 
	//eventView: ['time']   //allday view 안나오게하는거
  },
  month:{
	visibleEventCount: 2, //월간에서 몆개가뜨는지 현재 2개뜸 4개면 +more 2개이상됐울때 
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
gridSelection:{ //드래그했을때 기능
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
    popupAddLocation: () => {
        return '장소:';
      },
      popupEditLocation: () => {
        return '장소:';
      },
		popupIsAllday() {
      return '종일';
    },
	titlePlaceholder() {
      return '팀명을 입력하시오. ';
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
  calendar.changeView('month', true);       // 월간 뷰 보기   주간월간 둘다 날짜호환됨
});

	  //today button
	  function onClickTodayBtn() { 
  calendar.today();
  var date = calendar.getDate();
yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);

}


// csrf토큰 추가하기
 const csrfToken = $("meta[name='_csrf']").attr("content");
 const csrfHeader = $("meta[name='_csrf_header']").attr("content");

//일정 생성 요청 보내기
async function createEvent(event) {

   $.ajax({   
    
      type: "POST",
      url: "<%=request.getContextPath()%>/reservation/createevent",
      data: JSON.stringify(event), 
      contentType: "application/json; charset=utf-8", 
      dataType: "json",
      beforeSend: function (xhr) {
          xhr.setRequestHeader(csrfHeader, csrfToken);
        }, 
 		 })
	}
 
// 일정 수정 요청 보내기
async function updateEvent(event) {
  await fetch('<%=request.getContextPath()%>/reservation/updateevent', { 
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      [csrfHeader]: csrfToken,
    },
    body: JSON.stringify(event),
  });
}

// 일정 삭제 요청 보내기
async function deleteEvent(id, location) {
  await fetch("<%=request.getContextPath()%>/reservation/deleteevent?id="+id+"&location="+location, {
    method: 'DELETE',
    headers: {
        [csrfHeader]: csrfToken,
      },
    
  });
}

// 일정 생성
calendar.on('beforeCreateEvent', async (eventData) => {
  const event = { //유저 아이디를 일단 세션으로 불러옴
    id:String(Math.random() * 100000000000000000) ,//게시판 아이디 (이걸로 구분)
    location: String(${id}), //유저아이디
    calendarId: eventData.calendarId,  //회의실 1 2 3
    title: eventData.title,
    start: new Date(eventData.start).toISOString(),
    end: new Date(eventData.end).toISOString(),  
    state : eventData.state, // 중요 : busy , 일반 : free
  };

  calendar.createEvents([event]);
  await createEvent(event);
  alert("추가 완료")
});

//일정 편집
calendar.on('beforeUpdateEvent', async (eventData) => {
  const { event , changes} = eventData;
  const updatedEvent = {
		    id: event.id,
		    location: event.location,
		    calendarId: changes.calendarId	|| event.calendarId,
		    title: changes.title || event.title,
		    start: changes.start ? new Date(changes.start).toISOString() : new Date(event.start).toISOString(),
		    end: changes.end ? new Date(changes.end).toISOString() : new Date(event.end).toISOString(),
		    state: changes.state || event.state
		  };
  calendar.updateEvent(event.id, event.calendarId, changes);
  await updateEvent(updatedEvent);
  alert("수정 완료")
});

// 일정 삭제
calendar.on('beforeDeleteEvent', async (eventData) => {
  const { id, location,calendarId } = eventData;

  calendar.deleteEvent(id, calendarId); //원래 변수넣는자리가 정해져있나봄 ..
  await deleteEvent(id, location);
  alert("삭제 완료")
});

$('.toastui-calendar-event-form-popup-slot').on('DOMNodeInserted', function() {
	  /* location */
	    $(".toastui-calendar-popup-section-location").parent().attr("style","display:none"); 
	  /* private */
	   $(".toastui-calendar-ic-public").parent().attr("style","display:none");
	  /* state */
	  /* $(".toastui-calendar-state-section").attr("style","display:none"); */
	//isAllday삭제
	   $(".toastui-calendar-ic-checkbox-normal").parent().attr("style","display:none");
	
	});
	   
/* 	$(".toastui-calendar-event-detail-popup-slot").on('DOMNodeInserted',function(){
	   console.log("주간");
	})    */
	   



//데이터베이스에 저장된 정보 받기
async function fetchEvents() {
  try {
    // API 호출을 통해 데이터베이스에서 일정 정보 가져오기
    const response = await fetch('<%=request.getContextPath()%>/reservation/getreservation');
    const events = await response.json();

    // 가져온 일정 정보를 달력에 추가
    events.forEach(event => {  //event는 events배열의 안에있는  각각의 객체
      calendar.createEvents([{
        id: event.id,
        location: event.location,
        calendarId: event.calendarId,
        title: event.title,
        start: new Date(event.start).toISOString(),
        end: new Date(event.end).toISOString(),
        state : event.state, // 중요 : busy , 일반 : free
      }]);
    });
  } catch (error) {
    console.error('Error fetching events:', error);
  }
}

// 페이지 로드 시 이벤트 데이터를 가져와 달력에 표시
document.addEventListener('DOMContentLoaded', () => {
  fetchEvents();
});
//DOMContentLoaded: 웹 페이지의 로드가 완료된 후에 fetchEvents 실행
	
	//입력한사람만 일정 수정가능하게해주는 이벤트(location에 userid저장)
	calendar.on('clickEvent', (eventData)=>{

 	 if(eventData.event.location == ${id}
 	 || ${role}=="ADMIN"){
  		options.useDetailPopup = true;
  	}else{
   	options.useDetailPopup = false;
 	 }
	});

	$(document).on('mousedown', '.toastui-calendar-event-detail-popup-slot', function(event) {
 	 if(!options.useDetailPopup){
   	alert("등록자만 수정 가능합니다.");
 		 }
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
				//신청할때 일정날짜 입력해야지만하게하는기능
				document.addEventListener("DOMContentLoaded", function () {
  				const submitButton = document.querySelector(
    				"#applicationModal input[type=submit]"
  					);

  				// 예약일 입력 검사 함수
  				const checkReservationDates = () => {
   				 const reservationStart = document.getElementById("createDateStart");
    				const reservationEnd = document.getElementById("createDateEnd");

    				if (!reservationStart.value || !reservationEnd.value) {
     				 alert("예약 시작일과 예약 종료일을 모두 입력해주세요.");
      				return false;
   				}
   				 return true;
  				};

  				// 제출 버튼 이벤트 리스너
  				submitButton.addEventListener("click", (e) => {
   				 // 예약일이 비어있는 경우, 양식 제출을 방지하고 경고 처리
    				if (!checkReservationDates()) {
     				 e.preventDefault();
   				 }
 					 });
						});
			
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
				
					//차량 정보들 해당 모달값에 전달
					function sendValues1(element) {//신청클릭시
						const targetModalId = $(element).data('bs-target');
						const carId = $(element).data('car-id');
						const targetModal = $(targetModalId);

						 $(targetModal).find("input[name='RESERVATIONCARID']").val(carId); 
						 }
					
					
					function sendValues2(element) {//처리대기클릭시
					  const targetModalId = $(element).data('bs-target');
					  const carId = $(element).data('car-id');
					  const userId = $(element).data('user-id');
					  const startTime = $(element).data('start-time');
					  const endTime = $(element).data('end-time');
					  const destination = $(element).data('destination');
					  const carUse = $(element).data('car-use');
					  const targetModal = $(targetModalId);

					  $(targetModal).find("input[name='RESERVATIONCARID']").val(carId);
					  $(targetModal).find(".form-control.user").text(userId);
					  $(targetModal).find(".form-control.start").text(startTime);
					  $(targetModal).find(".form-control.end").text(endTime);
					  $(targetModal).find(".form-control.dest").text(destination);
					  $(targetModal).find(".form-control.use").text(carUse);
					}
 			
					
					
					
					//  Ajax POST로 전환
					function sendAcceptData(carId, carStatus) {
					  sendPostRequest('/reservation/requestaccept', { RESERVATIONCARID: carId, RESERVATIONCARSTATUS: carStatus });
					}

					function usecomplete(carId, carStatus) {
					  if (confirm("차량을 반납하시겠습니까?")) {
					    sendPostRequest('/reservation/usecomplete', { RESERVATIONCARID: carId, RESERVATIONCARSTATUS: carStatus });
					  }
					}

					function rejectcancel(carId, carStatus) {
					  if (confirm("반려를 취소하시겠습니까?")) {
					    sendPostRequest('/reservation/usecomplete', { RESERVATIONCARID: carId, RESERVATIONCARSTATUS: carStatus });
					  }
					}

					// POST 전송을 위한 함수
					async function sendPostRequest(url, data) {
						// csrf 토큰 추가하기
						  const csrfToken = $("meta[name='_csrf']").attr("content");
						  const csrfHeader = $("meta[name='_csrf_header']").attr("content");
	
					  const formData = new FormData();

					  for (const key in data) {
					    formData.append(key, data[key]);
					  }

					  const response = await fetch('<%=request.getContextPath()%>' + url, {
					    method: 'POST',
					    body: formData,
					    headers: {
						      [csrfHeader]: csrfToken,
						    },
					  });

					  // 응답 메시지 처리
					  if (response.ok) {
					    // 페이지 새로고침
					    window.location.reload();
					  } else {
					    // 오류 처리
					  }
					}
			
	</script>
	<%@ include file="footer.jsp"%>
</body>
</html>