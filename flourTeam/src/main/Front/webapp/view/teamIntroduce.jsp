<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.deptWrap a {
	text-decoration: none;
	color: white;
}

.deptWrap a:hover {
	color: #0000ffad;
}

.shadowWrap {
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.outerCircle {
	width: 200px;
	height: 200px;;
}

.innerCircle {
	width: 92%;
	height: 92%;
}

.smallCircle {
	width: 30px;
	height: 30px;
	margin: 0px;
	line-height: 30px;
	cursor: pointer;
}
</style>
</head>

<body>

	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="d-inline text-center">
			<div class="fs-1 fw-bolder text-white">팀원소개</div>
			<div class="fw-bolder text-white text-center deptWrap">
				<a href="#">전체부서</a> / <a href="#">총무팀</a> / <a href="#">개발팀</a> / <a
					href="#">인사팀</a> / <a href="#">기획팀</a> / <a href="#">영업팀</a>
			</div>
		</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div class="mx-auto p-3 mt-5" style="width: 80%;">
			<div class="d-flex justify-content-between">
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="1" data-aos="fade-down-right"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/bowl-with-potatoes-on-table_23-2148540418.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.557156715.1680836041&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText1">
							<div class="fs-5 fw-bold">기획팀 / 왕감자</div>
							<div>팀장 / 20230001</div>
						</div>
						<div class="mt-3 text-center" id="secondText1"
							style="display: none">
							<div class="fw-bold">photato@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="2" data-aos="fade-down"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/premium-photo/heap-of-uncooked-purple-sweet-potatoes-texture-background_76000-294.jpg?size=626&amp;ext=jpg&amp;ga=GA1.2.557156715.1680836041&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText2">
							<div class="fs-5 fw-bold">기획팀 / 양파</div>
							<div>과장 / 20230003</div>
						</div>
						<div class="mt-3 text-center" id="secondText2"
							style="display: none">
							<div class="fw-bold">onion@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="3" data-aos="fade-down-left"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/side-view-of-onions-in-basket-on-plaid-cloth-on-white-background_141793-9453.jpg?w=996&amp;t=st=1688729368~exp=1688729968~hmac=9e408c5bbf457cb4a7a865ece55290b25be0825e3cb36626f8758394ae019ee3); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText3">
							<div class="fs-5 fw-bold">기획팀 / 고구마</div>
							<div>차장 / 20230002</div>
						</div>
						<div class="mt-3 text-center" id="secondText3"
							style="display: none">
							<div class="fw-bold">sweetphotato@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between">
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="4" data-aos="fade-right"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/corn-grains-with-cobs-in-a-clay-plate-on-wooden-table-high-angle-view_176474-5906.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.764111275.1688728799&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText4">
							<div class="fs-5 fw-bold">기획팀 / 옥수수</div>
							<div>사원 / 20230004</div>
						</div>
						<div class="mt-3 text-center" id="secondText4"
							style="display: none">
							<div class="fw-bold">corn@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4 d-flex align-items-center">
					<div class="m-2 p-3 w-100">
						<div
							style="background-image: url(https://i.postimg.cc/436vDDq2/4.png); background-size: contain; background-repeat: no-repeat; background-position: center; height: 150px;"></div>
						<div class="fs-4 fw-bold text-center">기획팀</div>
					</div>
				</div>
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="5" data-aos="fade-left"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/soybean-sauce-and-soybean-on-wooden-floor-soy-sauce-food-nutrition-concept_1150-26321.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.764111275.1688728799&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText5">
							<div class="fs-5 fw-bold">기획팀 / 콩</div>
							<div>사원 / 20230005</div>
						</div>
						<div class="mt-3 text-center" id="secondText5"
							style="display: none">
							<div class="fw-bold">soybean@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between">
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="6" data-aos="fade-up-right"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/bowl-with-potatoes-on-table_23-2148540418.jpg?size=626&amp;ext=jpg&amp;ga=GA1.1.557156715.1680836041&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText6">
							<div class="fs-5 fw-bold">기획팀 / 왕감자</div>
							<div>팀장 / 20230001</div>
						</div>
						<div class="mt-3 text-center" id="secondText6"
							style="display: none">
							<div class="fw-bold" id="mail6">photato@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="7" data-aos="fade-up"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/premium-photo/heap-of-uncooked-purple-sweet-potatoes-texture-background_76000-294.jpg?size=626&amp;ext=jpg&amp;ga=GA1.2.557156715.1680836041&amp;semt=sph); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText7">
							<div class="fs-5 fw-bold">기획팀 / 양파</div>
							<div>과장 / 20230003</div>
						</div>
						<div class="mt-3 text-center" id="secondText7"
							style="display: none">
							<div class="fw-bold">onion@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="m-2 p-3 shadowWrap" id="8" data-aos="fade-up-left"
						data-aos-duration="1000">
						<div class="rounded-circle mx-auto outerCircle">
							<div class="rounded-circle m-2 innerCircle"
								style="background-image: url(https://img.freepik.com/free-photo/side-view-of-onions-in-basket-on-plaid-cloth-on-white-background_141793-9453.jpg?w=996&amp;t=st=1688729368~exp=1688729968~hmac=9e408c5bbf457cb4a7a865ece55290b25be0825e3cb36626f8758394ae019ee3); background-size: cover;">
							</div>
						</div>
						<div class="mt-3 text-center" id="firstText8">
							<div class="fs-5 fw-bold">기획팀 / 고구마</div>
							<div>차장 / 20230002</div>
						</div>
						<div class="mt-3 text-center" id="secondText8"
							style="display: none">
							<div class="fw-bold">sweetphotato@naver.com</div>
							<div class="d-flex justify-content-center">
								<!-- 관리자 전용 수정 버튼 -->
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle"
									style="display: none">
									<i class="bi bi-pencil-square"></i>
								</div>
								<div
									class="rounded-circle bg-warning bg-opacity-25 mx-2 smallCircle">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>버튼</div>
		</div>
	</div>
	<script>
		AOS.init();

		//innerCircle 클래스 mouseover 시 하단 div 변경

		$(".shadowWrap").on("mouseenter", function() {
			var $firstText = $("#firstText" + this.id);
			var $secondText = $("#secondText" + this.id);
			$firstText.stop(true, true).fadeOut(0);
			$secondText.stop(true, true).fadeIn(500);
		});

		$(".shadowWrap").on("mouseleave", function() {
			var $firstText = $("#firstText" + this.id);
			var $secondText = $("#secondText" + this.id);
			$firstText.stop(true, true).fadeIn(500);
			$secondText.stop(true, true).fadeOut(0);
		});
	</script>
</body>
</html>