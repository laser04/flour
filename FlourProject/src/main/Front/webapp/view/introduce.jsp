<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- toast -->
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
        <!-- 반응형 설정 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <style type="text/css">

           </style>
            </head>
            
            <body>
            	<div class="jumbotron text-center">
          		  <h1 class="display-4 mt-5">Introduce</h1>         			
           		 <hr class="my-4 w-75 mx-auto">
        		</div>
        		<div class="first-link">
           			 <a href="#first-paragraph">Go to the bottom paragraph</a>
        		</div>
        		<div class="second-link">
           			 <a href="#second-paragraph">Go to the bottom paragraph</a>
        		</div>
                <div class="test mx-auto" style="width:1350px;">
                   
                    <div id="first-paragraph" class="rounded mt-5" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
                    	<button id="editBtn" class="btn btn-primary" onclick="editBoard()">수정하기</button>
                        <div class="fs-1 my-3 text-warning text-end" data-aos="zoom-in" data-aos-duration="1000">우리 회사만의 노하우로 만든 밀가루, 단 하나뿐인 맛을 느껴보세요</div>                    
                        <!-- 첫번째 -->
                        <div class="d-flex flex-column mx-1 my-3">
                        	<div class="d-flex flex-row justify-content-between">
		                         <div class="col-6" data-aos="fade-left" data-aos-duration="2000"
		                          style="background-image: url('../resources/img/introduce/연구사진1.jpg'); background-size: 70%;
		                          background-repeat: no-repeat; background-position: center; border-radius: 15px;">
		                			<!-- 이미지를 보여주기 위한 빈 div -->
		           				 </div>                                  	
	                             <div class="col-6 ms-auto w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-right" data-aos-duration="2000" style="background-color: #F1F3F4; border-radius: 15px;">
	                               	 우리 회사는 오랜 경험과 지식, 끊임없는 연구와 개발을 통해, 오직 우리 회사에서만 제조할 수 있는 노하우를 창출하고 있습니다.
	                               	 이 노하우는 단순히 밀가루의 품질을 높이는 일에 그치지 않습니다. 저희 회사의 노하우는 오랜 기간 동안 고객의 요구에 부응하며 매 순간 매 순간 진화하고 있습니다.
	                               	 우리 회사의 밀가루는 특히 다른 곳에서 볼 수 없는 고유한 맛과 향을 가지고 있습니다.
	                               	 이 맛과 향은 모두 오직 우리 회사의 노하우로 만들어졌으며, 우리 회사에서 만들어진 밀가루만이 단 하나뿐인 맛을 지니고 있습니다.
	                               	 이러한 고유한 맛은 고객들의 다양한 요리와 제품들에 높은 만족도를 제공합니다. 우리 회사의 밀가루는 밀가루 본연의 맛과 향을 중시하는 데에 주력을 하고 있습니다.
	                               	 그래서 인공적인맛을 구성하는 첨가물, 개조식품, 화학적 처리, 유전자 조작 등은 결코 사용하지 않습니다.
	                            </div>
                            </div>
                            <div class="d-flex flex-row justify-content-between">
                            	<div class="col-6" data-aos="fade-right" data-aos-duration="2000"
		                          style="background-image: url('../resources/img/introduce/연구사진1.jpg'); background-size: 70%;
		                          background-repeat: no-repeat; background-position: center; border-radius: 15px;">
		                			<!-- 이미지를 보여주기 위한 빈 div -->
		           				 </div> 
                             	<div class="col-6 ms-auto w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-left" data-aos-duration="2000" style="background-color: #F1F3F4; border-radius: 15px;">   	 
                               	 대신 토지와 환경, 시간과 작물, 이들을 관리하는 기술적 노하우를 통해 자연스럽게 재배되고 가공되어 최대한 맛과 영양을 지니고 있습니다.
                               	 우리 회사에서 만들어진 밀가루는 항상 최고의 품질을 유지하고 있습니다. 이는 밀가루를 만드는 전 과정에서 철저한 관리와 검사를 실시하기 때문입니다.
                               	 모든 밀가루는 유통까지 완벽한 관리 아래에서 저장되며, 제품별로 매번 심사를 거쳐 최고 품질을 유지하고 있습니다.
                               	 실제로 우리 회사의 밀가루는 수많은 고객들로부터 높은 평가를 받고 있습니다.
                             	</div>
                            </div>
                            <div class="d-flex flex-row justify-content-between">
                            	<div class="col-6" data-aos="fade-left" data-aos-duration="2000"
		                          style="background-image: url('../resources/img/introduce/연구사진1.jpg'); background-size: 70%;
		                          background-repeat: no-repeat; background-position: center; border-radius: 15px;">
		                			<!-- 이미지를 보여주기 위한 빈 div -->
		           				 </div>
		           				  
                             	 <div class="col-6 ms-auto w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-right" data-aos-duration="2000" style="background-color: #F1F3F4; border-radius: 15px;">
                               	 우리 회사에서만 제조할 수 있는 특별한 맛과 향 속에는, 고유한 노하우로 제조한 밀가루의 맛미를 최대한 끌어낸 결과가 담겨져 있습니다.
                               	 이것이 바로 밀가루의 진가이며, 저희 회사의 밀가루 만의 가치입니다. 위에서 언급한 대로, 우리 회사에서 만들어진 밀가루는 오직 우리 회사의 노하우로만 만들어질 뿐,
                               	 다른 밀가루와는 완전히 다른 가치를 지니고 있습니다. 고유한 맛과 향을 지니게 된 이유는 우리 회사에서의 끊임없는 연구와 개발, 고객과의 원활한 소통 및 서비스,
                               	 최신 제조 설비와 첨단 기술 등이 융합되어 완성된 결과물입니다. 앞으로도 우리 회사는 이러한 노하우를 바탕으로 더욱더 나은 밀가루를 만들어내기 위해 더욱 노력할 것입니다.
                           	 	</div>  
                           	</div>                                                             
                        </div>
                    </div>
                     <!-- 2번째 -->
                     <div id="second-paragraph" class="rounded mt-5 mx-2" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
                     <button  id="editBtn" class="btn btn-primary" onclick="editBoard()">수정하기</button>
                        <div class="fs-1 my-3 ms-5 text-warning" data-aos="zoom-in" data-aos-duration="1000">건강한 먹거리, 자연 그대로의 맛을 담은 밀가루!</div>
                        <div class="text-wrap w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-right" data-aos-duration="2000">
                            	저희 회사는 건강에 대한 관심과 사랑을 담아,더욱 건강하고 맛있는 밀가루를 제조하고 있습니다.
                            	식생활이 바쁘고 불규칙해진 요즘날,건강한 먹거리는 필수적입니다.
                            	많은 연구와 시행착오를 거쳐,저희는 건강에 필수적인 영양소와 더불어,식물성 섬유질,미네랄,비타민 등 다양한 영양소를 함유한 밀가루를 만들어 내었습니다.
                            	우리가 몸에 필요한 영양소들은 주로 채소나 과일 등에 함유되어 있습니다.
                            	그러나 밀가루는 우리가 일상적으로 먹는 빵,떡,피자 등의 바탕이 되어,매일 우리의 식단에 등장합니다.
                            	이에 밀가루를 보다 건강하고 맛있게 만들고자,저희 회사는 항상 최신 연구결과와 고객의 요구사항에 귀 기울이며,끊임없이 개발하고 있습니다.
                        </div>
                        <div class="text-wrap w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-left" data-aos-duration="2000">    	
                            	저희의 밀가루는 천연 발효종을 사용하며,인공첨가물이 전혀 들어가지 않습니다.
                            	또한,재배와 수확에서부터 제조,유통에 모두 우수한 품질관리를 실시하고 있습니다.
                            	이처럼 건강한 소재와 최선의 노하우를 결합해 제조한 밀가루는 건강에 대한 새로운 인식과 요구사항에 맞추어,소비자들에게 큰 호응을 얻고 있습니다.
                            	또한,저희 회사는 단순히 건강을 대표하는 밀가루로써 끝나지 않고,그 안에 담겨있는 자연의 맛과 향을 중요시합니다.
                        </div>
                        <div class="text-wrap w-50 ms-5 my-3 fs-5 lh-lg" data-aos="fade-right" data-aos-duration="2000">    	
                            	밀가루 뿐만 아니라,제품을 만들어 내는 과정에서 사용되는 재료들까지도 모두 철저하게 관리하여,
                            	밀가루에 담긴 자연 그대로의 맛을 소비자들이 즐길 수 있도록 하고자 노력하고 있습니다. 많은 소비자들이 우수한 품질의 밀가루를 찾아 사용하고 있는 지금,
                            	저희 회사는 건강과 맛의 측면에서 소비자 선호도가 높은 밀가루를 만들어내고 있습니다.
                            	앞으로도 저희 회사는 유통과 사용에 있어 안전한 제품을 출시함은 물론,품질의 지속적 향상을 위해 노력하고 계속해서 발전하겠습니다.
                        </div>
                    </div>
                    <!-- 3번째   -->
                    <div class="rounded mt-5 mx-2" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);">
                    <button  id="editBtn" class="btn btn-primary" onclick="editBoard()">수정하기</button>
                        <div class="fs-1 my-3 text-warning text-center">경영철학</div>
                        <div class="text-center" data-aos="fade-up"
                        data-aos-duration="2000">
                            <img class="w-75" src="https://i.pinimg.com/564x/46/0a/74/460a74f329368971572ab531b71ba012.jpg"
                            style="box-shadow: 0 0 50px 10px #C6C6C6;"
                            >
                        </div>
                    </div>
                </div>
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <script>
                    AOS.init();
                    
                    function editBoard() {
                    	window.location.href ='http://localhost:8080/biz/view/visionRegister.jsp';
                    }
                </script>
            </body>
            </html>