<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
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
        
<style>
   div {
      /* border:1px solid black; */
   }
   
    .boardNoticeContent .bi{
        padding-left: 3px;
        padding-right: 3px;
    }

    /* toast editor insert 비활성화 */
    button.table, button.image, button.link {
  display: none;
}
   </style>
   </head>
   <body class="boardNoticeContent">
        <div class="w-100 d-flex justify-content-center align-items-center"
      style="
               background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
            height:300px; background-repeat: no-repeat; background-size:cover;">
      <div class="fs-1 fw-bolder text-white">공지사항</div>
   </div>
         <!-- 첫번쨰 폼 -->
      <form action="<%=request.getContextPath()%>/boardnoticeupdate" method="post" enctype="multipart/form-data"
      id="form1">
           <sec:csrfInput/>
           <!-- *BOARDID값 요청보내기위함 -->
            <input type="hidden"  name="BOARDNOTICEID" value="${boardNotice.BOARDNOTICEID}">
            <input type="hidden"  name="BOARDNOTICEFILENAME" value="${boardNotice.BOARDNOTICEFILENAME}">
         <input type="hidden"  name="BOARDNOTICEFILEPATH" value="${boardNotice.BOARDNOTICEFILEPATH}">
            
            <div>
                <div class="p-3 border-top">
                    <input class="fw-bold fs-3 border-0 w-100 form-control" id="title"
                     type="text" value="${boardNotice.BOARDNOTICETITLE}" name="BOARDNOTICETITLE" readonly>
                </div>
                <div class="d-flex p-2 justify-content-end border-top">
                    <div class="mx-3">부서명: <span>${boardNotice.DEPARTMENTNAME}</span></div>
                    <div class="mx-3">글쓴이: <span>${boardNotice.USERNAME}</span></div>
                    <div class="mx-3">작성일 :<span>${boardNotice.BOARDNOTICEREGDATE}</span></div>
                    <div class="mx-3">조회 :<span>${boardNotice.BOARDNOTICECOUNT}</span></div>
                </div>
            </div>
            <div class="border-top p-3" style="height:400px">
                <div class="h-100 normalCase">
                    <div class="form-control p-2 h-100 fs-5">${boardNotice.BOARDNOTICECONTENT}</div>
                </div>
                <div class="h-100 updateCase" style="display: none;">
                    <!-- <div id="editor"></div> 여기 안에 있는 글자가 
                     자동으로  <input type="hidden">으로 들어감 -->
                        <div id="editor">${boardNotice.BOARDNOTICECONTENT}</div>
                        <div>
                            <input type="hidden"  id="contents"  name="BOARDNOTICECONTENT" >
                        </div>
                    </div>
                </div>
        
            <div class="border-top p-3">
                <div class="normalCase">
                    <div class="w-100"><a href="<%=request.getContextPath() %>/fileDownloadnotice?BOARDNOTICEID=${boardNotice.BOARDNOTICEID}">${boardNotice.BOARDNOTICEFILENAME}</a></div>
                   <div class="btn btn-danger text-white mx-2 px-4 fw-bold" onclick="FileDelete()" >파일삭제</div>
                
                </div>
                <div class="updateCase" style="display: none;">
                    <input class="w-100" type="file" name="uploadfile" style="font-size: 0.6em">
                   
                </div>
            </div>
            
            <div class="border-top">
                <div class="normalCase">
                    <div class="d-flex justify-content-center p-3">
                        <div class="btn btn-success text-white mx-2 px-4 fw-bold" onclick="boardnoticelist()">목록</div>
                         
                          <c:if test="${role == 'ADMIN'}">
                        <div class="btn btn-info text-white mx-2 px-4 fw-bold" id="update" onclick="BoardNoticeUpdate()" >수정</div>
                        <div class="btn btn-danger text-white mx-2 px-4 fw-bold" id="delete" onclick="boardnoticedelete()">삭제</div>
                         </c:if>
                    </div>
                </div>
                <div class="updateCase" style="display:none">
                    <div class="d-flex justify-content-center p-3">
                        <button type="submit" class="btn btn-success text-white mx-2 px-4 fw-bold" >저장</button>
                        <div class="btn btn-danger text-white mx-2 px-4 fw-bold" id="cancel">취소</div>
                    </div>
                </div>
            </div>
            </form>
            <!-- 댓글 -->
            <div class="mt-5">
            <!-- 두번째 폼 -->
            <form action="<%=request.getContextPath()%>/boardnoticecomment" method="post">
                <div class="d-flex justify-content-between px-3">
                    <div class="text-secondary pt-2"><p style="font-weight: bold">댓글</p><p>총 50자까지 가능</p></div>
                 <sec:csrfInput/>   
                </div>
                <div class="mt-1" style="width: 95%; margin-left: 10px;">
                    <textarea class="form-control p-2" style="height: 75px" name="BOARDNOTICECOMMENTCONTENT"></textarea>
                </div>
                <!-- *BOARDID값 요청보내기위함 -->
                <input type="hidden"  name="BOARDNOTICEID" value="${boardNotice.BOARDNOTICEID}">
                <div class="text-center">
                   <input type="submit" value="등록" style="margin-top: 10px;">
                </div>
                </form>
                
                <div class="mx-3 mt-1">       
                    <div id="comment" >
                        <div class="row border-bottom">
                            <div class="col-2">사번</div>
                            <div class="col-2">내용</div>
                            <div class="col-1"></div>
                            <div class="col-4">날짜</div>
                        </div>
                        <!-- sample -->
                        <c:forEach items="${boardNoticeList}" var="boardnotice">
                        <div class="row border-bottom bg-secondary bg-opacity-10">
                            <div class="col-2 align-self-center">${boardnotice.BOARDNOTICECOMMENTUSERID} </div>
                            <%-- <div class="col-5 align-self-center">${board.BOARDCOMMENTCONTENT}</div> --%>
                            <div class="col-2">
                               <input type="text" class="form-control" id="commentContent${boardnotice.BOARDNOTICECOMMENTID}" value="${boardnotice.BOARDNOTICECOMMENTCONTENT}" readonly>
                            </div>
                            <div class="btn col-1" onclick="updateBtn(${boardnotice.BOARDNOTICECOMMENTID})">
                               <i class="bi bi-pencil"></i>
                            </div>
                            <div class="col-4 align-self-center">
                                ${boardnotice.BOARDNOTICECOMMENTREGDATE}
                                <div id="comment${boardnotice.BOARDNOTICECOMMENTID}" style="display:none;">
                                  <span><i class="bi bi-pencil btn"
                                   onclick="CommentUpdate(${boardnotice.BOARDNOTICECOMMENTUSERID},${boardnotice.BOARDNOTICECOMMENTID})"></i></span>
                                  <span><i class="bi bi-trash btn"
                                  onclick="CommentDelete(${boardnotice.BOARDNOTICECOMMENTUSERID},${boardnotice.BOARDNOTICECOMMENTID})"></i></span>
                               </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
      
