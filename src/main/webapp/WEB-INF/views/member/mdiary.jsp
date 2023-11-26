<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/diary.css">
   
   <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">             
            <h1 class="mb-0 bread" style="text-align: left;">돌봄일지 <span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">${pname}</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
         <div class="container" style="width: 800px;">
           
              <form method="POST" action="/petwogether/petsitter/diaryok">
             <div id="diarybox">
                <h1>돌봄 일지</h1>
                <div>
                 <span>산책 시간</span>  <span>1일</span> <input type="number" size="5" name="walk" value="${dto.dtime}" readonly> <span>시간</span>
                </div>
                <div>
                 <span>식사 횟수</span>  <span>1일</span> <input type="number" size="5" name="meal" value="${dto.dmeal}"  readonly> <span>회</span>
                </div>
                <div id="etc">
                 <div id="lb"><span id="lb1">특이사항</span></div>
                 <div id="lb2"><textarea name="etc" readonly>${dto.detc}</textarea></div>
                </div>
                <div id="diarybtn">
                   <input type="button" class="btnd" value="돌아가기" onClick="location.href='/petwogether/member/mmypage';">
                </div>
             </div>
             <input type="hidden" name="csseq" value="50">
            </form>
           
         </div>
      </section>