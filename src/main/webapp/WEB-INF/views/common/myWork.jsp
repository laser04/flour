<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.trash-wrap {
   cursor: pointer;
}

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
      <div class="fs-1 fw-bolder text-white">내 업무</div>
   </div>
   <div class="mx-auto mt-5 p-3 shadowWrap" style="width: 1350px;">
      <div class="mx-auto mt-3 w-75">
         <!-- nav -->
         <div>
            <div class="nav nav-tabs" id="myTab" role="tablist">
               <button class="col-2 nav-link active fs-5 fw-bold" id="list-tab"
                  data-bs-toggle="tab" data-bs-target="#list" type="button"
                  role="tab" aria-controls="list" aria-selected="true">내 업무
                  목록</button>
               <button class="col-2 nav-link fs-5 fw-bold" id="progress-tab"
                  data-bs-toggle="tab" data-bs-target="#progress" type="button"
                  role="tab" aria-controls="progress" aria-selected="false">진행
                  정도</button>
               <button class="col-2 nav-link fs-5 fw-bold" id="team-tab"
                  data-bs-toggle="tab" data-bs-target="#team" type="button"
                  role="tab" aria-controls="team" aria-selected="false">팀
                  업무 목록</button>
               <!-- 일정 추가 버튼 -->
               <div class="nav-item col-6 text-end pe-2">
                  <div class="btn btn-primary" data-bs-toggle="modal"
                     data-bs-target="#createModal">
                     <i class="bi bi-plus-circle"></i> <span class="ms-1">일정 추가</span>
                  </div>
               </div>
            </div>
         </div>

         <!-- content -->
         <div class="tab-content my-5" id="myTabContent">
            <!-- list -->
            <div class="tab-pane fade show active" id="list" role="tabpanel"
               aria-labelledby="list-tab">
               <div class="text-center">
                  <div
                     class="d-flex bg-secondary bg-opacity-50 border-bottom border-3 border-dark p-2">
                     <div class="col-6">
                        <strong>내 업무</strong>
                     </div>
                     <div class="col-3">
                        <strong>시작 날짜</strong>
                     </div>
                     <div class="col-3">
                        <strong>예상 마감일</strong>
                     </div>
                  </div>
                  
                  <c:forEach items="${myWorkList}" var="mywork">
                  <c:if test="${mywork.MYWORKSTATUS eq '진행중'}">
                  
                  <div class="d-flex p-2 border-bottom border-dark">
                     <div class="col-6">${mywork.MYWORKTASK}</div>
                     <div class="col-3">${mywork.MYWORKSTARTTIME}</div>
                     <div class="col-3">${mywork.MYWORKENDTIME}</div>
                  </div>
                  </c:if>
                  </c:forEach>
                  
               </div>
            </div>
            <%
               long time = System.currentTimeMillis();
               SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
               String today = date.format(new Date(time));
            %>
            <!-- progress -->
            <div class="tab-pane fade" id="progress" role="tabpanel"
               aria-labelledby="progress-tab">
               <div class="progress" style="height: 20px;">
                  <div class="progress-bar bg-info" role="progressbar" aria-label="Example with label"
                    aria-valuenow="${myworkprogress.MYWORKPROGRESSVALUE}" aria-valuemin="0" aria-valuemax="100"
                    style="width: ${myworkprogress.MYWORKPROGRESSVALUE}%;">${myworkprogress.MYWORKPROGRESSVALUE}%</div>
               </div>
               <div class="mt-3 text-center">
                  <div
                     class="d-flex bg-secondary bg-opacity-50 border-bottom border-3 border-dark p-2">
                     <div class="col-5">
                        <strong>내 업무</strong>
                     </div>
                     <div class="col-1">
                        <strong>상태</strong>
                     </div>
                     <div class="col-4">
                        <strong>변경</strong>
                     </div>
                     <div class="col-2">
                        <strong>삭제</strong>
                     </div>
                  </div>
                  
                  <c:forEach items="${myWorkList}" var="mywork">
                  <div
                     class="d-flex align-items-center p-2 border-bottom border-dark">
                     <div class="col-5 btn border-0 text-primary" 
                     data-bs-toggle="modal" data-bs-target="#doitModal"
                     data-myworkwork="${mywork.MYWORKWORK}">${mywork.MYWORKTASK}</div>
                     <div class="col-1">${mywork.MYWORKSTATUS}</div>
                     <div class="col-4">
                        <div class="btn btn-warning p-1 btn_update align-middle"
                           data-bs-toggle="modal" data-bs-target="#updateModal"
                           data-myworkid="${mywork.MYWORKID}"
                           data-myworktask="${mywork.MYWORKTASK}"
                            data-myworkwork="${mywork.MYWORKWORK}"
                            data-myworkstarttime="${mywork.MYWORKSTARTTIME}"
                              data-myworkendtime="${mywork.MYWORKENDTIME}"
                           
                           
                           >
                           <i class="bi bi-plus-circle"></i>&nbsp;수정
                        </div>            
                        <a href="<%=request.getContextPath()%>/myworkcomplete?MYWORKID=${mywork.MYWORKID}&MYWORKENDTIME=<%=today%>"       
                             class="btn btn-success p-1 btn_update align-middle"
                              onclick="return confirm('업무를 완료하시겠습니까?')">
                           <i class="bi-check-circle"></i>&nbsp;완료
                        </a>
                     </div>
                     <div class="col-2">
                        <div class="trash-wrap">
                         <a href="<%=request.getContextPath()%>/myworkdelete?MYWORKID=${mywork.MYWORKID}"
                         onclick="return confirm('업무를 삭제하시겠습니까?')">
                           <i class="bi bi-trash fs-3"></i>   
                           </a>   
                        </div>
                     </div>
                  </div>
                  </c:forEach>
                  
               </div>
            </div>
            
            
            <!-- team -->
            <div class="tab-pane fade" id="team" role="tabpanel" aria-labelledby="team-tab">
                <div class="accordion" id="accordion">
                    <c:forEach items="${teamWorkUserList}" var="teamuser" varStatus="loopStatus">
                        <div class="accordion-item">
                            <div class="accordion-header" id="heading${loopStatus.index}">
                                <button type="button" class="btn btn-primary mb-2" style="width: 100%; background-color: white; color: black; border: none;" data-bs-target="collapse${loopStatus.index}" onclick="toggleContent(this)">
                                    <div class="d-flex justify-content-between" style="width: 65%">
                                        <div>${teamuser.USERNAME}</div>
                                        <div class="progress" style="width: 200px; height: 20px;">
                                            <div class="progress-bar bg-info" role="progressbar" aria-label="Example with label"
                                            aria-valuenow="${teamuser.MYWORKPROGRESSVALUE}" aria-valuemin="0" aria-valuemax="100"
                                            style="width: ${teamuser.MYWORKPROGRESSVALUE}%;">${teamuser.MYWORKPROGRESSVALUE}%</div>
                                        </div>
                                    </div>
                                </button>
                            </div>
            
                            <div id="collapse${loopStatus.index}" class="accordion-collapse collapse">
                        <div class="accordion-body">
                        
                           <div class="fs-3 fw-bolder my-2">
                              <%-- <%=request.getAttribute("DEPT") %> --%>
                              ${teamuser.DEPARTMENTNAME}&nbsp;${teamuser.USERPOSITION} &nbsp;${teamuser.USERNAME}
                           </div>
         
                           <div>
                           
   
                              <!-- 진행중 -->
                              <div class="text-center my-3">
                                 <div class="d-flex border-bottom border-3 border-dark p-2">
                                    <div class="col-2 text-info fs-5">
                                       <strong>진행중</strong>
                                    </div>
                                    <div class="col-4">
                                       <strong>업무 내용</strong>
                                    </div>
                                    <div class="col-3">
                                       <strong>시작 날짜</strong>
                                    </div>
                                    <div class="col-3">
                                       <strong>예상 마감일</strong>
                                    </div>
                                 </div>
                                 
                                 <c:forEach items="${teamWorkList}" var="teamwork">
                                 <c:if test="${teamwork.MYWORKSTATUS eq '진행중' 
                                 and teamwork.userIdennum eq teamuser.userIdennum}">
                                 <div
                                    class="d-flex align-items-center border-bottom border-dark p-2">
                                    <div class="col-2">
                                       <i class="bi bi-lightning"></i>
                                    </div>
                                    <div class="col-4">
                                       ${teamwork.MYWORKTASK}<br> 
                                    <span class="btn border-0 text-primary"
                                    data-bs-toggle="modal" data-bs-target="#doitModal"
                                    data-myworkwork="${teamwork.MYWORKWORK}">
                                             할 일 상세 보기</span>
                                    </div>
                                    <div class="col-3">${teamwork.MYWORKSTARTTIME}</div>
                                    <div class="col-3">${teamwork.MYWORKENDTIME}</div>
                                 </div>
                                 </c:if>
                                 </c:forEach>
                                 
                              </div>

                              <div style="height: 20px;"></div>
                                             
                              
                              <!-- 완료 -->
                              <div class="text-center my-3">
                                 <div class="d-flex border-bottom border-3 border-dark p-2">
                                    <div class="col-2 text-success fs-5">
                                       <strong>완료</strong>
                                    </div>
                                    <div class="col-4">
                                       <strong>업무 내용</strong>
                                    </div>
                                    <div class="col-3">
                                       <strong>시작 날짜</strong>
                                    </div>
                                    <div class="col-3">
                                       <strong>마감일</strong>
                                    </div>
                                 </div>
                                 <c:forEach items="${teamWorkList}" var="teamwork">
                                 <c:if test="${teamwork.MYWORKSTATUS eq '완료' 
                                 and teamwork.userIdennum eq teamuser.userIdennum}">
                                 <div
                                    class="d-flex align-items-center border-bottom border-dark p-2">
                                    <div class="col-2">
                                       <i class="bi bi-lightning-fill"></i>
                                    </div>
                                    <div class="col-4">
                                       ${teamwork.MYWORKTASK}
                                       <br> <span class="btn border-0 text-primary"
                                          data-bs-toggle="modal" data-bs-target="#doitModal">
                                          할 일 상세 보기</span>
                                    </div>
                                    <div class="col-3">${teamwork.MYWORKSTARTTIME}</div>
                                    <div class="col-3">${teamwork.MYWORKENDTIME}</div>
                                 </div>
                                 </c:if>
                                 </c:forEach>
                                 
                              </div>

                           </div>
                        </div>
                     </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
         </div>
      </div>
   </div>

   <!-- modal -->
   <!-- 업무 추가 -->
   <form id="insertform" 
   action="<%=request.getContextPath()%>/myworkinsert" method="post">
      <sec:csrfInput/>
      <!-- 상태 처음 insert할때는 진행중으로 insert -->
   <input type="hidden" name="MYWORKSTATUS" value="진행중">
   <div class="modal fade" id="createModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">새 업무 등록</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div>
                  <div>내 업무</div>
                  <div class="form-floating" id="createFloatingTextareaWorkBox">
                     <textarea class="form-control" id="createFloatingTextareaWork"
                     name="MYWORKTASK"></textarea>
                     <label for="floatingTextarea">내용</label>
                  </div>
                  <div class="invalid-feedback">내용을 입력해주세요!</div>
               </div>
               <div class="mt-2">
                  <div>내 할 일</div>
                  <div class="form-floating" id="createFloatingTextareaDoitBox">
                     <textarea class="form-control" id="createFloatingTextareaDoit"
                     name="MYWORKWORK"></textarea>
                     <label for="floatingTextarea">내용</label>
                  </div>
                  <div class="invalid-feedback">내용을 입력해주세요!</div>
               </div>
               <div class="mt-2">
                  <div>일정 시작 날짜</div>
                  
                  <input type="date" class="form-control" id="createDateStart"
                     min="<%=today%>" value="<%=today%>" name="MYWORKSTARTTIME">
               </div>
               <div class="mt-2">
                  <div>일정 종료 날짜</div>
                  <input type="date" class="form-control" id="createDateEnd"
                     min="<%=today%>" name="MYWORKENDTIME" value="<%=today%>">
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">돌아가기</button>
               <button type="button" class="btn btn-primary"
                  onclick="createWork()">저장하기</button>
            </div>
         </div>
      </div>
   </div>
   </form>
   
   <!-- 업무 수정 -->
   <form  id="updateform"
    action="<%=request.getContextPath()%>/myworkupdate" method="post">
   <!-- MYWORKID 값 보내기 값은 스크립트를통해 넣어둠  -->
    <input type="hidden" id="myworkIdInput" name="MYWORKID" >
   
   <div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">업무 수정</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div>
                  <div>내 업무</div>
                  <div class="form-floating" id="updateFloatingTextareaWorkBox">
                     <textarea class="form-control" id="updateFloatingTextareaWork"
                     name="MYWORKTASK"></textarea>
                  </div>
                  <div class="invalid-feedback">내용을 입력해주세요!</div>
               </div>
               <div class="mt-2">
                  <div>내 할 일</div>
                  <div class="form-floating" id="updateFloatingTextareaDoitBox">
                     <textarea class="form-control" id="updateFloatingTextareaDoit"
                     name="MYWORKWORK" style="height:150px;"></textarea>
                  </div>
                  <div class="invalid-feedback">내용을 입력해주세요!</div>
               </div>
               <div class="mt-2">
                  <div>일정 시작 날짜</div>
                  <input type="date" class="form-control" min="<%=today%>"  name="MYWORKSTARTTIME" >
               </div>
               <div class="mt-2">
                  <div>일정 종료 날짜</div>
                  <input type="date" class="form-control" 
                     name="MYWORKENDTIME">
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">돌아가기</button>
               <button type="button" class="btn btn-primary"
                  onclick="updateWork()">저장하기</button>
            </div>
         </div>
      </div>
   </div>
   </form>
   <!-- 업무 삭제 check  삭제 모달관련-->
   <!-- <div class="modal fade" id="deleteModalCheck" tabindex="-1"
      role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-dropdown="false">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-body">
               <div class="text-warning d-flex justify-content-center">
                  <i class="bi bi-exclamation-circle" style="font-size: 100px;"></i>
               </div>
               <div class="m-2 text-wrap text-center">
                  <h3>업무 내용을 삭제하시겠습니까?</h3>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소하기</button>
               <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                  data-bs-target="#deleteModalSuccess" onclick="deletebtn()">삭제하기</button>
            </div>
         </div>
      </div>
   </div> -->

   <!-- 업무 삭제 success 삭제관련모달-->
   <!-- <div class="modal fade" id="deleteModalSuccess" tabindex="-1"
      role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-dropdown="false">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-body">
               <div class="text-success d-flex justify-content-center">
                  <i class="bi bi-check-circle" style="font-size: 100px;"></i>
               </div>
               <div class="m-2 text-wrap text-center">
                  <h3>일정이 삭제되었습니다.</h3>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
            </div>
         </div>
      </div>
   </div> -->

   <!-- 업무 상세보기 -->
   <div class="modal fade" id="doitModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title"></h5>
            </div>
            <div class="modal-body">
               <div class="fs-5 fw-bold mb-3">내 할 일</div>
               <div class="form-control" id="doitModalTextarea"
                  style="height: 300px;"></div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary"
                  data-bs-dismiss="modal">확인</button>
            </div>
         </div>
      </div>
   </div>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <script type="text/javascript">
      // 모달
            let createFloatingTextareaWorkBox = document.getElementById("createFloatingTextareaWorkBox");
            let createFloatingTextareaWork = document.getElementById("createFloatingTextareaWork");
            let createFloatingTextareaDoitBox = document.getElementById("createFloatingTextareaDoitBox");
            let createFloatingTextareaDoit = document.getElementById("createFloatingTextareaDoit");
            let createModal = document.getElementById("createModal");
            let createModalCheckWork = false; 
            let createModalCheckDoit = false; 
            let updateFloatingTextareaWorkBox = document.getElementById("updateFloatingTextareaWorkBox");
            let updateFloatingTextareaWork = document.getElementById("updateFloatingTextareaWork");
            let updateFloatingTextareaDoitBox = document.getElementById("updateFloatingTextareaDoitBox");
            let updateFloatingTextareaDoit = document.getElementById("updateFloatingTextareaDoit");
            let updateModal = document.getElementById("updateModal");
            let updateModalCheckWork = false;
            let updateModalCheckDoit = false;
      
            //createModal textareaWork null값 시 이벤트
            createFloatingTextareaWork.addEventListener("blur",()=>{
               
               if(createFloatingTextareaWork.value === null || createFloatingTextareaWork.value.trim()===""){
                  createFloatingTextareaWorkBox.classList.add("is-invalid");
                  createFloatingTextareaWork.classList.add("is-invalid");
                  createFloatingTextareaWork.focus();
                  createModalCheckWork = false;
               }else{
                  createFloatingTextareaWorkBox.classList.remove("is-invalid");
                  createFloatingTextareaWork.classList.remove("is-invalid");
                  createModalCheckWork = true;
               }
            })
            //createModal textareaDoit null값 시 이벤트
            createFloatingTextareaDoit.addEventListener("blur",()=>{
               
               if(createFloatingTextareaDoit.value === null || createFloatingTextareaDoit.value.trim()===""){
                  createFloatingTextareaDoitBox.classList.add("is-invalid");
                  createFloatingTextareaDoit.classList.add("is-invalid");
                  createFloatingTextareaDoit.focus();
                  createModalCheckDoit = false;
               }else{
                  createFloatingTextareaDoitBox.classList.remove("is-invalid");
                  createFloatingTextareaDoit.classList.remove("is-invalid");
                  createModalCheckDoit = true;
               }
            })

            //updateModal textareaWork null값 시 이벤트
            updateFloatingTextareaWork.addEventListener("blur",()=>{
               
               if(updateFloatingTextareaWork.value === null || updateFloatingTextareaWork.value.trim()===""){
                  updateFloatingTextareaWorkBox.classList.add("is-invalid");
                  updateFloatingTextareaWork.classList.add("is-invalid");
                  updateFloatingTextareaWork.focus();
                  updateModalCheckWork = false;
               }else{
                  updateFloatingTextareaWorkBox.classList.remove("is-invalid");
                  updateFloatingTextareaWork.classList.remove("is-invalid");
                  updateModalCheckWork = true;
               }
            })
            //updateModal textareaDoit null값 시 이벤트
            updateFloatingTextareaDoit.addEventListener("blur",()=>{
               
               if(updateFloatingTextareaDoit.value === null || updateFloatingTextareaDoit.value.trim()===""){
                  updateFloatingTextareaDoitBox.classList.add("is-invalid");
                  updateFloatingTextareaDoit.classList.add("is-invalid");
                  updateFloatingTextareaDoit.focus();
                  updateModalCheckDoit = false;
               }else{
                  updateFloatingTextareaDoitBox.classList.remove("is-invalid");
                  updateFloatingTextareaDoit.classList.remove("is-invalid");
                  updateModalCheckDoit = true;
               }
            })
            
   
            /* 새업무 등록 시작/종료 날짜 */      
            window.addEventListener('DOMContentLoaded', () => {
               const startDateInput = document.getElementById('createDateStart');
               const endDateInput = document.getElementById('createDateEnd');
      
               const today = new Date().toISOString().split('T')[0];
      
               startDateInput.setAttribute('min', today);
               endDateInput.setAttribute('min', today);
      
               startDateInput.addEventListener('input', () => {
                  const startDate = new Date(startDateInput.value);
                  endDateInput.setAttribute('min', startDate.toISOString().split('T')[0]);
               });
      
               endDateInput.addEventListener('input', () => {
                  const endDate = new Date(endDateInput.value);
                  startDateInput.setAttribute('max', endDate.toISOString().split('T')[0]);
               });
            });
            
            /* 모달 애니매이션 */
            const modal = document.getElementById('createModal');
            modal.addEventListener('keydown', function(event) {
               //keyCode = 27=> ESC
               if (event.keyCode === 27) {
                  event.stopPropagation();
               }
            });
            
            //myworkinsert로 submit하는 기능
            function createWork() {
              document.getElementById("insertform").submit();
            }
            
            //myworkupdate로 submit하는 기능
            function updateWork() {
              document.getElementById("updateform").submit();
            }

            
            
             //수정버튼클릭시: 모달이 열릴 때 이벤트를 수신합니다
             $('#updateModal').on('show.bs.modal', function (event) {
                 // 수정 버튼을 클릭한 요소를 가져옵니다.
                 var button = $(event.relatedTarget);
                 // data-myworkid 속성에서 MYWORKID 값을 가져옵니다.
                 var myworkId = button.data('myworkid');
                 var myworkTask = button.data('myworktask');
                 var myworkWork = button.data('myworkwork');
                 var myworkStartTime = button.data('myworkstarttime');
                 var myworkEndTime = button.data('myworkendtime');
                 
                 // 가져온 값을 모달 내부의 hidden input 요소에 설정합니다.
                 $('#myworkIdInput').val(myworkId);
                 $('#updateFloatingTextareaWork').val(myworkTask);
                 $('#updateFloatingTextareaDoit').val(myworkWork);
                 $('input[name="MYWORKSTARTTIME"]').val(myworkStartTime);
                 $('input[name="MYWORKENDTIME"]').val(myworkEndTime);
             });
            
             // 모달이 열릴 때 이벤트를 수신합니다.
             $('#doitModal').on('show.bs.modal', function (event) {
                 var button = $(event.relatedTarget);
                 var taskDescription = button.text();
                 var myworkwork = button.data('myworkwork'); // myworkwork 속성 값을 가져옵니다.
                 var modal = $(this);
                 modal.find('.modal-title').text(taskDescription);
                 modal.find('#doitModalTextarea').text(myworkwork); // myworkwork 값을 표시합니다.
             });
             
             function toggleContent(button) {
                 const target = document.getElementById(button.dataset.bsTarget);
                 target.classList.toggle('collapse');
             }
             
         </script>
         <%@ include file="footer.jsp" %>
</body>
</html>