<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#table-board a {
			text-decoration: none;
			color:#0DCAF0;
		}
		
		#table-board td {
			vertical-align: middle;
			padding: 10px;
			font-weight: bolder
		}
		
		/*페이징 */
		#page {
  			display: flex;
 		    margin-left:550px;
 		    font-size: 22px;
				}

		#page div {
  			margin: 0 10px;		  
			}
		
	</style>
</head>
<body>
	<div class="mx-auto" style="width: 1350px;">
		<div class="w-100"
			style="
                background-image: url('<%=request.getContextPath()%>/resources/img/freeBoard/FreeBoard.png');
                height:300px;"></div>
		<div class="mx-auto bg-white rounded mt-5 p-5" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
			<div class="d-flex justify-content-between mx-auto"
				style="width: 90%;">
				<div class="text-info fs-2 fw-bolder">자료실</div>
				
				<form action="/achieve/board/search/" 
				name="frm1" method="get">
				<div class="d-flex col-8 align-bottom justify-content-end"
               style="width: 400px; height: 40px;">
					<select class="form-select w-25" name="searchCondition">
						<option value="boardTitle" selected>제목</option>
						<option value="userName">작성자</option>
					</select> <input type="text" class="form-control w-50" name="searchKeyword">
					<button class="btn" onclick="document.forms.frm1.submit()">
						<i class="bi bi-search"></i>
					</button>
				</div>
				</form>
				
			</div>
			<div class="mx-auto mt-4" style="width: 90%;">
				<table id="table-board"
					class="table-bordered border-dark w-100 text-center">
					<tr class="bg-secondary bg-opacity-10 fw-bolder">			
						<td style="width:40%">제목</td>
						<td style="width:15%">작성자</td>
						<td style="width:20%">작성일</td>
						<td style="width:5%">조회수</td>
					</tr>
					<!-- sample -->
					
					<c:forEach items="${boardList}" var="board">
						<tr>
							
						<td class="text-start"><a href="/achieve/board/read/${board.boardId}">${board.boardTitle}</a></td>
						<td>${board.userName}</td>
						<td>${board.boardRegDate}</td>
						<td>${board.boardCount}</td>
							
						</tr>
					</c:forEach>
					
				</table>
				<div class="mt-4 text-end">
					<button class="btn btn-info fs-5 fw-bold px-3" onclick="boardinsert()" >글쓰기</button>
				</div>
			</div>
		</div>
		
		<!--페이지 출력  -->
		<div id="page">
		
		
		<c:if test="${startPage > pageblock}">
			<div>
			<a href="/achieve/board/search?pageNum=${startPage-pageblock}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">&lt;back
			</a></div><br><br>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
  			<div>
  			<a href="/achieve/board/search?pageNum=${i}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">${i}</a>
  			</div>
		</c:forEach>
		
		<c:if test="${endPage < pageCount }">
		<br><br><div><a 
			href="/achieve/board/search?pageNum=${startPage+pageblock}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">next&gt;
		</a></div>
		</c:if>
		
		</div>
			</div>

	<script type="text/javascript">
		const biStar = document.getElementsByClassName("bi-star");
		Array.from(biStar).forEach(function(e){
			var i = 0;
		    e.addEventListener("click", function(){
		    	if(i==0){
			        this.setAttribute("class", 'bi bi-star-fill fs-4 text-warning');
			        i--;
		    	}else{
		    		this.setAttribute("class", 'bi bi-star fs-4 text-warning');
		    		i++;
		    	}
		    });
		});
		
		/*Board_insert로 이동만  */
		function boardinsert() {
	        window.location.href = "/achieve/board/write/";
	    }
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>

