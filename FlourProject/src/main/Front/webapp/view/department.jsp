<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
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
		<div class="fs-1 fw-bolder text-white">기획팀</div>
	</div>
	<div class="mx-auto" style="width: 1350px;">
		<div class="d-flex justify-content-center mt-5">
			<div class="">
				<div>부서 목표</div>
				<div>회장님은 박보영을 좋아하신다!!</div>
				<div>
					<div class="btn btn-primary">글쓰기</div>
				</div>
			</div>
			<div>
				<div>부서실적</div>
				<div>
					<div class="row">
						<div class="col-4">판매실적</div>
						<div class="col-4">보안</div>
						<div class="col-4">안전사고</div>
					</div>
					<div class="row">
						<div class="col-4 text-danger">
							<i class="bi bi-circle-fill"></i>
						</div>
						<div class="col-4 text-warning">
							<i class="bi bi-circle-fill"></i>
						</div>
						<div class="col-4 text-success">
							<i class="bi bi-circle-fill"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="mx-auto bg-white mt-5 p-5">
				<div class="d-flex justify-content-between mx-auto"
					style="width: 90%;">
					<div class="text-warning fs-2 fw-bolder">부서게시판</div>
					<div class="d-flex col-5 align-bottom justify-content-end"
						style="height: 40px;">
						<select class="form-select w-25">
							<option value="title" selected>제목</option>
							<option value="writer">작성자</option>
						</select> <input type="text" class="form-control w-50">
						<button class="btn">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</div>
				<div class="mx-auto mt-4" style="width: 90%;">
					<table id="table-board"
						class="table-bordered border-dark w-100 text-center">
						<tr class="bg-secondary bg-opacity-10 fw-bolder">
							<td style="width: 8%">구분</td>
							<td style="width: 40%">제목</td>
							<td style="width: 15%">작성자</td>
							<td style="width: 10%">작성일</td>
							<td style="width: 12%">조회수</td>
							<td style="width: 10%">파일</td>
						</tr>
						<!-- sample -->
						<tr>
							<td>
								<div class="bg-danger rounded text-white fw-bold px-1 mx-1">
									긴급</div>
							</td>
							<td class="text-start"><a href="#">감자칩은 감자감자</a></td>
							<td>왕감자</td>
							<td>2023-07-05</td>
							<td>0</td>
							<td>
								<div>
									<i class="bi bi-file-text fs-4"></i>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="bg-warning rounded text-white fw-bold px-1 mx-1">
									안내</div>
							</td>
							<td class="text-start"><a href="#">고구마는 고구고구</a></td>
							<td>왕고구마</td>
							<td>2023-07-06</td>
							<td>0</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<div class="bg-success rounded text-white fw-bold px-1 mx-1">
									자유</div>
							</td>
							<td class="text-start"><a href="#">옥수수는 옥수옥수</a></td>
							<td>꼬마옥수수</td>
							<td>2023-07-10</td>
							<td>0</td>
							<td></td>
						</tr>
					</table>
					<div class="mt-4 text-end">
						<button class="btn btn-info fs-5 fw-bold px-3"
							onclick="window.location.href='./boardRegister.jsp'">글쓰기</button>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				const biStar = document.getElementsByClassName("bi-star");
				Array
						.from(biStar)
						.forEach(
								function(e) {
									var i = 0;
									e
											.addEventListener(
													"click",
													function() {
														if (i == 0) {
															this
																	.setAttribute(
																			"class",
																			'bi bi-star-fill fs-4 text-warning');
															i--;
														} else {
															this
																	.setAttribute(
																			"class",
																			'bi bi-star fs-4 text-warning');
															i++;
														}
													});
								});
			</script>
		</div>
	</div>
</body>
</html>