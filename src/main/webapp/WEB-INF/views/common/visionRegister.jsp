<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- toast -->
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
   
        <style type="text/css">
            .toastui-editor-contents p {
               font-size: 18px;
            }
            /* div{
                border: 1px solid black;
            } */

        </style>
    </head>

    <body>
        <div class="mx-auto mt-5 p-4 border" style="width: 945px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
            <div class="text-warning fw-bolder text-center fs-1"><small>(관리자용)</small> 비전 수정</div>
            <form action="#" method="post">
                <div id="check">
                    <div class="mt-3">
                        <div class="fs-5 mb-1">제목</div>
                        <div>
                            <input class="p-1 form-control" id="title" type="text" placeholder="제목을 입력해주세요">
                        </div>
                    </div>
                </div>
                <div class="mt-2 fs-5 mb-1">
                    <div>내용</div>
                    <div id="editor"></div>
                    <div>
                        <input type="hidden" id="contents" name="content">
                    </div>
                    <div>
                        <div class="mt-2 bg-secondary btn bg-opacity-10 d-flex justify-content-center" id="fileCreate" style="width: 14%;">
                            <i class="bi bi-plus-square"></i>
                            <div class="ms-1">파일 추가</div>
                        </div>
                        <div class="mt-2 d-block" id="fileWrap">
                            <input class="mt-2 w-100" type="file" id="file1" style="font-size:0.6em">
                        </div>
                    </div>
                </div>
                <div class="mt-3 text-center">
                    <input type="submit" class="btn bg-primary text-white mx-1" id="submitBtn" value="수정">
                    <div class="btn bg-danger text-white mx-1" id="resetBtn">취소</div>
                </div>  
            </form>
        </div>
        
        <!-- toast -->	
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
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

            //input file 생성
            var fileCreate = document.getElementById("fileCreate");
            var fileWrap = document.getElementById("fileWrap")
            var count = 1;
            fileCreate.addEventListener("click",()=>{
                if(count<3){
                    count ++;
                    var input = document.createElement("input");
                    input.setAttribute("type","file");
                    input.setAttribute("id","file"+count);
                    input.setAttribute("class","mt-2 w-100");
                    input.setAttribute("style","font-size:0.6em");

                    fileWrap.appendChild(input);
                }
            })
            
            //등록 버튼 - 수정필요
            var submitBtn = document.getElementById("submitBtn");
            submitBtn.addEventListener("click",()=>{
                document.querySelector('#contents').setAttribute('value' ,editor.getHTML());
                console.log(editor.getHTML());
            });
        </script>
    </body>
</html>