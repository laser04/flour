<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<!--체크관련 -->
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>

<style>
/* div{border:1px solid black;} */
.shadowWrap {
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.navText, .navBtn {
	border-radius: 8px;
}

.navText:hover, .navBtn:hover {
	background-color: #f3f3f3;
}

/* member Modal CheckBox */
.checkbox-wrapper-17 input[type=checkbox] {
	height: 0;
	width: 0;
	visibility: hidden;
}

.checkbox-wrapper-17 label { -
	-size: 50px;
	cursor: pointer;
	width: var(- -size);
	height: calc(var(- -size)/2);
	background: grey;
	display: block;
	border-radius: 100px;
	position: relative;
}

.checkbox-wrapper-17 label:after {
	content: '';
	position: absolute;
	top: 6%;
	left: 2.5%;
	width: calc(50% - 5%);
	height: calc(100% - 11%);
	background: #fff;
	border-radius: 90px;
	transition: 0.3s;
}

.checkbox-wrapper-17 input:checked+label {
	background: #0DA0FF;
}

.checkbox-wrapper-17 input:checked+label:after {
	left: calc(100% - 2.5%);
	transform: translateX(-100%);
}

.checkbox-wrapper-17 label:active:after {
	width: 55%;
}

.custom-table-wrapper {
  max-height: 650px; 
  overflow-y: auto;  
}
</style>
</head>

<body>
	<div class="mx-auto" style="width: 1350px;">
		<div class="d-flex justify-content-between">
			<div class="shadowWrap p-2 pt-5" style="width: 16%;">
				<div class="btn w-100 p-0 text-start fw-bold">
					<div class="p-2 fs-5 fw-bold navText" id="member">구성원 프로필</div>
				</div>
				<div class="btn w-100 p-0 text-start fw-bold mt-2">
					<div class="p-2 fw-bold fs-5 d-flex justify-content-between navBtn"
						data-bs-toggle="collapse" data-bs-target="#attitude"
						aria-controls="attitude" aria-expanded="false"
						aria-label="Toggle navigation">
						<div>출/퇴근</div>
						<div>
							<i class="bi bi-caret-down"></i>
						</div>
					</div>
					<div class="collapse" id="attitude">
						<div class="px-3">
							<div class="nav-item mt-1">
								<div class="nav-link p-1 navText" aria-current="page"
									id="status">출/퇴근 현황</div>
							</div>
							<div class="nav-item my-1">
<%--								<div class="nav-link p-1 navText" aria-current="page" id="tardy">지각--%>
<%--									명단</div>--%>
							</div>
						</div>
					</div>
				</div>
				<div class="btn w-100 p-0 text-start fw-bold mt-2">
					<div class="p-2 fw-bold fs-5 d-flex justify-content-between navBtn"
						data-bs-toggle="collapse" data-bs-target="#payment"
						aria-controls="payment" aria-expanded="false"
						aria-label="Toggle navigation">
						<div>결재</div>
						<div>
							<i class="bi bi-caret-down"></i>
						</div>
					</div>
					<div class="collapse" id="payment">
						<div class="px-3">
							<div class="nav-item my-1">
								<div class="nav-link p-1 navText" aria-current="page" id="draft">기안</div>
							</div>
							<div class="nav-item mt-1">
								<div class="nav-link p-1 navText" aria-current="page"
									id="reservation"><a href="<%=request.getContextPath()%>/reservation"
									style="text-decoration: none;">
									예약</a></div>
							</div>
							<div class="nav-item my-1">
								<div class="nav-link p-1 navText" aria-current="page"
									id="complete">결재 상태 확인	</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn w-100 p-0 text-start fw-bold mt-2">
					<div class="p-2 fw-bold fs-5 d-flex justify-content-between navBtn"
						data-bs-toggle="collapse" data-bs-target="#board"
						aria-controls="board" aria-expanded="false"
						aria-label="Toggle navigation">
						<div>공지</div>
						<div>
							<i class="bi bi-caret-down"></i>
						</div>
					</div>
					<div class="collapse" id="board">
						<div class="px-3">
							<div class="nav-item mt-1">
								<div class="nav-link p-1 navText" aria-current="page"
									id="noticeBoard">공지 작성</div>
							</div>
							<div class="nav-item my-1">
								<div class="nav-link p-1 navText" aria-current="page"
									id="newsBoard">뉴스 작성</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="shadowWrap d-flex align-items-center"
				style="width: 83%; height: 800px;">
				<div class="col-11 mx-auto">
					<!-- 구성원 프로필 -->
					<div id="memberContent">
						<div class="text-center shadowWrap p-3">
							<div class="fs-3 fw-bold">구성원 프로필 데이터</div>
							<div class="col-5 d-flex justify-content-between mx-auto my-3">
								<div class="col-8">
									<select id="deptSelect" class="form-select fw-bold deptSelect"
										aria-label="Default select example">
										<option value="0" >전체보기</option>
									</select>
								</div>
								<div class="col-3">
									<div class="fw-bold w-100 btn btn-outline-primary" onclick="usersLists()">조회</div>
								</div>
							</div>
						</div>
						<div class="text-center shadowWrap p-3 mt-3">

							<!-- sample -->
							<div id="usersList" class="d-flex p-0 border-bottom">
							</div>
						</div>
					</div>
					<!-- 출/퇴근 현황 -->
					<div id="statusContent" style="display: none;">
						<div class="text-center shadowWrap p-3">
							<div class="d-flex align-items-center border-bottom pb-3">
								<div class="col-3"></div>
								<div class="col-6 text-center">
									<i class="bi bi-chevron-left" id="prevBtn"
										style="cursor: pointer;"></i> <span class="fs-4 fw-bold"
										id="yearAndMonth"></span> <i class="bi bi-chevron-right"
										id="nextBtn" style="cursor: pointer;"></i>
								</div>
								<div class="col-3 text-end pt-1">
									<button class="btn rounded btn-outline-secondary" id="todayBtn">Today</button>
								</div>
							</div>
							<div class="col-7 d-flex justify-content-between ms-auto pt-3">
								<div class="col-4">
									<select class="form-select fw-bold"
										aria-label="Default select example">
										<option value="0" selected>전체</option>
										<option value="1">운영팀</option>
										<option value="2">감자팀</option>
										<option value="3">고구마팀</option>
									</select>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="왕감자">
								</div>
								<div class="col-1"></div>
								<div class="col-2">
									<div class="btn btn-secondary w-100" id="statusSearch">검색</div>
								</div>
							</div>
						</div>
						<div class="shadowWrap p-3 mt-3">
							<div class="fw-bold fs-5 my-2">(이름)</div>
							<div class="my-2">
								<span>부서 : </span> <span>(부서명)</span>
							</div>
						</div>
						<div class="shadowWrap p-3 mt-3">
							<div class="text-center">
								<div class="d-flex fw-bold border-bottom">
									<div class="col-2 p-1">일자</div>
									<div class="col-1 p-1">요일</div>
									<div class="col-3 p-1">출근시간</div>
									<div class="col-3 p-1">퇴근시간</div>
									<div class="col-3 p-1">총 근무시간</div>
								</div>
								<!-- sample -->
								<div class="d-flex border-bottom" id="status1">
									<div class="col-2 p-1">2023-07-21</div>
									<div class="col-1 p-1">금</div>
									<div class="col-3 p-1 startTime">11:51</div>
									<div class="col-3 p-1 finishTime">23:41</div>
									<div class="col-3 p-1 timeDiff"></div>
								</div>
								<div class="d-flex border-bottom" id="status2">
									<div class="col-2 p-1">2023-07-21</div>
									<div class="col-1 p-1">금</div>
									<div class="col-3 p-1 startTime">09:51</div>
									<div class="col-3 p-1 finishTime">23:11</div>
									<div class="col-3 p-1 timeDiff"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- 출/퇴근 지각 -->
					<div id="tardyContent" style="display: none;">
						<div class="text-center shadowWrap p-3">
							<div class="d-flex align-items-center border-bottom pb-3">
								<div class="col-3"></div>
								<div class="col-6 text-center">
									<i class="bi bi-chevron-left" id="prevBtnTardy"
										style="cursor: pointer;"></i> <span class="fs-4 fw-bold"
										id="yearAndMonthTardy"></span> <i class="bi bi-chevron-right"
										id="nextBtnTardy" style="cursor: pointer;"></i>
								</div>
								<div class="col-3 text-end pt-1">
									<button class="btn rounded btn-outline-secondary"
										id="todayBtnTardy">Today</button>
								</div>
							</div>
							<div class="col-4 d-flex justify-content-between ms-auto pt-3">
								<div class="col-7">
									<select class="form-select fw-bold"
										aria-label="Default select example">
										<option value="0" selected>전체</option>
										<option value="1">운영팀</option>
										<option value="2">감자팀</option>
										<option value="3">고구마팀</option>
									</select>
								</div>
								<div class="col-3">
									<div class="btn btn-secondary w-100" id="tardySearch">검색</div>
								</div>
							</div>
						</div>
						<div class="shadowWrap p-3 mt-3">
							<div class="text-center">
								<div class="d-flex fw-bold border-bottom">
									<div class="col-2 p-1">이름</div>
									<div class="col-2 p-1">날짜</div>
									<div class="col-3 p-1">정규 출근시간</div>
									<div class="col-3 p-1">실제 출근시간</div>
									<div class="col-2 p-1">지각</div>
								</div>
								<!-- sample -->
								<div class="d-flex border-bottom" id="tardy1">
									<div class="col-2 p-1">안준후</div>
									<div class="col-2 p-1 tardyDate"></div>
									<div class="col-3 p-1 startTimeTardy">09:00</div>
									<div class="col-3 p-1 finishTimeTardy">09:41</div>
									<div class="col-2 p-1 timeDiffTardy"></div>
								</div>
								<div class="d-flex border-bottom" id="tardy2">
									<div class="col-2 p-1">김원중</div>
									<div class="col-2 p-1 tardyDate"></div>
									<div class="col-3 p-1 startTimeTardy">09:00</div>
									<div class="col-3 p-1 finishTimeTardy">10:11</div>
									<div class="col-2 p-1 timeDiffTardy"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- 기안 결재 -->
					<div id="draftContent" style="display: none;">
						<div class="text-center shadowWrap p-3">
							<div class="fs-3 fw-bold">기안 결재</div>
							<div class="p-3 mt-5 text-center">
								<div class="d-flex border-bottom">
									<div class="col-1 p-1">
									<input type="checkbox" id="selectAll" onclick="selectAllCheckboxes('.check-icon-1')"/>
									</div>
									<div class="col-2 p-1">기안일</div>
									<div class="col-2 p-1">구분</div>
									<div class="col-4 p-1">제목</div>
									<div class="col-1 p-1">부서</div>
									<div class="col-1 p-1">이름</div>
									<div class="col-1 p-1">사번</div>
								</div>
								<!-- sample -->
								
								
								<!--휴가신청서  -->
								<c:forEach var="holiday" items="${holidayList}">
								 <c:if test="${holiday.DOCUMENTHOLIDAYSTATUS == '결재대기'}">
								<div class="d-flex align-items-center border-bottom">
									<div class="col-1 fs-5 pb-1">
    								<i class="far fa-square check-icon check-icon-1" data-value="${holiday.DOCUMENTHOLIDAYNUM}" 
    								onclick="holidayCheck(this)" ></i>
									</div>
									<div class="col-2 p-1">${holiday.DOCUMENTHOLIDAYSUBMITDAY}</div>
									<div class="col-2 p-1">휴가신청서</div>
									<div class="col-4 btn p-0 border-0 text-primary" data-bs-toggle="modal"
										data-bs-target="#draftModalVacation"
										data-user-name="${holiday.DOCUMENTHOLIDAYUSERNAME}"
										data-user-department="${holiday.DOCUMENTHOLIDAYUSERDEPARTMENT}"
										data-submit-day="${holiday.DOCUMENTHOLIDAYSUBMITDAY}"
										data-document-num="${holiday.DOCUMENTHOLIDAYNUM}"
										data-holiday-sort="${holiday.DOCUMENTHOLIDAYSORT}"
										data-start-day="${holiday.DOCUMENTHOLIDAYSTARTDAY}"
										data-end-day="${holiday.DOCUMENTHOLIDAYENDDAY}"
										data-holiday-content="${holiday.DOCUMENTHOLIDAYCONTENT}"
										 onClick="sendValues1(this)">
										${holiday.DOCUMENTHOLIDAYTITLE}</div>
									<div class="col-1 p-1">${holiday.DOCUMENTHOLIDAYUSERDEPARTMENT}</div>
									<div class="col-1 p-1">${holiday.DOCUMENTHOLIDAYUSERNAME}</div>
									<div class="col-1 p-1">${holiday.userIdennum}</div>
								</div>
								</c:if>
								</c:forEach>

								<!--업무보고서  -->
								<c:forEach var="taskreport" items="${taskreportList}">
								 <c:if test="${taskreport.DOCUMENTTASKREPORTSTATUS == '결재대기'}">
								<div class="d-flex align-items-center border-bottom">
									<div class="col-1 fs-5 pb-1">
    								<i class="far fa-square check-icon check-icon-1" data-value="${taskreport.DOCUMENTTASKREPORTNUM}" 
    								onclick="taskreportCheck(this)" ></i>
									</div>
									<div class="col-2 p-1">${taskreport.DOCUMENTTASKREPORTSUBMITDAY}</div>
									<div class="col-2 p-1">업무보고서</div>
									<div class="col-4 btn p-0 border-0 text-primary" data-bs-toggle="modal"
										data-bs-target="#draftModalReport" 
										data-user-name="${taskreport.DOCUMENTTASKREPORTUSERNAME}"
										data-user-department="${taskreport.DOCUMENTTASKREPORTUSERDEPARTMENT}"
										data-submit-day="${taskreport.DOCUMENTTASKREPORTSUBMITDAY}"
										data-document-num="${taskreport.DOCUMENTTASKREPORTNUM}"
										data-task-name="${taskreport.DOCUMENTTASKREPORTTASKNAME}"
										data-start-day="${taskreport.DOCUMENTTASKREPORTSTARTDAY}"
										data-end-day="${taskreport.DOCUMENTTASKREPORTENDDAY}"
										data-task-plan="${taskreport.DOCUMENTTASKREPORTPLAN}"
										data-special-note="${taskreport.DOCUMENTTASKREPORTSPECIALNOTE}"
										data-task-suggestion="${taskreport.DOCUMENTTASKREPORTSUGGESTIONS}"
										onClick="sendValues2(this)">
										${taskreport.DOCUMENTTASKREPORTTITLE}</div>
									<div class="col-1 p-1">${taskreport.DOCUMENTTASKREPORTUSERDEPARTMENT}</div>
									<div class="col-1 p-1">${taskreport.DOCUMENTTASKREPORTUSERNAME}</div>
									<div class="col-1 p-1">${taskreport.userIdennum}</div>
								</div>
								 </c:if>
								</c:forEach>
								
									<!--사직서  -->
									<c:forEach var="resignation" items="${resignationList}">
									<c:if test="${resignation.DOCUMENTRESIGNATIONSTATUS == '결재대기'}">
								<div class="d-flex align-items-center border-bottom">
									<!-- 사직서 체크시 비동기로 데이터베이스 업데이트 -->
									<div class="col-1 fs-5 pb-1">
    								<i class="far fa-square check-icon check-icon-1" data-value="${resignation.DOCUMENTRESIGNATIONNUM}" 
    								onclick="resignationCheck(this)" ></i>
									</div>
									<div class="col-2 p-1">${resignation.DOCUMENTRESIGNATIONSUBMITDAY}</div>
									<div class="col-2 p-1">사직서</div>
									<div class="col-4 btn p-0 border-0 text-primary" data-bs-toggle="modal"
										data-bs-target="#draftModalResignation"
										data-bs-target="#draftModalVacation"
										data-user-name="${resignation.DOCUMENTRESIGNATIONUSERNAME}"
										data-user-department="${resignation.DOCUMENTRESIGNATIONUSERDEPARTMENT}"
										data-submit-day="${resignation.DOCUMENTRESIGNATIONSUBMITDAY}"
										data-document-num="${resignation.DOCUMENTRESIGNATIONNUM}"
										data-user-createday="${resignation.DOCUMENTRESIGNATIONUSERCREATEDAY}"
										data-retirement-day="${resignation.DOCUMENTRESIGNATIONRETIREMENTDAY}"
										data-resign-reason="${resignation.DOCUMENTRESIGNATIONREASON}"
										onClick="sendValues3(this)" >
										${resignation.DOCUMENTRESIGNATIONTITLE}</div>
									<div class="col-1 p-1">${resignation.DOCUMENTRESIGNATIONUSERDEPARTMENT}</div>
									<div class="col-1 p-1">${resignation.DOCUMENTRESIGNATIONUSERNAME}</div>
									<div class="col-1 p-1">${resignation.userIdennum}</div>
								</div>
								</c:if>
								</c:forEach>
								
								
							</div>
							<div class="text-end px-3">
								<div class="btn btn-outline-primary px-4"
								onclick="submitPayment()">
								결재</div>
								<div class="btn btn-outline-primary px-4"
								onclick="submitReject()">
								반려</div>
							</div>
						</div>
					</div>
					

					<!-- 결재 완료 반려 -->
				<div id="completeContent" style="display: none;">
				    <div class="text-center shadowWrap p-3">
				        <div class="fs-3 fw-bold">결재 상태</div>
				        <div class="mt-5">
				            <div class="table-responsive custom-table-wrapper">
				                <table class="table table-bordered align-middle">
				                <thead>
				                    <tr>
				             <th class="text-center" style="width: 2%;">
				             <input type="checkbox" id="selectAll2" onclick="selectAllCheckboxes2('.check-icon-2')"/>
				             </th>
				             <th class="text-center">문서번호</th>
				             <th class="text-center">작성자</th>
				             <th class="text-center">제목</th>
				             <th class="text-center">구분</th>
				             <th class="text-center">기안일</th>
				             <th class="text-center">결재일</th>
				             <th class="text-center">결재자</th>
				             <th class="text-center">결재상태</th>
				                    </tr>
				                </thead>
				                <tbody>
				             <!--결제 완료/반려 휴가신청서  --> 
				             <c:forEach var="holiday" items="${holidayList}">
							 <c:if test="${holiday.DOCUMENTHOLIDAYSTATUS == '결재완료'
							 || holiday.DOCUMENTHOLIDAYSTATUS == '반려'}">
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon check-icon-2" data-value="${holiday.DOCUMENTHOLIDAYNUM}" 
    								onclick="holidayCheck(this)" ></i></td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYNUM}</td>
				             <td class="text-center">${holiday.userIdennum}
				             &nbsp;${holiday.DOCUMENTHOLIDAYUSERDEPARTMENT}
				             &nbsp;${holiday.DOCUMENTHOLIDAYUSERNAME} </td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYTITLE}</td>
				             <td class="text-center">휴가신청서</td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYSUBMITDAY}</td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYPAYMENTDAY}</td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYPAYMENTUSERID}
				             &nbsp;${holiday.DOCUMENTHOLIDAYPAYMENTDEPARTMENT}
				             &nbsp;${holiday.DOCUMENTHOLIDAYPAYMENTUSER}</td>
				             <td class="text-center">${holiday.DOCUMENTHOLIDAYSTATUS}</td>
				             </tr>
				             </c:if>
				             </c:forEach>
				             
				             <!--결제 완료/반려 업무보고서  -->     
				             <c:forEach var="taskreport" items="${taskreportList}">
							 <c:if test="${taskreport.DOCUMENTTASKREPORTSTATUS == '결재완료'
							 || taskreport.DOCUMENTTASKREPORTSTATUS == '반려'}">      
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon check-icon-2" data-value="${taskreport.DOCUMENTTASKREPORTNUM}" 
    								onclick="taskreportCheck(this)" ></i></td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTNUM}</td>
				             <td class="text-center">${taskreport.userIdennum}
				             &nbsp;${taskreport.DOCUMENTTASKREPORTUSERDEPARTMENT}
				             &nbsp;${taskreport.DOCUMENTTASKREPORTUSERNAME} </td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTTITLE}</td>
				             <td class="text-center">업무보고서</td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTSUBMITDAY}</td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTPAYMENTDAY}</td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTPAYMENTUSERID}
				             &nbsp;${taskreport.DOCUMENTTASKREPORTPAYMENTDEPARTMENT}
				             &nbsp;${taskreport.DOCUMENTTASKREPORTPAYMENTUSER}</td>
				             <td class="text-center">${taskreport.DOCUMENTTASKREPORTSTATUS}</td>
				             </tr> 
				             </c:if>  
				             </c:forEach>      
				       
				              <!--결제 완료/반려 사직서  -->    
				             <c:forEach var="resignation" items="${resignationList}">
				             <c:if test="${resignation.DOCUMENTRESIGNATIONSTATUS == '결재완료'
				             || resignation.DOCUMENTRESIGNATIONSTATUS == '반려'}">   
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon check-icon-2" data-value="${resignation.DOCUMENTRESIGNATIONNUM}" 
    								onclick="resignationCheck(this)" ></i></td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONNUM}</td>
				             <td class="text-center">${resignation.userIdennum}
				             &nbsp;${resignation.DOCUMENTRESIGNATIONUSERDEPARTMENT}
				             &nbsp;${resignation.DOCUMENTRESIGNATIONUSERNAME} </td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONTITLE}</td>
				             <td class="text-center">사직서</td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONSUBMITDAY}</td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONPAYMENTDAY}</td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONPAYMENTUSERID}
				             &nbsp;${resignation.DOCUMENTRESIGNATIONPAYMENTDEPARTMENT}
				             &nbsp;${resignation.DOCUMENTRESIGNATIONPAYMENTUSER}</td>
				             <td class="text-center">${resignation.DOCUMENTRESIGNATIONSTATUS}</td>
				             </tr>
				             </c:if>
				             </c:forEach>
				             
				                </tbody>
				            </table>
				        </div>
				         <div class="btn btn-outline-primary px-4"onclick="submitDelete()" 
				    style="margin-top: 15px;" >삭제</div>
				    </div>
				</div>
				</div>
					
					<!-- 공지 작성 -->
					<div id="noticeBoardContent" style="display: none;">
						<div class="shadowWrap p-3">
							<div class="text-center fs-3 fw-bold">공지 작성</div>
							<form class="mt-5 p-3" action="<%=request.getContextPath()%>/admin/boardnoticeinsert"  enctype="multipart/form-data" method="post">
								<div class="d-flex">
									<div
										class="col-2 fs-5 text-center fw-bold bg-secondary bg-opacity-25">제목</div>
									<div class="col-10">
										<input class="p-1 form-control" id="title" type="text"
											placeholder="제목을 입력해주세요" name="BOARDNOTICETITLE">
									</div>
								</div>
								
								<div class="mt-4">
									<div class="text-center fs-5 fw-bold bg-secondary bg-opacity-25">내용</div>
									<!-- noticeEditor 안에 있는 글자가 자동으로  <input type="hidden">으로 들어감 -->
									<div id="noticeEditor"></div>
									 <div>
						                <input type="hidden" id="notice-contents" name="BOARDNOTICECONTENT">
						             </div>
								<div class="mt-2 fs-5 mb-1" id="fileWrap">
									<input class="mt-2 w-100" type="file" id="file1"
										style="font-size: 0.6em" name="uploadfile">
								</div>
								<div class="mt-3 px-3 text-end">
									<input type="submit" class="btn btn-outline-primary px-4" id="submitBtn" value="등록">
									<div  class="btn btn-outline-primary px-4" onclick="goNoticeList()">목록</div>
									
								</div>
								</div>
								</form>
							</div>
					</div>
					
					<!-- 뉴스 작성 -->
	               <div id="newsBoardContent" style="display: none;">
	                  <div class="shadowWrap p-3">
	                     <div class="text-center fs-3 fw-bold">뉴스 작성</div>
	                     <form class="mt-5 p-3" action="<%=request.getContextPath()%>/admin/boardnewsinsert"  enctype="multipart/form-data" method="post">
	                        <div class="d-flex">
	                           <div
	                              class="col-2 fs-5 text-center fw-bold bg-secondary bg-opacity-25">제목</div>
	                           <div class="col-10">
	                              <input class="p-1 form-control" id="newsTitle" type="text"
	                                 placeholder="제목을 입력해주세요" name="BOARDNEWSTITLE">
	                           </div>
	                        </div>
	                        
	                        <div class="mt-4">
	                           <div class="text-center fs-5 fw-bold bg-secondary bg-opacity-25">내용</div>
	                           <div id="newsEditor"></div>
	                           <div>
						       		<input type="hidden" id="news-contents" name="BOARDNEWSCONTENT">
						       </div>
	                        <div class="mt-2 fs-5 mb-1" id="fileWrap">
	                           <input class="mt-2 w-100" type="file" id="file1"
	                              style="font-size: 0.6em" name="uploadfile">
	                        </div>
	                        <div class="mt-3 px-3 text-end">
	                           <input type="submit" class="btn btn-outline-primary px-4" id="news-submitBtn" value="등록">
								<div  class="btn btn-outline-primary px-4" onclick="goNewsList()">목록</div>	
	                        </div>
	                        </div>
	                     </form>
	                  </div>
	               </div>

				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<!-- 구성원 프로필 세부 -->
	<div class="modal fade" id="memberModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header text-center">
					<div class="col-11 fs-3 fw-bold modal-title">사원정보</div>
					<div class="col-1">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body">
					<form action="" method="post"
						class="px-5 d-flex justify-content-around">
						<div class="col-4">
							<div class="rounded"
								style="background-image: url(''); background-position: center; background-repeat: no-repeat; background-size: cover; height: 320px;"></div>
							<div
								class="d-flex mt-2 mx-auto text-center justify-content-around align-items-center">
								<div class="col-2 fs-5 fw-bold">이름</div>
								<div class="col-9">
									<div id="modalName" class="form-control">(이름)</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">사원번호</div>
								<div class="col-9">
									<div id="modalEmployeeNumber" class="form-control">(사원번호)</div>
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">부서명</div>
								<div class="col-6">
									<select class="form-select fw-bold modalDeptSelect" id="modalDepartment">

									</select>
								</div>
								<div
									class="col-3 d-flex align-items-center justify-content-center">
									<div class="checkbox-wrapper-17 me-2">
										<input type="checkbox" id="switch-17" /> <label
											for="switch-17" id="label-17"></label>
									</div>
									<div>부서장</div>
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">직책</div>
								<div class="col-9">
									<div id="modalTitle" class="form-control">(직책)</div>
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">이메일</div>
								<div class="col-9">
									<input id="modalEmail" type="email" class="form-control" value="(이메일)">
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">전화번호</div>
								<div class="col-9">
									<input id="modalPhoneNumber" type="text" class="form-control" value="(전화번호)">
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">입사일</div>
								<div class="col-9">
									<input id="modalJoinDate" type="text" class="form-control"
										value="2023-07-21" readonly>
								</div>
							</div>
							<div class="d-flex mt-2 align-items-center">
								<div class="col-3 fs-5 fw-bold">주소</div>
								<div class="col-9">
									<input id="modalAddress" type="text" class="form-control" value="(주소)">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer mx-auto col-6">
					<button type="button" class="btn btn-primary col-5"
						data-bs-dismiss="modal">수정</button>
					<button type="button" class="btn btn-secondary col-5"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기안결재 세부 -->
	<!-- 휴가신청서 모달 -->
	<div class="modal fade" id="draftModalVacation" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header text-center">
					<div class="col-11 fs-3 fw-bold modal-title">휴 가 신 청</div>
					<div class="col-1">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-between">
						<div class="col-4 text-center shadowWrap">
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안자</div>
								<div class="col-8 p-1 username"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">소속</div>
								<div class="col-8 p-1 userdepartment"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안일</div>
								<div class="col-8 p-1 submitday"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">문서번호</div>
								<div class="col-8 p-1 documentnum"></div>
							</div>
						</div>
						<div class="col-2 d-flex shadowWrap">
							<div class="col-2 fw-bold bg-secondary bg-opacity-25 text-center"
								style="writing-mode: vertical-lr">결 재</div>
							<div class="col-10 text-center align-middle">
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${departmentName}</div>
								<div class="h-50 border-bottom" style="line-height: 69px;">
								${name}</div>
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${id}</div>
							</div>
						</div>
					</div>
					<div class="shadowWrap">
						<div class="d-flex align-items-center border-bottom mt-4">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">구분</div>
							<div class="col-10 p-1 text-center holidaysort"></div>
						</div>
						<div class="d-flex align-items-center border-bottom">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">기간</div>
							<div class="col-10 p-1 text-center">
								<span class="startday"></span> ~ 
								<span class="endday"></span>
							</div>
						</div>
						<div class="d-flex border-bottom"
							style="height: 150px; line-height: 140px;">
							<div
								class="col-2 h-100 fw-bold bg-secondary bg-opacity-25 text-center p-1">내용</div>
							<div class="col-10 h-100 p-1 holidaycontent">()</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 업무보고서  모달-->
	<div class="modal fade" id="draftModalReport" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header text-center">
					<div class="col-11 fs-3 fw-bold modal-title">업 무 보 고 서</div>
					<div class="col-1">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-between">
						<div class="col-4 text-center shadowWrap">
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안자</div>
								<div class="col-8 p-1 username"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">소속</div>
								<div class="col-8 p-1 userdepartment"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안일</div>
								<div class="col-8 p-1 submitday"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">문서번호</div>
								<div class="col-8 p-1 documentnum"></div>
							</div>
						</div>
						<div class="col-2 d-flex shadowWrap">
							<div class="col-2 fw-bold bg-secondary bg-opacity-25 text-center"
								style="writing-mode: vertical-lr">결 재</div>
							<div class="col-10 text-center align-middle">
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${departmentName}</div>
								<div class="h-50 border-bottom" style="line-height: 69px;">
								${name}</div>
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${id}</div>
							</div>
						</div>
					</div>
					<div class="shadowWrap">
						<div class="d-flex mt-4 align-items-center border-bottom">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">업무명</div>
							<div class="col-10 p-1 text-center taskname"></div>
						</div>
						<div class="d-flex align-items-center border-bottom">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">일시</div>
							<div class="col-10 p-1 text-center">   
							<span class="startday"></span> ~ 
							<span class="endday"></span>
							 </div>
						</div>
						<div class="d-flex border-bottom"
							style="height: 160px; line-height: 160px;">
							<div
								class="col-2 h-100 fw-bold bg-secondary bg-opacity-25 text-center p-1">업무계획</div>
							<div class="col-10 h-100 p-1 text-center taskplan"></div>
						</div>
						<div class="d-flex border-bottom"
							style="height: 80px; line-height: 80px;">
							<div
								class="col-2 h-100 fw-bold bg-secondary bg-opacity-25 text-center p-1">특이사항</div>
							<div class="col-10 h-100 p-1 text-center specialnote"></div>
						</div>
						<div class="d-flex border-bottom"
							style="height: 80px; line-height: 80px;">
							<div
								class="col-2 h-100 fw-bold bg-secondary bg-opacity-25 text-center p-1">건의사항</div>
							<div class="col-10 h-100 p-1 text-center tasksuggestion"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 사직서  모달-->
	<div class="modal fade" id="draftModalResignation" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-bs-backdrop="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header text-center">
					<div class="col-11 fs-3 fw-bold modal-title">사직서</div>
					<div class="col-1">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				</div>
				<div class="modal-body">
					<div class="d-flex justify-content-between">
						<div class="col-4 text-center shadowWrap">
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안자</div>
								<div class="col-8 p-1 username"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">소속</div>
								<div class="col-8 p-1 userdepartment"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">기안일</div>
								<div class="col-8 p-1 submitday"></div>
							</div>
							<div class="d-flex border-bottom">
								<div class="col-4 p-1 fw-bold bg-secondary bg-opacity-25">문서번호</div>
								<div class="col-8 p-1 documentnum"></div>
							</div>
						</div>
						<div class="col-2 d-flex shadowWrap">
							<div class="col-2 fw-bold bg-secondary bg-opacity-25 text-center"
								style="writing-mode: vertical-lr">결 재</div>
							<div class="col-10 text-center align-middle">
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${departmentName}</div>
								<div class="h-50 border-bottom" style="line-height: 69px;">
								${name}</div>
								<div class="h-25 border-bottom" style="line-height: 33px;">
								${id}</div>
							</div>
						</div>
					</div>
					<div class="shadowWrap">
						<div class="d-flex mt-4 align-items-center border-bottom">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">입사년월일</div>
							<div class="col-4 p-1 text-center usercreateday"></div>
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">퇴직예정일자</div>
							<div class="col-4 p-1 text-center retirementday"></div>
						</div>
						
						<div class="d-flex align-items-center border-bottom">
							<div
								class="col-2 fw-bold bg-secondary bg-opacity-25 text-center p-1">사유</div>
							<div class="col-10 p-1 text-center resignreason">	</div>
						</div>
						<div class="d-flex align-items-center border-bottom"></div>
						<div class="border-bottom text-center pt-5"
							style="height: 150px; vertical-align: middle;">
							상기 본인은 위와 같은 사정으로 인해<br> <span class="retirementday2"></span>부터 사직하고자 이에
							사직서를 제출합니다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 반려 사유 선택 -->
	<div class="modal fade" id="reservationModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">반려 사유 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>반려 사유 선택</div>
					<select class="form-select" aria-label="Default select example">
						<option selected>먼저 승인된 일정이 있습니다.</option>
						<option value="1">수리, 보수 등으로 사용불가 상태입니다.</option>
						<option value="2">일정관리자에게 유선문의 부탁드립니다.</option>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">거절사유 입력</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		$(".navBtn").on("click",function(){
			if($(this).find("i").hasClass("bi-caret-down")){
				$(this).find("i").removeAttr("class","bi-caret-down")
				$(this).find("i").attr("class","bi-caret-up")
			}else if($(this).find("i").hasClass("bi-caret-up")){	
				$(this).find("i").removeAttr("class","bi-caret-up")			
				$(this).find("i").attr("class","bi-caret-down")
			}
		})

		let previouslyClicked = null;
		var contents;
		$(document).ready(function() {
			$("#member").click()
		});		
		$(".navText").on("click", function() {
			if (
				$(this).attr("id") === "member" ||
				$(this).attr("id") === "status" ||
				$(this).attr("id") === "tardy" ||
				$(this).attr("id") === "reservation" ||
				$(this).attr("id") === "draft" ||
				$(this).attr("id") === "complete" ||
				$(this).attr("id") === "noticeBoard" ||
				$(this).attr("id") === "newsBoard"
			) {
				// 이전에 클릭한 것이 있는 경우에만 스타일 삭제
				if (previouslyClicked !== null) {
				previouslyClicked.removeAttr("style");
				contents = previouslyClicked.attr("id")+"Content";
				$("#"+contents).attr("style","display:none");
				}

				// 현재 클릭한 요소에 스타일을 적용하고 'previouslyClicked'에 현재 클릭한 요소를 저장
				$(this).attr("style", "background-color:#F1F7FE; color:#3366FF;");
				previouslyClicked = $(this);
				
				contents = $(this).attr("id")+"Content";
				$("#"+contents).attr("style","display:block");
			} else {
				
			}
		});

		//출퇴근
		$("#status").on("click",function () {
			var date = new Date();
			var yearAndMonth = $("#yearAndMonth");
			yearAndMonth.text(date.getFullYear() + ". " + (date.getMonth() + 1));

			function getCurrentYearAndMonth() {
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				return {
				year: year,
				month: month
				};
			}
			function updateYearAndMonth() {
				var currentYearAndMonth = getCurrentYearAndMonth();
				yearAndMonth.text(currentYearAndMonth.year + ". " + currentYearAndMonth.month);
			}
			$("#nextBtn").on("click", () => {
				date.setMonth(date.getMonth() + 1);
				updateYearAndMonth();
			});
			$("#prevBtn").on("click", () => {
				date.setMonth(date.getMonth() - 1);
				updateYearAndMonth();
			});
			function onClickTodayBtn() {
				date = new Date();
				updateYearAndMonth();
			}
			$("#todayBtn").on("click", onClickTodayBtn);
		});
		//출퇴근 시간차이 구하기
		$("#statusSearch").on("click", function() {
			$(".startTime").each(function(index) {
				const start = $(this).text().split(":");
				const finish = $(".finishTime").eq(index).text().split(":");
				let hourDiff = parseInt(finish[0], 10) - parseInt(start[0], 10);
				let minuteDiff = parseInt(finish[1], 10) - parseInt(start[1], 10);

				if (minuteDiff < 0) {
				hourDiff -= 1;
				minuteDiff = 60 + minuteDiff;
				}

				$(".timeDiff").eq(index).text(`${hourDiff}시간 ${minuteDiff}분`);
			});
		});
		
		//지각
		$("#tardy").on("click",function () {
			var date = new Date();
			var yearAndMonth = $("#yearAndMonthTardy");
			var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
			yearAndMonth.text(date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + (date.getDate()) + "(" + dayNames[date.getDay()] + ")");

			function getCurrentYearAndMonthTardy() {
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
				var dayName = dayNames[date.getDay()];
				return {
				year: year,
				month: month,
				day : day,
				dayName : dayName
				};
			}
			function updateYearAndMonthTardy() {
				var currentYearAndMonth = getCurrentYearAndMonthTardy();
				yearAndMonth.text(currentYearAndMonth.year + ". " + currentYearAndMonth.month + ". " + currentYearAndMonth.day + "(" + currentYearAndMonth.dayName + ")");
			}
			$("#nextBtnTardy").on("click", () => {
				date.setDate(date.getDate() + 1);
				updateYearAndMonthTardy();
			});
			$("#prevBtnTardy").on("click", () => {
				date.setDate(date.getDate() - 1);
				updateYearAndMonthTardy();
			});
			function onClickTodayBtnTardy() {
				date = new Date();
				updateYearAndMonthTardy();
			}
			$("#todayBtnTardy").on("click", onClickTodayBtnTardy);
		});
		//지각 시간 구하기
		$("#tardySearch").on("click", function() {
			$(".startTimeTardy").each(function(index) {
				const start = $(this).text().split(":");
				const finish = $(".finishTimeTardy").eq(index).text().split(":");
				let hourDiff = parseInt(finish[0], 10) - parseInt(start[0], 10);
				let minuteDiff = parseInt(finish[1], 10) - parseInt(start[1], 10);

				if (minuteDiff < 0) {
				hourDiff -= 1;
				minuteDiff = 60 + minuteDiff;
				}

				$(".timeDiffTardy").eq(index).text(`${hourDiff}시간 ${minuteDiff}분`);

				var dateText = $("#yearAndMonthTardy").text();
				var dateComponents = dateText.match(/(\d+)/g); 
				var formattedDate = dateComponents[0] + "-" + dateComponents[1].padStart(2, '0') + "-" + dateComponents[2].padStart(2, '0');
				$(".tardyDate").eq(index).text(formattedDate);
			});
		});

		//예약
		$("#reservation").on("click",function () {
			var date = new Date();
			var yearAndMonth = $("#yearAndMonthReservation");
			var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
			yearAndMonth.text(date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + (date.getDate()) + "(" + dayNames[date.getDay()] + ")");

			function getCurrentYearAndMonthReservation() {
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				var dayNames = ["일", "월", "화", "수", "목", "금", "토"];
				var dayName = dayNames[date.getDay()];
				return {
				year: year,
				month: month,
				day : day,
				dayName : dayName
				};
			}
			function updateYearAndMonthReservation() {
				var currentYearAndMonth = getCurrentYearAndMonthReservation();
				yearAndMonth.text(currentYearAndMonth.year + ". " + currentYearAndMonth.month + ". " + currentYearAndMonth.day + "(" + currentYearAndMonth.dayName + ")");
			}
			$("#nextBtnReservation").on("click", () => {
				date.setDate(date.getDate() + 1);
				updateYearAndMonthReservation();
			});
			$("#prevBtnReservation").on("click", () => {
				date.setDate(date.getDate() - 1);
				updateYearAndMonthReservation();
			});
			function onClickTodayBtnReservation() {
				date = new Date();
				updateYearAndMonthReservation();
			}
			$("#todayBtnReservation").on("click", onClickTodayBtnReservation);
		});

		// member Modal
		$("#switch-17").on("click",function(){
			console.log($(this).is(":checked"));
			console.log("Selected date:", $("#date").val());
		})

		
		
		
		
		
		//여기부터 추가
		//휴가신청서 체크 확인(AJAX) 
		 function holidayCheck(element ) {
		     // 체크 표시 업데이트
		     const checked = element.classList.contains('fa-check-square');
		     if (checked) {
		    	 // 체크되어 있다면 'fa-check-square' 클래스를 제거하고 'fa-square' 클래스를 추가
		         element.classList.remove('fa-check-square');
		         element.classList.add('fa-square');
		     } else {
		    	  // 체크되어 있지 않다면 'fa-square' 클래스를 제거하고 'fa-check-square' 클래스를 추가
		         element.classList.remove('fa-square');
		         element.classList.add('fa-check-square');
		     }

		     // 선택한 값 얻기
		     const value = element.getAttribute("data-value");

		     // @PutMapping으로 이동
		     let urlPath;
		     if (checked) {
		       urlPath = '<%=request.getContextPath()%>/admin/holidayuncheck?DOCUMENTHOLIDAYNUM=' 
		    		   + value;
		     } else {
		       urlPath = '<%=request.getContextPath()%>/admin/holidaycheck?DOCUMENTHOLIDAYNUM=' 
		    		   + value;
		     }

		     fetch(urlPath, { //비동기로 보냄
		       method: 'PUT'
		     })
		     .then(response => response.text())
		     .then(data => {
		       console.log('Success:', data);
		     })
		     .catch((error) => {
		       console.error('Error:', error);
		     });
		 } 
		 
		//업무보고서 체크 확인(AJAX) 
		 function taskreportCheck(element) {
		     const checked = element.classList.contains('fa-check-square');
		     if (checked) { 	
		         element.classList.remove('fa-check-square');
		         element.classList.add('fa-square');
		     } else {
		         element.classList.remove('fa-square');
		         element.classList.add('fa-check-square');
		     }
		     const value = element.getAttribute("data-value");	
		     
		     let urlPath;
		     if (checked) {
		       urlPath = '<%=request.getContextPath()%>/admin/taskreportuncheck?DOCUMENTTASKREPORTNUM='
		    		   + value;
		     } else {
		       urlPath = '<%=request.getContextPath()%>/admin/taskreportcheck?DOCUMENTTASKREPORTNUM='
		    		   + value;
		     }

		     fetch(urlPath, { //비동기
		       method: 'PUT'
		     })
		     .then(response => response.text())
		     .then(data => {
		       console.log('Success:', data);
		     })
		     .catch((error) => {
		       console.error('Error:', error);
		     });
		 }
		 
		//사직서들 체크 확인(AJAX) 
		 function resignationCheck(element) {	     
		     const checked = element.classList.contains('fa-check-square');
		     if (checked) {
		         element.classList.remove('fa-check-square');
		         element.classList.add('fa-square');
		     } else {
		         element.classList.remove('fa-square');
		         element.classList.add('fa-check-square');
		     }
		     const value = element.getAttribute("data-value");
		     let urlPath;
		     if (checked) {
		       urlPath = '<%=request.getContextPath()%>/admin/resignationuncheck?DOCUMENTRESIGNATIONNUM=' 
		    		   + value;
		     } else {
		       urlPath = '<%=request.getContextPath()%>/admin/resignationcheck?DOCUMENTRESIGNATIONNUM=' 
		    		   + value;
		     }

		     fetch(urlPath, {
		       method: 'PUT'
		     })
		     .then(response => response.text())
		     .then(data => {
		       console.log('Success:', data);
		     })
		     .catch((error) => {
		       console.error('Error:', error);
		     });
		 }
		 
		
		//휴가신청 tj모달로 정보옮기기
		function sendValues1(element) {
		  const targetModalId = $(element).data('bs-target');
		  const userName = $(element).data('user-name');
		  const userDepartment = $(element).data('user-department');
		  const submitDay = $(element).data('submit-day');
		  const documentNum = $(element).data('document-num');
		  const holidaySort = $(element).data('holiday-sort');
		  const startDay = $(element).data('start-day');
		  const endDay = $(element).data('end-day');
		  const holidayContent = $(element).data('holiday-content');
		  const targetModal = $(targetModalId);
		
		  $(targetModal).find('.username').text(userName);
		  $(targetModal).find('.userdepartment').text(userDepartment);
		  $(targetModal).find('.submitday').text(submitDay);
		  $(targetModal).find('.documentnum').text(documentNum);
		  $(targetModal).find('.holidaysort').text(holidaySort);
		  $(targetModal).find('.startday').text(startDay);
		  $(targetModal).find('.endday').text(endDay);
		  $(targetModal).find('.holidaycontent').text(holidayContent);
		}		
		
		//업무보고서 모달로 정보옮기기
		function sendValues2(element) {
		  const targetModalId = $(element).data('bs-target');
		  const userName = $(element).data('user-name');
		  const userDepartment = $(element).data('user-department');
		  const submitDay = $(element).data('submit-day');
		  const documentNum = $(element).data('document-num');
		  const taskName = $(element).data('task-name');
		  const startDay = $(element).data('start-day');
		  const endDay = $(element).data('end-day');
		  const taskPlan = $(element).data('task-plan');
		  const specialNote = $(element).data('special-note');
		  const taskSuggestion = $(element).data('task-suggestion');
		  const targetModal = $(targetModalId);
		
		  $(targetModal).find('.username').text(userName);
		  $(targetModal).find('.userdepartment').text(userDepartment);
		  $(targetModal).find('.submitday').text(submitDay);
		  $(targetModal).find('.documentnum').text(documentNum);
		  $(targetModal).find('.taskname').text(taskName);
		  $(targetModal).find('.startday').text(startDay);
		  $(targetModal).find('.endday').text(endDay);
		  $(targetModal).find('.taskplan').text(taskPlan);
		  $(targetModal).find('.specialnote').text(specialNote);
		  $(targetModal).find('.tasksuggestion').text(taskSuggestion);
		}
		//사직서 모달로 정보옮기기
		function sendValues3(element) {
		  const targetModalId = $(element).data('bs-target');
		  const userName = $(element).data('user-name');
		  const userDepartment = $(element).data('user-department');
		  const submitDay = $(element).data('submit-day');
		  const documentNum = $(element).data('document-num');
		  const userCreatedDay = $(element).data('user-createday');
		  const retirementDay = $(element).data('retirement-day');
		  const resignReason = $(element).data('resign-reason');
		  const targetModal = $(targetModalId);
		
		  $(targetModal).find('.username').text(userName);
		  $(targetModal).find('.userdepartment').text(userDepartment);
		  $(targetModal).find('.submitday').text(submitDay);
		  $(targetModal).find('.documentnum').text(documentNum);
		  $(targetModal).find('.usercreateday').text(userCreatedDay);
		  $(targetModal).find('.retirementday').text(retirementDay);
		  $(targetModal).find('.retirementday2').text(retirementDay);
		  $(targetModal).find('.resignreason').text(resignReason);
		}
		

		//결제 버튼 
		function submitPayment() {
		  if (confirm('결제하시겠습니까?')) {
		    window.location.href = "/admin/approvalcomplete";
		  }
		}
		//반려버튼
		function submitReject() {
		  if (confirm('반려하시겠습니까?')) {
		    var contextPath = '<%=request.getContextPath()%>';
		    window.location.href = contextPath + '/admin/approvalreject';
		  }
		}
		
		//결재완료/반려 삭제 버튼
		function submitDelete() {
			if (confirm('삭제하시겠습니까?')) {
			  var contextPath = '<%=request.getContextPath()%>';
			  window.location.href = contextPath + '/admin/approvaldelete';
			}
		}

		//체크 전체선택	
		function selectAllCheckboxes(targetClass) {
    const masterCheckbox = document.getElementById("selectAll");
    const checkboxes = document.querySelectorAll(targetClass); // 대상 클래스를 적용
    checkboxes.forEach(checkbox => {
        const isChecked = checkbox.classList.contains('fa-check-square');
        if (masterCheckbox.checked && !isChecked) {
            checkbox.click();
        } else if (!masterCheckbox.checked && isChecked) {
            checkbox.click();
        }
    });
}
		
		//체크 전체선택	2
		function selectAllCheckboxes2(targetClass) {
    const masterCheckbox = document.getElementById("selectAll2");
    const checkboxes = document.querySelectorAll(targetClass); // 대상 클래스를 적용
    checkboxes.forEach(checkbox => {
        const isChecked = checkbox.classList.contains('fa-check-square');
        if (masterCheckbox.checked && !isChecked) {
            checkbox.click();
        } else if (!masterCheckbox.checked && isChecked) {
            checkbox.click();
        }
    });
}
		
		
		//toast editor
		const Editor = toastui.Editor;
		
		//****************************************************************
		//공지 작성
		const noticeEditor = new Editor({
			el: document.querySelector('#noticeEditor'),
			height: '350px',
			initialEditType: 'wysiwyg',
			previewStyle: 'vertical',
			language:'ko'
		});
		noticeEditor.getMarkdown();
		
        //등록 버튼 - 수정필요
        var submitBtn = document.getElementById("submitBtn");
        submitBtn.addEventListener("click",()=>{
            document.querySelector('#notice-contents').setAttribute('value' ,noticeEditor.getHTML());
            console.log(editor.getHTML());
        });

        
        //****************************************************************
		//뉴스 작성
		const newsEditor = new Editor({
			el: document.querySelector('#newsEditor'),
			height: '350px',
			initialEditType: 'wysiwyg',
			previewStyle: 'vertical',
			language:'ko'
		});
		newsEditor.getMarkdown();

        //등록 버튼 - 수정필요
        var newssubmitBtn = document.getElementById("news-submitBtn");
        newssubmitBtn.addEventListener("click",()=>{
            document.querySelector('#news-contents').setAttribute('value' ,newsEditor.getHTML());
            console.log(editor.getHTML());
        });
        
        //목록버튼을 누르면 공지게시판으로 이동
	    function goNoticeList() {        	
	        window.location.href = "<%=request.getContextPath()%>/boardnoticelist"; 
	    }
	    
	    //목록버튼을 누르면 뉴스게시판으로 이동
	    function goNewsList() {      	
	       window.location.href = "<%=request.getContextPath()%>/boardnewslist"; 
	    }
		function usersLists() {
			fetch("/admin/getUsers")
					.then(response => {
						if (response.status === 200) {
							return response.json();
						} else {
							throw new Error("Network response was not ok.");
						}
					})
					.then(data => {
						const listDept = document.getElementById("deptSelect");
						const selectedDept = parseInt(listDept.value);
						const userList = document.getElementById("usersList");
						userList.innerHTML = "<table class='table'><thead><tr><th scope='col'>#</th><th scope='col'>부서명</th><th scope='col'>사원 번호</th><th scope='col'>성명</th><th scope='col'>이메일</th></tr></thead><tbody></tbody></table>";
						const tbody = userList.querySelector('tbody');

						data.forEach((record, index) => {
							if (selectedDept === 0 || selectedDept === parseInt(record.departmentId)) {

								const newRow = document.createElement("tr");
								newRow.setAttribute('data-bs-toggle', 'modal');
								newRow.setAttribute('data-bs-target', '#memberModal');

								newRow.innerHTML = '<th scope="row">' + index + '</th>' +
										'<td>' + record.departmentName + '</td>' +
										'<td>' + record.userIdennum + '</td>' +
										'<td>' + record.userName + '</td>' +
										'<td>' + record.userEmail + '</td>';
								newRow.addEventListener('click', () => setDataToModal(record));
								tbody.appendChild(newRow);
							}
						});
					});
		}
		function getDepartmentListModal() {
			fetch('/admin/getDepartment')
					.then(response => {
						if (response.status === 200) {
							return response.json();
						} else {
							throw new Error("Network response was not ok.");
						}
					})
					.then(departments => {
						const deptSelect = document.querySelector(".deptSelect");

						departments.forEach(department => {
							const option = document.createElement("option");
							option.value = department.departmentId;
							option.textContent = department.departmentName;
							deptSelect.appendChild(option);
						});
					})
					.catch(error => {
						console.error('Error fetching departments:', error);
					});
		}
		function getDepartmentList() {
			fetch('/admin/getDepartment')
					.then(response => {
						if (response.status === 200) {
							return response.json();
						} else {
							throw new Error("Network response was not ok.");
						}
					})
					.then(departments => {
						const deptSelect = document.querySelector(".modalDeptSelect");

						departments.forEach(department => {
							const option = document.createElement("option");
							option.value = department.departmentId;
							option.textContent = department.departmentName;
							deptSelect.appendChild(option);
						});
					})
					.catch(error => {
						console.error('Error fetching departments:', error);
					});
		}

		function setDataToModal(record) {
			document.querySelector('#memberModal .modal-title').textContent = record.userName + "의 사원정보";
			document.getElementById('modalName').innerHTML = record.userName;
			document.getElementById('modalEmployeeNumber').innerHTML = record.userIdennum;
			document.getElementById('modalTitle').innerText = record.userPosition;
			document.getElementById('modalEmail').value = record.userEmail;
			document.getElementById('modalPhoneNumber').value = record.userPhone;
			const date = new Date(record.userCreatedDate);
			const year = date.getFullYear();
			const month = (date.getMonth() + 1);
			const day = date.getDate();
			document.getElementById('modalJoinDate').value = year + "년 "+ month + "월 " + day + "일";
			document.getElementById('modalAddress').value = record.userAddressBasic + record.userAddressDetail;
			const departmentSelectElement = document.getElementById('modalDepartment');
			for (let i = 0; i < departmentSelectElement.options.length; i++) {
				if (departmentSelectElement.options[i].value === record.departmentId) {
					departmentSelectElement.options[i].selected = true;
					break;
				}
			}
		}
		function populateYearAndMonthOptions() {
			const yearSelect = document.getElementById("yearSelect");
			const monthSelect = document.getElementById("monthSelect");
			const currentYear = new Date().getFullYear();
			const currentMonth = new Date().getMonth() + 1;

			for (let year = currentYear; year >= currentYear - 5; year--) {
				const option = document.createElement("option");
				option.value = year;
				option.textContent = year;
				yearSelect.appendChild(option);
			}

			for (let month = 1; month <= 12; month++) {
				const option = document.createElement("option");
				option.value = month;
				option.textContent = month.toString().padStart(2, '0');
				monthSelect.appendChild(option);
			}

			yearSelect.value = currentYear;
			monthSelect.value = currentMonth;
		}

		// JSON 배열 형식으로 접속자의 모든 출/퇴근시간 리스트 가져오기
		function populateCommuteTable() {
			fetch("/user/commute/check/" + currentUserId)
					.then(response => {
						if (response.status === 200) {
							return response.json();
						} else {
							throw new Error("Network response was not ok.");
						}
					})
					.then(data => {
						// 데이터를 이용하여 테이블을 동적으로 생성.
						const yearSelect = document.getElementById("yearSelect");
						const monthSelect = document.getElementById("monthSelect");
						const selectedYear = parseInt(yearSelect.value);
						const selectedMonth = parseInt(monthSelect.value);


						const filteredData = data.filter(commuteData => {
							const checkDate = new Date(commuteData.checkDate);
							return (
									checkDate.getFullYear() === selectedYear &&
									checkDate.getMonth() + 1 === selectedMonth // JavaScript months are 0-indexed
							);
						});
						const commuteTableContainer = document.getElementById("commuteTableContainer");

						commuteTableContainer.innerHTML = '';

						// Populate the table with fetched data
						filteredData.forEach(commuteData => {
							console.log(filteredData);
							const newRow = document.createElement("div");
							newRow.classList.add("d-flex", "mt-2", "p-2", "border-bottom", "border-dark");
							const formattedDate = formatDate(commuteData.checkDate);
							const formattedCheckInTime = formatTime(commuteData.checkInTime);
							const formattedCheckOutTime = formatTime(commuteData.checkOutTime);
							newRow.innerHTML =
									'<div class="col-3">' + formattedDate + '</div>' +
									'<div class="col-3">' + formattedCheckInTime + '</div>' +
									'<div class="col-3">' + formattedCheckOutTime + '</div>' +
									'<div class="col-3">' + calculateWorkHours(commuteData.checkInTime, commuteData.checkOutTime) + '</div>';
							commuteTableContainer.appendChild(newRow);
						});
					})
					.catch(error => {
						console.error("에러 발생:", error);
						alert("출근 체크 중 오류가 발생하였습니다. 다시 시도해주세요.");
					});
		}

		// Function to format the date as "MM-DD" (e.g., "08-04")
		function formatDate(dateString) {
			const date = new Date(dateString);
			const month = (date.getMonth() + 1).toString().padStart(2, '0');
			const day = date.getDate().toString().padStart(2, '0');
			return month + '-' + day;
		}

		// Function to format the time as "HH:mm" (e.g., "11:28")
		function formatTime(timeString) {
			const time = new Date(timeString);
			const hours = time.getHours().toString().padStart(2, '0');
			const minutes = time.getMinutes().toString().padStart(2, '0');
			return hours + ':' + minutes;
		}

		// Example function to calculate work hours (you can modify this based on your requirements)
		function calculateWorkHours(checkInTime, checkOutTime) {
			const checkIn = new Date(checkInTime);
			const checkOut = new Date(checkOutTime);
			const diffInMilliseconds = checkOut - checkIn;
			const hours = Math.floor(diffInMilliseconds / (1000 * 60 * 60));
			const minutes = Math.floor((diffInMilliseconds % (1000 * 60 * 60)) / (1000 * 60));

			// Format hours and minutes to 2 digits with leading zeros
			const formattedHours = hours.toString().padStart(2, '0');
			const formattedMinutes = minutes.toString().padStart(2, '0');

			return formattedHours + ":" + formattedMinutes;
		}
		populateYearAndMonthOptions();

		function initialize() {
			getDepartmentList();
			getDepartmentListModal()
		}

		initialize();


	</script>
</body>
	<%@ include file="../common/footer.jsp" %>
</html>