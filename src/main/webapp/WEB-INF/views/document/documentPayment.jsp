<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	
	<%@ include file="../common/header.jsp" %>
	
	
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/document.css">

<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!--체크관련 -->
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<title>결제 시스템</title>
<style>
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root{
	/* 색상 */
	--body-color: #E4E9F7;
	--sidebar-color: #FFF;
	--primary-color: #695CFE;
	--primary-color-light: #F6F5FF;
	--toggle-color: #DDD;
	--text-color: #707070;
	
	--tran-02: all 0.2s ease;
	--tran-03: all 0.3s ease;
	--tran-04: all 0.4s ease;
	--tran-05: all 0.5s ease;
}

body{
	height: 100vh;
	background: var(--body-color);
	transition: var(--tran-05);
}

body.dark{
	--body-color: #18191A;
	--sidebar-color: #242526;
	--primary-color: #3A3B3C;
	--primary-color-light: #3A3B3C;
	--toggle-color: #FFF;
	--text-color: #CCC;
}

/* === Sidebar === */
.sidebar{
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 250px;
	padding: 10px 14px;
	background: var(--sidebar-color);
	transition: var(--tran-05);
	z-index: 100;
}

.sidebar.close{
	width: 88px;
}

/* === Resuable CSS=== */
.sidebar .text{
	font-size: 16px;
	font-weight: 500;
	color: var(--text-color);
	transition: var(--tran-03);
	white-space: nowrap;
	opacity: 1;
}

.sidebar.close .text{
	opacity: 0;
}

