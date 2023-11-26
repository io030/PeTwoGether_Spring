<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">             
            <h1 class="mb-0 bread">돌봄 서비스 리뷰 목록 <span style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">일반회원</span></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
           <div class="main-container" style="width:800px; margin: 0 auto;">
            <c:if test="${not empty auth and lv eq '1'}">
    		<div class="btns">
            <button type="button" class="btn btn-primary" style="background-color:#F8A1A4; border: #F8A1A4; margin-bottom: 10px;" onclick="location.href='/petwogether/member/psreviewadd';">
						<i class="fa-solid fa-pen-nib" style=" float:left;"></i> <span>작성하기</span>
					</button>
            <aside class="single_sidebar_widget search_widget" style="width: 300px; float:right;">
                            <div class="form-group" >
                              <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="검색" name="search" id="search">
                                <div class="input-group-append">
                                  <button class="btn btn-primary" type="button" name="searchBtn" id="searchBtn" style="width:50px; background-color:#F8A1A4 !important; border-color:#F8A1A4 !important; "><i class="fa-solid fa-magnifying-glass"></i></button>
                                </div>
                              </div>
                            </div>
                      </aside>
    		</div>
            </c:if>
    <table id="psrList" class="table table-bordered table-hover" style="background-color:#FFE8CB;">
  <thead style="background-color:#FFE8CB;">
    <tr style="background-color:#FFE8CB;">
       <td style="width:50px;">번호</td>
       <td>제목</td>
       <td style="width:60px; text-align: center;">작성자</td>
       <td style="width:150px; text-align: center;">작성날짜</td>
       <td style="width:80px; text-align: center;">조회수</td>
    </tr>
  </thead>
   <tbody>
      <c:forEach items="${PSRList }" var="dto" varStatus="status">
      <tr>
      <td style="text-align: center;">${dto.psrseq }</td>
      <td onclick="location.href='psreview?psrseq=${dto.psrseq}&mseq=${dto.mseq}';">${dto.psrtitle }</td>
      <td style="text-align: center;">${dto.mid} </td>
      <td style="text-align: center;">${dto.psrregdate }</td>
      <td style="text-align: center;">${dto.psrview }</td>
      </tr>
      </c:forEach>
   </tbody>
   </table>
   </div>

      </section>
      
<script>
$('#searchBtn').click(() => {
    
    $.ajax({
       
       type: 'GET',
       
       url: '/petwogether/member/psreviewsearch',
       
       data: 'word=' + $('#search').val(),
       
       dataType: 'JSON',
       
       success: function(result) {

          $('#psrList tbody').html('');
           
           
           
           result.forEach((item, index) => {
    
               let temp = '';

               temp += '<tr>';
               temp += '<td style="text-align: center;">' + item.psrseq + '</td>';
               temp += '<td onClick="location.href=\'/petwogether/member/psreview?psrseq=' +item.psrseq + '&mseq='+ item.mseq  + '\' ;">' + item.psrtitle + '</td>';
               temp += '<td style="text-align: center;">' + item.mid + '</td>';
               temp += '<td style="text-align: center;">' + item.psrregdate + '</td>';
               temp += '<td style="text-align: center;">' + item.psrview + '</td>';
               temp += '</tr>';
    
               $('#psrList tbody').append(temp);

           }); //forEach

       }, //success
 
       error: function(a,b,c) {
          console.log(a,b,c);
       }
    })
    });
</script>