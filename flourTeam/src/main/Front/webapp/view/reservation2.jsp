<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* Popup Styles */
.popup {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	max-width: 500px;
	position: relative;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.button-container {
	text-align: center;
	margin-top: 20px;
}
/* container-buttons */
.container-buttons {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	padding: 10px;
	margin-top: 20px;
}

.container-buttons button {
	background-color: #eebf24;
	color: white;
	padding: 10px 24px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.container-buttons button:hover {
	background-color: #d4a71b;
}
/* container, box  */
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 10px;
	padding: 10px;
	/* border: 1px solid black; */
	width: 1350px;
	margin-top: 20px;
	margin: 0 auto;
}

.box {
	/* border: 1px solid black; */
	padding: 20px;
	text-align: center;
	width: 20%;
}

.box img {
	width: 100%;
	height: auto;
}

.box form {
	display: grid;
	gap: 10px;
	margin-top: 10px;
}

.box form .input-container input[name="user-number"] {
	width: 180px;
}

.box input {
	padding: 5px;
}

.box button {
	background-color: #eebf24;
	color: white;
	padding: 10px 24px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
}

.input-container {
	display: flex;
	gap: 5px;
}
</style>

</head>
<body>
	<div class="mx-auto" style="width:1350px;">
		<div class="w-100 d-flex justify-content-center align-items-center"
			style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px;">
			<div class="fs-1 fw-bolder text-white">근태관리</div>
		</div>
		<div class="container-buttons">
			<button onclick="showAll()">전체</button>
			<button onclick="showRoom('room1')">회의실 1</button>
			<button onclick="showRoom('room2')">회의실 2</button>
			<button onclick="showRoom('room3')">회의실 3</button>
		</div>
	
		<div class="container">
			<div class="box">
				<img src="../resources/img/reservation/회의실1.jpg" alt="Image 1">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit" onclick="showPopup()">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실1.jpg" alt="Image 2">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실1.jpg" alt="Image 3">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실1.jpg" alt="Image 4">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실2.jpg" alt="Image 5">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실2.jpg" alt="Image 6">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실2.jpg" alt="Image 7">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실2.jpg" alt="Image 8">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실3.jpg" alt="Image 9">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실3.jpg" alt="Image 10">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실3.jpg" alt="Image 11">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사 번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
			<div class="box">
				<img src="../resources/img/reservation/회의실3.jpg" alt="Image 12">
				<form>
					<div class="input-container">
						<label for="user-number">사번:</label> <input type="text"
							name="user-number" placeholder="사번">
					</div>
					<div class="input-container">
						<label for="user-number">신청날짜:</label> &nbsp;&nbsp; <input
							type="date" name="date">
					</div>
					<div class="input-container">
						<label for="user-number">신청시간:</label> &nbsp;&nbsp; <input
							type="time" name="start-time">
					</div>
					<div class="input-container">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						~<input type="time" name="end-time">
					</div>
					<button type="submit">신청</button>
				</form>
			</div>
		</div>
		<!-- Popup -->
		<div id="popup" class="popup">
			<div class="popup-content">
				<span class="close" onclick="closePopup()">&times;</span>
				<h2>신청 정보</h2>
				<p>
					신청사 사번: <span id="popup-user-number"></span>
				</p>
				<p>
					대여 시작 시간: <span id="popup-start-time"></span>
				</p>
				<p>
					대여 종료 시간: <span id="popup-end-time"></span>
				</p>
				<p>
					용도: <span id="popup-purpose"></span>
				</p>
				<div class="button-container">
					<button onclick="cancelRequest()">취소</button>
					<button onclick="rejectRequest()">거절</button>
					<button onclick="approveRequest()">승인</button>
				</div>
			</div>
		</div>
	
		<script>
			function showPopup() {
				// Get input values
				const userNumber = document
						.querySelector('input[name="user-number"]').value;
				const startTime = document
						.querySelector('input[name="start-time"]').value;
				const endTime = document.querySelector('input[name="end-time"]').value;
	
				// Set popup content
				document.getElementById('popup-user-number').textContent = userNumber;
				document.getElementById('popup-start-time').textContent = startTime;
				document.getElementById('popup-end-time').textContent = endTime;
	
				// Show popup
				document.getElementById('popup').style.display = 'block';
			}
	
			function closePopup() {
				// Close popup
				document.getElementById('popup').style.display = 'none';
			}
	
			function cancelRequest() {
				// Perform cancellation logic here
				alert('요청이 취소되었습니다.');
				closePopup();
			}
	
			function rejectRequest() {
				// Perform rejection logic here
				alert('요청이 거절되었습니다.');
				closePopup();
			}
	
			function approveRequest() {
				// Perform approval logic here
				alert('요청이 승인되었습니다.');
				closePopup();
			}
		</script>
	</div>
</body>
</html>