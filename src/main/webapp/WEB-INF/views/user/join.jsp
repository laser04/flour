<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.flour.web.dto.UserAccountDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <sec:csrfMetaTags/>
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
    <div class="input-form-background row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3" style="text-align: center; font-weight: bold;">회원가입</h4>
        <form class="needs-validation" action="join" method="post">
            <sec:csrfInput />
        <div class="d-flex">
          <div class="d-inline w-50">
          	 <div class="mb-3" style="width:293px;">
			    <label for="name">이름</label>
			    <input type="text" class="form-control" id="name" name="name" placeholder="" value="" required>
			    <div class="invalid-feedback">
			      이름을 입력해주세요.
			    </div>
			  </div>
			 <div class="mb-3" style="width:293px;">
			    <label for="user_idennum">사원번호</label>
                 <c:if test="${param.idennum eq null}">
                     <input aria-describedby="idHelp" class="form-control" id="user_idennum" name="idennum" required
                            maxlength="9"
                            minlength="9" placeholder="사번을 입력해주세요" type="text">
                 </c:if>
                 <c:if test="${param.idennum ne null}">
                     <input aria-describedby="idHelp" class="form-control" id="user_idennum" name="idennum" required
                            maxlength="9"
                            minlength="9" placeholder="사번을 입력해주세요" type="text" value="${param.idennum}">
                 </c:if>
                 <small class="form-text text-muted" id="idennumHelp">
                     9자리의 숫자로 이루어진 사번을 입력해주세요<br/>
                 </small>
                 <c:if test="${errors['idennum'] ne null}">
                     <small class="form-text text-danger">id
                         Error: <c:out value="${errors['idennum']}"/> </small>
                 </c:if>
			  </div>
          </div>
          <div class="col-md-6 mb-3 w-50">
			  <div id="imagePreview" style="width: 100px; height: 100px; margin-left: 100px; margin-bottom: 10px;"></div>
			  <label for="photo" id="photoLabel">사진 첨부</label>
			  <input type="file" class="form-control-file" accept=".jpg, .png" id="photo" name="photo" onchange="previewImage(event)">
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
              <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
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
			    <input type="email" class="form-control rounded" id="email" name="email" placeholder="you@example.com" required style="width: 80%;">
			    <div class="input-group-append" style="margin-left: 10px;">
			      <button class="btn btn-outline-secondary rounded" type="button" onclick="">중복 확인</button>
			    </div>
			  </div>
			  <div class="invalid-feedback">
			    아이디를 입력해주세요.
			  </div>
		  </div>

          <div class="mb-3">
            <label for="address">주소</label>
              <div class="col-sm-5" id="address">

                  <div style="width: 50%">
                    <input type="text" readonly name="address_postnum" onclick="execDaumPostcode()" class="form-control" id="postcode" placeholder="우편번호">
                  </div>
                  <div>
                  <input type="text" readonly name="address_basic" onclick="execDaumPostcode()" class="form-control" id="roadAddress" placeholder="도로명주소" size="60" >
                  </div>
                  <input type="hidden" name="address_jibun" id="jibunAddress" placeholder="지번주소"  size="60">
                  <span id="guide" style="color:#999;display:none"></span>
                  <div>
                  <input type="text" name="address_detail" class="form-control" id="detailAddress" placeholder="상세주소"  size="60">
                  </div>
                  <input type="hidden" id="extraAddress" placeholder="참고항목"  size="60">
                  <input type="hidden" id="engAddress" placeholder="영문주소"  size="60" ><br>
              </div>
          </div>

          <div class="mb-3">
            <label for="phone">전화번호<span class="text-muted">&nbsp;</span></label>
            <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력해주세요.">
          </div>

          <div class="row">
            <div class="col-md-7 mb-3">
              <label for="department">부서명</label>
              <select class="custom-select d-block w-100" id="department" name="department">
                <option value="slc1" selected>선택</option>
	            <option value="1">인사팀</option>
	            <option value="2">기획팀</option>
	            <option value="3">보안팀</option>
	            <option value="4">재획팀</option>
	            <option value="1">영업팀</option>
              </select>
              <div class="invalid-feedback">
                부서명을 선택해주세요.
              </div>
            </div>
            <div class="col-md-5 mb-3">
              <label for="gender">성별</label>
              <select class="custom-select d-block w-100" id="gender" name="gender">
                <option value="slc2" selected>선택</option>
	            <option value="남자">남자</option>
	            <option value="여자">여자</option>
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