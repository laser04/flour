<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#table-board a {
	text-decoration: none;
	color: #0DCAF0;
}

#table-board td {
	vertical-align: middle;
	padding: 10px;
	font-weight: bolder
}
</style>
</head>
<body>
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="fs-1 fw-bolder text-white">자유게시판</div>
	</div>
	<div class="mx-auto bg-white rounded mt-5 p-5"
		style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1); width: 1350px;">
		<div class="d-flex justify-content-between mx-auto"
			style="width: 90%;">
			<div class="text-info fs-2 fw-bolder">자유게시판</div>
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
					<td style="width: 5%">즐겨찾기</td>
					<td style="width: 40%">제목</td>
					<td style="width: 15%">작성자</td>
					<td style="width: 10%">작성일</td>
					<td style="width: 20%">조회수</td>
					<td style="width: 10%">파일</td>
				</tr>
				<!-- sample -->
				<tr>
					<td>
						<div>
							<i class="bi bi-star fs-4 text-warning" style="cursor: pointer;"></i>
						</div>
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
						<div>
							<i class="bi bi-star fs-4 text-warning" style="cursor: pointer;"></i>
						</div>
					</td>
					<td class="text-start"><a href="#">고구마는 고구고구</a></td>
					<td>왕고구마</td>
					<td>2023-07-06</td>
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
		Array.from(biStar).forEach(
				function(e) {
					var i = 0;
					e.addEventListener("click", function() {
						if (i == 0) {
							this.setAttribute("class",
									'bi bi-star-fill fs-4 text-warning');
							i--;
						} else {
							this.setAttribute("class",
									'bi bi-star fs-4 text-warning');
							i++;
						}
					});
				});
	</script>
</body>
</html>

