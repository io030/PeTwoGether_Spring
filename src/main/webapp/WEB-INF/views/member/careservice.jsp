<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/careservice.css">

    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">             
            <h1 class="mb-0 bread">돌봄 서비스 신청하기 <span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">일정 선택하기</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light" style="padding-top: 60px;">
         <div class="container">
         
         <form action="/petwogether/member/careserviceok" method="POST" name="serviceok">
         <input type="hidden" name="psseq" value="${psdto.psseq}">
            <div class="csbox">
               <div id="psbox">
                  <div class="psinfo">
                     <div class="infoimg" style="width: 140px; height:140px; margin-top: 5px; background-image: url('<%=request.getContextPath()%>/resources/images/petsitter/${psdto.psfile}');"></div>
                     <div class="infotxt" >
                        <div style="color: #F8A1A4; font-size: 1.5rem; margin-bottom: 5px;">${rdto.rtitle}</div>
                        <table class="pstbl">
                           <tr>
                              <th>이름 &nbsp;&nbsp; </th>
                              <td> ${psdto.psname}</td>
                           </tr>
                           <tr>
                              <th>거주지 유형 &nbsp;&nbsp;</th>
                              <td> ${psdto.psresidence}</td>
                           </tr>
                           <tr>
                              <th>연락처 &nbsp;&nbsp;</th>
                              <td> ${psdto.pstel}</td>
                           </tr>
                        </table>
                     </div>
                  </div>
                  
                  <div class="pinfo">
                  <div style="color: #F8A1A4; font-size: 1.3rem; width: 150px; margin: 10px auto; text-align: center; margin-top: 30px;">함께사는 동물</div>
                  
                  <c:forEach items="${pspetlist}" var="pdto">
                  <div style="display: flex; margin: 5px auto; padding: 20px;">
                     <div class="infoimg" style="background-image: url('<%=request.getContextPath()%>/resources/images/pet/${pdto.pfile}');"></div>
                  
                  
                     <div class="infotxt">
                        <table class="pettbl">
                           <tr>
                              <th>이름</th>
                              <td>${pdto.pname}</td>
                           </tr>
                           <tr>
                              <th>나이</th>
                              <td>${pdto.page} 살</td>
                           </tr>
                           <tr>
                              <th>성별</th>
                              <td>${pdto.pgender eq 'm' ? '남아' : '여아'}</td>
                           </tr>
                        </table>
                     </div>
                  </div>
                  </c:forEach>
                  
                  <div style="color: #F8A1A4; font-size: 1.3rem; width: 150px; margin: 10px auto; margin-top: 30px; text-align: center;">자격증</div>
                  <div style="background-color: #F8F9FA; padding:20px; color:#525252; width: 60%; margin: auto; margin-bottom: 20px; text-align: center; border-radius: 20px;">${psdto.pslicense}</div>
                  
                  <div style="color: #F8A1A4; font-size: 1.3rem; width: 150px; margin: 10px auto; margin-top: 40px; text-align: center;">소개글</div>
                  <div style="padding:30px;  color:#525252; line-height: 2rem; width: 80%; margin: auto;">${rdto.rcontent}</div>
                  
                  </div>
                  
               </div>
               
               <div id="mbox">
                  <div id="calbox">
                  
                     <div class="sec_cal">

                        <div class="cal_nav">
                           <a href="javascript:;" class="nav-btn go-prev">prev</a>
                           <div class="year-month" id="cmonth" style="font-size: 2.3rem;"></div>
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
                     
                     <div style="margin: 30px auto;">
                     <input type="text" class="avail" readonly >&nbsp;이용가능&nbsp;&nbsp;&nbsp;
                     <input type="text" class="avail"  style="background-color: #FAFAFA;" readonly >&nbsp;이용불가<br><br>
                     <input type="text" class="avail"  style="background-color: #FFCCA9;" readonly >&nbsp;시작날짜&nbsp;&nbsp;&nbsp;
                     <input type="text" class="avail"  style="background-color: #FFB27D;" readonly >&nbsp;종료날짜
                     </div>
                     
                  </div>
                  <div id="servicebox">
                     <div style="text-align: center; margin: 20px; font-size:1.5rem; padding-top: 40px; padding: 20px; padding-bottom: 5px; color: #F8A1A4;">이용할 서비스 선택하기</div>
                     <div class="scbox"><label><input type="radio" name="scheck" value="basic" style="width: 20px; height: 20px;">&nbsp;&nbsp;BASIC</label></div>
                     <div class="sctxt">실내놀이 / 매일산책 / 약물복용 /목욕가능 </div>
                     
                     <div class="scbox"><label><input type="radio" name="scheck" value="basicplus" style="width: 20px; height: 20px;">&nbsp;&nbsp;BASIC+</label></div>
                     <div class="sctxt">BASIC 서비스 & 퍼피케어 </div>
                     
                     <div class="scbox"><label><input type="radio" name="scheck" value="premium" style="width: 20px; height: 20px;">&nbsp;&nbsp;PREMIUM</label></div>
                     <div class="sctxt">BASIC+ 서비스 & 노견케어 / 장기예약 </div>

                     <div class="petselect" style="padding: 0; padding-top: 20px; font-size: 1.3rem; color: #FCCC45;">서비스 맡길 반려동물 선택</div>
                     
                     <div class="petselect">
                     <c:forEach items="${mpetlist}" var="mdto">
                        <label style="margin: 0 20px;"><input type="checkbox" class="pets" value="${mdto.pseq}" name="pname" style="width: 15px; height: 15px;">&nbsp;&nbsp;${mdto.pname}</label>
                     </c:forEach>
                     </div>
                     
                     
                     <hr style="width: 90%; margin: 20px auto;">
                     
                     <div style="width: 300px; margin-left: 100px; padding-bottom: 50px; font-size: 1.1rem;">1일 이용 금액&nbsp;&nbsp;<input type="text" id="sprice" style="width: 100px; text-align: right; border: 1px solid gray; border-radius: 10px; padding: 1px;" value="">&nbsp;원</div>
                  
                  </div>
               </div>
            
            
               
            </div>
            <button type="button" class="csbtn" onclick="allconfirm();">신청하기</button>
         </form>
            
         </div>
      </section>

      <script>
      
      $("input[type='checkbox']").on("click", function() {
         let count = $("input:checked[type='checkbox']").length;
         
         
         if(count > 3) {
            $(this).prop("checked", false);
            alsert("3마리까지만 선택할 수 있습니다.")
         }
         
      });
      
         var daycount = 0;
         let price = 0;
         let pcount = 0;
         let allprice = 0;

      
      <!-- 달력 script -->

      
            $('.sec_cal').ready(function() {
               calendarInit();
            });

            /*
                달력 렌더링 할 때 필요한 정보 목록 

                현재 월(초기값 : 현재 시간)
                금월 마지막일 날짜와 요일
                전월 마지막일 날짜와 요일
             */
             var rdmonth = '';
             var rddate = '';
             var rdstate = '';
             
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

               currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
               currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
               currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

               // kst 기준 현재시간
               // console.log(thisMonth);

               // 캘린더 렌더링
               renderCalender(thisMonth);

               function renderCalender(thisMonth) {

                  // 렌더링을 위한 데이터 정리
                  var currentYear = thisMonth.getFullYear();
                  var currentMonth = thisMonth.getMonth();
                  var currentDate = thisMonth.getDate();

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
                  
                  
                  let amap = new Map();
                  
                     <c:forEach items="${rdlist}" var="rddto">
                        
                        /*   년,월,일
                        alert(${(rddto.rddate).substring(0, 4)});                  
                        alert(${(rddto.rddate).substring(5, 7)});
                        alert(${(rddto.rddate).substring(8, 10)});
                         */

                        rdmonth = ${(rddto.rddate).substring(5, 7)};
                        rddate = parseInt('${(rddto.rddate).substring(8, 10)}');
                        rdstate = '${rddto.rdstate}';
                        
                        if (rdmonth == (currentMonth + 1)){
                           amap.set(rddate, rdstate);                           
                        }
                     
                     </c:forEach>
                     
                     
                  
                  // 이번달
               for (var i = 1; i <= nextDate; i++) {

                  let temp = amap.get(i);
                  
                  if(i < currentDate){
                     
                     calendar.innerHTML = calendar.innerHTML
                     + '<div class="day current color" style="background-color: transparent; color: #DDDDDD;" >'
                     + i + '<input type="hidden" value="' + currentYear + ' - ' + (currentMonth + 1) + ' - ' + i + '" name="date"></div>'
                     
                     
                     
                  } else {
                        
                     if (temp === '이용불가능' || temp === "" || temp == null) {
   
                        calendar.innerHTML = calendar.innerHTML
                              + '<div class="day current color" name="date" style="background-color: #FAFAFA;" >'
                              + i + '<input type="hidden" value="' + currentYear + '-' + (currentMonth + 1) + '-' + i + '" name="date"></div>'
   
                     } else {
   
                        calendar.innerHTML = calendar.innerHTML
                              + '<div class="day current color" name="date" onclick="selDate()" style=" cursor: pointer; background-color: #FFE8CB;">'
                              + i + '<input type="hidden" value="' + currentYear + '-' + (currentMonth + 1) + '-' + i + '" name="date"></div>'
                     }
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

         var sdate = '';
         var selectdate = new Array();
         
         var aprice = $('#sprice').val();
         
         let stnum = $('input[name="csstart"]').length;
         let ennum = $('input[name="csend"]').length;

         
         function selDate() {

            sdate = $('#cmonth').text() + '-' + $(event.target).text();

            sdate = sdate.replace('.', '-');

            //alert($(event.target).css("background-color") === 'rgb(255,232,203)');

            console.log(sdate);

            /* 색상 토글 */
/*             if ($(event.target).css("background-color") === 'rgb(255, 232, 203)') {
               $(event.target).css("background-color", "#FCCC45");
               
               //이전날짜 비활성화 + 이후 날짜 선택하면 쭈루룩 선택되게 해주기
            
            } else {
               $(event.target).css("background-color", "#FFE8CB");
               daycount--;
            }
             */
            /* alert($(event.target).attr('name')); */
            
            let scount = false;
            let ecount = false;
            
            //alert($(event.target).text());
            //alert(scount);
            
               
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
   
         //달력 끝
         
         let sercount = $('input[name="scheck"]:checked').length;
         //이용 서비스 시작
         $('input[name="scheck"]').change(function() {
            
            //pricecount();
            
            var service = $('input[name="scheck"]:checked').val();
            
            if (service == 'basic') {
               price = 30000;
            } else if (service == 'basicplus') {
               price = 40000;
            } else if (service == 'premium') {
               price = 55000;
            }
            
            if(allprice == 0) {         
                  $('#sprice').val(price);
            }  else {
               
               if(pcount == 0) {
                  alert('서비스를 이용할 반려동물을 선택해주세요!')
               } else {
                  allprice = price*pcount;
                  $('#sprice').val(allprice);                  
               }
               
            }
            
            sercount = 1;
            
         });

          
          let pname = $('input[name="pname"]').length;
 
          let mpseq1 = $('input[name="mpseq1"]').length;
          let mpseq2 = $('input[name="mpseq2"]').length;
          let mpseq3 = $('input[name="mpseq3"]').length;
 
         $('.pets').change(function() {

            pcount = $('.pets:checked').length;

            allprice = pcount * price;

            /* if (allprice == 0) {
               alert('서비스를 선택해주세요.');
            }  */

            $('#sprice').val(allprice);
            
            //$('input[name="pname"]')
            
               
               if(mpseq1 == 0) {
                  
                  if ($(event.target).attr('name') == 'pname') {
                     
                     $(event.target).attr('name', 'mpseq1');
                     mpseq1 =  1;

                  } else if ($(event.target).attr('name') == 'mpseq2') {
                     
                     $(event.target).attr('name', 'mpseq1');
                     mpseq1 =  1;
                     mpseq2 =  0;
                     
                  } else if ($(event.target).attr('name') == 'mpseq3') {
                     
                     $(event.target).attr('name', 'mpseq1');
                     mpseq1 =  1;
                     mpseq3 =  0;
                     
                  }
                  
               } else if (mpseq2 == 0) {
                  
                  if ($(event.target).attr('name') == 'pname') {
                     
                     $(event.target).attr('name', 'mpseq2');
                     mpseq2 =  1;

                  } else if ($(event.target).attr('name') == 'mpseq3') {
                     
                     $(event.target).attr('name', 'mpseq2');
                     mpseq2 =  1;
                     mpseq3 =  0;

                  }    else if ($(event.target).attr('name') == 'mpseq1') {
                     
                     $(event.target).attr('name', 'pname');
                     mpseq1 =  0;
                  }
                  
               } else if (mpseq3 == 0) {
                  
                  if ($(event.target).attr('name') == 'pname') {
                     
                     $(event.target).attr('name', 'mpseq3');
                     mpseq3 =  1;

               }  else if ($(event.target).attr('name') == 'mpseq2') {
                     
                     $(event.target).attr('name', 'pname');
                     mpseq2 =  0;

               } else if ($(event.target).attr('name') == 'mpseq3') {
                     
                     $(event.target).attr('name', 'pname');
                     mpseq3 =  0;

                  }
                  
               } 


         });
         
         
         function allconfirm() {
            
            if (mpseq1 == 0 && mpseq2 == 0 && mpseq3 == 0 ) {
               alert('서비스를 맡길 반려동물을 선택해주세요.');
               
            }
            
            if(stnum == 0) {
               alert('서비스 이용 날짜를 선택해주세요');
            }
            
            if(sercount == 0) {
               alert('이용하실 서비스를 선택해주세요.');
            }
            
            if (mpseq1 != 0 && stnum != 0 && sercount !=0 ){
               serviceok.submit();            
            }
            
         };
         
            
      
         
         
         
      </script>
      
      