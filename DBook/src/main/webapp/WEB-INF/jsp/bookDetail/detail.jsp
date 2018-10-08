<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/SlideMenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/autocomplete.css" />
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/TopMenu.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/category.css" />
	
	<title>DBook</title>
	<style type="text/css">
	
	#category_select{
		display: -webkit-box;
		height: 50px;
		vertical-align:middle;
		border-bottom: 1px solid #7f888f;
		margin-bottom: 20px;
	}
	
	#category_select select{
		height: 1.75em;
		margin-left: 5px;
		margin-right: 5px;
	}
	
	/* 책 이미지, 설명 */
	#cover_image {
		width: 25%;
		height: auto;
		margin: 0;
		padding-left: 3%;
		padding-right: 3%;
		display: inline-block;
		float:left;
	}
	
	.book_info_table {
		width: 75%;
		height: auto;
		margin: 0;
		display: table;
		float:left;
		padding-left: 3%;
		padding-right: 3%;
	}
	
	.book_info_row {
		display: table-row;
	}
	
	.book_info_cell {
		display: table-cell;
		padding: 10px;
	}
	
	.book_info_col1 {
		width: 15%;
		font-weight: bold;
		color: black;
	}
	
	.book_info_col2 {
		width: 32%;
	}
	
	
	/* 별점 */
	.starR1 {
	    background: url('${pageContext.request.contextPath}/resources/images/star.jpg') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	}
	.starR2 {
	    background: url('${pageContext.request.contextPath}/resources/images/star.jpg') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	}
	#rating > span {cursor: pointer;}
	#avg_rating {display: inline-block; height: 30px;}
	
	.starR1.on {background-position:0 0;}
	.starR2.on {background-position:-15px 0;}
	
	</style>
