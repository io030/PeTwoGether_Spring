<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  <!-- END nav -->
    <div class="hero-wrap js-fullheight" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-11 ftco-animate text-center">
             
             
             <div style="border-radius: 50px; height: 500px; width: 1000px; margin: 0 auto; background-color: white">
                <div style="padding: 50px; margin-top: 100px; font-size: 2rem;"><span class="flaticon-pawprint-1 mr-2" style="color: #F6BD5B;"></span>PET <span style="color: #F8A1A4;">Two</span>GETHER</div>
                <div style="padding: 50px; font-size: 2.5rem;">돌봄 신청이 완료되었습니다!</div>
                <div style="width: 500px; margin: 0 auto; padding: 50px; display: flex; justify-content: space-between;">
                   <div>
                      <input type="button" value="메인으로" style="width: 150px; height: 50px; border: 0; background-color: #F8A1A4; border-radius: 5px; color: white;" onclick="location.href='/petwogether/main/index';">
                   </div>
                   <div>
                     <input type="button" value="마이페이지" style="width: 150px; height: 50px; border: 0; background-color: #F8A1A4; border-radius: 5px; color: white;" onclick="location.href='/petwogether/member/mmypage';">
                  </div>
                </div>
             </div>
             
         
          </div>
        </div>
      </div>
    </div>