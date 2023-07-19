<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.trash-wrap {
	cursor: pointer;
}

.shadowWrap {
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
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
	<div class="mx-auto mt-5 p-3 shadowWrap" style="width: 1350px;">
		<div class="mx-auto mt-3 w-75">
			<!-- nav -->
			<div>
				<div class="nav nav-tabs" id="myTab" role="tablist">
					<button class="col-2 nav-link active fs-5 fw-bold" id="list-tab"
						data-bs-toggle="tab" data-bs-target="#list" type="button"
						role="tab" aria-controls="list" aria-selected="true">내 업무
						목록</button>
					<button class="col-2 nav-link fs-5 fw-bold" id="progress-tab"
						data-bs-toggle="tab" data-bs-target="#progress" type="button"
						role="tab" aria-controls="progress" aria-selected="false">진행
						정도</button>
					<button class="col-2 nav-link fs-5 fw-bold" id="team-tab"
						data-bs-toggle="tab" data-bs-target="#team" type="button"
						role="tab" aria-controls="team" aria-selected="false">팀
						업무 목록</button>
					<!-- 일정 추가 버튼 -->
					<div class="nav-item col-6 text-end pe-2">
						<div class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#createModal">
							<i class="bi bi-plus-circle"></i> <span class="ms-1">일정 추가</span>
						</div>
					</div>
				</div>
			</div>

			<!-- content -->
			<div class="tab-content my-5" id="myTabContent">
				<!-- list -->
				<div class="tab-pane fade show active" id="list" role="tabpanel"
					aria-labelledby="list-tab">
					<div class="text-center">
						<div
							class="d-flex bg-secondary bg-opacity-50 border-bottom border-3 border-dark p-2">
							<div class="col-6">
								<strong>내 할 일</strong>
							</div>
							<div class="col-3">
								<strong>시작 날짜</strong>
							</div>
							<div class="col-3">
								<strong>예상 마감일</strong>
							</div>
						</div>
						<div class="d-flex p-2 border-bottom border-dark">
							<div class="col-6">감자칩 사오기</div>
							<div class="col-3">2023-06-29</div>
							<div class="col-3">2023-06-30</div>
						</div>
						<div class="d-flex p-2 border-bottom border-dark">
							<div class="col-6">감자빵 만들기</div>
							<div class="col-3">2023-06-29</div>
							<div class="col-3">2023-07-04</div>
						</div>
					</div>
				</div>
				<!-- progress -->
				<div class="tab-pane fade" id="progress" role="tabpanel"
					aria-labelledby="progress-tab">
					<div class="progress" style="height: 20px;">
						<div class="progress-bar bg-info w-50" role="progressbar"
							aria-label="Example with label" aria-valuenow="75"
							aria-valuemin="0" aria-valuemax="100">50%</div>
					</div>
					<div class="mt-3 text-center">
						<div
							class="d-flex bg-secondary bg-opacity-50 border-bottom border-3 border-dark p-2">
							<div class="col-5">
								<strong>내 할일</strong>
							</div>
							<div class="col-1">
								<strong>상태</strong>
							</div>
							<div class="col-4">
								<strong>변경</strong>
							</div>
							<div class="col-2">
								<strong>삭제</strong>
							</div>
						</div>
						<div
							class="d-flex align-items-center p-2 border-bottom border-dark">
							<div class="col-5">감자칩 사오기</div>
							<div class="col-1">완료</div>
							<div class="col-4"></div>
							<div class="col-2">
								<div class="trash-wrap" data-bs-toggle="modal"
									data-bs-target="#deleteModalCheck">
									<i class="bi bi-trash fs-3"></i>
								</div>
							</div>
						</div>
						<div
							class="d-flex align-items-center p-2 border-bottom border-dark">
							<div class="col-5">감자빵 만들기</div>
							<div class="col-1">진행</div>
							<div class="col-4">
								<div class="btn btn-warning p-1 btn_update align-middle"
									data-bs-toggle="modal" data-bs-target="#updateModal">
									<i class="bi bi-plus-circle"></i>&nbsp;수정
								</div>
								<div class="btn btn-success p-1 btn_update align-middle">
									<i class="bi-check-circle"></i>&nbsp;완료
								</div>
							</div>
							<div class="col-2">
								<div class="trash-wrap" data-bs-toggle="modal"
									data-bs-target="#deleteModalCheck">
									<i class="bi bi-trash fs-3"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- team -->
				<div class="tab-pane fade" id="team" role="tabpanel"
					aria-labelledby="team-tab">
					<div class="accordion" id="accordion">
						<div class="accordion-item">
							<div class="accordion-header" id="headingOne">
								<div class="btn accordion-button collapsed"
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
								</div>
							</div>
							<div id="collapseOne" class="accordion-collapse collapse"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<div class="fs-3 fw-bolder my-2">
										<%-- <%=request.getAttribute("DEPT") %> --%>
										기획팀 안준후
									</div>
									<div>
										<!-- 진행중 -->
										<div class="text-center my-3">
											<div class="d-flex border-bottom border-3 border-dark p-2">
												<div class="col-2 text-info fs-5">
													<strong>진행중</strong>
												</div>
												<div class="col-4">
													<strong>업무 내용</strong>
												</div>
												<div class="col-3">
													<strong>시작 날짜</strong>
												</div>
												<div class="col-3">
													<strong>예상 마감일</strong>
												</div>
											</div>
											<div
												class="d-flex align-items-center border-bottom border-dark p-2">
												<div class="col-2">
													<i class="bi bi-lightning"></i>
												</div>
												<div class="col-4">
													감자빵 만들기<br> <span class="btn border-0 text-primary"
														data-bs-toggle="modal" data-bs-target="#doitModal">할
														일 상세 보기</span>
												</div>
												<div class="col-3">2023-06-29</div>
												<div class="col-3">2023-07-04</div>
											</div>
										</div>

										<div style="height: 20px;"></div>

										<!-- 완료 -->
										<div class="text-center my-3">
											<div class="d-flex border-bottom border-3 border-dark p-2">
												<div class="col-2 text-success fs-5">
													<strong>완료</strong>
												</div>
												<div class="col-4">
													<strong>업무 내용</strong>
												</div>
												<div class="col-3">
													<strong>시작 날짜</strong>
												</div>
												<div class="col-3">
													<strong>예상 마감일</strong>
												</div>
											</div>
											<div
												class="d-flex align-items-center border-bottom border-dark p-2">
												<div class="col-2">
													<i class="bi bi-lightning-fill"></i>
												</div>
												<div class="col-4">
													감자칩 사오기<br> <span class="btn border-0 text-primary"
														data-bs-toggle="modal" data-bs-target="#doitModal">할
														일 상세 보기</span>
												</div>
												<div class="col-3">2023-06-29</div>
												<div class="col-3">2023-06-30</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<div class="accordion-header" id="headingTwo">
								<div class="btn accordion-button collapsed"
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
								</div>
							</div>
							<div id="collapseTwo" class="accordion-collapse collapse"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<div class="fs-3 fw-bolder my-2">
										<%-- <%=request.getAttribute("DEPT") %> --%>
										기획팀 마승현
									</div>
									<div>
										<!-- 진행중 -->
										<div class="text-center my-3">
											<div class="d-flex border-bottom border-3 border-dark p-2">
												<div class="col-2 text-info fs-5">
													<strong>진행중</strong>
												</div>
												<div class="col-4">
													<strong>업무 내용</strong>
												</div>
												<div class="col-3">
													<strong>시작 날짜</strong>
												</div>
												<div class="col-3">
													<strong>예상 마감일</strong>
												</div>
											</div>
										</div>

										<div style="height: 20px;"></div>

										<!-- 완료 -->
										<div class="text-center my-3">
											<div class="d-flex border-bottom border-3 border-dark p-2">
												<div class="col-2 text-success fs-5">
													<strong>완료</strong>
												</div>
												<div class="col-4">
													<strong>업무 내용</strong>
												</div>
												<div class="col-3">
													<strong>시작 날짜</strong>
												</div>
												<div class="col-3">
													<strong>예상 마감일</strong>
												</div>
											</div>
											<div
												class="d-flex align-items-center border-bottom border-dark p-2">
												<div class="col-2">
													<i class="bi bi-lightning-fill"></i>
												</div>
												<div class="col-4">
													껍데기 만들기<br> <span class="btn border-0 text-primary"
														data-bs-toggle="modal" data-bs-target="#doitModal">할
														일 상세 보기</span>
												</div>
												<div class="col-3">2023-06-29</div>
												<div class="col-3">2023-06-30</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- modal -->
	<!-- 업무 추가 -->
	<div class="modal fade" id="createModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새 업무 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div>내 업무</div>
						<div class="form-floating" id="createFloatingTextareaWorkBox">
							<textarea class="form-control" id="createFloatingTextareaWork"></textarea>
							<label for="floatingTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
					<div class="mt-2">
						<div>내 할 일</div>
						<div class="form-floating" id="createFloatingTextareaDoitBox">
							<textarea class="form-control" id="createFloatingTextareaDoit"></textarea>
							<label for="floatingTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
					<div class="mt-2">
						<div>일정 시작 날짜</div>
						<%
							long time = System.currentTimeMillis();
						SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
						String today = date.format(new Date(time));
						%>
						<input type="date" class="form-control" id="createDateStart"
							min="<%=today%>">
					</div>
					<div class="mt-2">
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
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">업무 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div>내 업무</div>
						<div class="form-floating" id="updateFloatingTextareaWorkBox">
							<textarea class="form-control" id="updateFloatingTextareaWork"></textarea>
							<label for="floatingTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
					<div class="mt-2">
						<div>내 할 일</div>
						<div class="form-floating" id="updateFloatingTextareaDoitBox">
							<textarea class="form-control" id="updateFloatingTextareaDoit"></textarea>
							<label for="floatingTextarea">내용</label>
						</div>
						<div class="invalid-feedback">내용을 입력해주세요!</div>
					</div>
					<div class="mt-2">
						<div>일정 시작 날짜</div>
						<input type="date" class="form-control" value="<%=today%>"
							readonly>
					</div>
					<div class="mt-2">
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
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<button type="button" class="btn btn-danger" data-bs-toggle="modal"
						data-bs-target="#deleteModalSuccess">삭제하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 업무 삭제 success -->
	<div class="modal fade" id="deleteModalSuccess" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
					<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 업무 상세보기 -->
	<div class="modal fade" id="doitModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">기획팀 팀장 왕감자</h5>
				</div>
				<div class="modal-body">
					<div class="fs-5 fw-bold mb-3">내 할 일</div>
					<div class="form-control" id="doitModalTextarea"
						style="height: 300px;">테스트랑께</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		// 모달
				let createFloatingTextareaWorkBox = document.getElementById("createFloatingTextareaWorkBox");
				let createFloatingTextareaWork = document.getElementById("createFloatingTextareaWork");
				let createFloatingTextareaDoitBox = document.getElementById("createFloatingTextareaDoitBox");
				let createFloatingTextareaDoit = document.getElementById("createFloatingTextareaDoit");
				let createModal = document.getElementById("createModal");
				let createModalCheckWork = false; 
				let createModalCheckDoit = false; 
				let updateFloatingTextareaWorkBox = document.getElementById("updateFloatingTextareaWorkBox");
				let updateFloatingTextareaWork = document.getElementById("updateFloatingTextareaWork");
				let updateFloatingTextareaDoitBox = document.getElementById("updateFloatingTextareaDoitBox");
				let updateFloatingTextareaDoit = document.getElementById("updateFloatingTextareaDoit");
				let updateModal = document.getElementById("updateModal");
				let updateModalCheckWork = false;
				let updateModalCheckDoit = false;
		
				//createModal textareaWork null값 시 이벤트
				createFloatingTextareaWork.addEventListener("blur",()=>{
					
					if(createFloatingTextareaWork.value === null || createFloatingTextareaWork.value.trim()===""){
						createFloatingTextareaWorkBox.classList.add("is-invalid");
						createFloatingTextareaWork.classList.add("is-invalid");
						createFloatingTextareaWork.focus();
						createModalCheckWork = false;
					}else{
						createFloatingTextareaWorkBox.classList.remove("is-invalid");
						createFloatingTextareaWork.classList.remove("is-invalid");
						createModalCheckWork = true;
					}
				})
				//createModal textareaDoit null값 시 이벤트
				createFloatingTextareaDoit.addEventListener("blur",()=>{
					
					if(createFloatingTextareaDoit.value === null || createFloatingTextareaDoit.value.trim()===""){
						createFloatingTextareaDoitBox.classList.add("is-invalid");
						createFloatingTextareaDoit.classList.add("is-invalid");
						createFloatingTextareaDoit.focus();
						createModalCheckDoit = false;
					}else{
						createFloatingTextareaDoitBox.classList.remove("is-invalid");
						createFloatingTextareaDoit.classList.remove("is-invalid");
						createModalCheckDoit = true;
					}
				})

				//updateModal textareaWork null값 시 이벤트
				updateFloatingTextareaWork.addEventListener("blur",()=>{
					
					if(updateFloatingTextareaWork.value === null || updateFloatingTextareaWork.value.trim()===""){
						updateFloatingTextareaWorkBox.classList.add("is-invalid");
						updateFloatingTextareaWork.classList.add("is-invalid");
						updateFloatingTextareaWork.focus();
						updateModalCheckWork = false;
					}else{
						updateFloatingTextareaWorkBox.classList.remove("is-invalid");
						updateFloatingTextareaWork.classList.remove("is-invalid");
						updateModalCheckWork = true;
					}
				})
				//updateModal textareaDoit null값 시 이벤트
				updateFloatingTextareaDoit.addEventListener("blur",()=>{
					
					if(updateFloatingTextareaDoit.value === null || updateFloatingTextareaDoit.value.trim()===""){
						updateFloatingTextareaDoitBox.classList.add("is-invalid");
						updateFloatingTextareaDoit.classList.add("is-invalid");
						updateFloatingTextareaDoit.focus();
						updateModalCheckDoit = false;
					}else{
						updateFloatingTextareaDoitBox.classList.remove("is-invalid");
						updateFloatingTextareaDoit.classList.remove("is-invalid");
						updateModalCheckDoit = true;
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