<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/mypage.css">

<section class="hero-wrap hero-wrap-2"
   style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');"
   data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container" style="width: 1300px; min-width: 1300px;">
      <div class="row no-gutters slider-text align-items-end">
         <div class="col-md-9 ftco-animate pb-5">
            <h1 class="mb-0 bread" style="text-align: left;">
               마이페이지 <span
                  style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">펫시터</span>
            </h1>
         </div>
      </div>
   </div>
</section>

<section class="ftco-section bg-light">
   <div class="container">

      <div class="box">
         <h1>반려동물 정보</h1>
         <div>
            <input type="button" id="addbtn" value="등록하기">
            <div class="input">
               <div class="finput">
                  <form method="POST" action="/petwogether/petsitter/petaddok" enctype="multipart/form-data">
                     <div id="btnn">
                        <input type="button" id="cancel" class="rbtn" value="취소"> 
                        <input type="submit" class="rbtn" value="저장"> 
                     </div>
                     <div id="tbl">
                        <table id="addtable">
                           <tr>
                              <th>이름</th>
                              <th>성별</th>
                              <th>나이</th>
                              <th>크기</th>
                              <th>종류</th>
                              <th>품종</th>
                              <th>사진</th>
                           </tr>
                           <tr>
                              <td><input type="text" name="name" id="name" value="" size="5" required></td>
                              <td><input type="text" name="gender" id="gender" value="" size="1" required></td>
                              <td><input type="text" name="age" id="age" value="" size="1" required> 살</td>
                              <td><input type="text" name="weight" id="weight" value="" size="1" required></td>
                              <td><select name="type">
                                    <option value="강아지">강아지</option>
                                    <option value="고양이">고양이</option>
                                    <option value="기타">기타</option>
                              </select></td>
                              <td><input type="text" name="kind" id="kind" value="" size="5" required></td>
                              <td><input type="file" name="file" id="file"></td>
                           </tr>
                        </table>
                     </div>
                     
                  </form>
               </div>
            </div>
         </div> <!-- 등록하기 폼 끝 -->

         <c:forEach items="${list}" var="dto">
         <div class="b1">
            <div>
               <img src="/petwogether/resources/images/pet/${dto.pfile}">
            </div>
            <div id="info">
               ${dto.pname} (${dto.pgender}/${dto.page}살/${dto.psize})<br> 
               ${dto.ptype} (${dto.pbreed})
            </div>
            <input type="button" id="d${dto.pseq}" class="rbtn delete del" value="삭제하기"> 
            <input type="button" id="${dto.pseq}" class="rbtn edit" value="수정하기">
               
            <div id="div${dto.pseq}" class="input2">
               <div class="finput">
                  <form method="POST" action="/petwogether/petsitter/peteditok" enctype="multipart/form-data">
                     <div id="btnn">
                        <input type="button" id="c${dto.pseq}" class="rbtn can" value="취소">
                        <input type="submit" id="s${dto.pseq}" class="rbtn save" value="저장"> 
                     </div>
                     <div id="tbl">
                        <table id="addtable">
                           <tr>
                              <th>이름</th>
                              <th>성별</th>
                              <th>나이</th>
                              <th>크기</th>
                              <th>종류</th>
                              <th>품종</th>
                              <th>사진</th>
                           </tr>
                           <tr>
                              <td><input type="text" name="name" id="name" value="${dto.pname}" size="5" required></td>
                              <td><input type="text" name="gender" id="gender" value="${dto.pgender}" size="1" required></td>
                              <td><input type="text" name="age" id="age" value="${dto.page}" size="1" required> 살</td>
                              <td><input type="text" name="weight" id="weight" value="${dto.psize}" size="1" required></td>
                              <td><select name="type">
                                    <option value="강아지">강아지</option>
                                    <option value="고양이">고양이</option>
                                    <option value="기타">기타</option>
                              </select></td>
                              <td><input type="text" name="kind" id="kind" value="${dto.pbreed}" size="6" required></td>
                              <td><input type="file" name="file" id="file" value="${dto.pfile}"></td>
                           </tr>
                        </table>
                     </div>
                     <input type="hidden" name="pseq" value="${dto.pseq}">
                  </form>
               </div>
            </div> <!-- 수정하기 폼 -->
         </div> <!-- 반려동물 1마리 끝 -->
         </c:forEach>
      </div> <!-- 반려동물 정보 박스 -->


      <div class="box">
         <h1>돌봄 서비스 신청 현황</h1>
         
         <c:forEach items="${list2}" var="dto">
         <div class="b2">
            <div id="info1">
               서비스 이용 날짜<br> 
               서비스 신청자<br> 
               이용 반려동물
            </div>
            <div id="info2">
               ${dto.csstart} ~ ${dto.csend}<br> 
               ${dto.mname}<br> 
               ${dto.pets}
            </div>
            <c:if test="${dto.dstate == 'w'}">
               <input type="button" class="rbtn cancel" value="취소하기" onClick="location.href='/petwogether/petsitter/pdiarydel?csseq=${dto.csseq}';">
               <div class="state">이용예정</div>
            </c:if>
            <c:if test="${dto.dstate == 'o'}">
               <div class="state ing">진행중</div>
            </c:if>
            <c:if test="${dto.dstate == 'x'}">
               <input type="button" class="rbtn diary" value="돌봄일지" onClick="location.href='/petwogether/petsitter/pdiary?pets=${dto.pets}&csseq=${dto.csseq}';">
               <div class="state">이용완료</div>
            </c:if>
         </div>
         </c:forEach>
         <!-- 돌봄 서비스 1개 끝 -->

      </div> <!-- 돌봄 서비스 박스 -->


      <input type="button" id="addbtn" value="회원탈퇴" onClick="location.href='/petwogether/petsitter/poutpetsitter';">
   </div>
</section>

<script>
   $('#addbtn').click(function() {
      $('.input').show();
   });
      
   $('#cancel').click(function(){
      $('.input').hide();
   });
      
   $('.edit').click(function(){
      
      var n = event.target.id;
      $('#div' + n).show();
   });
   
   $('.can').click(function(){
      
      var n = (event.target.id).substring(1);
      $('#div' + n).hide();
   
   });
   
   $('.delete').click(function(){
      
      var n = (event.target.id).substring(1);
      location.href="/petwogether/petsitter/petdelok?pseq=" + n;
   });
   
   
</script>