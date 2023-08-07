<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- toast -->
<link rel="stylesheet"
   href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
   <!-- 반응형 설정 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
        
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
      <div class="text-info fw-bolder text-center fs-1">자료실</div>
      <form action="/achieve/board/insert/"  enctype="multipart/form-data" method="post" >
      
          <sec:csrfInput/>
          
         <div id="check">
            <div class="mt-3">
               <div class="fs-5 mb-1">&nbsp;제목</div>
               <div>
                  <input class="p-1 form-control" id="title" type="text"
                     placeholder="제목을 입력해주세요" name="boardTitle"  required>
               </div>
            </div>
            
            <div class="d-flex mt-2 justify-content-start">
			    <div style="width: 13%; margin-right: 10px " >
			        <div class="fs-5 mb-1">&nbsp;부서</div>
			        <div>
			            <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="${boarddto.departmentName}" name="departmentName" readonly>
			        </div>
			    </div>
			    <div style="width: 13%; margin-right: 10px">
			        <div class="fs-5 mb-1">&nbsp;권한</div>
			        <div>
			            <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="${boarddto.userRole}" name="userRole" readonly>
			        </div>
			    </div>
			    <div style="width: 13%; margin-right: 10px">
			        <div class="fs-5 mb-1">&nbsp;이름</div>
			        <div>
			            <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="${boarddto.userName}" name="userName" readonly>
			        </div>
			    </div>
			</div>
         </div>
         <div class="mt-2 fs-5 mb-1">
            <div>&nbsp;내용</div>
             <!-- <div id="editor"></div> 여기 안에 있는 글자가 
            			자동으로  <input type="hidden">으로 들어감 -->
            <div id="editor"></div>
            <div>
               <input type="hidden" id="contents" name="boardContent">
            </div>
            <div class="mt-2 d-block" id="fileWrap">
               <input class="mt-2 w-100" type="file" id="file1"
                  style="font-size: 0.6em"	name="uploadFile">
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
                location.href="/achieve/board/write/";
            });

            //등록 버튼 - 수정필요
            var submitBtn = document.getElementById("submitBtn");
            submitBtn.addEventListener("click",()=>{
                document.querySelector('#contents').setAttribute('value' ,editor.getHTML());
                console.log(editor.getHTML());
            });

             initialize();
        </script>
        	<%@ include file="../common/footer.jsp" %>
</body>
</html>