<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+KruMiXxKRTCThfazQG8rP3rX2K2x/Bagw3fjr8Mzdedhcx" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

  <style>
    .input-form {
      max-width: 550px;
      margin-top: 10px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.1);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.1);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.1)
    }

    .image-preview {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .image-preview img {
      max-width: 100%;
      max-height: 100%;
      object-fit: cover;
    }

    .modal-content {
      background-color: #f8f9fa;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      text-align: center;
      font-family: 'Roboto', sans-serif;
    }

    .modal-header {
      border-bottom: none;
      padding: 1rem;
    }

    .modal-body {
      padding: 1rem;
    }

    .modal-footer {
      border-top: none;
      padding: 1rem;
    }

    .btn-primary {
      background-color: #1b5ecf;
      border-color: #1b5ecf;
      font-weight: bold;
      padding: 0.5rem 1rem;
      font-size: 1rem;
      text-transform: uppercase;
    }
  </style>
</head>

<body style="background-color: #F2F2F2">
  <div class="container" style="margin-top: 120px;">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3" style="text-align: center; font-weight: bold;">비밀번호 찾기</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-12 mb-3">
              <label for="employeeNumber">사원번호</label>
              <input type="text" class="form-control" id="employeeNumber" placeholder="" required>
              <div class="invalid-feedback">
                사원번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-12 mb-3">
              <label for="email">이메일</label>
              <div class="input-group">
                <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." required>
                <div class="input-group-append">
                <button class="btn btn-outline-secondary rounded" type="button" id="verificationButton" style="margin-left: 10px;">인증번호 받기</button>
                </div>
              </div>
              <div class="invalid-feedback">
               이메일을 입력해주세요.
              </div>
            </div>
            <div class="col-md-12 mb-3" style="display: none;" id="verificationCodeArea">
              <label for="verificationCode">인증번호</label>
              <div class="input-group">
                <input type="text" class="form-control" id="verificationCode" required>
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary rounded" type="button" id="verificationConfirmButton" style="margin-left: 10px;">인증번호 확인</button>
                </div>
              </div>
              <div class="invalid-feedback">
                인증번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-12 mb-3" id="newPasswordFields" style="display: none;">
              <label for="newPassword">새 비밀번호</label>
              <input type="password" class="form-control" id="newPassword" required>
              <div class="invalid-feedback">
                새 비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-12 mb-3" id="confirmPasswordFields" style="display: none;">
              <label for="confirmPassword">비밀번호 확인</label>
              <input type="password" class="form-control" id="confirmPassword" required>
              <div class="invalid-feedback">
                비밀번호를 다시 입력해주세요.
              </div>
            </div>
          </div>
          <button class="btn btn-primary btn-lg btn-block" type="submit"
            style="background-color: #CC9900; border: 1px solid #CC9900; margin-top: 15px;">비밀번호 변경</button>
        </form>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="verificationModal" tabindex="-1" role="dialog" aria-labelledby="verificationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <!-- <h5 class="modal-title" id="verificationModalLabel">인증번호 확인</h5> -->
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
         인증번호를 입력하세요
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="verificationModalConfirm">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 인증번호 확인 모달 -->
	<div class="modal" tabindex="-1" role="dialog" id="verificationSuccessModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- <h5 class="modal-title">인증번호 확인되었습니다.</h5> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>인증번호가 확인되었습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 인증번호 오류 모달 -->
	<div class="modal" tabindex="-1" role="dialog" id="verificationErrorModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- <h5 class="modal-title">잘못된 인증번호입니다.</h5> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>잘못된 인증번호입니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
  <script>   
    
  window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add('was-validated');
      }, false);
    });
  }, false);

  const verificationButton = document.getElementById('verificationButton');
  const verificationConfirmButton = document.getElementById('verificationConfirmButton');
  const newPasswordFields = document.getElementById('newPasswordFields');
  const confirmPasswordFields = document.getElementById('confirmPasswordFields');
  const verificationCodeArea = document.getElementById('verificationCodeArea');
  const verificationModal = document.getElementById('verificationModal');
  const verificationModalBody = verificationModal.querySelector('.modal-body');
  const verificationModalConfirm = document.getElementById('verificationModalConfirm');
  
  let verificationCodeSent = false;
  let verificationCode = '';

  function sendVerificationCode() {
    // 인증번호 전송 기능 구현
    // 예시로 6자리 난수 생성
    verificationCode = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;
    console.log('인증번호: ', verificationCode); // 콘솔에서 인증번호 확인
    verificationCodeSent = true;

    $('#verificationModal').modal('show');
    verificationModalBody.textContent = '인증번호가 전송되었습니다.';
  }

  function checkVerificationCode(inputVerificationCode) {
    if (inputVerificationCode === verificationCode.toString()) {
      return true;
    } else {
      return false;
    }
  }

  verificationButton.addEventListener('click', sendVerificationCode);

  verificationModalConfirm.addEventListener('click', () => {
    if (newPasswordFields.style.display !== 'block') {
      verificationCodeArea.style.display = 'block';
    }
  });

  verificationConfirmButton.addEventListener('click', () => {
	const inputVerificationCode = document.getElementById('verificationCode').value;

	if (checkVerificationCode(inputVerificationCode)) {
	    $('#verificationSuccessModal').modal('show'); // 인증번호 확인 모달을 표시
	    newPasswordFields.style.display = 'block';
	    confirmPasswordFields.style.display = 'block';
	} else {
	    $('#verificationErrorModal').modal('show'); // 인증번호 오류 모달을 표시
	}
});
  </script>
</body>

</html>
