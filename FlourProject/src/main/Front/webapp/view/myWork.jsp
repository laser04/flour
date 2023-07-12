<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />

<style type="text/css">
.myWork {
	width: 1350px;
	margin: 0 auto;
}

.myWork tr {
	height: 50px;
}

.myWork td {
	vertical-align: middle;
}

.myWork a {
	text-decoration: none;
	color: black;
	font-size: 0.75em;
}

.top-hover {
	border-bottom: 5px solid transparent;
}

.top-hover:hover {
	border-bottom-color: blue;
	cursor: pointer;
}

.btn_update {
	width: 70px;
	height: 35px;
	font-size: 15px;
}

.bi-lightning-fill {
	width: 50px;
	height: 50px;
}

.trash-wrap {
	cursor: pointer;
}
</style>
</head>

<body>

	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="fs-1 fw-bolder text-white">내 업무</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div style="margin: 25px auto; width: 80%">
			<div class="text-center border border-dark h3 p-3 my-4 bg-white">내
				업무 보기</div>
			<div class="border border-dark p-3 bg-white">
				<div class="text-end">
					<div class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#createModal">
						<i class="bi bi-plus-circle"></i>&nbsp;새 일정 추가
					</div>
				</div>
				<!-- nav -->
				<div class="w-75" style="margin: 0 auto;">
					<div class="d-flex justify-content-center text-center my-3 h5">
						<div class="col-4 top-hover p-2">내 업무 목록</div>
						<div class="col-4 top-hover p-2">진행 정도</div>
						<div class="col-4 top-hover p-2">팀 업무 목록</div>
					</div>

					<!-- 할 일 목록 -->
					<div class="mt-3">
						<table class="w-100 table border-dark text-lg-center">
							<tr class="bg-secondary bg-opacity-50"
								style="border-bottom-width: 3px;">
								<th class="col-6">내 업무</th>
								<th class="col-3">시작 날짜</th>
								<th class="col-3">예상 마감일</th>
							</tr>
							<!-- sample -->
							<tr>
								<td>감자칩 사오기</td>
								<td>2023-06-29</td>
								<td>2023-06-30</td>
							</tr>
							<tr>
								<td>감자빵 만들기</td>
								<td>2023-06-29</td>
								<td>2023-07-04</td>
							</tr>
						</table>
					</div>

					<!-- 진행정도 -->
					<div class="mt-3">
						<div class="progress" style="height: 20px;">
							<div class="progress-bar bg-info w-50" role="progressbar"
								aria-label="Example with label" aria-valuenow="75"
								aria-valuemin="0" aria-valuemax="100">50%</div>
						</div>
						<div class="my-3">
							<table class="w-100 table border-dark text-lg-center">
								<tr class="bg-secondary bg-opacity-50"
									style="border-bottom-width: 3px;">
									<th class="col-4">내 할일</th>
									<th class="col-1">상태</th>
									<th class="col-3">변경</th>
									<th class="col-1">삭제</th>
								</tr>
								<!-- sample -->
								<tr>
									<td>감자칩 사오기</td>
									<td>완료</td>
									<td>
										<button type="button"
											class="btn btn-warning p-1 btn_update allign-middle"
											data-bs-toggle="modal" data-bs-target="#updateModal">
											<i class="bi bi-plus-circle"></i>&nbsp;수정
										</button>
										<div class="btn btn-success p-1 btn_update allign-middle">
											<i class="bi-check-circle"></i>&nbsp;완료
										</div>
									</td>
									<td>
										<div class="trash-wrap" data-bs-toggle="modal"
											data-bs-target="#deleteModalCheck">
											<i class="bi bi-trash fs-3"></i>
										</div>
									</td>
								</tr>
								<tr>
									<td>감자빵 만들기</td>
									<td></td>
									<td></td>
									<td>
										<div class="trash-wrap" data-bs-toggle="modal"
											data-bs-target="#deleteModalCheck">
											<i class="bi bi-trash fs-3"></i>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- 팀 업무 목록 -->
					<div class="accordion mt-3" id="accordion">
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">
									<div class="d-flex justify-content-between" style="width: 65%">
										<div>안준후</div>
										<div class="progress" style="width: 200px; height: 20px;">
											<div class="progress-bar bg-info w-50" role="progressbar"
												aria-label="Example with label" aria-valuenow="75"
												aria-valuemin="0" aria-valuemax="100">50%</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<div class="fs-3 fw-bolder my-2">
										<%-- <%=request.getAttribute("DEPT") %> --%>
										기획팀 안준후
									</div>
									<div class="my-3">
										<table class="w-100 table border-dark text-lg-center">
											<tr>
												<th class="col-2 text-info fs-5">진행중</th>
												<th class="col-4">업무 내용</th>
												<th class="col-3">시작 날짜</th>
												<th class="col-3">예상 마감일</th>
											</tr>
											<tr>
												<td><i class="bi bi-lightning-fill"></i></td>
												<td>감자빵 만들기<br>
												<a href="#">할 일 상세 보기</a></td>
												<td>2023-06-29</td>
												<td>2023-07-04</td>
											</tr>
										</table>
									</div>
									<div class="mt-5">
										<table class="w-100 table border-dark text-lg-center">
											<tr>
												<th class="col-2 text-success fs-5">완료</th>
												<th class="col-4">업무 내용</th>
												<th class="col-3">시작 날짜</th>
												<th class="col-3">예상 마감일</th>
											</tr>
											<tr>
												<td><i class="bi bi-lightning-fill"></i></td>
												<td>감자칩 사오기<br>
												<a href="#">할 일 상세 보기</a></td>
												<td>2023-06-29</td>
												<td>2023-06-30</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header" id="headingTwo">
								<button class="accordion-button collapsed" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									<div class="d-flex justify-content-between" style="width: 65%">
										<div>마승현</div>
										<div class="progress" style="width: 200px; height: 20px;">
											<div class="progress-bar bg-info w-100" role="progressbar"
												aria-label="Example with label" aria-valuenow="75"
												aria-valuemin="0" aria-valuemax="100">100%</div>
										</div>
									</div>
								</button>
							</h2>
							<div id="collapseTwo" class="accordion-collapse collapse"
								aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<div class="fs-3 fw-bolder my-2">
										<%-- <%=request.getAttribute("DEPT") %> --%>
										기획팀 마승현
									</div>
									<div class="my-3">
										<table class="w-100 table border-dark text-lg-center">
											<tr>
												<th class="col-2 text-info fs-5">진행중</th>
												<th class="col-4">업무 내용</th>
												<th class="col-3">시작 날짜</th>
												<th class="col-3">예상 마감일</th>
											</tr>
										</table>
									</div>
									<div class="mt-5">
										<table class="w-100 table border-dark text-lg-center">
											<tr>
												<th class="col-2 text-success fs-5">완료</th>
												<th class="col-4">업무 내용</th>
												<th class="col-3">시작 날짜</th>
												<th class="col-3">예상 마감일</th>
											</tr>
											<tr>
												<td><i class="bi bi-lightning-fill"></i></td>
												<td>껍데기 만들기<br>
												<a href="#">할 일 상세 보기</a></td>
												<td>2023-06-28</td>
												<td>2023-07-04</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- modal -->
				<!-- 업무 추가 -->
				<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true"
					data-bs-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">새 업무 등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div>
									<div>일정</div>
									<div class="form-floating" id="createFloatingTextareaBox">
										<textarea class="form-control" id="createFloatingTextarea"></textarea>
										<label for="floatingTextarea">업무 내용</label>
									</div>
									<div class="invalid-feedback">내용을 입력해주세요!</div>
								</div>
								<div>
									<div>일정 시작 날짜</div>
									<%
										long time = System.currentTimeMillis();
									SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
									String today = date.format(new Date(time));
									%>
									<input type="date" class="form-control" id="createDateStart"
										min="<%=today%>">
								</div>
								<div>
									<div>일정 종료 날짜</div>
									<input type="date" class="form-control" id="createDateEnd"
										min="<%=today%>">
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">돌아가기</button>
								<button type="button" class="btn btn-primary"
									onclick="createWork()">저장하기</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 업무 수정 -->
				<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true"
					data-bs-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">업무 수정</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div>
									<div>일정</div>
									<div class="form-floating" id="updateFloatingTextareaBox">
										<textarea class="form-control" id="updateFloatingTextarea"></textarea>
										<label for="floatingTextarea">수정 업무</label>
									</div>
									<div class="invalid-feedback">내용을 입력해주세요!</div>
								</div>
								<div>
									<div>일정 시작 날짜</div>
									<input type="date" class="form-control" value="<%=today%>"
										readonly>
								</div>
								<div>
									<div>일정 종료 날짜</div>
									<input type="date" class="form-control" min="<%=today%>"
										value="<%=today%>">
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">돌아가기</button>
								<button type="button" class="btn btn-primary"
									onclick="updateWork()">저장하기</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 업무 삭제 check -->
				<div class="modal fade" id="deleteModalCheck" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-bs-backdrop="static">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="text-warning d-flex justify-content-center">
									<i class="bi bi-exclamation-circle" style="font-size: 100px;"></i>
								</div>
								<div class="m-2 text-wrap text-center">
									<h3>업무 내용을 삭제하시겠습니까?</h3>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소하기</button>
								<button type="button" class="btn btn-danger"
									data-bs-toggle="modal" data-bs-target="#deleteModalSuccess">삭제하기</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 업무 삭제 success -->
				<div class="modal fade" id="deleteModalSuccess" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true" data-bs-backdrop="static">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="text-success d-flex justify-content-center">
									<i class="bi bi-check-circle" style="font-size: 100px;"></i>
								</div>
								<div class="m-2 text-wrap text-center">
									<h3>일정이 삭제되었습니다.</h3>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info"
									data-bs-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		let createFloatingTextareaBox = document.getElementById("createFloatingTextareaBox");
		let createFloatingTextarea = document.getElementById("createFloatingTextarea");
		let createModal = document.getElementById("createModal");
		let createModalCheck = false; 
		let updateFloatingTextareaBox = document.getElementById("updateFloatingTextareaBox");
		let updateFloatingTextarea = document.getElementById("updateFloatingTextarea");
		let updateModal = document.getElementById("updateModal");
		let updateModalCheck = false;

		//createModal textarea null값 시 이벤트
		createFloatingTextarea.addEventListener("blur",()=>{
			
			if(createFloatingTextarea.value === null || createFloatingTextarea.value.trim()===""){
				createFloatingTextareaBox.classList.add("is-invalid");
				createFloatingTextarea.classList.add("is-invalid");
				createFloatingTextarea.focus();
				createModalCheck = false;
			}else{
				createFloatingTextareaBox.classList.remove("is-invalid");
				createFloatingTextarea.classList.remove("is-invalid");
				createModalCheck = true;
			}
		})
		
		//updateModal textarea null값 시 이벤트
		updateFloatingTextarea.addEventListener("blur",()=>{
			
			if(updateFloatingTextarea.value === null || updateFloatingTextarea.value.trim()===""){
				updateFloatingTextareaBox.classList.add("is-invalid");
				updateFloatingTextarea.classList.add("is-invalid");
				updateFloatingTextarea.focus();
				updateModalCheck = false;
			}else{
				updateFloatingTextareaBox.classList.remove("is-invalid");
				updateFloatingTextarea.classList.remove("is-invalid");
				updateModalCheck = true;
			}
		})
		
		
		/* 모달 저장 */
/*		function createWork(){
			
		}
		function updateWork(){
	 		if(updateModalCheck){
				//모달창 닫힘
				$(#updateModal).modal("hide");
				//textarea value 삭제
			} 
	
		}
*/
	
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
		
		/* 모달 애니매이션 */
		const modal = document.getElementById('createModal');
		modal.addEventListener('keydown', function(event) {
			//keyCode = 27=> ESC
			if (event.keyCode === 27) {
				event.stopPropagation();
			}
		});
	</script>
</body>
</html>