.sidebar .image{
	min-width: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.sidebar li{
	height: 50px;
	margin-top: 10px;
	list-style: none;
	display: flex;
	align-items: center;
}

.sidebar li .icon{
	display: flex;
	align-items: center;
	justify-content: center;
	min-width: 60px;
	font-size: 20px;
}

.sidebar li .icon,
.sidebar li .text{
	color: var(--text-color);
	transition: var(--tran-02);
}

.sidebar header{
	position: relative;
}

.sidebar .image-text img{
	width: 40px;
	border-radius: 6px;
}

.sidebar header .image-text{
	display: flex;
	align-items: center;
}

header .image-text .header-text{
	display: flex;
	flex-direction: column;
}

.header-text .name{
	font-weight: 600;
}

.header-text .profession{
	margin-top: -2px;
}

.sidebar header .toggle{
	position: absolute;
	top: 50%;
	right: -25px;
	transform: translateY(-50%) rotate(180deg);
	height: 25px;
	width: 25px;
	background: var(--primary-color);
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	color: var(--sidebar-color);
	font-size: 22px;
	transition: var(--tran-03);
}

.sidebar.close header .toggle{
	transform: translateY(-50%);
}

body.dark .sidebar header .toggle{
	color: var(--text-color);
}
.sidebar .menu{
	margin-top: 35px;
}
.sidebar .search-box{
	background: var(--primary-color-light);
	border-radius: 6px;
	transition: var(--tran-05);
}

.search-box input{
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	font-weight: 500;
	background: var(--primary-color-light);
	transition: var(--tran-05);
}

.sidebar li a{
	height: 100%;
	width: 100%;
	display: flex;
	align-items: center;
	text-decoration: none;
	border-radius: 6px;
	transition: var(--tran-04);
}

.sidebar li a:hover{
	background: var(--primary-color);
}

.sidebar li a:hover .icon,
.sidebar li a:hover .text{
	color: var(--sidebar-color);
}
body.dark .sidebar li a:hover .icon,
body.dark .sidebar li a:hover .text{
	color: var(--sidebar-color);
}

.sidebar .menu-bar{
	height: calc(100% - 50px);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.menu-bar .mode{
	position: relative;
	border-radius: 6px;
	background: var(--primary-color-light);
}

.menu-bar .mode .moon-sun{
	height: 50px;
	width: 60px;
	display: flex;
	align-items: center;
}
.menu-bar .mode i{
	position: absolute;
	transition: var(--tran-03);
}

.menu-bar .mode i.sun{
	opacity: 0;
}

body.dark .menu-bar .mode i.sun{
	opacity: 1;
}

body.dark .menu-bar .mode i.moon{
	opacity: 0;
}

.menu-bar .mode .toggle-switch{
	position: absolute;
	right: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	min-width: 60px;
	cursor: pointer;
	border-radius: 6px;
	background: var(--primary-color-light);
	transition: var(--tran-05);
}

.toggle-switch .switch{
	position: relative;
	height: 22px;
	width: 44px;
	border-radius: 25px;
	background-color: var(--toggle-color);
}

.switch::before{
	content: '';
	position: absolute;
	height: 15px;
	width: 15px;
	border-radius: 50%;
	top: 50%;
	left: 5px;
	transform: translateY(-50%);
	background: var(--sidebar-color);
	transition: var(--tran-03);
}

body.dark .switch::before{
	left: 24px;
}

.home {
    position: relative;
	margin-top: 80px;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: var(--body-color);
    transition: var(--tran-05);
}

.home .text {
	margin-bottom: 30px;
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 8px 40px;
    text-align: center;
}

.vacation-form {
    width: 800px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.table-container {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    table-layout: fixed; /* 사유 입력창 크기 고정을 위해 추가 */
}

.table-container th,
.table-container td {
    border: 1px solid var(--text-color);
    padding: 8px;
    text-align: center; /* 테이블 셀 가운데 정렬 */
    word-wrap: break-word; /* 사유 입력창 크기 고정을 위해 추가 */
}
th {
    text-align: center;
	width: 120px;
  }
.table-container th {
    background-color: var(--primary-color-light);
}

.table-container tbody tr:nth-child(even) {
    background-color: var(--primary-color-light);
}

textarea#reason {
    resize: none;
	height: 300px;
}

.form-group {
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
}

.active {
      background: var(--primary-color);
}


.custom-table-wrapper {
  max-height: 650px; 
  overflow-y: auto;  
}
</style>
</head>
<body>
		<!-- 날짜정보  -->
		<%
		long time = System.currentTimeMillis();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String today = date.format(new Date(time));
		%>
	<nav class="sidebar close">
		<header>
			<div class="image-text">
				<span class="image">
					<img src="https://i.imgur.com/u9VWUdA.png" title="onlylogo.png"/>
				</span>

                <div class="text header-text">
                    <span class="name">결제 페이지?</span>
                    <span class="profession">소제목..?</span>
                </div>
			</div>

            <i class='bx bx-chevron-right toggle'></i>
		</header>

        <div class="menu-bar">
            <div class="menu">
                <li class="search-box"></li>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="#" id="vacation-link">
                            <i class='bx bx-chevron-right toggle icon'></i>
                            <span class="text nav-text">휴가신청서</span>
                        </a>
                    </li>
                   
                    <li class="nav-link">
                        <a href="#" id="work-report-link">
                            <i class='bx bx-chevron-right toggle icon'></i>
                            <span class="text nav-text">업무보고서</span>
                        </a>
                    </li>
					
                    <li class="nav-link">
                        <a href="#" id="resignation-link">
                            <i class='bx bx-chevron-right toggle icon'></i>
                            <span class="text nav-text">사직서</span>
                        </a>
                    </li>
                    
                    <li class="nav-link">
                        <a href="#" id="drft-link">
                            <i class='bx bx-chevron-right toggle icon'></i>
                            <span class="text nav-text">결제 상태 확인</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
	</nav>
		
		
		<!-- 휴가 신청 -->
		<section class="home" id="vacation-section" style="display: none;">
			<div class="text">
				<h1>휴가 신청서</h1>
			</div>
			<div class="d-flex justify-content-center">
			
				<form action="<%=request.getContextPath()%>/approval/holidayinsert"
				method="post" style="width: 800px;"
				onsubmit="return confirm('제출하시겠습니까?');">
				<sec:csrfInput/>
				<!-- 신청한 유저아이디  나중에수정 -->
				<input type="hidden" value="${userInfo.userIdennum}"  name="userIdennum">
				<!-- 결제상태 -->
				<input type="hidden" name="DOCUMENTHOLIDAYSTATUS" value="결재대기">
					<table class="table table-bordered table-striped">
						<tr>
							<th class="align-mㅣ">이름</th>
							<td>
							<input type="text" value="${userInfo.USERNAME}"  
							class="form-control" name="DOCUMENTHOLIDAYUSERNAME"	readonly>
							</td>
						</tr>
						<tr>
							<th class="align-mㅣ">부서</th>
							<td>
							<input type="text" value="${userInfo.DEPARTMENTNAME}"  
							class="form-control" name="DOCUMENTHOLIDAYUSERDEPARTMENT"	readonly>
							</td>
						</tr>
						
						<tr>
							<th class="align-mㅣ">제출 날짜</th>
							<td><input type="date" value="<%=today%>"
							class="form-control" name="DOCUMENTHOLIDAYSUBMITDAY" readonly>
							</td>
						</tr>
						
						<tr>
							<th class="align-middle">휴가 날짜</th>
							<td>
								<div class="row">
									<div class="col">
										<input type="date" class="form-control" 
										min="<%=today%>"  name="DOCUMENTHOLIDAYSTARTDAY" required>
									</div>
									~
									<div class="col">
										<input type="date" class="form-control" 
										min="<%=today%>" name="DOCUMENTHOLIDAYENDDAY" required>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th class="align-middle">휴가 종류</th>
							<td>
								<select id="vacation-type" name="DOCUMENTHOLIDAYSORT" class="form-select" required>			
									<option value="반차" selected>반차</option>
									<option value="연차">연차</option>
									<option value="출산">출산</option>
									<option value="배우자 출산">배우자 출산</option>
									<option value="가족 돌봄">가족 돌봄</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th class="align-mㅣ">제목</th>
							<td><input type="text" class="form-control" name="DOCUMENTHOLIDAYTITLE" required> </td>
						</tr>
						
						<tr>
							<th class="align-middle">내용</th>
							<td><textarea id="reason" name="DOCUMENTHOLIDAYCONTENT" class="form-control" required></textarea></td>
						</tr>
					</table>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">제출</button>
					</div>
				</form>
			</div>
		</section>
		
		<!-- 업무보고서 신청 -->
		<section class="home" id="work-report-section" style="display: none;">
			<div class="text">
				<h1>업무 보고서</h1>
			</div>
			<div class="d-flex justify-content-center">
			
				<form action="<%=request.getContextPath()%>/approval/taskreportinsert" method="post" style="width: 800px;"
				onsubmit="return confirm('제출하시겠습니까?');">
				<sec:csrfInput/>
				<!-- 신청한 유저아이디  나중에수정 -->
				<input type="hidden" name="userIdennum" value="${userInfo.userIdennum}">
				<!-- 결제상태 -->
				<input type="hidden" name="DOCUMENTTASKREPORTSTATUS" value="결재대기">
				
					<table class="table table-bordered table-striped">
						<tr>
							<th class="align-mㅣ">이름</th>
							<td>
							<input type="text"  value="${userInfo.USERNAME}"  class="form-control" 
							name="DOCUMENTTASKREPORTUSERNAME" readonly>
							</td>
						</tr>
						<tr>
							<th class="align-mㅣ">부서</th>
							<td>
							<input type="text" value="${userInfo.DEPARTMENTNAME}" class="form-control" 
							name="DOCUMENTTASKREPORTUSERDEPARTMENT" readonly>
							</td>
						</tr>
					
						<tr>
							<th class="align-middle">제목</th>
							<td><input type="text"  name="DOCUMENTTASKREPORTTITLE" class="form-control" required></td>
						</tr>
						
						<tr>
							<th class="align-middle">업무명</th>
							<td><input type="text"  name="DOCUMENTTASKREPORTTASKNAME" class="form-control" required></td>
						</tr>
	
						<tr>
							<th class="align-mㅣ">제출 날짜</th>
							<td><input type="date" value="<%=today%>"
							class="form-control" name="DOCUMENTTASKREPORTSUBMITDAY" readonly>
							</td>
						</tr>
						
						<tr>
							<th class="align-middle">업무 일시</th>
							<td>
								<div class="row">
									<div class="col">
										<input type="date" class="form-control" min="<%=today%>"  name="DOCUMENTTASKREPORTSTARTDAY" required>
									</div>
									~
									<div class="col">
										<input type="date" class="form-control" min="<%=today%>" name="DOCUMENTTASKREPORTENDDAY" required>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th class="align-middle">업무 계획</th>
							<td><textarea  name="DOCUMENTTASKREPORTPLAN" class="form-control" style="resize: none; height: 200px;" required></textarea></td>
						</tr>
						
						<tr>
							<th class="align-middle">특이 사항</th>
							<td><textarea  name="DOCUMENTTASKREPORTSPECIALNOTE" class="form-control" style="resize: none; height: 200px;" required></textarea></td>
						</tr>
						
						<tr>
							<th class="align-middle">건의 사항</th>
							<td><textarea  name="DOCUMENTTASKREPORTSUGGESTIONS" class="form-control" style="resize: none; height: 120px;" required></textarea></td>
						</tr>
						
					</table>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">제출</button>
					</div>
				</form>
			</div>
		</section>
		
		
		<!-- 사직서 신청 -->
		<section class="home" id="resignation-section" style="display: none;">
			<div class="text">
				<h1>사직서</h1>
			</div>
			<div class="d-flex justify-content-center">
				<form action="<%=request.getContextPath()%>/approval/resignationinsert" method="post" style="width: 800px;"
				onsubmit="return confirm('제출하시겠습니까?');">
				<sec:csrfInput/>
				<!-- 신청한 유저아이디  나중에수정 -->
				<input type="hidden" name="userIdennum" value="${userInfo.userIdennum}">
				<!-- 결제상태 -->
				<input type="hidden" name="DOCUMENTRESIGNATIONSTATUS" value="결재대기">
				
					<table class="table table-bordered table-striped">
						<tr>
							<th class="align-mㅣ">이름</th>
							<td>
							<input type="text" value="${userInfo.USERNAME}" class="form-control" 
							name="DOCUMENTRESIGNATIONUSERNAME" readonly>
							</td>
						</tr>
						<tr>
							<th class="align-mㅣ">부서</th>
							<td>
							<input type="text" value="${userInfo.DEPARTMENTNAME}" class="form-control" 
							name="DOCUMENTRESIGNATIONUSERDEPARTMENT" readonly>
							</td>
						</tr>
						
						<tr>
							<th class="align-mㅣ">제목</th>
							<td><input type="text" class="form-control" name="DOCUMENTRESIGNATIONTITLE" required> </td>
						</tr>
						
						
						<tr>
							<th class="align-mㅣ">제출 날짜</th>
							<td><input type="date" value="<%=today%>"
							class="form-control" name="DOCUMENTRESIGNATIONSUBMITDAY" readonly>
							</td>
						</tr>
						
						<tr>
						<!--  여기에 입사년월일 넣기 -->
							<th class="align-mㅣ">입사 년월일</th>
							<td><input type="date" class="form-control"
							name="DOCUMENTRESIGNATIONUSERCREATEDAY" value="${userInfo.USERCREATEDDATE}" readonly>
							 </td>
						</tr>
						
						<tr>
							<th class="align-mㅣ">퇴직 예정일</th>
							<td><input type="date" min="<%=today%>"
							class="form-control" name="DOCUMENTRESIGNATIONRETIREMENTDAY" required>
							</td>
						</tr>
						
						<tr>
							<th class="align-middle">사유 </th>
							<td>
								<select id="vacation-type" name="DOCUMENTRESIGNATIONREASON" class="form-select" required>							
									<option value="정년" selected>정년</option>
									<option value="이직">이직</option>
									<option value="진학">진학</option>
									<option value="결혼">결혼</option>
									<option value="권고">권고</option>	
									<option value="권고">기타</option>		
								</select>
							</td>
						</tr>	
					</table>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">제출</button>
					</div>
				</form>
			</div>
		</section>
		
		
		<!-- 결재상태 확인 -->
		<section class="home" id="draft-section" style="display: none;">
			<div class="text">
				<h1>결재 상태 확인</h1>
			</div>
				
				<!-- 결재 대기 반려만  -->
				<div id="completeContent">
				    <div class="text-center shadowWrap p-3">
				        <div class="fs-3 fw-bold">결재 대기/반려</div>
				        <div class="mt-5">
				            <div class="table-responsive custom-table-wrapper scrollable-div"
				            style="display: flex; justify-content: center; margin-left:80px ">
				                <table class="table table-bordered align-middle scrollable-table"
				                 style="width: 80%; font-size: 13px;">
				                <thead>
				                    <tr>
				             <th class="text-center" style="width: 2%;">
				             <input type="checkbox" id="selectAll" onclick="selectAllCheckboxes()"/></th>
				             <th class="text-center" style="width: 12%;">문서번호</th>
				             <th class="text-center" style="width: 13%;">작성자</th>
				             <th class="text-center" style="width: 20%;">제목</th>
				             <th class="text-center" style="width: 10%;">구분</th>
				             <th class="text-center" style="width: 11%;">기안일</th>
				             <th class="text-center" style="width: 11%;">결재일</th>
				             <th class="text-center" style="width: 13%;">결재자</th>
				             <th class="text-center" style="width: 8%;">결재상태</th>
				                    </tr>
				                </thead>
				                <tbody>
				             <!--결제 완료/반려 휴가신청서  --> <!--아이디 일단 임시세션 -->
				             <c:forEach var="holiday" items="${holidayList}">
							 <c:if test="${(holiday.DOCUMENTHOLIDAYSTATUS == '결재대기'
							 || holiday.DOCUMENTHOLIDAYSTATUS == '반려')
							 && holiday.userIdennum == userInfo.userIdennum }">
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon" data-value="${holiday.DOCUMENTHOLIDAYNUM}" 
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
							 <c:if test="${(taskreport.DOCUMENTTASKREPORTSTATUS == '결재대기'
							 || taskreport.DOCUMENTTASKREPORTSTATUS == '반려')
							 && taskreport.userIdennum == userInfo.userIdennum}">      
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon" data-value="${taskreport.DOCUMENTTASKREPORTNUM}" 
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
				             <c:if test="${(resignation.DOCUMENTRESIGNATIONSTATUS == '결재대기'
				             || resignation.DOCUMENTRESIGNATIONSTATUS == '반려')
				             && resignation.userIdennum == userInfo.userIdennum}">   
				             <tr>
				             <td class="text-center"><i class="far fa-square check-icon" data-value="${resignation.DOCUMENTRESIGNATIONNUM}" 
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
				    </div>
				    <div class="btn btn-outline-primary px-4"onclick="submitDelete()" 
				    style="margin-top: 5px;" >삭제</div>
				</div>
				</div>
			
			
			<!-- 결재완료만 -->
			<div id="completeContent">
				    <div class="text-center shadowWrap p-3">
				        <div class="fs-3 fw-bold">결재 완료</div>
				        <div class="mt-5">
				            <div class="table-responsive custom-table-wrapper scrollable-div"
				            style="display: flex; justify-content: center; margin-left:80px ">
				                <table class="table table-bordered align-middle scrollable-table"
				                 style="width: 80%; font-size: 13px;">
				                <thead>
				                    <tr>
				             <th class="text-center" style="width: 12%;">문서번호</th>
				             <th class="text-center" style="width: 13%;">작성자</th>
				             <th class="text-center" style="width: 20%;">제목</th>
				             <th class="text-center" style="width: 10%;">구분</th>
				             <th class="text-center" style="width: 11%;">기안일</th>
				             <th class="text-center" style="width: 11%;">결재일</th>
				             <th class="text-center" style="width: 13%;">결재자</th>
				             <th class="text-center" style="width: 10%;">결재상태</th>
				                    </tr>
				                </thead>
				                <tbody>
				             <!--결제 완료/반려 휴가신청서  --> <!--아이디 일단 임시세션 -->
				             <c:forEach var="holiday" items="${holidayList}">
							 <c:if test="${holiday.DOCUMENTHOLIDAYSTATUS == '결재완료'
							 && holiday.userIdennum == userInfo.userIdennum}">
				             <tr>
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
							 && taskreport.userIdennum == userInfo.userIdennum}">      
				             <tr>
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
				             && resignation.userIdennum == userInfo.userIdennum}">   
				             <tr>
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
				    </div>
				</div>
				</div>
			
			
		</section>

		

    <script>
	  const body = document.querySelector("body"),
      sidebar = body.querySelector(".sidebar"),
      toggle = body.querySelector(".toggle"),
      modeSwtich = body.querySelector(".toggle-switch"),
      modeText = body.querySelector(".mode-text");

      toggle.addEventListener("click", () =>{
        sidebar.classList.toggle("close");
      });
     
	  
	const vacationLink = body.querySelector("#vacation-link"); 			// 휴가신청서 링크
	const workreportLink = body.querySelector("#work-report-link");		// 업무보고서 링크
	const resignationLink = body.querySelector("#resignation-link"); 	// 사직서 링크
	const draftLink = body.querySelector("#drft-link");  //결재상태확인

	const vacationSection = body.querySelector("#vacation-section"); 			// 휴가신청서 섹션
	const workreportSection = body.querySelector("#work-report-section");		// 업무보고서 섹션
	const resignationSection = body.querySelector("#resignation-section");		// 사직서 섹션
	const draftSection = body.querySelector("#draft-section");	 //결재
	
	
	vacationLink.addEventListener("click", () => {
		vacationSection.style.display = "block";
		workreportSection.style.display = "none";
		resignationSection.style.display = "none";
		draftSection.style.display = "none";
	});

	workreportLink.addEventListener("click", () => {
		vacationSection.style.display = "none";
		workreportSection.style.display = "block";
		resignationSection.style.display = "none";
		draftSection.style.display = "none";
	});

	resignationLink.addEventListener("click", () => {
		vacationSection.style.display = "none";
		workreportSection.style.display = "none";
		resignationSection.style.display = "block";
		draftSection.style.display = "none";
	});
	
	draftLink.addEventListener("click", () => {
		vacationSection.style.display = "none";
		workreportSection.style.display = "none";
		draftSection.style.display = "block";
		resignationSection.style.display = "none";
	});
	
	
	
	// csrf토큰 추가하기
	 const csrfToken = $("meta[name='_csrf']").attr("content");
	 const csrfHeader = $("meta[name='_csrf_header']").attr("content");

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
	       urlPath = '<%=request.getContextPath()%>/approval/holidayuncheck?DOCUMENTHOLIDAYNUM='
	    		   + value;
	     } else {
	       urlPath = '<%=request.getContextPath()%>/approval/holidaycheck?DOCUMENTHOLIDAYNUM='
	    		   + value;
	     }

	     fetch(urlPath, { //비동기로 보냄
	       method: 'PUT',
	       headers: {
	           [csrfHeader]: csrfToken,
	         },
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
	       urlPath = '<%=request.getContextPath()%>/approval/taskreportuncheck?DOCUMENTTASKREPORTNUM='
	    		   + value;
	     } else {
	       urlPath = '<%=request.getContextPath()%>/approval/taskreportcheck?DOCUMENTTASKREPORTNUM='
	    		   + value;
	     }

	     fetch(urlPath, { //비동기
	       method: 'PUT',
	       headers: {
	           [csrfHeader]: csrfToken,
	         },
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
	       urlPath = '<%=request.getContextPath()%>/approval/resignationuncheck?DOCUMENTRESIGNATIONNUM='
	    		   + value;
	     } else {
	       urlPath = '<%=request.getContextPath()%>/approval/resignationcheck?DOCUMENTRESIGNATIONNUM='
	    		   + value;
	     }

	     fetch(urlPath, {
	       method: 'PUT',
	       headers: {
	           [csrfHeader]: csrfToken,
	         },
	     })
	     .then(response => response.text())
	     .then(data => {
	       console.log('Success:', data);
	     })
	     .catch((error) => {
	       console.error('Error:', error);
	     });
	 }
	
	
	
	// 결재대기/반려 삭제 버튼
	 function submitDelete() {
	     if (confirm('삭제하시겠습니까?')) {
	         const csrfToken = $("meta[name='_csrf']").attr("content");
	         const csrfHeader = $("meta[name='_csrf_header']").attr("content");
	         
	         var contextPath = '<%=request.getContextPath()%>';
	         sendPostRequest(contextPath + '/approval/approvaldelete', {}, csrfHeader, csrfToken);
	     }
	 }

	 // POST 전송을 위한 함수
	 async function sendPostRequest(url, data, csrfHeader, csrfToken) {
	     const formData = new FormData();

	     for (const key in data) {
	         formData.append(key, data[key]);
	     }

	     const response = await fetch(url, {
	         method: 'POST',
	         body: formData,
	         headers: {
	             [csrfHeader]: csrfToken,
	         },
	     });

	     // 응답 메시지 처리
	     if (response.ok) {
	         // 페이지 새로고침
	         window.location.reload();
	     } else {
	         // 오류 처리
	         alert('요청 실패');
	     }
	 }
	//체크 전체선택	
	function selectAllCheckboxes() {
    const masterCheckbox = document.getElementById("selectAll");
    const checkboxes = document.querySelectorAll(".check-icon");
    checkboxes.forEach(checkbox => {
        // 현재 체크상태와 전체 선택 체크박스 상태에 따라 체크상태를 업데이트합니다.
        const isChecked = checkbox.classList.contains('fa-check-square');
        if (masterCheckbox.checked && !isChecked) {
            checkbox.click();
        } else if (!masterCheckbox.checked && isChecked) {
            checkbox.click();
        }
    });
}
	
	</script>
</body>

</html>