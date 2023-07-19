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
		color: #FFC107;
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
			<div class="fs-1 fw-bolder text-white">공지사항</div>
		</div>
		<div class="mx-auto bg-white rounded mt-5 p-5"
			style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1); width: 1350px;">
			<div class="d-flex justify-content-between mx-auto"
				style="width: 90%;">
				<div class="text-warning fs-2 fw-bolder">공지사항</div>
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
						<td style="width: 10%">구분</td>
						<td style="width: 50%">제목</td>
						<td style="width: 15%">작성자</td>
						<td style="width: 15%">작성일</td>
						<td style="width: 10%">조회수</td>
					</tr>
					<!-- sample -->
					<tr>
						<td>
							<div>
								<div>
									<div class="rounded bg-danger text-white w-75 p-1 mx-auto">긴급</div>
								</div>
							</div>
						</td>
						<td class="text-start"><a href="./noticeBoardContent.jsp">감자칩은 감자감자</a></td>
						<td>왕감자</td>
						<td>2023-07-05</td>
						<td>0</td>
					</tr>
					<tr>
						<td>
							<div>
								<div class="rounded bg-success text-white w-75 p-1 mx-auto">공지</div>
							</div>
						</td>
						<td class="text-start"><a href="./noticeBoardContent.jsp">고구마는 고구고구</a></td>
						<td>왕고구마</td>
						<td>2023-07-06</td>
						<td>0</td>
					</tr>
					<tr>
						<td>
							<div>
								<div class="rounded bg-secondary text-white w-75 p-1 mx-auto">안내</div>
							</div>
						</td>
						<td class="text-start"><a href="./noticeBoardContent.jsp">양파는 양파양파</a></td>
						<td>왕고구마</td>
						<td>2023-07-06</td>
						<td>0</td>
					</tr>
				</table>
				<div class="mt-4 text-end">
					<button class="btn btn-info fs-5 fw-bold px-3"
						onclick="window.location.href='./noticeBoardRegister.jsp'">글쓰기</button>
				</div>
			</div>
		</div>
	
		<script type="text/javascript">
			
		</script>
	</body>
	</html>