</head>
<body>
	
	<!-- topMenu -->
			<jsp:include page="../include/TopMenu.jsp"/>
			
	<!-- Wrapper -->
			<button id="showLeft" style="position: fixed; right: 0px; z-index: 100;">Menu</button>
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">
						
							<!-- Header -->
							<jsp:include page="../include/HeaderMenu.jsp"/>
							
							<!-- Section -->
								<section style="padding-top: 15px; padding-bottom: 15px; margin: 0; height: auto; border: none;">
									<div id="category_select">
										
										<a href="${pageContext.request.contextPath}" style="border: hidden;">홈 ></a>
									
										<select style="width:auto;" >
										
											<option>${requestScope.categories["0"]}</option>
											<option>국내도서</option>
											<option>국외도서</option>
										</select>
										
										<span>></span>
										
										<select style="width:auto;" >
											<option>${requestScope.categories["0"]}</option>
											<option>국내도서</option>
											<option>국외도서</option>
										</select>
										
										<span>></span>
										
										<select style="width:auto;" >
											<option>${requestScope.categories["0"]}</option>
											<option>국내도서</option>
											<option>국외도서</option>
										</select>
									</div>
									
									<div style="padding-bottom: 5px;">
										<h3 style="margin-bottom: 0;">${book.book_name}</h3>
										<h5 style="float: right;">조회수 ${requestScope.book.view_cnt}</h5>
									</div>
									
								</section>
								
								<section style="width: 100%; height: auto; padding-top: 30px; float: left; border-top: 0px;">
									<div style="width:100%; float: left; text-align: center;">
										<div id="cover_image">
											<img src="${pageContext.request.contextPath}/resources/images/book01.jpg" style="width:100%; height:auto;"/>
										</div>
										<div class="book_info_table">
											<div class="book_info_row">
												<div class="book_info_cell book_info_col1">저자</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.author}</div>
												<div class="book_info_cell book_info_col1">번역</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.translator}</div>
											</div>
											<div class="book_info_row">
												<div class="book_info_cell book_info_col1">출판사</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.publisher}</div>
												<div class="book_info_cell book_info_col1">출판일</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.published_date}</div>
											</div>
											<div class="book_info_row">
												<div class="book_info_cell book_info_col1">형태</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.form_detail}</div>
												<div class="book_info_cell book_info_col1">eBOOK</div>
												<div class="book_info_cell book_info_col2">
													<c:if test="${requestScope.book.is_ebook==0}">없음</c:if>
													<c:if test="${requestScope.book.is_ebook==1}">있음</c:if>
												</div>
											</div>
											<div class="book_info_row">
												<div class="book_info_cell book_info_col1">ISBN 10</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.isbn_10}</div>
												<div class="book_info_cell book_info_col1">ISBN 13</div>
												<div class="book_info_cell book_info_col2">${requestScope.book.isbn_13}</div>
											</div>
										</div>
										<div class="book_info_table" style="float: right;">
											<div class="book_info_row">
												<div class="book_info_cell book_info_col1" style="vertical-align: middle;">평점</div>
												<div class="book_info_cell" style="width: 85%; text-align: center;">
													<div id="avg_rating">
														<span class="starR1"></span>
														<span class="starR2"></span>
														<span class="starR1"></span>
														<span class="starR2"></span>
														<span class="starR1"></span>
														<span class="starR2"></span>
														<span class="starR1"></span>
														<span class="starR2"></span>
														<span class="starR1"></span>
														<span class="starR2"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								
								<section>
									<h3>책 소개</h3>
									<c:forEach var="item" items="${requestScope.book_introduction}">
										${item}
										<br>
									</c:forEach>
								</section>
								
								<section>
									<h3>저자 소개</h3>
									<c:forEach var="item" items="${requestScope.author_introduction}">
										${item}
										<br>
									</c:forEach>
								</section>
								
								<section>
									<h3>목차</h3>
									<c:forEach var="item" items="${requestScope.contents}">
										${item}
										<br>
									</c:forEach>
								</section>
								
								<section>
									<h3 style="display: inline;">의견 남기기</h3>
									<div id="rating" style="display: inline-block; height: 30px; margin-left: 20px;">
										<span class="starR1"></span>
										<span class="starR2"></span>
										<span class="starR1"></span>
										<span class="starR2"></span>
										<span class="starR1"></span>
										<span class="starR2"></span>
										<span class="starR1"></span>
										<span class="starR2"></span>
										<span class="starR1"></span>
										<span class="starR2"></span>
										<!-- $("#rating span.on").length -->
									</div>
									
									<div id="replyInput0" style="margin-top: 20px;">
										<form action="${pageContext.request.contextPath}/reply/write.do" onsubmit="return checkReply(0)" method="post">
											<div class="input-group" style="width:95%;  margin: 0 auto;">
												  <input type="hidden" name="board_no" value="${detailBlogBoard.board_no}">
												  <input type="hidden" name="id" value="${sessionScope.userVO.id}">
												  <input type="hidden" name="depth" value="0">
												  <input type="hidden" name="seq" value="${pageScope.replySeqMax+1}">							  
												  <textarea type="text" class="form-control" placeholder="남기고 싶은 댓글을 남기세요" name="content" id="replyContent0"></textarea>
												  <div class="input-group-append" style="margin-top: 10px;">
												    <button type="submit" id="button-addon">제출</button>
												  </div>
											</div>
										</form>
									</div>
								</section>
								
								<section style="width: 100%; word-wrap: break-word;">
									${book}
								</section>
								
						</div>
					</div>
			</div>
			
		<!-- Sidebar -->
			<jsp:include page="../include/SlideSideMenu.jsp"></jsp:include>
			<jsp:include page="../include/SlideTopMenu.jsp"></jsp:include>
					

		<!-- Scripts -->
			<jsp:include page="../include/JS.jsp"></jsp:include>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.2.6/js/swiper.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/slide2.js"></script>
			
			<script>
					$(document).ready(function() {
						detailForm();
						avg_rating();
					});
		
					$(window).resize(function(){
						detailForm();
					});
					
				/* 별 누를때 */
					$("#rating span").click(function(){
						  $(this).parent().children('span').removeClass('on');
						  $(this).addClass('on').prevAll('span').addClass('on');
						});
		
		
					function detailForm(){
						
						if($(window).width()>660){
							$("#cover_image").css("width","25%");
							$(".book_info_table").css("width","75%");
					    }
						else{
							$("#cover_image").css("width","100%");
							$(".book_info_table").css("width","100%");							
					    }
					}
					
				/* 책 정보 평점 구하고 출력 */
					function avg_rating(){
						
					}
			</script>
			
			
</body>
</html>