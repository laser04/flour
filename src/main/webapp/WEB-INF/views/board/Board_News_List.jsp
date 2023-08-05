<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp" %>
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
            <div class="text-info fs-2 fw-bolder">뉴스</div>
            
            <form action="<%=request.getContextPath() %>/boardnewslist/search" 
            name="frm1" method="get">
            <div class="d-flex col-8 align-bottom justify-content-end"
               style="width: 400px; height: 40px;">
               <select class="form-select w-25" name="searchCondition">
                  <option value="BOARDNEWSTITLE" selected>제목</option>
                  <option value="USERNAME">작성자</option>
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
               
            <c:forEach items="${boardNewsList}" var="boardnews">
               <tr>
                  
                  <td class="text-start"><a href="<%=request.getContextPath() %>/boardnewsget?BOARDNEWSID=${boardnews.BOARDNEWSID}">${boardnews.BOARDNEWSTITLE}</a></td>
                  <td>${boardnews.USERNAME}</td>
                  <td>${boardnews.BOARDNEWSREGDATE}</td>
                  <td>${boardnews.BOARDNEWSCOUNT}</td>
                  
               </tr>
               </c:forEach>
               
            </table>
         </div>
      </div>
      
      <!--페이지 출력  -->
      <div id="page">
      
      <c:if test="${startPage > pageblock}">
         <div>
         <a href="<%=request.getContextPath() %>/boardnewslist?pageNum=${startPage-pageblock}">&lt;back
         </a></div><br><br>
      </c:if>
      
      <c:forEach var="i" begin="${startPage}" end="${endPage}">
           <div>
           <a href="<%=request.getContextPath() %>/boardnewslist?pageNum=${i}">${i }</a>
           </div>
      </c:forEach>
      
      <c:if test="${endPage < pageCount }">
      <br><br><div><a 
         href="<%=request.getContextPath() %>/boardnewslist?pageNum=${startPage+pageblock}">next&gt;
      </a></div>
      </c:if>
      
      </div>
         </div>

   <script type="text/javascript">
      
      /*Board_insert로 이동만  */
      function boardnewsinsert() {
           window.location.href = "<%=request.getContextPath()%>/moveboardnewsinsert";
       }
   </script>
   <%@ include file="../common/footer.jsp" %>
</body>
</html>