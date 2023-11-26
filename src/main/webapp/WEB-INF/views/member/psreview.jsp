<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    
	<!-- <link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
    <script src="<%=request.getContextPath()%>/resources/js/star-rating.js" type="text/javascript"></script>

    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">             
            <h1 class="mb-0 bread">돌봄 서비스 리뷰 <span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">일반회원</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg" ">
      <div class="container">
        <div class="row" style="margin:0 400px 0 400px;">
          <div class="col-lg-8 ftco-animate" style="width:1000px;">
          	<div class="review">
          	<div class="reviewImg">
          	<c:if test="${not empty rList.psrfile}">
              <%-- <img src="/petwogether/resources/images/pet/${rList.psrfile}"  alt="리뷰사진" class="img-fluid" style="width: 472px; height:350px; object-fit:contain;"> --%>
             <img src="/petwogether/resources/files/${rList.psrfile}"  alt="리뷰사진" class="img-fluid" style="width: 472px; height:350px; object-fit:contain;">
          	</c:if>
     		</div>
         	<div class="content">       	
            <h4 class="mb-3" style="margin-top: 15px;">${rList.psrtitle}</h4>
            <p>${rList.psrcontent}</p>
         	</div>
          
              <div class="about-author d-flex p-4 bg-light" style="margin: 50px 0 50px 0;">
              <div class="bio mr-5">
                <img src="<%=request.getContextPath()%>/resources/images/petsitter/${pList.psfile}" alt="Image placeholder" class="img-fluid mb-4" style="width: 150px !important; height: 150px !important; object-fit:cover !important;">
              </div>
              
              <div class="desc">
                <h3>${pList.psname}</h3>
                <p>경력: ${pList.pscareer}</p>
                <p>자격증: ${pList.pslicense}</p>
              </div>
            </div>
			</div>
			
			<div style="margin-left:120px; margin-bottom: 50px;">
			<input id="input-21a" value="${rList.psrrate}" type="number" class="rating" data-symbol="❤" min=0 max=5 step=0.5 data-size="sm" style="display: none;">    
			</div>
			        
              <div class="about-author d-flex p-4 bg-light" style="width:472px;">
              <div class="desc">
                <h4>돌봄 서비스 이용 정보</h4>
                <p>이용한 서비스: ${sList.sname}  </p>
                <p>서비스 이용기간: ${sList.csstart} ~ ${sList.csend} </p>
              </div>
              
            </div>
            </div>
            
            </div>
          </div> <!-- .col-md-8 -->

	<c:if test="${not empty auth and sseq eq rList.mseq }">
	<div class="btns" style="margin: 30px 825px 0 825px;">
	<!-- <div class="btns" style="margin: 30px 0 0 1050px;"> -->
		<button class="btn btn-primary" type="button"
			style="background-color: #F8A1A4; border: #F8A1A4;"
			onclick="location.href='/petwogether/member/psreviewedit.do?psrseq=${rList.psrseq}&csseq=${rList.csseq }';">
			<i class="fa-solid fa-pen-to-square"></i> 수정하기
		</button>
		<button class="btn btn-primary" type="button"
			style="background-color: #F8A1A4; border: #F8A1A4;"
			onclick="location.href='/petwogether/member/psrdeleteok.do?psrseq=${rList.psrseq}&mseq=${mseq }';">
			<i class="fa-solid fa-trash-can"></i> 삭제하기
		</button>
	</div>
	</c:if>

</section> <!-- .section -->
	<script>
		$("#input-21a").rating({
			min : 0,
			max : 5,
			step : 0.5,
			size : 'sm',
			readonly : true,
			'showCaption' : false
		});
	</script>
