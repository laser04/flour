<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <link rel="stylesheet"
          href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
    <link rel="stylesheet"
          href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

    <style>
        /* div{border: 1px solid black;} */
        .index a {
            text-decoration: none;
            color: black;
        }

        .shadowWrap {
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        .indexIcon {
            width: 45px;
            height: 45px;
        }

        .text-ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .modalWrap {
            cursor: pointer;
        }

        /* toast editor insert 비활성화 */
        button.table, button.image, button.link {
            display: none;
        }
        /* .toastui-calendar-grid-cell-header{

                height: 26px;
            } */
    </style>
</head>

<body class="index">
<div class="d-flex p-3 mx-auto" style="width: 1350px">
    <!-- left -->
    <div class="d-inline mt-3 w-25">
        <div class="p-3 bg-white shadowWrap">
            <sec:authorize access="isAuthenticated()">
                <div class="d-flex justify-content-center">
                    <div class="col-3 text-center justify-content-center">
                        <c:if test="${empty users.userPhoto}">
                            <i class="bi bi-person-circle" style="font-size: 60px;"></i>
                        </c:if>
                        <c:if test="${!empty users.userPhoto}">
                            <img class="rounded" src="${users.userPhoto}"
                                 width="80" alt="${name}"/>
                        </c:if>
                    </div>
                    <div class="col-9 d-inline align-self-center">
                        <div class="m-2 text-center">${name} 님 환영합니다.</div>
                    </div>
                </div>

                <div class="mt-4 mx-auto d-flex" style="width: 85%">
                    <div class="col-4" onclick="window.location.href = '/user/update';">
                        <div
                                class="mx-auto rounded-circle d-flex align-items-center justify-content-center btn border-dark indexIcon">
                            <div style="position: relative;">
                                <i class="bi bi-clock" style="font-size: 25px;"></i>
                            </div>
                        </div>
                        <div class="text-center mt-1" style="cursor: pointer;">출/퇴근
                        </div>
                    </div>
                    <div class="col-4" onclick="window.location.href = '#';">
                        <div
                                class="mx-auto rounded-circle d-flex align-items-center justify-content-center btn border-dark indexIcon">
                            <div style="position: relative;">
                                <i class="bi bi-file-text" style="font-size: 25px;"></i>
                            </div>
                        </div>
                        <div class="text-center mt-1" style="cursor: pointer;">결재</div>
                    </div>
                    <div class="col-4" onclick="window.location.href = '#';">
                        <div
                                class="mx-auto rounded-circle d-flex align-items-center justify-content-center btn border-dark indexIcon">
                            <div style="position: relative;">
                                <i class="bi bi-briefcase" style="font-size: 25px;"></i>
                            </div>
                        </div>
                        <div class="text-center mt-1" style="cursor: pointer;">일정</div>
                    </div>

                </div>

                <div class="mt-4">
                    <div class="d-flex">
                        <div class="col-4 text-center">결재대기</div>
                        <div class="col-3 text-end">휴가</div>
                        <div class="col-1 text-center">0</div>
                        <div class="col-3 text-end">출장</div>
                        <div class="col-1 text-center">0</div>
                    </div>
                    <div class="d-flex">
                        <div class="col-4 text-center">결재대기</div>
                        <div class="col-3 text-end">휴가</div>
                        <div class="col-1 text-center">0</div>
                        <div class="col-3 text-end">출장</div>
                        <div class="col-1 text-center">0</div>
                    </div>
                </div>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <div>
                <input type='button' class='log_box btn btn-primary' value='로그인'
                       onclick="window.location.href = '/login'">
                </div>
            </sec:authorize>
            <div class="mt-5">
                <!-- 날씨 -->
                <div class="p-3 mx-auto shadowWrap" style="width: 270px;">
                    <div class="fs-2 fw-bold text-center" id="w-location"></div>
                    <div class="mt-3 d-flex">
                        <div class="col-6 text-center">
                            <div class="btn w-100" id="popover-btn" data-bs-container="body"
                                 data-bs-toggle="popover" data-bs-placement="bottom">
                                <image class="w-100" id="w-icon"></image>
                                <div id="w-details"></div>
                                <div id="descWrap" style="display: none;">
                                    <span id="w-desc"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 text-center align-self-center">
                            <span class="fs-4 fw-bold">현재기온</span> <span class="fs-5"
                                                                         id="w-string"></span>
                        </div>
                    </div>
                    <div class="dropdown mt-3 border border-dark">
                        <a class="btn dropdown-toggle w-100 text-end" href="#"
                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            더보기 </a>
                        <div class="dropdown-menu w-100 text-center">
                            <div class="d-flex p-1 mx-3">
                                <div class="col-6">체감온도</div>
                                <div class="col-6 fs-" id="w-feels-like"></div>
                            </div>
                            <div class="d-flex p-1 mx-3 border-top border-dark">
                                <div class="col-6">풍속</div>
                                <div class="col-6" id="w-wind"></div>
                            </div>
                            <div class="d-flex p-1 mx-3 border-top border-dark">
                                <div class="col-6">습도</div>
                                <div class="col-6" id="w-humidity"></div>
                            </div>
                            <div class="d-flex p-1 mx-3 border-top border-dark">
                                <div class="col-6">미세먼지 농도</div>
                                <div class="col-6" id="w-dust"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-4 p-3 bg-white shadowWrap">
            <div class="d-flex">
                <div class="col-3"></div>
                <div class="col-6 text-center">
                    <i class="bi bi-chevron-left" id="prevBtn"
                       style="cursor: pointer;"></i> <span class="fs-4 fw-bold"
                                                           id="yearAndMonth"></span> <i class="bi bi-chevron-right"
                                                                                        id="nextBtn" style="cursor: pointer;"></i>
                </div>
                <div class="col-3 text-end pt-1">
                    <button class="btn rounded" onclick="onClickTodayBtn()">Today</button>
                </div>
            </div>
            <div id="calendar" style="height: 320px;"></div>
        </div>
    </div>

    <!-- right -->
    <div class="d-inline mt-3 ms-4 w-75">
        <div id="indexBanner" class="carousel slide shadowWrap"
             data-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#indexBanner"
                        data-bs-slide-to="0" class="active" aria-current="true"
                        aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#indexBanner"
                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#indexBanner"
                        data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100"
                         src="https://img.freepik.com/free-photo/corporate-businessmen-working-tablet-office_53876-97637.jpg?size=626&ext=jpg&ga=GA1.2.184464462.1689233557&semt=ais"
                         alt="First slide" style="object-fit: cover; height: 300px;">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                         src="https://img.freepik.com/free-photo/happy-young-asian-businessmen-businesswomen-meeting-brainstorming-ideas-about-new-paperwork-project_7861-3061.jpg?size=626&ext=jpg&ga=GA1.1.184464462.1689233557&semt=ais"
                         alt="Second slide" style="object-fit: cover; height: 300px;">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100"
                         src="https://img.freepik.com/free-photo/business-partners-handshake-global-corporate-with-technology-concept_53876-102615.jpg?size=626&ext=jpg&ga=GA1.1.184464462.1689233557&semt=ais"
                         alt="Third slide" style="object-fit: cover; height: 300px;">
                </div>
            </div>
            <button class="carousel-control-prev" data-bs-target="#indexBanner"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </button>
            <button class="carousel-control-next" data-bs-target="#indexBanner"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </button>
        </div>

        <div class="mt-4 w-100 shadowWrap">
            <div class="p-3">
                <div class="d-flex border-bottom pb-2">
                    <div class="col-3"></div>
                    <div class="col-6 text-center fs-3 fw-bold">공지</div>
                    <div class="col-3 text-end pe-4 pt-2">
                        <a href="<%=request.getContextPath()%>/boardnoticelist">전체보기</a>
                    </div>
                </div>
                <div class="d-flex fs-5 text-center border-bottom">
                    <div class="col-6">제목</div>
                    <div class="col-2">작성자</div>
                    <div class="col-3">일자</div>
                    <div class="col-1">조회수</div>
                </div>

                <c:forEach items="${boardNotice}" var="boardnotice">
                    <div class="d-flex py-2 text-center border-bottom">
                        <c:set var="trimmedTitleNotice" value="${fn:substring(boardnotice.BOARDNOTICETITLE, 0, 15)}"/>
                        <div class="col-6">
                            <a href="<%=request.getContextPath() %>/boardnoticeget?BOARDNOTICEID=${boardnotice.BOARDNOTICEID}" class="text-primary">
                                    ${trimmedTitleNotice}${fn:length(boardnotice.BOARDNOTICETITLE) > 15 ? '...' : ''}
                            </a>
                        </div>
                        <div class="col-2">${boardnotice.USERNAME}</div>
                        <div class="col-3">${boardnotice.BOARDNOTICEREGDATE}</div>
                        <div class="col-1">${boardnotice.BOARDNOTICECOUNT}</div>
                    </div>
                </c:forEach>



            </div>
        </div>

        <div class="mt-4 w-100 shadowWrap">
            <div class="p-3">
                <div class="d-flex border-bottom pb-2">
                    <div class="col-3"></div>
                    <div class="col-6 text-center fs-3 fw-bold">뉴스</div>
                    <div class="col-3 text-end pe-4 pt-2">
                        <a href="<%=request.getContextPath()%>/boardnewslist">전체보기</a>
                    </div>
                </div>
                <div class="d-flex fs-5 text-center border-bottom">
                    <div class="col-6">제목</div>
                    <div class="col-2">작성자</div>
                    <div class="col-3">일자</div>
                    <div class="col-1">조회수</div>
                </div>
                <!-- sample -->
                <c:forEach items="${boardNewsList}" var="boardnews">
                    <div class="d-flex py-2 text-center border-bottom">
                        <c:set var="trimmedTitleNews" value="${fn:substring(boardnews.BOARDNEWSTITLE, 0, 15)}"/>
                        <div class="col-6">
                            <a href="<%=request.getContextPath() %>/boardnewsget?BOARDNEWSID=${boardnews.BOARDNEWSID}" class="text-primary">
                                    ${trimmedTitleNews}${fn:length(boardnews.BOARDNEWSTITLE) > 15 ? '...' : ''}
                            </a>
                        </div>
                        <div class="col-2">${boardnews.USERNAME}</div>
                        <div class="col-3">${boardnews.BOARDNEWSREGDATE}</div>
                        <div class="col-1">${boardnews.BOARDNEWSCOUNT}</div>
                    </div>
                </c:forEach>


            </div>
        </div>
    </div>
</div>

<!-- toast -->
<script
        src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>

<script src="<%= request.getContextPath() %>/js/weather.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 캘린더를 생성하기 위해 tui-calendar 객체와 스타일 코드 삽입

    // TOAST Calendar
    const Calendar = tui.Calendar;
    var yearAndMonth = document.getElementById("yearAndMonth");
    const container = document.getElementById('calendar');
    const options = {
        defaultView: 'month',          // 캘린더가 초기에 그려지는 뷰 타입을 주간 뷰로 지정
        isReadOnly: true,
        month: {
            visibleWeeksCount: 0,
            workweek: false,
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            visibleEventCount: 0,
        },
        taskView: false,
        scheduleView: false,
    };

    const calendar = new Calendar(container, options);  // 캘린더 인스턴스 생성
    var date = calendar.getDate();
    yearAndMonth.innerText = date.getFullYear() + ". " + (date.getMonth() + 1);


    /* 이동 및 뷰 타입 버튼 이벤트 핸들러 */
    nextBtn.addEventListener('click', () => {

        function getCurrentYearAndMonth() {
            var date = calendar.getDate();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            return {
                year: year,
                month: month
            };
        }
        calendar.next();

        var currentYearAndMonth = getCurrentYearAndMonth();
        yearAndMonth.innerText = currentYearAndMonth.year + ". " + currentYearAndMonth.month;


    });

    prevBtn.addEventListener('click', () => {

        function getCurrentYearAndMonth() {
            var date = calendar.getDate();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            return {
                year: year,
                month: month
            };
        }

        calendar.prev();

        var currentYearAndMonth = getCurrentYearAndMonth();
        yearAndMonth.innerText = currentYearAndMonth.year + ". " + currentYearAndMonth.month;
    });
    //today button
    function onClickTodayBtn() {
        calendar.today();

        var date = calendar.getDate();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;

        yearAndMonth.innerText = year + ". " + month;
    }

    //작업-추가
    // bootstrap popover 초기화
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl, {
            content: function () {
                const descWrap = document.querySelector('#descWrap');
                return descWrap.innerText || descWrap.textContent;
            }
        })
    });

</script>
<%@ include file="./common/footer.jsp" %>
</body>
</html>