<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- toast -->
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
        <style>
			.fs-1 {
		        font-size: 36px;
		        font-weight: bold;	        
		    }
		    .text-warning {
		        color: #FFC107;
		    }
		     .second-link a {
		        color: #FFC107;
		        font-weight: bold;
		        text-decoration: none;
		    }
		    
		    .second-link a:hover {
		        color: #FFA000;
		    }
		    	     .first-link a {
		        color: #FFC107;
		        font-weight: bold;
		        text-decoration: none;
		    }
		    
		    .first-link a:hover {
		        color: #FFA000;
		    }
		    /* history */
		    .timeline {
		      display: flex;
		      flex-direction: column;
		      align-items: center;
		      font-family: Arial, sans-serif;
		    }
		
		    .year {
		      position: relative;
		      padding: 20px 0;
		      font-size: 24px;
		      font-weight: bold;
		      color: #333;
		    }
		
		    .year::before {
		      content: "";
		      position: absolute;
		      top: 50%;
		      left: 175px;
		      transform: translateY(-50%);
		      width: 70px;
		      height: 3px;
		      background-color: #333;
		    }
		
		    .year-content {
		      display: flex;
		      flex-direction: column;
		      align-items: center;
		      max-width: 300px;
		      margin-top: 10px;
		      padding: 10px;
		      text-align: center;
		      background-color: #F7F7F7;
		      border-radius: 4px;
		      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
		    }
		
		    .timeline:last-child .year::before {
		      display: none;
		    }
		
		    .achievement {
		      margin-top: 10px;
		      color: #666;
		    }
           </style>
            </head>
            
            <body>
            	<div class="jumbotron text-center">
          		  <h1 class="display-4 mt-5" style="color:#FFE491; font-weight: bold;">Introduce</h1>         			
           		 <hr class="my-4 w-75 mx-auto">
        		</div>
        		
        		<!-- <div class="first-link">
           			 <a href="#first-paragraph">Go to the bottom paragraph</a>
        		</div>
        		<div class="second-link">
           			 <a href="#second-paragraph">Go to the bottom paragraph</a>
        		</div> -->
                <div class="test mx-auto" style="width:1600px;">
                   
                    <div id="first-paragraph" class="rounded mt-5" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1); ">
                    	<button id="editBtn" class="btn btn-primary" onclick="editBoard()">수정하기</button>
                        <!-- 첫번째 -->
                        <div class="d-flex flex-column mx-1 my-3">
                        	<div class="d-flex flex-row justify-content-between">
		                         <div class="col-4 text-warning text-center" style="font-size: 40px; font-weight: bold;">
		                      	   회사소개
		           				 </div>
	                             <div class="col-6 ms-auto w-50  ms-5 fs-5 lh-lg" data-aos="fade-right" data-aos-duration="2000" style="background-color: #fefbf5; border-radius: 15px; margin-bottom: 140px;">
	                               	
	                               	<div style="font-size: 18px; font-weight: bold;">&nbsp;밀가루였다는 밀가루 제조 및 가공 분야에서 새로운 도전과 열정을 가지고 있는 기업입니다. </div>
	                               	<br>
	                               	<div style="font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp;밀가루였다는 계속해서 성장하며 혁신을 추구하는 스타트업으로서,
	                               		 우리는 밀가루 산업에서 새로운 표준을 세우고자 합니다.
	                               		 <br>
	                               		  &nbsp;&nbsp;&nbsp;&nbsp;▷ &nbsp;저희는 고객님들의 요구에 부응하며, 지속적인 혁신을 통해 밀가루 산업의 선두 주자로서 도약할 것입니다.<br>
	                               		  &nbsp;&nbsp;&nbsp;&nbsp;▷&nbsp;저희는 고객님들에게 최고 품질의 밀가루를 제공하기 위해 철저한 품질 관리와 혁신적인 제조 방법을 추구합니다.<br>
	                               		  &nbsp;&nbsp;&nbsp;&nbsp;▷&nbsp;저희의 열정과 도전은 미래에도 계속해서 성장하고 발전하는 우리 기업의 핵심 가치입니다. 
	                                </div>
	                               	
	                            </div>
                            </div>
                            <hr style="width: 70%; opacity: 0.2;">
                            <div class="col-4 text-warning text-center" style="font-size: 40px; font-weight: bold;">CI</div>
                            <div class="d-flex flex-row justify-content-between" style="margin-bottom: 150px;">
                            	 <div class="col-4"
		                          style="background-image: url('../resources/img/common/logo.png'); background-size: 50%;
		                          background-repeat: no-repeat; background-position: center; border-radius: 15px;">
		                			<!-- 이미지를 보여주기 위한 빈 div -->
		           				 </div>   
                             	<div class="col-6 ms-auto w-50 ms-5 fs-5 lh-lg" data-aos="fade-left" data-aos-duration="2000" style="background-color: #fefbf5; border-radius: 15px;">   	 
                               		<div style="font-size: 15px; margin-left: 15px;">&nbsp;&nbsp;밀가루였다는 기업의 핵심 가치와 정체성을 대표하는 상징입니다.
                               		밀가루의 향기와 부드러움을 상징하는 곡물 심볼과 함께 혁신과 창의성을 나타내는 현대적인 로고마크로 구성되어 있습니다.
                               		자칫 단순해보일 수 있는 이 CI는 고객님에게 있는 그대로의 자연을 선물해드리고 싶은 마음을 전달하고자 합니다.
                               		지속적인 발전과 성장을 상징하며, 우리가 밀가루 산업에서 지속적인 선두 주자로서 나아가기 위한 약속을 담고 있습니다.
                             		</div>
                             		<div>
									  <a href="path/to/ci_file.pdf" download>
									    <button class="btn" style="text-decoration: underline; opacity: 0.6; margin-left: 10px;">CI Download</button>
									  </a>
									</div>
                             	</div>
                            </div>
                            <hr style="width: 70%; opacity: 0.2;">
                            <div class="d-flex mb-5 flex-row justify-content-between">
                            	 <div class="col-4 text-warning text-center" style="font-size: 40px; font-weight: bold; " >
		                      	  <p>HISTORY<p>
		           				 </div>  
		                          <div class="timeline" data-aos="fade-left" data-aos-duration="2000">
						    <div class="year">2004</div>
						    <div class="year-content" style="background-color: #fefbf5; width: 75%">
						      <div class="achievement">▷온라인 교육사이트"i-choongang"오픈 </div>
						      <div class="achievement">▷MOS 공인시험센터 지정 </div>
						      <div class="achievement">▷종소기업청 "청년채용패키지사업" 교육훈련 시설 </div>
						    </div>
						  </div>
						
						  <div class="timeline" data-aos="fade-left" data-aos-duration="2000">
						    <div class="year">2010</div>
						    <div class="year-content"  style="background-color: #fefbf5; width: 75%">
						      <div class="achievement">▷잡코리아 기업멤머스 MOU 체결 </div>
						      <div class="achievement">▷한국IBM과 전략적 교육협력 체결 및 공인 교육센터 지정 </div>
						      <div class="achievement">▷오라클 최우수 교육 파트너 "ORACLE Best Awards" 수상 </div>
						    </div>
						  </div>
						
						  <div class="timeline" data-aos="fade-left" data-aos-duration="2000">
						    <div class="year">2022</div>
						    <div class="year-content" style="background-color: #fefbf5; width: 75%">
						      <div class="achievement">▷한국SW산업협회 벤처･스타트업 아카데미 K-디지털 트레이닝 훈련기관 선정 </div>
						      <div class="achievement">▷고용노동부, 서울지역 인적자원개발위원회 산업구조변화대응 특화훈련과정 선정</div>
						      <div class="achievement">▷명지대학교 청년친화형 기업ESG 지원사업 “비전공자 대상 인공지능 산업이해 직무체험” 학점인정 협약체결</div>
						    </div>
						  </div>  
		           		</div>
		           		<hr style="width: 70%; opacity: 0.2;">
		           		<div class="d-flex mb-5 flex-row justify-content-between">
                            	 <div class="col-4 text-warning text-center" style="font-size: 40px; font-weight: bold; " >
		                      	  <p>Location<p>
		           				 </div>
		           				 <div class="col-6 ms-auto w-50 ms-5 fs-5 lh-lg" data-aos="fade-left" data-aos-duration="2000" style="background-color: #fefbf5; border-radius: 15px;">   	 
                               		<div id="map" style="width: 500px; height: 400px;"></div>
                             	 </div> 
                      </div>                                                             
                    </div>
                   
                     <!-- 2번째 
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
                    -->
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
                </div>
                <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                <script>
                    AOS.init();
                    
                    function editBoard() {
                    	window.location.href ='http://localhost:8080/biz/view/visionRegister.jsp';
                    }     
                </script>
               <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bbc1fa75307d55b3cfc86bba114b9bb"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				</script>
				<%@ include file="../common/footer.jsp"%>
            </body>
            </html>