<!-- toast -->
<script
src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>    
        <script>

        //toast
        const Editor = toastui.Editor;
        const editor = new Editor({
            el: document.querySelector('#editor'),
            height: '100%',
            initialEditType: 'wysiwyg',
            previewStyle: 'vertical',
            usageStatistics: false, // Table Extension 비활성화
            language:'ko'
        });
        editor.getMarkdown();

        
            //수정 버튼 클릭 시 이벤트
            function BoardNoticeUpdate(){
            if("${boardNotice.userIdennum}"==="${id}"
            ||  "${role}"==="ADMIN")//관리자경우도넣음
            {
                $(".normalCase").attr("style","display:none");
                $(".updateCase").attr("style","display:block");

                $("#title").attr("readonly",false);
                $("#title").focus();
            }
            else{ 
               alert("수정은 불가능한 게시물입니다")
            }
        }
            
            //취소 버튼 클릭 시 이벤트
            $("#cancel").on("click",function(){
                $(".normalCase").attr("style","display:block");
                $(".updateCase").attr("style","display:none");

                $("#title").attr("readonly",true);
            })

            // 기존의 수정, 취소 버튼 클릭 이벤트 바깥에 추가하세요.
           $("#form1").submit(function () {
   			 $("#contents").val(editor.getMarkdown());
			});

          // 게시판 삭제 버튼 클릭시 기능
       function boardnoticedelete() {
         // 확인 메시지를 표시하고 사용자가 확인을 누르면 삭제 동작 실행
          if("${boardNotice.userIdennum}"==="${id}"
            ||  "${role}"==="ADMIN")//관리자경우도넣음
            
           {
               if (confirm("게시물을 삭제하시겠습니까?")) {
                 // boarddelete() URL로 이동
                 window.location.href = "<%=request.getContextPath()%>boardnoticedelete?BOARDNOTICEID=${boardNotice.BOARDNOTICEID}";
                  }
           }
         else{ 
             alert("삭제 불가능한 게시물입니다")
            }
       }
    
            //목록 클릭시 기능
            function boardnoticelist() {
               window.location.href = "<%= request.getContextPath() %>/boardnoticelist";
            }
            
            //파일삭제 버튼클릭시
            function FileDelete() {
            	 if("${boardNotice.userIdennum}"==="${id}"
                 ||  "${role}"==="ADMIN")//관리자경우도넣음
                {

                if (confirm("파일을 삭제하시겠습니까?")) {
                window.location.href = "<%=request.getContextPath() %>/filedeletenotice?BOARDNOTICEID=${boardNotice.BOARDNOTICEID}"; /* /filedelete?가 아닌 /filedeletenotice? */
                }
                }
               else{
                  alert("파일을 삭제할수없습니다.")
               }
               }
            
            
           //댓글 수정
            function CommentUpdate(BOARDNOTICECOMMENTUSERID,BOARDNOTICECOMMENTID) {
             
              console.log($("#commentContent"+BOARDNOTICECOMMENTID).val());
              var commentContent = $("#commentContent"+BOARDNOTICECOMMENTID).val();
              var encodedCommentContent = encodeURIComponent(commentContent);
              
            if(BOARDNOTICECOMMENTUSERID==="${id}"
               || "${role}"==="ADMIN")//관리자경우도넣음
               {
                  if (confirm("댓글을 수정하시겠습니까?")) {
                  window.location.href = "<%=request.getContextPath() %>/boardnoticecommentupdate?BOARDNOTICECOMMENTID="
                  +BOARDNOTICECOMMENTID+"&BOARDNOTICEID=${boardNotice.BOARDNOTICEID}&BOARDNOTICECOMMENTCONTENT="
                 +encodedCommentContent;
                     }
                 }
            else{
               alert("댓글을 수정 할 수없습니다.")
            }  
         }
           
           
            //댓글 삭제
            function CommentDelete(BOARDNOTICECOMMENTUSERID,BOARDNOTICECOMMENTID) {
                 
            	if(BOARDNOTICECOMMENTUSERID==="${id}"
                || "${role}"==="ADMIN")//관리자경우도넣음
                   {
                     if (confirm("댓글을 삭제하시겠습니까?")) {
                     window.location.href = "<%=request.getContextPath() %>/boardnoticecommentdelete?BOARDNOTICECOMMENTID="
                       +BOARDNOTICECOMMENTID+"&BOARDNOTICEID=${boardNotice.BOARDNOTICEID}";    
                        }
                   }
                else{
                   alert("댓글을 삭제 할 수없습니다.")
                } 
               
               }
            
         function updateBtn(BOARDNOTICECOMMENTID){
            $("#comment"+BOARDNOTICECOMMENTID).attr("style","display:block");
            $("#commentContent"+BOARDNOTICECOMMENTID).attr("readonly",false);
            $("#commentContent"+BOARDNOTICECOMMENTID).focus();
         }
        </script>
           <%@ include file="../common/footer.jsp" %>
    </body>
</html>