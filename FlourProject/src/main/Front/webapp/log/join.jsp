<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>

    .input-form {
      max-width: 680px;
      margin-top: 10px;
      padding: 32px;
      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
  </style>
</head>

<body style="background-color: #F2F2F2">
  <div class="container" style="margin-top: 50px;">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3" style="text-align: center; font-weight: bold;">회원가입</h4>
        <form class="validation-form" novalidate>
        <div class="d-flex">
          <div class="d-inline w-50">
          	 <div class="mb-3" style="width:293px;">
			    <label for="name">이름</label>
			    <input type="text" class="form-control" id="name" placeholder="" value="" required>
			    <div class="invalid-feedback">
			      이름을 입력해주세요.
			    </div>
			  </div>
			 <div class="mb-3" style="width:293px;">
			    <label for="number">사원번호</label>
			    <input type="text" class="form-control" id="number" placeholder="" value="" required>
			    <div class="invalid-feedback">
			      사원번호를 입력해주세요.
			    </div>
			  </div>
          </div>
          <div class="col-md-6 mb-3 w-50">
			  <div id="imagePreview" style="width: 100px; height: 100px; margin-left: 100px; margin-bottom: 10px;"></div>
			  <label for="photo" id="photoLabel">사진 첨부</label>
			  <input type="file" class="form-control-file" id="photo" onchange="previewImage(event)">
			  <div class="invalid-feedback">
			    사진을 첨부해주세요.
			  </div>
			</div>
          
          </div>
			<script>
			  function previewImage(event) {
			    var reader = new FileReader();
			    reader.onload = function () {
			      var imagePreview = document.getElementById('imagePreview');
			      var imgElement = document.createElement('img');
			      imgElement.setAttribute('src', reader.result);
			      imgElement.setAttribute('class', 'image-preview'); // 추가된 부분
			      imagePreview.innerHTML = '';
			      imagePreview.appendChild(imgElement);
			
			      // 사진이 첨부되면 "사진 첨부" 텍스트 숨기기
			      var photoLabel = document.getElementById('photoLabel');
			      photoLabel.style.display = 'none';
			    };
			    reader.readAsDataURL(event.target.files[0]);
			  }
			</script>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="password" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="password1">비밀번호 확인</label>
              <input type="password" class="form-control" id="password1" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 다시 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="form-group">
			  <label for="email">이메일</label>
			  <div class="input-group mb-3">
			    <input type="email" class="form-control rounded" id="email" placeholder="you@example.com" required style="width: 80%;">
			    <div class="input-group-append" style="margin-left: 10px;">
			      <button class="btn btn-outline-secondary rounded" type="button">중복 확인</button>
			    </div>
			  </div>
			  <div class="invalid-feedback">
			    아이디를 입력해주세요.
			  </div>
		  </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="주소를 입력해주세요" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="USER_PHONE">전화번호<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" id="address2" placeholder="전화번호를 입력해주세요.">
          </div>

          <div class="row">
            <div class="col-md-7 mb-3">
              <label for="DEPARTMENT_NAME">부서명</label>
              <select class="custom-select d-block w-100" id="DEPARTMENT_NAME">
                <option value="slc1" selected>선택</option>
	            <option value="g1"
	            >인사팀</option>
	            <option value="g2">기획팀</option>
	            <option value="g3">보안팀</option>
	            <option value="g4">재획팀</option>
	            <option value="g5">영업팀</option>
              </select>
              <div class="invalid-feedback">
                부서명을 선택해주세요.
              </div>
            </div>
            <div class="col-md-5 mb-3">
              <label for="USER_GENDER">성별</label>
              <select class="custom-select d-block w-100" id="USER_GENDER">
                <option value="slc2" selected>선택</option>
	            <option value="boy">남자</option>
	            <option value="girl">여자</option>
              </select>
              <div class="invalid-feedback">
                추천인 코드를 입력해주세요.
              </div>
            </div>
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" style="background-color: #CC9900; border: 1px solid #CC9900">가입 완료</button>
        </form>
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
  </script>
</body>

</html>