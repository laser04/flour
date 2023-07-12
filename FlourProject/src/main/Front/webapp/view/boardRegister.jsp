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
            <div class="text-info fw-bolder text-center fs-1">자유 게시판</div>
            <form action="insertBoard.do" method="post">
                <div id="check">
                    <div class="mt-3">
                        <div class="fs-5 mb-1">제목</div>
                        <div>
                            <input class="p-1 form-control" id="title" type="text" placeholder="제목을 입력해주세요">
                        </div>
                    </div>
                    <div class="d-flex mt-2 justify-content-between">
                        <div style="width: 13%;">
                            <div class="fs-5 mb-1">부서</div>
                            <div>
                                <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="기획팀" readonly>
                            </div>
                        </div>
                        <div style="width: 13%;">
                            <div class="fs-5 mb-1">직책</div>
                            <div>
                                <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="관리자" readonly>
                            </div>
                        </div>
                        <div style="width: 13%;">
                            <div class="fs-5 mb-1">이름</div>
                            <div>
                                <input class="form-control bg-secondary bg-opacity-25 p-1 ps-3" type="text" value="왕감자" name="writer" readonly>
                            </div>
                        </div>
                        <div style="width: 40%;">
                            <div class="fs-5 mb-1">비밀번호</div>
                            <div>
                                <input class="form-control p-1 ps-3" id="password" type="password">
                            </div>
                        </div>
                        <div class="text-center" style="width: 7%;">
                            <div>
                                <label class="fs-5" for="announcement">공지</label>
                            </div>
                            <div>
                                <input class="form-check-input mt-2 fs-4" id="announcement" type="checkbox">
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
                    <input type="submit" class="btn bg-primary text-white mx-1" id="submitBtn" value="등록">
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
            
            //취소 버튼
            var resetBtn = document.getElementById("resetBtn");
            resetBtn.addEventListener("click",()=>{
                location.href="./board.jsp";
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