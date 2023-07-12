<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .top-right {
            position: relative;
            width: 100%;
            height: 300px;
            overflow: hidden;
        }

        .top-right img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-width: 100%;
            min-height: 100%;
        }

        .top-right::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .5);
        }

        .top-right h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
            font-size: 50px;
        }

        .top-right small {
            display: block;
            font-size: 20px;
        }

        .top-right .btn {
            position: absolute;
            bottom: 10%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #fff;
            color: #000;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 20px;
        }

        .top-right .btn:hover {
            background-color: #000;
            color: #fff;
        }

        .top-right .btn:active {
            background-color: #000;
            color: #fff;
        }

        input[type="text"], input[type="password"] {
            padding-bottom: 10px;
        }
        

        label{
            font-weight: bold;
        }
        .right-section {
            width: 100%;
            height: 100%;
            padding: 20px;
        }

        .profile-box {
            text-align: left;
            margin-bottom: 20px;
            
        }
        .img-box{
            text-align: center;
        }
        .box-container {
            display: flex;
            justify-content: space-between;
        }
        .boxlabel{
            color: gainsboro;
        }
        .btn-container{
            margin: auto;
        }
        .box {
            width: 80%;
            padding: 20px;
        }
        .box-border{
            border-left : 1px solid gainsboro;
            height : 550px;
        }
        .form-control-plaintext {
            border: none;
            border-bottom: 1px solid #000;
            outline: none;
            padding: 0;
            background-color: transparent;
            margin-top: 10px; 
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            padding: 10px;
        }
        .btn-container input[type="submit"] {
            margin-right: 20px;
        }
    </style>
</head>

<body>
    <div class="right-section" style="width:1350px; margin:0 auto;">
        <div class="top-right">
            <img alt="" src="../resources/img/myPage/예약페이지.jpg" style="width: 100%; height: 300px;">
        </div>
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">회원정보</button>
                <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">회원탈퇴</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <form action="/mypage" method="post">
                    <div class="box-container">
                        <div class="box mt-5">
                            <div class="mb-5 row">
                                <h1>2350001<!--${user.userNo}--> / 사원<!--${user.Permanent}--> <small>홍길동<!--${user.name}--></small></h1>
                            </div>
                            <div class="mb-4 row">
                                <label for="userEmail" class="col-sm-2 col-form-label">>이메일</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control-plaintext" id="userEmail" value="email@example.com">
                                </div>
                            </div>
                            <div class="mb-4 row">
                                <label for="userPhone" class="col-sm-2 col-form-label">>연락처</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control-plaintext" id="userPhone" value="010-3717-4001">
                                </div>
                            </div>
                            <div class="mb-4 row">
                                <label for="userPermanent" class="col-sm-2 col-form-label">>계약형태</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control-plaintext" id="userPermanent" value="정규직">
                                </div>
                            </div>
                            <div class="mb-4 row">
                                <label for="userPermanent" class="col-sm-2 col-form-label">>입사일</label>
                                <div class="col-sm-4">
                                    <input type="text" readonly class="form-control-plaintext" id="userPermanent" value="2023-07-04">
                                </div>
                            </div>
                            <div class="mb-4 row">
                                <label for="userPermanent" class="col-sm-2 col-form-label">>주소</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly name="user_address_postnum" onclick="execDaumPostcode()" class="form-control-plaintext" id="postcode" placeholder="우편번호">
                                    <input type="button" onclick="execDaumPostcode()" class="btn btn-outline-primary" value="우편번호 찾기"><br>
                                    <input type="text" readonly name="user_address_road" onclick="execDaumPostcode()" class="form-control-plaintext" id="roadAddress" placeholder="도로명주소" size="60" ><br>
                                    <input type="hidden" name="user_address_jibun" id="jibunAddress" placeholder="지번주소"  size="60">
                                    <span id="guide" style="color:#999;display:none"></span>
                                    <input type="text" name="user_address_detail" class="form-control-plaintext" id="detailAddress" placeholder="상세주소"  size="60"><br>
                                    <input type="hidden" id="extraAddress" placeholder="참고항목"  size="60">
                                    <input type="hidden" id="engAddress" placeholder="영문주소"  size="60" ><br>
                                </div>
                            </div>
                        </div>
                        <div class="box-border">

                        </div>
                        <div class="box">
                            <div class="profile-box">
                                <div>
                                    <p>내 정보</p>
                                </div>
                                <div class="img-box">
                                    <img src="../resources/img/myPage/GitHub.png" alt="프로필 사진" style="width: 90px; border-radius: 50%; margin: 0 auto;">
                                </div>
                                <div class="imgChangeBtn d-flex justify-content-center mt-3">
                                    <button type="button" class="btn btn-outline-primary">프로필사진 수정</button>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userName" class="col-sm-2 col-form-label">이름</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control-plaintext" id="userName" value="안준후">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="department" class="col-sm-2 col-form-label">부서명</label>
                                <div class="col-sm-5">
                                    <select class="form-select" id="department">
                                        <option>영업부</option>
                                        <option value="경영관리부">경영관리부</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userPassword" class="col-sm-2 col-form-label">비밀번호</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control-plaintext" name="password" id="userPassword">
                                    <i class="toggle-password fas fa-eye-slash"></i>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="userPassword" class="col-sm-2 col-form-label">비밀번호 확인</label>
                                <div class="col-sm-5">
                                    <input type="password" class="form-control-plaintext" name="password" id="userPassword">
                                    <i class="toggle-password fas fa-eye-slash"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-container ml-4">
                        <input type="submit" value="변경하기" class="btn btn-primary">
                        <input type="reset" value="취소" class="btn btn-secondary">
                    </div>
                </form>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <h3>회원탈퇴 폼</h3>
            </div>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const togglePassword = document.querySelectorAll('.toggle-password');

        togglePassword.forEach(function(toggle) {
            toggle.addEventListener('click', function() {
                const passwordInput = this.previousElementSibling;
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                } else {
                    passwordInput.type = 'password';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                }
            });
        });
    </script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {


                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
         
                document.getElementById("engAddress").value = data.addressEnglish;
                       
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
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
</html>