<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.css"/>
    <script
            src="https://cdn.jsdelivr.net/npm/jdenticon@3.1.0/dist/jdenticon.min.js"
            async
            integrity="sha384-VngWWnG9GS4jDgsGEUNaoRQtfBGiIKZTiXwm9KpgAeaRn6Y/1tAFiyXqSzqC8Ga/"
            crossorigin="anonymous">
    </script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cropper/1.0.1/jquery-cropper.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

    <style>
        .shadowWrap {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
        <c:out value="${users.userIdennum} / ${users.departmentName} / ${users.userName} / ${users.userPosition}"/>
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
                            <!-- Year and Month selection -->
                            <div class="d-flex justify-content-center mb-3">
                                <select id="yearSelect" class="form-select me-2" onchange="populateCommuteTable()">
                                    <!-- Options for the year will be added dynamically -->
                                </select>
                                <select id="monthSelect" class="form-select" onchange="populateCommuteTable()">
                                    <!-- Options for the month will be added dynamically -->
                                </select>
                            </div>
                            <div class="w-100 btn btn-primary text-white fw-bold" onclick="downloadCSV()">Excel 다운로드
                            </div>
                            <!-- Header row (static) -->
                            <div class="d-flex mt-3 p-2 border-bottom border-dark">
                                <div class="col-3">날짜</div>
                                <div class="col-3">출근시간</div>
                                <div class="col-3">퇴근시간</div>
                                <div class="col-3">근무시간</div>
                            </div>
                            <div id="commuteTableContainer"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade mx-auto h-100" id="profile-tab"
                     role="tabpanel" aria-labelledby="profile-tab-list">
                    <div class="d-flex justify-content-center align-items-center h-100">
                        <form class="needs-validation h-100 col-7 me-5" action="/user/update/profile"
                              method="post" novalidate>
                            <sec:csrfInput/>
                            <div class="form-group">
                                <label class="fw-bold" for="user_email">이메일</label> <input
                                    id="user_email" type="text" name="email" class="form-control"
                                    placeholder="이메일 주소" aria-describedby="emailHelp" required
                                    maxlength="30" value="<c:out value='${users.userEmail}'/>">
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
                                    maxlength="13" value="<c:out value='${users.userPhone}' />">
                                <small id="phoneHelp" class="form-text text-muted">
                                    전화번호 형식을 기입하세요 </small>
                                <c:if test="${!empty errors['phone']}">
                                    <small class="form-text text-danger">전화번호 형식이 아닙니다.</small>
                                </c:if>
                            </div>
                            <div class="form-group mt-2">
                                <label class="fw-bold" for="user_gender">성별</label>
                                <div id="user_gender" class="form-control">${users.userGender}</div>
                            </div>
                            <div class="form-group mt-2">
                                <label class="fw-bold" for="user_department">부서</label>
                                <div id="user_department" class="form-control">${users.departmentName}</div>
                            </div>
                            <div>
                                <div class="form-group mt-2">
                                    <label class="fw-bold" for="user_address_postnum">주소</label> <input
                                        id="user_address_postnum" type="text" name="address_postnum"
                                        class="form-control" placeholder="우편번호"
                                        aria-describedby="address_postnumHelp" required
                                        maxlength="30"
                                        value="<c:out value='${users.userAddressPostnum}' />"
                                        onclick="execDaumPostcode()" readonly>
                                </div>
                                <div class="form-group">
                                    <input id="user_address_basic" type="text"
                                           name="address_basic" class="form-control" placeholder="도로명주소"
                                           aria-describedby="address_basicHelp" required maxlength="30"
                                           value="<c:out value='${users.userAddressBasic}' />"
                                           onclick="execDaumPostcode()" readonly>
                                </div>
                                <div class="form-group">
                                    <input id="user_address_detail" type="text"
                                           name="address_detail" class="form-control" placeholder="상세주소"
                                           aria-describedby="address_detailHelp" required maxlength="30"
                                           value="<c:out value='${users.userAddressDetail}' />">
                                </div>
                            </div>
                            <div class="form-group">
                                <input id="profileImage" type="hidden" name="photo"
                                       class="form-control"/>
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
                                        <c:if test="${empty users.userPhoto}">
                                            <svg class="rounded" data-jdenticon-value="${users.userName}"
                                                 width="200px" height="200px"></svg>
                                        </c:if>
                                        <c:if test="${!empty users.userPhoto}">
                                            <img class="rounded" src="${users.userPhoto}" width="200px"
                                                 height="200px" alt="${users.userName}"/>
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
                                                                                                   class="custom-file-input"
                                                                                                   id="profile-image-file"
                                                                                                   style="display: none;">
                                    </div>
                                    <div id="new-profile-image-control" class="py-1">
                                        <div class="col-7 d-flex justify-content-between mx-auto">
                                            <button class="btn btn-warning btn-block fw-bold text-white"
                                                    id="cut-button">수정
                                            </button>
                                            <button class="btn btn-success btn-block fw-bold text-white"
                                                    id="confirm-button">저장
                                            </button>
                                            <button class="btn btn-danger btn-block fw-bold text-white"
                                                    id="reset-button">취소
                                            </button>
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
                            <sec:csrfInput/>
                            <div class="form-group mt-2">
                                <label class="fw-bold" for="newPassword">새 비밀번호</label> <input
                                    id="newPassword" type="password" name="newPassword"
                                    class="form-control" aria-describedby="passwordHelp"
                                    minlength="8" maxlength="50" required> <small
                                    id="passwordHelp" class="form-text text-muted"> 8자에서
                                50자 사이로 입력해주세요 </small>
                                <c:if test="${!empty errors['newPassword']}">
                                    <small class="form-text text-danger"><c:out
                                            value="${errors['newPassword']}"/></small>
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
                                            value="${errors['newPasswordConfirm']}"/></small>
                                </c:if>
                            </div>
                            <div class="form-group mt-2 text-center mt-4">
                                <button class="btn btn-info w-75 fw-bold" type="submit"
                                        aria-describedby="submitHelp">비밀번호 변경
                                </button>
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
                                확인합니다.
                            </div>
                            <div class="mt-3">
                                <form action="/user/delete" method="post" class="d-flex">
                                    <sec:csrfInput/>
                                    <div class="w-75 p-1">
                                        <input type="password" class="form-control">
                                    </div>
                                    <div class="w-25 p-1">
                                        <div class="btn btn-outline-primary w-100"
                                             data-bs-toggle="modal" data-bs-target="#deleteModal">확인
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div>
                            <img src="https://i.ibb.co/cNNGQk4/logoCI.png" alt="logoCI">
                        </div>
                    </div>
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
        <div class="modal-content" id="workOnCheck">
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
                <button id="workOn" type="button" class="btn btn-success"
                        data-bs-dismiss="modal" onclick="workOn()">출근
                </button>
                <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal" onclick="cancelRadio()">취소
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="commuteModalCheck" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" id="workOnChecked">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="text-dark d-flex justify-content-center col-4">
                    <i class="bi bi-megaphone" style="font-size: 100px;"></i>
                </div>
                <div class="m-2 text-wrap text-center col-8">
                    <h3 id="errorMessage"></h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="workOnCommitModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" id="workOnCommit">
            <div class="modal-body">
                <div class="text-dark d-flex justify-content-center">
                    <i class="bi bi-person-workspace" style="font-size: 100px;"></i>
                </div>
                <div class="m-2 text-wrap text-center">
                    <h3>출근 체크하시겠습니까?</h3>
                    <div>
                        현재시간 : <span id="current-time-commute2"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="workOnCommitBtn" type="button" class="btn btn-success"
                        data-bs-dismiss="modal">출근
                </button>
                <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">취소
                </button>
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
                        data-bs-dismiss="modal" onclick="workOff()">퇴근
                </button>
                <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">취소
                </button>
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
                        data-bs-dismiss="modal">회원탈퇴
                </button>
                <button type="button" class="btn btn-outline-secondary"
                        data-bs-dismiss="modal">취소
                </button>
            </div>
        </div>
    </div>
</div>
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
        $resultImage.html(newImage);
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
    if (tabInfo === "profile") {
        $("#profile-li").attr("class", "active");
        $("#password-li").attr("class", "");
        $("#account-li").attr("class", "");

        $("#profile-tab").attr("class", "tab-pane fade active in");
        $("#password-tab").attr("class", "tab-pane fade");
        $("#account-tab").attr("class", "tab-pane fade");
    } else if (tabInfo === "password") {
        $("#profile-li").attr("class", "");
        $("#password-li").attr("class", "active");
        $("#account-li").attr("class", "");

        $("#profile-tab").attr("class", "tab-pane fade");
        $("#password-tab").attr("class", "tab-pane fade active in");
        $("#account-tab").attr("class", "tab-pane fade");
    } else if (tabInfo === "account") {
        $("#profile-li").attr("class", "");
        $("#password-li").attr("class", "");
        $("#account-li").attr("class", "active");

        $("#profile-tab").attr("class", "tab-pane fade");
        $("#password-tab").attr("class", "tab-pane fade");
        $("#account-tab").attr("class", "tab-pane fade active in");
    }

    let loginByEmailUrl = document.referrer;

    if (loginByEmailUrl.includes("login-by-email")) {
        $("#profile-li").attr("class", "");
        $("#password-li").attr("class", "active");
        $("#account-li").attr("class", "");

        $("#profile-tab").attr("class", "tab-pane fade");
        $("#password-tab").attr("class", "tab-pane fade active in");
        $("#account-tab").attr("class", "tab-pane fade");
    }

    // 현재 날짜와 시간을 업데이트하는 함수
    function updateDateTime() {
        const currentDateTime = new Date();
        const currentDate = currentDateTime.toLocaleDateString('ko-KR');
        const currentTime = currentDateTime.toLocaleTimeString('ko-KR');

        document.getElementById('current-date').textContent = currentDate;
        document.getElementById('current-time').textContent = currentTime;
        document.getElementById('current-time-commute').textContent = currentTime;
        document.getElementById('current-time-finish').textContent = currentTime;
    }

    //날짜 형식 변경 함수
    function formatDate(dateString) {
        const date = new Date(dateString);
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const day = date.getDate().toString().padStart(2, '0');
        return month + '-' + day;
    }

    //시간 형식 변경 함수
    function formatTime(timeString) {
        const time = new Date(timeString);
        const hours = time.getHours().toString().padStart(2, '0');
        const minutes = time.getMinutes().toString().padStart(2, '0');
        return hours + ':' + minutes;
    }

    function workOn() {
        let errorMessage = document.getElementById("errorMessage")
        fetch("/user/commute/work_on_check/" + currentUserId)
            .then(response => {
                if (response.status === 200) {
                    return response.json()
                } else {
                    throw new Error("Network response was not ok.");
                }
            })
            .then(data => {
                if (data.status === 1) {
                    errorMessage.innerText = data.message;
                    $("#commuteModalCheck").modal("show");
                    populateCommuteTable();
                } else {
                    errorMessage.innerText = data.message;
                    $("#commuteModalCheck").modal("show");
                    populateCommuteTable()
                }
            })
            .catch((error) => {
                console.error("에러 발생:", error);
                alert("출근 체크 중 오류가 발생하였습니다. 다시 시도해주세요.");
            });
    }

    function workOff() {
        let errorMessage = document.getElementById("errorMessage")
        fetch("/user/commute/work_off_check/" + currentUserId)
            .then(response => {
                if (response.status === 200) {
                    return response.json()
                } else {
                    throw new Error("Network response was not ok.");
                }
            })
            .then(data => {
                if (data.status === 1) {
                    errorMessage.innerText = data.message;
                    $("#commuteModalCheck").modal("show");
                    populateCommuteTable()
                } else {
                    errorMessage.innerText = data.message;
                    $("#commuteModalCheck").modal("show");
                    populateCommuteTable()
                }
            })
            .catch((error) => {
                console.error("에러 발생:", error);
                alert("출근 체크 중 오류가 발생하였습니다. 다시 시도해주세요.");
            });
    }

    async function fetchJsonData() {
        const url = 'http://localhost:8080/user/commute/check/' + currentUserId;

        try {
            const response = await fetch(url);
            const jsonData = await response.json();
            console.log(jsonData)
            return jsonData;
        } catch (error) {
            console.error('Error fetching JSON data:', error);
            return null;
        }
    }

    function jsonToCsv(jsonData) {
        const csvRows = [];
        const headers = ['userIdennum', 'userName', 'checkDate', 'checkInTime', 'checkOutTime', 'status'];
        const translatedHeaders = ['사원번호', '사원이름', '출근날짜', '출근시간', '퇴근시간', '상태'];
        csvRows.push(translatedHeaders.join(','));

        for (const row of jsonData) {
            const values = headers.map(header => {
                let value = row[header];
                if (header === 'checkDate') {
                    value = formatDate(value);
                }
                if (header === 'checkInTime' || header === 'checkOutTime') {
                    if (value !== null && value !== undefined) { // null 및 undefined 체크
                        console.log(value + " 넌 어느밸류");
                        value = formatTime(value);
                        console.log(value + " 넌 어느밸류바뀐");
                    }
                }
                if (header === 'status') {
                    value = value === 'WORKON' ? '출근' : '퇴근';
                }
                return value !== null && value !== undefined ? '"' + value + '"' : value;
            });
            csvRows.push(values.join(','));
        }

        return csvRows.join('\n');
    }

    async function downloadCSV() {
        const jsonData = await fetchJsonData();

        if (!jsonData) {
            console.error('JSON data is empty or could not be fetched.');
            return;
        }

        const csvData = jsonToCsv(jsonData);
        const utf8Bom = "\uFEFF";
        const csvContent = utf8Bom + csvData;
        const blob = new Blob([csvContent], {type: 'text/csv;charset=utf-8;'});
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = 'data.csv';
        document.body.appendChild(a);

        a.click();

        window.URL.revokeObjectURL(url);
    }

    //최근 5년의 select value 생성
    function populateYearAndMonthOptions() {
        const yearSelect = document.getElementById("yearSelect");
        const monthSelect = document.getElementById("monthSelect");
        const currentYear = new Date().getFullYear();
        const currentMonth = new Date().getMonth() + 1;

        for (let year = currentYear; year >= currentYear - 5; year--) {
            const option = document.createElement("option");
            option.value = year;
            option.textContent = year;
            yearSelect.appendChild(option);
        }

        for (let month = 1; month <= 12; month++) {
            const option = document.createElement("option");
            option.value = month;
            option.textContent = month.toString().padStart(2, '0');
            monthSelect.appendChild(option);
        }

        yearSelect.value = currentYear;
        monthSelect.value = currentMonth;
    }

    // JSON 배열 형식으로 접속자의 모든 출/퇴근시간 리스트 가져오기
    function populateCommuteTable() {
        fetch("/user/commute/check/" + currentUserId)
            .then(response => {
                if (response.status === 200) {
                    return response.json();
                } else {
                    throw new Error("Network response was not ok.");
                }
            })
            .then(data => {
                // 데이터를 이용하여 테이블을 동적으로 생성.
                const yearSelect = document.getElementById("yearSelect");
                const monthSelect = document.getElementById("monthSelect");
                const selectedYear = parseInt(yearSelect.value);
                const selectedMonth = parseInt(monthSelect.value);


                const filteredData = data.filter(commuteData => {
                    const checkDate = new Date(commuteData.checkDate);
                    return (
                        checkDate.getFullYear() === selectedYear &&
                        checkDate.getMonth() + 1 === selectedMonth // JavaScript months are 0-indexed
                    );
                });
                const commuteTableContainer = document.getElementById("commuteTableContainer");

                commuteTableContainer.innerHTML = '';

                // Populate the table with fetched data
                filteredData.forEach(commuteData => {
                    console.log(filteredData);
                    const newRow = document.createElement("div");
                    newRow.classList.add("d-flex", "mt-2", "p-2", "border-bottom", "border-dark");
                    const formattedDate = formatDate(commuteData.checkDate);
                    const formattedCheckInTime = formatTime(commuteData.checkInTime);
                    let formattedCheckOutTime;
                    if (commuteData.checkOutTime === null) {
                        console.log(commuteData.checkOutTime);
                        formattedCheckOutTime = "퇴근 전";
                    } else {
                        formattedCheckOutTime = formatTime(commuteData.checkOutTime);
                    }
                    console.log(formattedCheckOutTime)
                    newRow.innerHTML =
                        '<div class="col-3">' + formattedDate + '</div>' +
                        '<div class="col-3">' + formattedCheckInTime + '</div>' +
                        '<div class="col-3">' + formattedCheckOutTime + '</div>' +
                        '<div class="col-3">' + calculateWorkHours(commuteData.checkInTime, commuteData.checkOutTime) + '</div>';
                    commuteTableContainer.appendChild(newRow);
                });
            })
            .catch(error => {
                console.error("에러 발생:", error);
                alert("출근 체크 중 오류가 발생하였습니다. 다시 시도해주세요.");
            });
    }

    //출근 시간과 퇴근 시간의 차이를 계산하는 함수
    function calculateWorkHours(checkInTime, checkOutTime) {
        if (checkOutTime === null) {
            return "퇴근 전";
        } else {
            const checkIn = new Date(checkInTime);
            const checkOut = new Date(checkOutTime);
            const diffInMilliseconds = checkOut - checkIn;
            const hours = Math.floor(diffInMilliseconds / (1000 * 60 * 60));
            const minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));

            // 시간이 0시간 0분이면 null을 반환
            const formattedHours = hours.toString().padStart(2, '0');
            const formattedMinutes = minutes.toString().padStart(2, '0');

            return formattedHours + ":" + formattedMinutes;
        }
    }

    populateYearAndMonthOptions();


    // 초기화 및 주기적으로 날짜와 시간을 업데이트하는 함수
    function initialize() {
        populateCommuteTable()
        updateDateTime();
        setInterval(updateDateTime, 1000);
    }

    initialize();
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {


                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;

                document.getElementById("engAddress").value = data.addressEnglish;

                if (roadAddr !== '') {
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>