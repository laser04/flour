<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- toast -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<style>
div {
	/* border:1px solid black; */
	
}

.boardContent .bi {
	padding-left: 3px;
	padding-right: 3px;
}

/* toast editor insert 비활성화 */
button.table, button.image, button.link {
	display: none;
}
</style>

</head>
<body class="boardContent">
	<div class="w-100 d-flex justify-content-center align-items-center"
		style="
	            background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
	         height:300px; background-repeat: no-repeat; background-size:cover;">
		<div class="fs-1 fw-bolder text-white">뉴스</div>
	</div>
	<div class="mx-auto mt-5" style="width: 1215px;">
		<form>
			<div>
				<div class="p-3 border-top">
					<input class="fw-bold fs-3 border-0 w-100 form-control" id="title"
						type="text" value="제목" readonly>
				</div>
				<div class="d-flex p-2 justify-content-end border-top">
					<div class="mx-3">
						부서명 <span>기획팀</span>
					</div>
					<div class="mx-3">
						글쓴이 <span>왕감자</span>
					</div>
					<div class="mx-3">
						작성일 <span>2023-07-12</span>
					</div>
					<div class="mx-3">
						조회 <span>0</span>
					</div>
				</div>
			</div>
			<div class="border-top p-3" style="height: 400px">
				<div class="h-100 normalCase">
					<div class="form-control p-2 h-100 fs-5">내용</div>
				</div>
				<div class="h-100 updateCase" style="display: none;">
					<div id="editor"></div>
					<div>
						<input type="hidden" id="contents" name="content">
					</div>
				</div>
			</div>
	</div>
	<div class="border-top">
		<div class="normalCase">
			<div class="d-flex justify-content-center p-3">
				<div class="btn btn-success text-white mx-2 px-4 fw-bold"
					onclick="window.location.href='./newsBoard.jsp'">목록</div>
				<div class="btn btn-info text-white mx-2 px-4 fw-bold" id="update">수정</div>
				<div class="btn btn-danger text-white mx-2 px-4 fw-bold" id="delete">삭제</div>
			</div>
		</div>
		<div class="updateCase" style="display: none">
			<div class="d-flex justify-content-center p-3">
				<button type="submit"
					class="btn btn-success text-white mx-2 px-4 fw-bold">저장</button>
				<div class="btn btn-danger text-white mx-2 px-4 fw-bold" id="cancel">취소</div>
			</div>
		</div>
	</div>
	</form>

	<!-- 댓글 -->
	<div class="mt-5">
		<div class="d-flex justify-content-between px-3">
			<div class="text-secondary pt-2">총 50자까지 가능</div>
			<div class="btn btn-secondary" id="registration">등록</div>
		</div>
		<div class="mt-1">
			<textarea class="form-control p-2" style="height: 75px"></textarea>
		</div>
		<div class="mx-3 mt-1">
			<div id="placeholder">등록된 댓글이 없습니다.</div>
			<div id="comment" style="display: none;">
				<div class="row border-bottom">
					<div class="col-2">사번</div>
					<div class="col-6">내용</div>
					<div class="col-4">날짜</div>
				</div>
				<!-- sample -->
				<div class="row border-bottom bg-secondary bg-opacity-10">
					<div class="col-2 align-self-center">2300001</div>
					<div class="col-6 align-self-center">감자는 감자감자</div>
					<div class="col-4 align-self-center">
						2023-07-12 17:33 <span><i class="bi bi-pencil btn"></i></span> <span><i
							class="bi bi-trash btn"></i></span>
					</div>
				</div>
				<div class="row border-bottom">
					<div class="col-2 align-self-center">2300001</div>
					<div class="col-6 align-self-center">감자는 감자감자</div>
					<div class="col-4 align-self-center">
						2023-07-12 17:33 <span><i class="bi bi-pencil btn"></i></span> <span><i
							class="bi bi-trash btn"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- toast -->
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		//수정, 취소 버튼 클릭 시 이벤트
		$("#update").on("click", function() {
			$(".normalCase").attr("style", "display:none");
			$(".updateCase").attr("style", "display:block");

			$("#title").attr("readonly", false);
			$("#title").focus();
		})
		$("#cancel").on("click", function() {
			$(".normalCase").attr("style", "display:block");
			$(".updateCase").attr("style", "display:none");

			$("#title").attr("readonly", true);
		})

		//등록 버튼 클릭 시 이벤트
		//추후 수정
		$("#registration").on("click", function() {
			$("#placeholder").attr("style", "display:none");
			$("#comment").attr("style", "display:block");
		})

		//toast
		const Editor = toastui.Editor;
		const editor = new Editor({
			el : document.querySelector('#editor'),
			height : '100%',
			initialEditType : 'wysiwyg',
			previewStyle : 'vertical',
			usageStatistics : false, // Table Extension 비활성화
			language : 'ko'
		});
		editor.getMarkdown();
	</script>
</body>
</html>