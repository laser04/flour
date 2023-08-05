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
   
    .boardNewsContent .bi{
        padding-left: 3px;
        padding-right: 3px;
    }

    /* toast editor insert 비활성화 */
    button.table, button.image, button.link {
  display: none;
}
</style>
</head>
   <body class="boardNewsContent">
        <div class="w-100 d-flex justify-content-center align-items-center"
      style="
               background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
            height:300px; background-repeat: no-repeat; background-size:cover;">
      <div class="fs-1 fw-bolder text-white">뉴스</div>
   </div>
         <!-- 첫번쨰 폼 -->
      <form action="<%=request.getContextPath()%>/boardnewsupdate" method="post" enctype="multipart/form-data">
           <sec:csrfInput/>
           <!-- *BOARDID값 요청보내기위함 -->
            <input type="hidden"  name="BOARDNEWSID" value="${boardNews.BOARDNEWSID}">
            <input type="hidden"  name="BOARDNEWSFILENAME" value="${boardNews.BOARDNEWSFILENAME}">
         <input type="hidden"  name="BOARDNEWSFILEPATH" value="${boardNews.BOARDNEWSFILEPATH}">
            
            <div>
                <div class="p-3 border-top">
                    <input class="fw-bold fs-3 border-0 w-100 form-control" id="title"
                     type="text" value="${boardNews.BOARDNEWSTITLE}" name="BOARDNEWSTITLE" readonly>
                </div>
                <div class="d-flex p-2 justify-content-end border-top">
                    <div class="mx-3">부서명: <span>${boardNews.DEPARTMENTNAME}</span></div>
                    <div class="mx-3">글쓴이: <span>${boardNews.USERNAME}</span></div>
                    <div class="mx-3">작성일 :<span>${boardNews.BOARDNEWSREGDATE}</span></div>
                    <div class="mx-3">조회 :<span>${boardNews.BOARDNEWSCOUNT}</span></div>
                </div>
            </div>
            <div class="border-top p-3" style="height:400px">
                <div class="h-100 normalCase">
                    <div class="form-control p-2 h-100 fs-5">${boardNews.BOARDNEWSCONTENT}</div>
                </div>
                <div class="h-100 updateCase" style="display: none;">
                    <!-- <div id="editor"></div> 여기 안에 있는 글자가 
                     자동으로  <input type="hidden">으로 들어감 -->
                        <div id="editor">${boardNews.BOARDNEWSCONTENT}</div>
                        <div>
                            <input type="hidden"  id="contents"  name="BOARDNEWSCONTENT" >
                        </div>
                    </div>
                </div>
        
            <div class="border-top p-3">
                <div class="normalCase">
                    <div class="w-100"><a href="<%=request.getContextPath() %>/fileDownloadnews?BOARDNEWSID=${boardNews.BOARDNEWSID}">${boardNews.BOARDNEWSFILENAME}</a></div>
                   <div class="btn btn-danger text-white mx-2 px-4 fw-bold" onclick="FileDelete()" >파일삭제</div>
                
                </div>
                <div class="updateCase" style="display: none;">
                    <input class="w-100" type="file" name="uploadfile" style="font-size: 0.6em">
                   
                </div>
            </div>
            <div class="border-top">
                <div class="normalCase">
                    <div class="d-flex justify-content-center p-3">
                        <div class="btn btn-success text-white mx-2 px-4 fw-bold" onclick="boardnewslist()">목록</div>
                        <!-- 임시세션으로 관리자일때만 보이도록 일단 임시임 바꾸기 -->
                        <c:if test="${role == 'ADMIN' }">
                        <div class="btn btn-info text-white mx-2 px-4 fw-bold" id="update" onclick="BoardNewsUpdate()" >수정</div>
                        <div class="btn btn-danger text-white mx-2 px-4 fw-bold" id="delete" onclick="boardnewsdelete()">삭제</div>
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
            <form action="<%=request.getContextPath()%>/boardnewscomment" method="post">
                <div class="d-flex justify-content-between px-3">
                    <div class="text-secondary pt-2"><p style="font-weight: bold">댓글</p><p>총 50자까지 가능</p></div>
                    
                </div>
                <div class="mt-1" style="width: 95%; margin-left: 10px;">
                    <textarea class="form-control p-2" style="height: 75px" name="BOARDNEWSCOMMENTCONTENT"></textarea>
                </div>
                <!-- *BOARDID값 요청보내기위함 -->
                <input type="hidden"  name="BOARDNEWSID" value="${boardNews.BOARDNEWSID}">
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
                        <c:forEach items="${boardNewsList}" var="boardNews">
                        <div class="row border-bottom bg-secondary bg-opacity-10">
                            <div class="col-2 align-self-center">${boardNews.BOARDNEWSCOMMENTUSERID} </div>
                            <%-- <div class="col-5 align-self-center">${board.BOARDCOMMENTCONTENT}</div> --%>
                            <div class="col-2">
                               <input type="text" class="form-control" id="commentContent${boardNews.BOARDNEWSCOMMENTID}" value="${boardNews.BOARDNEWSCOMMENTCONTENT}" readonly>
                            </div>
                            
                            <div class="btn col-1" onclick="updateBtn(${boardNews.BOARDNEWSCOMMENTID})">
                               <i class="bi bi-pencil"></i>
                            </div>
                            <div class="col-4 align-self-center">
                                ${boardNews.BOARDNEWSCOMMENTREGDATE}
                                <div id="comment${boardNews.BOARDNEWSCOMMENTID}" style="display:none;">
                                  <span><i class="bi bi-pencil btn"
                                   onclick="CommentUpdate(${boardNews.BOARDNEWSCOMMENTUSERID},${boardNews.BOARDNEWSCOMMENTID})"></i></span>
                                  <span><i class="bi bi-trash btn"
                                  onclick="CommentDelete(${boardNews.BOARDNEWSCOMMENTUSERID},${boardNews.BOARDNEWSCOMMENTID})"></i></span>
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
            function BoardNewsUpdate(){
            if(${boardNews.userIdennum}===${id}
            || ${role}==="ADMIN" )//관리자경우도넣음
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
            $("form").first().submit(function () {
              $("#contents").val(editor.getMarkdown());
            });

          // 게시판 삭제 버튼 클릭시 기능
       function boardnewsdelete() {
         // 확인 메시지를 표시하고 사용자가 확인을 누르면 삭제 동작 실행
         if(${boardNews.userIdennum}===${id}
            || ${role}==="ADMIN" )//관리자경우도넣음
           {
               if (confirm("게시물을 삭제하시겠습니까?")) {
                 // boarddelete() URL로 이동
                 window.location.href = "<%=request.getContextPath()%>boardnewsdelete?BOARDNEWSID=${boardNews.BOARDNEWSID}";
                  }
           }
         else{ 
             alert("삭제 불가능한 게시물입니다")
         
            }
         
       }
    
            //목록 클릭시 기능
            function boardnewslist() {
               window.location.href = "<%= request.getContextPath() %>/boardnewslist";
            }
            
            //파일삭제 버튼클릭시
            function FileDelete() {
            	if(${boardNews.userIdennum}===${id}
                || ${role}==="ADMIN" )//관리자경우도넣음
                {

                if (confirm("파일을 삭제하시겠습니까?")) {
                window.location.href = "<%=request.getContextPath() %>/filedeletenews?BOARDNEWSID=${boardNews.BOARDNEWSID}"; /* /filedelete?가 아닌 /filedeletenotice? */
                }
                }
               else{
                  alert("파일을 삭제할수없습니다.")
                  
               }
               }
            
 
           //댓글 수정
            function CommentUpdate(BOARDNEWSCOMMENTUSERID,BOARDNEWSCOMMENTID) {
             
              console.log($("#commentContent"+BOARDNEWSCOMMENTID).val());
              var commentContent = $("#commentContent"+BOARDNEWSCOMMENTID).val();
              var encodedCommentContent = encodeURIComponent(commentContent);
            if(BOARDNEWSCOMMENTUSERID===${id}
               || ${role}==="ADMIN")//관리자경우도넣음  
               {
                  if (confirm("댓글을 수정하시겠습니까?")) {
                  window.location.href = "<%=request.getContextPath() %>/boardnewscommentupdate?BOARDNEWSCOMMENTID="
                  +BOARDNEWSCOMMENTID+"&BOARDNEWSID=${boardNews.BOARDNEWSID}&BOARDNEWSCOMMENTCONTENT="
                 +encodedCommentContent;
                     }
                 }
            else{
               alert("댓글을 수정 할 수없습니다.")
            }  
               }
           
             
           
           
            //댓글 삭제
            function CommentDelete(BOARDNEWSCOMMENTUSERID,BOARDNEWSCOMMENTID) {
                 
            	if(BOARDNEWSCOMMENTUSERID===${id}
                || ${role}==="ADMIN")//관리자경우도넣음
                   {
                     if (confirm("댓글을 삭제하시겠습니까?")) {
                     window.location.href = "<%=request.getContextPath() %>/boardnewscommentdelete?BOARDNEWSCOMMENTID="
                       +BOARDNEWSCOMMENTID+"&BOARDNEWSID=${boardNews.BOARDNEWSID}";    
                        }
                   }
                else{
                   alert("댓글을 삭제 할 수없습니다.")
                } 
               
               }
            
         function updateBtn(BOARDNEWSCOMMENTID){
            $("#comment"+BOARDNEWSCOMMENTID).attr("style","display:block");
            $("#commentContent"+BOARDNEWSCOMMENTID).attr("readonly",false);
            $("#commentContent"+BOARDNEWSCOMMENTID).focus();
         }
         
        </script>
           <%@ include file="../common/footer.jsp" %>
    </body>
</html>