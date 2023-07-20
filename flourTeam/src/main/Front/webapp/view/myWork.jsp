<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.11/cropper.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jdenticon@3.1.0/dist/jdenticon.min.js"
	async
	integrity="sha384-VngWWnG9GS4jDgsGEUNaoRQtfBGiIKZTiXwm9KpgAeaRn6Y/1tAFiyXqSzqC8Ga/"
	crossorigin="anonymous">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.11/cropper.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cropper/1.0.1/jquery-cropper.js"></script>

<style>
.shadowWrap {
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="background-image: url('https://i.imgur.com/XDyxuBN.jpg'); height: 300px; background-repeat: no-repeat; background-size: cover;">
		<div class="fs-1 fw-bolder text-white">내 정보</div>
	</div>
	<div class="mx-auto mt-5 p-3 shadowWrap" style="width: 1350px;">
		<input id="tab-info" type="hidden" value="<c:out value='${tabInfo}'/>">
		<div class="text-center fs-3 fw-bold pb-3 border-bottom">
			<c:out value="${user.id} / ${user.department} / ${user.name}" />
		</div>

		<div class="d-flex mt-4">
			<!-- 좌측 -->
			<div class="col-3 p-2 d-flex flex-column justify-content-between">
				<div class="list-group" id="list-tab" role="tablist">
					<div id="attribute-li">
						<a class="fw-bold list-group-item list-group-item-action active"
							id="attribute-tab-list" data-bs-toggle="list"
							href="#attribute-tab" role="tab" aria-controls="attribute-tab">출/퇴근
							관리</a>
					</div>
					<div id="profile-li">
						<a class="fw-bold list-group-item list-group-item-action"
							id="profile-tab-list" data-bs-toggle="list" href="#profile-tab"
							role="tab" aria-controls="profile-tab">프로필 수정</a>
					</div>
					<div id="password-li">
						<a class="fw-bold list-group-item list-group-item-action"
							id="password-tab-list" data-bs-toggle="list"
							href="#password-tab" role="tab" aria-controls="password-tab">비밀번호
							변경</a>
					</div>
					<div id="account-li">
						<a class="fw-bold list-group-item list-group-item-action"
							id="account-tab-list" data-bs-toggle="list" href="#account-tab"
							role="tab" aria-controls="account-tab">회원 탈퇴</a>
					</div>
				</div>
			</div>
			<!-- 우측 -->
			<div class="col-9 p-2 d-flex justify-content-center shadowWrap"
				id="mainCenter" style="height: 610px;">
				<div class="tab-content w-100" id="nav-tabContent">
					<div class="tab-pane fade col-10 h-100 mx-auto show active"
						id="attribute-tab" role="tabpanel"
						aria-labelledby="attribute-tab-list">
						<div
						class="d-flex flex-column justify-content-center h-100">
							<div class="col-6 mx-auto text-center">
								<div class="text-center fs-4 text-success mt-3 fw-bold"
									id="current-date"></div>
								<div class="text-center fs-4 text-success mt-3 fw-bold"
									id="current-time"></div>
								<div class="text-center my-3" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="commute" autocomplete="off"> <label
										class="btn btn-outline-success w-25 mx-1 fw-bold" for="commute"
										data-bs-toggle="modal" data-bs-target="#commuteModal">출근</label>

									<input type="radio" class="btn-check" name="btnradio"
										id="finish" autocomplete="off"> <label
										class="btn btn-outline-success w-25 mx-1 fw-bold" for="finish"
										data-bs-toggle="modal" data-bs-target="#finishModal">퇴근</label>
								</div>
							</div>
							<div class="mt-5 pt-4 px-4 text-center">
								<div class="w-100 btn btn-primary text-white fw-bold">Excel
									다운로드</div>
								<div class="d-flex mt-3 p-2 border-bottom border-dark">
									<div class="col-3">날짜</div>
									<div class="col-3">출근시간</div>
									<div class="col-3">퇴근시간</div>
									<div class="col-3">근무시간</div>
								</div>
								<!-- sample -->
								<div class="d-flex mt-2 p-2 border-bottom border-dark">
									<div class="col-3">07-07</div>
									<div class="col-3">08:58</div>
									<div class="col-3">21:50</div>
									<div class="col-3">12:58</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade mx-auto h-100" id="profile-tab"
						role="tabpanel" aria-labelledby="profile-tab-list">
						<div class="d-flex justify-content-center align-items-center h-100">
							<form class="needs-validation h-100 col-7 me-5" action="/user/update/profile"
								method="post" novalidate>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<div class="form-group">
										<label class="fw-bold" for="user_email">이메일</label> <input
											id="user_email" type="text" name="email" class="form-control"
											placeholder="이메일 주소" aria-describedby="emailHelp" required
											maxlength="30" value="<c:out value='${user.email}'/>">
										<small id="emailHelp" class="form-text text-muted"> 이메일
											형식으로 기입하세요. </small>
										<c:if test="${!empty errors['email']}">
											<small class="form-text text-danger">이메일 형식이 아닙니다.</small>
										</c:if>
									</div>
									<div class="form-group mt-2">
										<label class="fw-bold" for="user_phone">연락처</label> <input
											id="user_phone" type="tel" name="phone" class="form-control"
											placeholder="연락처" aria-describedby="phoneHelp" required
											maxlength="13" value="<c:out value='${user.phone}' />">
										<small id="phoneHelp" class="form-text text-muted">
											전화번호 형식을 기입하세요 </small>
										<c:if test="${!empty errors['phone']}">
											<small class="form-text text-danger">전화번호 형식이 아닙니다.</small>
										</c:if>
									</div>
									<div class="form-group mt-2">
										<label class="fw-bold" for="user_gender">성별</label>
										<div id="user_gender" class="form-control">${user.gender}</div>
									</div>
									<div class="form-group mt-2">
										<label class="fw-bold" for="user_department">부서</label>
										<div id="user_department" class="form-control">${user.department}</div>
									</div>
									<div>
										<div class="form-group mt-2">
											<label class="fw-bold" for="user_address_postnum">주소</label> <input
												id="user_address_postnum" type="text" name="address_postnum"
												class="form-control" placeholder="우편번호"
												aria-describedby="address_postnumHelp" required
												maxlength="30"
												value="<c:out value='${user.address_postnum}' />"
												onclick="execDaumPostcode()" readonly>
										</div>
										<div class="form-group">
											<input id="user_address_basic" type="text"
												name="address_basic" class="form-control" placeholder="도로명주소"
												aria-describedby="address_basicHelp" required maxlength="30"
												value="<c:out value='${user.address_basic}' />"
												onclick="execDaumPostcode()" readonly>
										</div>
										<div class="form-group">
											<input id="user_address_detail" type="text"
												name="address_detail" class="form-control" placeholder="상세주소"
												aria-describedby="address_detailHelp" required maxlength="30"
												value="<c:out value='${user.address_detail}' />">
										</div>
									</div>
									<div class="form-group">
										<input id="profileImage" type="hidden" name="photo"
											class="form-control" />
									</div>

									<div class="form-group mt-2 text-center mt-4">
										<button class="btn btn-primary w-75 fw-bold" type="submit">수정하기</button>
									</div>
							</form>
							<div class="col-3 p-2" id="mainRight">
								<div class="panel panel-default text-center shadowWrap">
									<div class="fs-5 fw-bold p-1 bg-info bg-opacity-25">프로필 이미지</div>
									<div class="text-center p-2">
										<div id="current-profile-image">
											<c:if test="${empty user.photo}">
												<svg class="rounded" data-jdenticon-value="${user.name}"
													width="200px" height="200px"></svg>
											</c:if>
											<c:if test="${!empty user.photo}">
												<img class="rounded" src="${user.photo}" width="200px"
													height="200px" alt="${user.name}" />
											</c:if>
										</div>
									</div>
									<div id="new-profile-image"
										class="d-flex justify-content-center p-2"></div>
									<div class="panel-body p-1">
										<div class="custom-file py-1">
											<label
												class="custom-file-label cropped-new-profile-imagebtn-block btn btn-info fw-bold text-white"
												for="profile-image-file">프로필 이미지 변경</label> <input type="file"
												class="custom-file-input" id="profile-image-file"
												style="display: none;">
										</div>
										<div id="new-profile-image-control" class="py-1">
											<div class="col-7 d-flex justify-content-between mx-auto">
												<button class="btn btn-warning btn-block fw-bold text-white"
													id="cut-button">수정</button>
												<button class="btn btn-success btn-block fw-bold text-white"
													id="confirm-button">저장</button>
												<button class="btn btn-danger btn-block fw-bold text-white"
													id="reset-button">취소</button>
											</div>
										</div>
										<div id="cropped-new-profile-image" class="mt-3"></div>
									</div>
								</div>
							</div>
						</div>		
					</div>
					<div class="tab-pane fade col-7 mx-auto h-100" id="password-tab"
						role="tabpanel" aria-labelledby="password-tab-list">
						<div
						class="d-flex justify-content-center align-items-center h-100">
							<form class="needs-validation w-100" action="/user/update/password"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="form-group mt-2">
									<label class="fw-bold" for="newPassword">새 비밀번호</label> <input
										id="newPassword" type="password" name="newPassword"
										class="form-control" aria-describedby="passwordHelp"
										minlength="8" maxlength="50" required> <small
										id="passwordHelp" class="form-text text-muted"> 8자에서
										50자 사이로 입력해주세요 </small>
									<c:if test="${!empty errors['newPassword']}">
										<small class="form-text text-danger"><c:out
												value="${errors['newPassword']}" /></small>
									</c:if>
								</div>
								<div class="form-group mt-2">
									<label class="fw-bold" for="newPasswordConfirm">비밀번호 확인</label>
									<input id="newPasswordConfirm" type="password"
										name="newPasswordConfirm" class="form-control"
										aria-describedby="passwordConfirmHelp" minlength="8"
										maxlength="50" required>
									<c:if test="${!empty errors['newPasswordConfirm']}">
										<small class="form-text text-danger"><c:out
												value="${errors['newPasswordConfirm']}" /></small>
									</c:if>
								</div>
								<div class="form-group mt-2 text-center mt-4">
									<button class="btn btn-info w-75 fw-bold" type="submit"
										aria-describedby="submitHelp">비밀번호 변경</button>
								</div>
							</form>
						</div>
					</div>
					<div class="tab-pane fade col-9 mx-auto p-4 h-100" id="account-tab"
						role="tabpanel" aria-labelledby="account-tab-list">
						<div
							class="d-flex justify-content-between align-items-center h-100">
							<div>
								<div class="fs-5 fw-bold">비밀번호 재확인</div>
								<div class="mt-2">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번
									확인합니다.</div>
								<div class="mt-3">
									<form action="/user/delete" method="post" class="d-flex">
										<div class="w-75 p-1">
											<input type="password" class="form-control">
										</div>
										<div class="w-25 p-1">
											<div class="btn btn-outline-primary w-100"
												data-bs-toggle="modal" data-bs-target="#deleteModal">확인</div>
										</div>
									</form>
								</div>
							</div>
							<div>
								<img src="https://i.ibb.co/cNNGQk4/logoCI.png" alt="logoCI"
									border="0">
							</div>
						</div>
						<!-- session 제거용 -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 -->
	<!-- 출근 -->
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


	<!-- 퇴근 -->
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

	<!-- 삭제 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div class="fs-4 fw-bold">계정 삭제</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>계정을 삭제하면 되돌릴 수 없으며, 삭제한 데이터를 복구할 수 없음을 이해했습니다.</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">회원탈퇴</button>
					<button type="button" class="btn btn-outline-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	'use strict';
let cropper = '';
let $confirmBtn = $('#confirm-button');
let $resetBtn = $("#reset-button");
let $cutBtn = $('#cut-button');
let $newProfileImage = $('#new-profile-image');
let $currentProfileImage = $("#current-profile-image");
let $resultImage = $('#cropped-new-profile-image');
let $profileImage = $('#profileImage');
let $profileImageFIle = $('#profile-image-file');

// 초기 버튼과 새로운 프로필 이미지 숨기기
$newProfileImage.hide();
$cutBtn.hide();
$resetBtn.hide();
$confirmBtn.hide();

$("#profile-image-file").change(function (e) {      // 프로필 사진이 바뀔때
    if (e.target.files.length === 1) {
        const reader = new FileReader();
        reader.onload = e => {
            if (e.target.result) {                           // 파일을 가져왔을 경우
                // 이미지태그 만들기
                let img = document.createElement("img");
                img.id = 'new-profile';
                img.src = e.target.result;
                img.height = 200;

                $newProfileImage.html(img);     // newProfileImage영역에 위에서 만든 이미지 태그 삽입
                $newProfileImage.show();
                $currentProfileImage.hide();

                // Cropper 적용
                let $newImage = $(img);
                $newImage.cropper({aspectRatio: 1});
                cropper = $newImage.data('cropper');

                $cutBtn.show();
                $confirmBtn.hide();
                $resetBtn.show();
            }
        };

        reader.readAsDataURL(e.target.files[0]);
    }
});


$cutBtn.click(function () {
    let dataUrl = cropper.getCroppedCanvas().toDataURL();
    let newImage = document.createElement("img");
    newImage.id = "cropped-new-profile-image";
    newImage.src = dataUrl;
    newImage.width = 200;
	newImage.height = 200;
	newImage.classList.add("rounded");
    newImage.style.display = "none";
    $resultImage.html(newImage);2
    $resultImage.show();
    $confirmBtn.show();
	$cutBtn.hide();

    $confirmBtn.click(function () {
		newImage.style.display = "block";
        $newProfileImage.html(newImage);
        $cutBtn.hide();
   		$resetBtn.hide();
        $confirmBtn.hide();
        $profileImage.val(dataUrl);
    });
});

$resetBtn.click(function () {
    $currentProfileImage.show();
    $newProfileImage.hide();
    $resultImage.hide();
    $resetBtn.hide();
    $cutBtn.hide();
    $confirmBtn.hide();
    $profileImage.val('');
    $profileImageFIle.val('');
	$(".cropper-container").hide();
});

let tabInfo = $("#tab-info").val();
if(tabInfo === "profile") {
    $("#profile-li").attr("class", "active");
    $("#password-li").attr("class", "");
    $("#account-li").attr("class", "");

    $("#profile-tab").attr("class", "tab-pane fade active in");
    $("#password-tab").attr("class", "tab-pane fade");
    $("#account-tab").attr("class", "tab-pane fade");
} else if(tabInfo === "password") {
    $("#profile-li").attr("class", "");
    $("#password-li").attr("class", "active");
    $("#account-li").attr("class", "");

    $("#profile-tab").attr("class", "tab-pane fade");
    $("#password-tab").attr("class", "tab-pane fade active in");
    $("#account-tab").attr("class", "tab-pane fade");
} else if(tabInfo === "account") {
    $("#profile-li").attr("class", "");
    $("#password-li").attr("class", "");
    $("#account-li").attr("class", "active");

    $("#profile-tab").attr("class", "tab-pane fade");
    $("#password-tab").attr("class", "tab-pane fade");
    $("#account-tab").attr("class", "tab-pane fade active in");
}

let loginByEmailUrl = document.referrer;

if(loginByEmailUrl.includes("login-by-email")) {
    $("#profile-li").attr("class", "");
    $("#password-li").attr("class", "active");
    $("#account-li").attr("class", "");

    $("#profile-tab").attr("class", "tab-pane fade");
    $("#password-tab").attr("class", "tab-pane fade active in");
    $("#account-tab").attr("class", "tab-pane fade");
}

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

				// 초기화 및 주기적으로 날짜와 시간을 업데이트하는 함수
				function initialize() {
			updateDateTime();
			setInterval(updateDateTime, 1000);
		}

		initialize();
</script>
</body>
<%@ include file="./footer.jsp"%>
</html>
