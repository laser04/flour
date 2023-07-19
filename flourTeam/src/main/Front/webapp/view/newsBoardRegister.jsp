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

<style type="text/css">
.toastui-editor-contents p {
	font-size: 18px;
}

/* toast editor insert 비활성화 */
button.table, button.image, button.link {
	display: none;
}
</style>
</head>

<body>
	<div class="mx-auto mt-5 p-4 border"
		style="width: 945px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
		<div class="text-success fw-bolder text-center fs-1">뉴스</div>
		<form action="insertBoard.do" method="post">
			<div id="check">
				<div class="mt-3">
					<div class="fs-5 mb-1">뉴스</div>
					<div>
						<input class="p-1 form-control" id="title" type="text"
							placeholder="제목을 입력해주세요">
					</div>
				</div>
				<div class="d-flex mt-2 justify-content-start">
					<div style="width: 13%; margin-right: 10px">
						<div class="fs-5 mb-1">&nbsp;부서</div>
						<div>
							<input class="form-control bg-secondary bg-opacity-25 p-1 ps-3"
								type="text" value="${boarddto.DEPARTMENTNAME}"
								name="DEPARTMENTNAME" readonly>
						</div>
					</div>
					<div style="width: 13%; margin-right: 10px">
						<div class="fs-5 mb-1">&nbsp;직책</div>
						<div>
							<input class="form-control bg-secondary bg-opacity-25 p-1 ps-3"
								type="text" value="${boarddto.USERADMIN}" name="USERADMIN"
								readonly>
						</div>
					</div>
					<div style="width: 13%; margin-right: 10px">
						<div class="fs-5 mb-1">&nbsp;이름</div>
						<div>
							<input class="form-control bg-secondary bg-opacity-25 p-1 ps-3"
								type="text" value="${boarddto.USERNAME}" name="USERNAME"
								readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-2 fs-5 mb-1">
				<div>내용</div>
				<div id="editor"></div>
				<div>
					<input type="hidden" id="contents" name="content">
				</div>
			</div>
			<div class="mt-3 text-center">
				<input type="submit" class="btn bg-primary text-white mx-1"
					id="submitBtn" value="등록">
				<div class="btn bg-danger text-white mx-1" id="resetBtn">취소</div>
			</div>
		</form>
	</div>

	<!-- toast -->
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script type="text/javascript">
            //toast
            const Editor = toastui.Editor;
            const editor = new Editor({
                el: document.querySelector('#editor'),
                height: '350px',
                initialEditType: 'wysiwyg',
                previewStyle: 'vertical',
                language:'ko'
            });
            editor.getMarkdown();
            
            //취소 버튼
            var resetBtn = document.getElementById("resetBtn");
            resetBtn.addEventListener("click",()=>{
                location.href="./newsBoard.jsp";
            });

            //등록 버튼 - 수정필요
            var submitBtn = document.getElementById("submitBtn");
            submitBtn.addEventListener("click",()=>{
                document.querySelector('#contents').setAttribute('value' ,editor.getHTML());
                console.log(editor.getHTML());
            });
        </script>
</body>
</html>