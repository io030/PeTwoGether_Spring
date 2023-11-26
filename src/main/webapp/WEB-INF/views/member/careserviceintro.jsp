<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">          	
            <h1 class="mb-0 bread">돌봄 서비스 신청하기 <span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">펫시터 선택</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
				
				<c:forEach items="${plist}" var="dto">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(<%=request.getContextPath()%>/resources/images/petsitter/${dto.psfile}); cursor: pointer;" onclick="location.href='/petwogether/member/careservice?psseq=${dto.psseq}'"></div>
								
								
							</div>
							<div class="text pt-3 px-3 pb-4 text-center">
								<h3 style="font-size: 1.6rem; margin: 10px;">${dto.psname}</h3>
								<span class="position mb-2">${dto.pstel}</span>
								<div class="faded" style="color: #838383;">
									<p>${dto.pslicense}</p>									
									<p>거주지 유형 : ${dto.psresidence}</p>									
	             				 </div>
							</div>
						</div>
					</div>
					</c:forEach>
					
				</div>
			</div>
		</section>