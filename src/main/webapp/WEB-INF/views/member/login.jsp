<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">

  <!-- END nav -->
    <div class="hero-wrap js-fullheight" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_1.jpg'); opacity: 0.7;" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-11 ftco-animate text-center">
             
             <form method="POST" action="/petwogether/member/loginok">
             <div id="loginbox">
                <h1>로그인</h1>
                <div>
                   <div id="user">
                      <label><input type="radio" class="rd" name="user" value="m" checked> <span>일반회원</span></label>
                      <label><input type="radio" class="rd" name="user" value="p"> <span>펫시터</span></label>
                      <label><input type="radio" class="rd" name="user" value="a"> <span>관리자</span></label>
                   </div>
                   <span>아이디</span> <input type="text" name="id" size="15" required><br>
                   <span>비밀번호</span> <input type="password" name="pass" size="15" required>
                   
                </div>
                <div id="loginbtn">
                   <input type="button" value="회원가입" class="btnlo">
                   <input type="submit" value="로그인" class="btnlo">
                </div>
             </div>
            </form>
            <hr>
            <div style="display: flex; justify-content: space-between;">
         
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="m" checked> <span>일반회원</span>
               <input type="hidden" name="id" value="jyya70">
               <input type="hidden" name="pass" value="Bs780805">
               <input type="submit" value="일반회원(jyya70)">
            </form>
         
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="m" checked> <span>일반회원</span>
               <input type="hidden" name="id" value="dzso48">
               <input type="hidden" name="pass" value="Ab716321">
               <input type="submit" value="일반회원(dzso48)">
            </form>
            
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="m" checked> <span>일반회원</span>
               <input type="hidden" name="id" value="vpdd89">
               <input type="hidden" name="pass" value="Bm467208">
               <input type="submit" value="일반회원(vpdd89)">
            </form>
         
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="p" checked> <span>펫시터</span>
               <input type="hidden" name="id" value="nssn45">
               <input type="hidden" name="pass" value="Lv838412">
               <input type="submit" value="펫시터(nssn45)">
            </form>
         
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="p" checked> <span>펫시터</span>
               <input type="hidden" name="id" value="mbic89">
               <input type="hidden" name="pass" value="Fo825567">
               <input type="submit" value="펫시터(mbic89)">
            </form>
         
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="a" checked> <span>관리자</span>
               <input type="hidden" name="id" value="ksh11">
               <input type="hidden" name="pass" value="1111">
               <input type="submit" value="관리자(ksh11)">
            </form>
            
            <form method="POST" action="/petwogether/member/loginok">
               <input type="radio" class="rd" name="user" value="a" checked> <span>관리자</span>
               <input type="hidden" name="id" value="kjh22">
               <input type="hidden" name="pass" value="2222">
               <input type="submit" value="관리자(kjh22)">
            </form>
         
         </div>
            
          </div>
        </div>
      </div>
    </div>


    
   