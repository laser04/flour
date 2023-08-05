<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common/tag.jsp"%>
<%@ include file="../common/Auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>밀가루였다</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <sec:csrfMetaTags/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jdenticon@3.1.0/dist/jdenticon.min.js" async
            integrity="sha384-VngWWnG9GS4jDgsGEUNaoRQtfBGiIKZTiXwm9KpgAeaRn6Y/1tAFiyXqSzqC8Ga/" crossorigin="anonymous">
    </script>
    <style>
        .container {
            max-width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${error ne null}">
        <!-- 에러 페이지를 호출하도록-->
        <div class="py-5 text-center">
            <p class="lead">가입</p>
            <div class="alert alert-danger" role="alert">${error}</div>
            <p class="lead">${email}</p>
        </div>
    </c:if>
    <c:if test="${error eq null}">
        <div class="py-5 text-center">
            <p class="lead">가입</p>
            <h2>
                서비스를 사용하려면 인증 이메일을 확인하세요
            </h2>
            <p>${email}</p>
            <a href="/resend-confirm-email"><button id="send-email" class="btn btn-info" type="button">인증 이메일 다시 보내기</button></a>
        </div>
    </c:if>
</div>
</body>
</html>
