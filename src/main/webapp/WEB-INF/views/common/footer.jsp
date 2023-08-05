<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <style type="text/css">
        #footer-body{
            font: 'IBM Plex Sans R', sans-serif;
        }

        #footer-body > p {
            line-height: 20px;
        }

        #footer-body > img {
            width: 15px;
            height: 15px;
        }

        .footer-container {
            display: flex;
            justify-content: center;
            background-color: whitesmoke;
            color: #000; /* 검정 */
            width: 100%; /* 전체 너비로 변경 */
            max-height: 235px;
            margin-top: 80px;
        }

        .footer {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            max-width: 1350px; /* 원래의 컨테이너 너비로 변경 */
            margin: 0 auto;
            background-color: whitesmoke;
            color: #000;
            padding: 1rem 0;
        }

        .footer-heading {
            display: flex;
            flex-direction: column;
            margin-right: 4rem; /* 수정: 너무 큰 간격 조정 */
            margin-bottom: 2rem; /* 추가: 아이템 간 간격 조정 */
        }
        .footer-heading p {
		  margin-bottom: 0; /* p 요소의 아래 여백을 없애줍니다 */
		}
		
		.footer-heading img,
		.footer-heading p {			
		  max-height: 100%;	/*.footer-heading 내부 요소의 높이를 제한하여 넘침 방지 */
		}

        .footer-heading h2 {
            margin-bottom: 1rem;
            font-size: 16px;
        }

        .footer-heading a {
            color: #000;
            text-decoration: none;
            margin-bottom: 0.9rem;
        }

        .footer-heading a:hover {
            color: gray;
            transition: 0.1s ease-out;
        }

        .footer-email-form h2 {
            margin-bottom: 2rem;
        }

        #footer-email {
            width: 250px;
            height: 40px;
            border-radius: 4px;
            outline: none;
            border: none;
            padding-left: 0.5rem;
            font-size: 15px;
            margin-bottom: 1rem;
        }

        #footer-email::placeholder {
            color: #b1b1b1;
        }

        #footer-email-btn {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            background-color: #ebd82f;
            outline: none;
            border: none;
            color: #000;
            font-size: 18px;
        }

        #footer-email-btn:hover {
            cursor: pointer;
            background-color: #F9423D;
            transition: all 0.1s ease-out;
        }

        .icon {
            width: 30px;
            height: 30px;
        }

        .icon-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 3rem;
            margin-bottom: 1rem;
        }

        .icon2 {
            width: 60px;
            height: 60px;
            transition: transform 0.3s ease;
        }

        .icon2:hover {
            transform: scale(2); /* 크기 확대 */
        }

        .icon-container_t {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 0rem;
            margin-bottom: 1rem;
        }

        .icon-text-container {
            display: flex;
            align-items: center;
            margin-bottom: 0.9rem;
            font-size: 15px; /* 글자 크기 수정 */
        }

        /* 추가: footer-table 클래스 스타일 */
        .footer-table {
            position: relative;
        }

        .footer-table table {
            position: absolute;
            top: -20px;
        }
    </style>

<div id="footer-body">
	<footer class="footer-container">
	    <div class="footer">
	        <div class="footer-heading footer-1">
	            <h2>주소</h2>
	            <div class="icon-text-container">
	                <img alt="" src="/img/common/location.png" width="25px;">&nbsp;&nbsp;&nbsp;
	                <p>서울특별시 마포구 신촌로 176 4층 401호</p>
	            </div>
	            <div class="icon-text-container">
	                <img alt="" src="/img/common/phone.png" width="25px;">&nbsp;&nbsp;&nbsp;
	                <p>031-345-7889</p>
	            </div>
	            <div class="icon-text-container">
	                <img alt="" src="/img/common/email.png" width="25px;">&nbsp;&nbsp;&nbsp;
	                <p>project@test.com</p>
	            </div>
	            
	            <p style="font-size:12px;">&copy; 2023.exam. All rights reserved</p> <!-- 수정: 텍스트 수정 -->
	        </div>
	        <div class="footer-heading footer-2">
	            <h2>관련링크</h2>
	            <div class="icon-container">
	                <a href="http://twitter.com" target="_blank"><img alt="" src="/img/common/Twitter.png" class="icon"></a>
	                <a href="http://Youtube.com" target="_blank"><img alt="" src="/img/common/Youtube.png" class="icon"></a>
	                <a href="http://GitHub.com" target="_blank"><img alt="" src="/img/common/GitHub.png" class="icon"></a>
	                <a href="http://Facebook.com" target="_blank"><img alt="" src="/img/common/Facebook.png" class="icon"></a>
	                <a href="http://LinkedIn.com" target="_blank"><img alt="" src="/img/common/LinkedIn.png" class="icon"></a>
	                <a href="http://Google.com" target="_blank"><img alt="" src="/img/common/Google.png" class="icon"></a>
	            </div>
	        </div>
	        <div class="footer-heading footer-3">
	            <h2>내부전경</h2>
	            <div class="icon-container_t">
	                <img alt="" src="/img/common/사무실1.png" class="icon2">
	                <img alt="" src="/img/common/사무실2.png" class="icon2">
	                <img alt="" src="/img/common/사무실3.png" class="icon2">
	                <img alt="" src="/img/common/사무실4.png" class="icon2">
	                <img alt="" src="/img/common/사무실5.png" class="icon2">
	                <img alt="" src="/img/common/사무실6.png" class="icon2">
	            </div>
	        </div>
	        <div class="footer-heading footer-4">
	            <h2>이메일 뉴스레터</h2>
	            <form class="footer-email-form">
	                <input type="email" id="footer-email" placeholder="이메일 주소 입력">
	                <input type="submit" value="구독하기" id="footer-email-btn">
	            </form>
	        </div>
	    </div>	    
	</footer>
</div>
