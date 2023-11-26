<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  <!-- END nav -->
    <div class="hero-wrap js-fullheight" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-11 ftco-animate text-center">
             <h1 class="mb-4" style="color:aliceblue">반려동물과 늘 함께하는<br>PET <span>Two</span>GETHER </h1>
             <c:if test="${empty auth}">
            <p><a href="/petwogether/member/login" class="btn btn-primary mr-md-4 py-3 px-4">로그인 <span class="ion-ios-arrow-forward"></span></a></p>
             </c:if>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light ftco-no-pt ftco-intro">
       <div class="container">
          <div class="row">
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
                  <span class="flaticon-blind"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">반려 동물 서비스</h3>
                <p>PeTwoGether가 보장하는 펫 시터들에게 반려동물들을 믿고 맡겨보세요!</p>
                <p>실내 놀이, 매일 산책, 퍼피 케어, 노견 케어 등의 서비스를 제공합니다</p>
                <a href="/petwogether/member/careserviceintro" class="btn-custom d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i><i class="sr-only">Read more</i></a>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
                  <span class="flaticon-dog-eating"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">의료 정보</h3>
                <p>PeTwoGether가 알려주는 반려동물 의료 정보!</p>
                <p>전문가들이 알려주는 알아두면 쓸모가 있는 기초 의료정보들 </p>
                
                <a href="#" class="btn-custom d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i><i class="sr-only">Read more</i></a>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
                  <span class="flaticon-grooming"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">사지말고 입양하세요</h3>
                <p>PeTwoGether는 세상에 잊혀져가는 유기동물들을 세상에 알리고 소중한 가족을 찾아주는 플랫폼입니다</p>
                <a href="#" class="btn-custom d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i><i class="sr-only">Read more</i></a>
              </div>
            </div>      
          </div>
        </div>
       </div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
       <div class="container">
          <div class="row d-flex no-gutters">
             <div class="col-md-5 d-flex">
                <div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(<%=request.getContextPath()%>/resources/images/about-1.jpg);">
                </div>
             </div>
             <div class="col-md-7 pl-md-5 py-md-5">
                <div class="heading-section pt-md-5">
               <h2 class="mb-4">Pet TwoGether가 제공하는 서비스</h2>
                </div>
                <div class="row">
                   <div class="col-md-6 services-2 w-100 d-flex">
                      <div class="icon d-flex align-items-center justify-content-center" ><span class="flaticon-stethoscope"></span></div>
                      <div class="text pl-3">
                         <h4>실내놀이</h4>
                         <p>터그놀이, 노즈워크 등등 </p>
                      </div>
                   </div>
                   <div class="col-md-6 services-2 w-100 d-flex">
                      <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-customer-service"></span></div>
                      <div class="text pl-3">
                         <h4>매일산책</h4>
                         <p>산책 및 실외 배변 가능</p>
                      </div>
                   </div>
                   <div class="col-md-6 services-2 w-100 d-flex">
                      <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-emergency-call"></span></div>
                      <div class="text pl-3">
                         <h4>퍼피 케어</h4>
                         <p>1년 미만 퍼피 돌봄 가능</p>
                      </div>
                   </div>
                   <div class="col-md-6 services-2 w-100 d-flex">
                      <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-veterinarian"></span></div>
                      <div class="text pl-3">
                         <h4>노견 케어</h4>
                         <p>8년 이상 노견 돌봄 가능</p>
                      </div>
                   </div>
                </div>
           </div>
        </div>
       </div>
    </section>

    <section class="ftco-counter" id="section-counter">
       <div class="container">
            <div class="row">
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="${mCnt }">0</strong>
              </div>
              <div class="text">
                 <span>고객 수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="${psCnt }">0</strong>
              </div>
              <div class="text">
                 <span>펫 시터 수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="${aCnt }">0</strong>
              </div>
              <div class="text">
                 <span>전문가 수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="${psrCnt }">0</strong>
              </div>
              <div class="text">
                 <span>후기 수</span>
              </div>
            </div>
          </div>
        </div>
       </div>
    </section>
    
    <section class="ftco-section testimony-section" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');">
       <div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>Pet TwoGether 돌봄 서비스 후기</h2>
          </div>
        </div>
        
        <div class="row ftco-animate">       
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              
              <c:forEach items="${psrList }" var="dto" begin="0" end="15" step="1" varStatus="status">
              <div class="item">
                <div class="testimony-wrap py-4">
                   <div class="icon d-flex align-items-center justify-content-center"><i class="fa fa-quote-left"></i></div>
                  <div class="text">
                    <p class="mb-4" style="color:#F8A1A4;" onclick="location.href='/petwogether/member/psreview?psrseq=${dto.psrseq}&mseq=${dto.mseq}';"> ${dto.psrtitle} </p>
                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(<%=request.getContextPath()%>/resources/images/petsitter/${psList[status.index].psfile}"></div><!-- 돌봄 맡겼던 펫 시터 파일 -->
                       <div class="pl-3">
                          <p class="name" style="color:#F8A1A4;">${psList[status.index].psname}</p>
                          <p class="name" style="font-size: 15px;">${psList[status.index].pscareer}</p>
                          <p class="name" style="font-size: 15px;">${psList[status.index].pslicense}</p>
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
    </section>

    <section class="ftco-section bg-light">
       <div class="container">
          <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>돌봄 서비스 이용 가격</h2>
          </div>
        </div>
          <div class="row">
             <div class="col-md-4 ftco-animate">
             <div class="block-7">
                <div class="img" style="background-image: url(<%=request.getContextPath()%>/resources/images/pricing-1.jpg);"></div>
               <div class="text-center p-4">
                  <span class="excerpt d-block">Basic</span>
                  <span class="price"><sup><i class="fa-solid fa-won-sign"></i></sup> <span class="number" style="font-size: 3.2rem;">30,000</span></span>
               
                  <ul class="pricing-text mb-5">
                  <li style="background-color: white;"></li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>실내 놀이</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>매일 산책</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>약물 복용</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>목욕 가능</li>
                  </ul>

                  
               </div>
             </div>
           </div>
           <div class="col-md-4 ftco-animate" >
             <div class="block-7">
                <div class="img" style="background-image: url(<%=request.getContextPath()%>/resources/images/pricing-2.jpg);"></div>
               <div class="text-center p-4">
                  <span class="excerpt d-block">Basic+</span>
                  <span class="price"><sup><i class="fa-solid fa-won-sign"></i></sup> <span class="number" style="font-size: 3.2rem;">40,000</span> </span>
                  
                  <ul class="pricing-text mb-5">
                  <li style="background-color: white;"></li>
                  <li style="background-color: white;">&nbsp;</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>Basic 기본 서비스 제공</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>퍼피 케어</li>
                  <li style="background-color: white;">&nbsp;</li>

                  </ul>


               </div>
             </div>
           </div>
           <div class="col-md-4 ftco-animate">
             <div class="block-7">
                <div class="img" style="background-image: url(<%=request.getContextPath()%>/resources/images/pricing-3.jpg);"></div>
               <div class="text-center p-4">
                  <span class="excerpt d-block">Premium</span>
                  <span class="price"><sup><i class="fa-solid fa-won-sign"></i></sup> <span class="number" style="font-size: 3.2rem;">55,000</span> </span>
                  
                  <ul class="pricing-text mb-5">
                     <li style="background-color: white;"></li>
                     <li style="background-color: white;">&nbsp;</li>
                    <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>Basic+ 기본 서비스 제공</li>
                 <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>노견 케어</li>
                 <li style="background-color: #F2F2F2;"><i class="fa fa-check mr-2"></i>장기 예약</li>
                  </ul>


               </div>
             </div>
           </div>
           <a href="/petwogether/member/careserviceintro" class="btn btn-primary d-block px-2 py-3" style="width:400px; margin: 0 auto; margin-top: 30px; font-size: 1.3rem;">돌봄 서비스 신청하기</a>
         </div>
       </div>
    </section>