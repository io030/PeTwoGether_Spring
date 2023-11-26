<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/star-rating.css"
	media="all" rel="stylesheet" type="text/css" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resources/js/star-rating.js"
	type="text/javascript"></script>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('<%=request.getContextPath()%>/resources/images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread">
					돌봄 후기 수정 <span
						style="font-size: 1.3rem; background-color: white; padding: 5px; border-radius: 10px;">일반회원</span>
				</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">

	<div class="formContainer"
		style="margin: 0 auto; width: 1000px; border-radius: 10px; border: 1px solid #F8A1A4; padding: 20px;">
		<form method="POST" action="/petwogether/member/psrevieweditok" enctype="multipart/form-data">

			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label" style="color: #F8A1A4;">제목</label> 
				<input type="text" class="form-control" value="${rList.psrtitle}" id="psrtitle" name="psrtitle" placeholder="제목을 입력하세요" required style="height: 1000px;">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label" style="color: #F8A1A4;">내용</label>
				<textarea class="form-control" rows="3" style="resize: none; height: 800px !important;" name="psrcontent" id="psrcontent" required placeholder="내용을 입력하세요">${rList.psrcontent }</textarea>
			</div>

			<div style="margin-bottom: 5px;">
				<input id="psrrate" name="psrrate" value="${rList.psrrate}" type="number" class="rating" data-symbol="❤" min=0 max=5 step=0.5 data-size="sm" style="display: none;">
			</div>

 			<div class="mb-3">
				<label for="formFileSm" class="form-label" style="color: #F8A1A4;">사진 추가</label> 
				<input class="form-control form-control-sm" style="height: 30px !important;" id="psrfile" name="psrfile" type="file">
			</div>


			<div class="btns">
				<button type="button" class="btn btn-primary" onclick="location.href='/petwogether/member/psreviewlist';" style="background-color: #F8A1A4; border: #F8A1A4;">돌아가기</button>
				<button type="submit" class="btn btn-primary" style="background-color: #F8A1A4; border: #F8A1A4;">
					<i class="fa-solid fa-pen-nib"></i> 수정하기
				</button>
			</div>
			<input type="hidden" name="mseq" id="mseq" value="${sseq }">
			<input type="hidden" name="psrseq" id="psrseq" value="${psrseq }">
			<input type="hidden" name="csseq" id="csseq" value="${csseq }">
		</form>
	</div>

</section>

<script>
	$("#psrrate").rating({
		min : 0,
		max : 5,
		step : 0.5,
		size : 'sm',
		'showCaption' : false
	});
</script>