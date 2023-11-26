<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/regpetsitter.css">



    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">             
            <h1 class="mb-0 bread">펫 시터 등록하기<span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">펫 시터 회원</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
         <div class="container">
            
            <div style="border-radius: 50px; min-height: 100vh; width: 750px; margin: 0 auto; background-color: #F6F3FF">
            
            <div style="text-align: center; font-size: 2.5rem; padding: 10px;">펫 시터 등록</div>
            
            
            
            <form method="POST" action="/petwogether/petsitter/regpetsitterok" enctype="multipart/form-data">
            <table>
               <tr>
                  <th style="text-align: center; font-size: 1.5rem; padding: 10px;">제목</th>
                  <td><input type="text" required name="rtitle" style="border:0 solid black; width: 550px; height: 35px; border-radius: 10px;"></td>
               <tr>
               <tr>
                  <th style="text-align: center; font-size: 1.5rem; padding: 10px;">소개</th>
                  <td><textarea required name="rcontent" style="border:0 solid black; width: 550px; height: 200px; border-radius: 10px;"></textarea></td>
               <tr>
               <tr>
                  <th style="text-align: center; font-size: 1.5rem; padding: 10px;">거주지 사진</th>
                  <td>
                  <input type="file" name="rfile">
               </td>
               <tr>
               <tr>
                  <th style="text-align: center; font-size: 1.5rem; padding: 10px;">달력</th>
               
                  <td>
       
                   <div class="calc">
            
                     <div class="sec_cal">
            
                        <div class="start"></div>
                           <div class="cal_nav">
                              <a href="javascript:;" class="nav-btn go-prev daum">prev</a>
                              <div class="year-month" id="cmonth"></div>
                              <a href="javascript:;" class="nav-btn go-next">next</a>
                           </div>
                           <div class="cal_wrap">
                              <div class="days">
                                 <div class="day">MON</div>
                                 <div class="day">TUE</div>
                                 <div class="day">WED</div>
                                 <div class="day">THU</div>
                                 <div class="day">FRI</div>
                                 <div class="day">SAT</div>
                                 <div class="day">SUN</div>
                              </div>
                              <div class="dates"></div>
                           </div>
                     </div>
                  </div>              
   
               </td>
               <tr>
            </table>
            
              
                        
                     
            <div style="width: 500px; margin: 0 auto; padding: 50px; display: flex; justify-content: space-between;">
               <input type="submit" value="등록하기" style="width: 150px; height: 50px; border: 0; background-color: #F8A1A4; border-radius: 5px; color: white;">
               <input type="button" value="돌아가기" style="width: 150px; height: 50px; border: 0; background-color: #F8A1A4; border-radius: 5px; color: white;" onclick="location.href='/petwogether/main/index';">
            </div>
            
            <input type="hidden" name="psseq" value="${sseq}">
            <input type="hidden" name="rseq" value="${rseq}">
            <input type="hidden" name="start" value="">
               
            </form>
            </div>
         
         </div>
      </section>
      
      <script>
      
         
        
        $('.sec_cal').ready(function() {
                    calendarInit();
                 });
   
                 /*
                     달력 렌더링 할 때 필요한 정보 목록 
   
                     현재 월(초기값 : 현재 시간)
                     금월 마지막일 날짜와 요일
                     전월 마지막일 날짜와 요일
                  */
   
                 function calendarInit() {
   
                    // 날짜 정보 가져오기
                    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
                    var utc = date.getTime()
                          + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
                    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
                    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
   
                    var thisMonth = new Date(today.getFullYear(), today
                          .getMonth(), today.getDate());
                    // 달력에서 표기하는 날짜 객체
   
                    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
                    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
                    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
   
                    // kst 기준 현재시간
                    // console.log(thisMonth);
   
                    // 캘린더 렌더링
                    renderCalender(thisMonth);
   
                    function renderCalender(thisMonth) {
   
                       // 렌더링을 위한 데이터 정리
                       currentYear = thisMonth.getFullYear();
                       currentMonth = thisMonth.getMonth();
                       currentDate = thisMonth.getDate();
   
                       // 이전 달의 마지막 날 날짜와 요일 구하기
                       var startDay = new Date(currentYear, currentMonth, 0);
                       var prevDate = startDay.getDate();
                       var prevDay = startDay.getDay();
   
                       // 이번 달의 마지막날 날짜와 요일 구하기
                       var endDay = new Date(currentYear, currentMonth + 1, 0);
                       var nextDate = endDay.getDate();
                       var nextDay = endDay.getDay();
   
                       // console.log(prevDate, prevDay, nextDate, nextDay);
   
                       // 현재 월 표기
                       $('.year-month').text(
                             currentYear + '.' + (currentMonth + 1));
   
                       // 렌더링 html 요소 생성
                       calendar = document.querySelector('.dates')
                       calendar.innerHTML = '';
   
                       // 지난달
                     for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
                        calendar.innerHTML = calendar.innerHTML
                              + '<div class="day prev disable color ">'  + i
                              + '<input type="hidden" value="' + i + '"></div>'
                     }
                       
                       // 이번달
                       for (var i = 1; i <= nextDate; i++) {
                          
                          if(i < currentDate) {
                             
                             calendar.innerHTML = calendar.innerHTML
                             + '<div class="day current color" style="background-color: transparent; color: #DDDDDD;" >'
                             + i + '<input type="hidden" value="' + currentYear + ' - ' + (currentMonth + 1) + ' - ' + i + '" name="date"></div>'
                                   
                          } else {
                             
                           calendar.innerHTML = calendar.innerHTML
                             + '<div class="day current color" name="date" onclick="selDate()" style=" cursor: pointer; background-color: #FFE8CB;">'
                             + i + '<input type="hidden" value="' + currentYear + '-' + (currentMonth + 1) + '-' + i + '" name="date"></div>'
                          }
                       }
            
                       // 다음달
                       for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
                          calendar.innerHTML = calendar.innerHTML
                                + '<div class="day next disable color ">' + i
                                + '<input type="hidden" value="' + i + '></div>'
                       }
   
                       // 오늘 날짜 표기
                     if (today.getMonth() == currentMonth) {
                        todayDate = today.getDate();
                        var currentMonthDate = document
                              .querySelectorAll('.dates .current');
                        currentMonthDate[todayDate - 1].classList.add('today');
                     }
                    }
   
                    // 이전달로 이동
                    $('.go-prev').on('click', function() {
                       thisMonth = new Date(currentYear, currentMonth - 1, 1);
                       renderCalender(thisMonth);
                    });
   
                    // 다음달로 이동
                    $('.go-next').on('click', function() {
                       thisMonth = new Date(currentYear, currentMonth + 1, 1);
                       renderCalender(thisMonth);
                    });
   
   
                 }
   
                 var availabledate = '';
                 
               let stnum = $('input[name="csstart"]').length;
               let ennum = $('input[name="csend"]').length;
                 
                 function selDate() {
   
                    availabledate = $('#cmonth').text() + '-' + $(event.target).text();
                    availabledate = availabledate.replaceAll('.', '-');
                    
                    console.log(availabledate);

                  if(stnum == 0 && ennum == 0) {
                     
                     if ($(event.target).children('input[type="hidden"]').attr('name') == 'date') {
                        
                        $(event.target).children('input[type="hidden"]').attr('name', 'csstart');
                        stnum =  1;
                        
                        if ($(event.target).css("background-color") === 'rgb(255, 232, 203)') {
                           $(event.target).css("background-color", "#FFCCA9");
                        }
                           
                     } 
                     
                  } else if (stnum == 1 && ennum == 0) {
                  
                     if ($(event.target).children('input[type="hidden"]').attr('name') == 'date') {
                        
                           $(event.target).children('input[type="hidden"]').attr('name', 'csend');
                           ennum = 1;
                           
                           if ($(event.target).css("background-color") === 'rgb(255, 232, 203)') {
                              $(event.target).css("background-color", "#FFB27D");
                           }
                              
                                       
                        } else if ($(event.target).children('input[type="hidden"]').attr('name') == 'csstart') {
                           $(event.target).children('input[type="hidden"]').attr('name', 'date');   
                           stnum = 0;   
                           
                           if ($(event.target).css("background-color") === 'rgb(255, 204, 169)') {
                              $(event.target).css("background-color", "#FFE8CB");
                           }
                              
                           
                        } else {
                           $(event.target).children('input[type="hidden"]').attr('name', 'date');         
                           ennum = 0;
                           
                           if ($(event.target).css("background-color") === 'rgb(255, 178, 125)') {
                              $(event.target).css("background-color", "#FFE8CB");
                           }
                              
                        }
                     
                  } else if (stnum == 0 && ennum == 1) {
                     
                     if ($(event.target).children('input[type="hidden"]').attr('name') == 'date') {
                        
                        $(event.target).children('input[type="hidden"]').attr('name', 'csstart');
                        stnum =  1;
                        
                        if ($(event.target).css("background-color") === 'rgb(255, 232, 203)') {
                           $(event.target).css("background-color", "#FFCCA9");
                        }
                           

                     } else if ($(event.target).children('input[type="hidden"]').attr('name') == 'csend') {
                        $(event.target).children('input[type="hidden"]').attr('name', 'date');   
                        ennum = 0;                        
                        
                        if ($(event.target).css("background-color") === 'rgb(255, 178, 125)') {
                           $(event.target).css("background-color", "#FFE8CB");
                        }
                           
                     }
                     
                  } else if (stnum == 1 && ennum == 1){
                     
                     if ($(event.target).children('input[type="hidden"]').attr('name') == 'csstart') {
                        
                        $(event.target).children('input[type="hidden"]').attr('name', 'date');
                        stnum =  0;
                        
                        if ($(event.target).css("background-color") === 'rgb(255, 204, 169)') {
                           $(event.target).css("background-color", "#FFE8CB");
                        }

                     } else if ($(event.target).children('input[type="hidden"]').attr('name') == 'csend') {
                        $(event.target).children('input[type="hidden"]').attr('name', 'date');   
                        ennum = 0;   
                        
                        if ($(event.target).css("background-color") === 'rgb(255, 178, 125)') {
                           $(event.target).css("background-color", "#FFE8CB");
                        }
                        
                     }
                     
                  }
                  
            }      
      
      </script>
      