<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("crcn", "\r\n"); %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title><spring:message code="title.movieInfo"/></title>
	
	<!-- Bootstrap core CSS -->
	<link href="<c:url value='/resources/css/admin/bootstrap.min.css'/>" rel="stylesheet">

	<!-- Custom fonts for this template -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	<link href="<c:url value='/resources/css/all.min.css'/>" rel="stylesheet" type="text/css">
	 <link href="<c:url value='/resources/css/coming-soon.css'/>" rel="stylesheet">
	<script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
	<link href="<c:url value='/resources/css/labs.css'/>" media="screen" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="<c:url value='/resources/css/mainContent.css'/>">
	<style>
		body{
			font-family: 'NotoSans', sans-serif;
			font-weight:bold;
			color: #a5a5a5;
		}
	
		#trailer{
			background-color: black;
			margin-bottom: 50px;
		}
		#movieWrap {
			background-color: #1b1b1b;
		}
		h4{
			color:white;
		}
		.movie_subTitle{
			display:inline-block;
			width: 67px;
		}
		span{
			font-size: 16px;	
		}
		#footer{
		 	background-color: #1b1b1b !important;
		}
		
		.row{
			margin-bottom: 10px;	
		}
		
		.sub_row{
			margin-top: 15px;
		}
		
		#star{
			margin-right: 10px;
			display: inline-block;
			float: right;
		}
		
		.mainMovieWrap{
			top:20%;
			position:absolute; 
			left:50%; 
			transform:translateX(-50%);
			height:700px !important;
			background-color: black;
		}
		
		#movieVideo{
			height:700px !important;
		}
		
		.mainExit{
			float: right;
			display: inline-block;
			width: 40px;
			height 30px;
			background-color: black;
			border: none;
			z-index: 1000;
		}
		
		.mainExitIcon{
			color: white;
			font-size: 30px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="movieWrap">
		<div class="row" id="trailer">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" controls id="mainVideo">
	    			<source src="<c:url value='/movieInfo/${movieVO.movieIdx}/${movieVO.fileName}'/>" type="video/mp4">
	  			</video>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h4 style="display: inline-block;">
					${movieVO.movieTitle}
				</h4>
				<button id="btn_wish" onclick="wish()" class="btn btn-outline-danger" style="float: right; width: 150px;">
					<c:if test="${wishSw != null}">
						<i class="fas fa-heart"></i>	
					</c:if>
					<c:if test="${wishSw == null}">
						<i class="far fa-heart"></i>
					</c:if>
					찜하기
				</button>
				<div id="star"></div>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<input type="button" value="시청하기" onclick="check()" class="btn btn-secondary btn-block"/>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<span>${fn:substring(moveiVO.movieOpeningdate,0,11)} ⊙ 영화 ⊙ ${movieVO.movieAge}</span>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<span class="movie_subTitle">장르</span>
				<span>${movieVO.movieGenre}</span>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<span class="movie_subTitle">감독</span>
				<span>${movieVO.movieDirector}</span>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<span class="movie_subTitle">출연</span>
				<span>${movieVO.movieActor}</span>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row sub_row" style="margin-bottom: 0px; padding-bottom: 40px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<table>
					<tr>
						<td class="movie_subTitle">
							<span class="movie_subTitle">줄거리</span>
						</td>
						<td>
							<span>${fn:replace(movieVO.movieSynopsis,crcn, "<br/>")}</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-1"></div>
  		</div>
  		<div class="row" style="margin-bottom: 0px;">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h5 style="margin-top: 20px;">
					<font color="#fff">${movieVO.movieGenre} 추천 영화</font>
				</h5>
			</div>
			<div class="col-sm-1"></div>
  		</div>
		<c:forEach items="${recommendList}" var="movieImage" varStatus="index">
			<c:if test="${index.index % 4 == 0}">
				<c:set var="indexNum" value="${index.index + 3}"/>
				<div class="row" style="padding-bottom: 100px; margin-bottom: 0px;">
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
						<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">			
							<section class="movieContent">
			</c:if>
			<c:if test="${index.index != fn:length(recommendList) - 1}">
				<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${movieImage.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
					<div class="img">
						<img width="100%" height="100%" 
    						src="<c:url value='/mainImage?movieIdx=${movieImage.movieIdx}&fileName=${movieImage.fileName}'/>">
					</div>
					<div class="border"><h1>▶</h1></div>
				</div>
			</c:if>
			<c:if test="${index.index == fn:length(recommendList) - 1}">
				<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${movieImage.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
					<div class="img">
						<img width="100%" height="100%" 
    						src="<c:url value='/mainImage?movieIdx=${movieImage.movieIdx}&fileName=${movieImage.fileName}'/>">
					</div>
					<div class="border"><h1>▶</h1></div>
				</div>
				<c:forEach begin="${index.index + 1}" end="${indexNum}" step="1">
					<div class="frame no_click" style="margin-left: 0px;">
						<div class="no_click">
							<img width="100%" height="100%">
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${index.index == fn:length(recommendList) - 1}">
						</section>
					</div>
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
				</div>
			</c:if>
			<c:if test="${index.index != fn:length(recommendList)}">
				<c:if test="${index.index == indexNum}">
								</section>
							</div>
						<div class="col-sm-0 col-md-1 col-lg-1"></div>
					</div>
				</c:if>					
			</c:if>
		</c:forEach>
  	</div>
  	<c:if test="${payInfo != null}">
  		<div class="mainMovieWrap" style="display: none;">
  			<button class="mainExit" onclick="movieVisible()">
  				<i class="far fa-times-circle mainExitIcon"></i>
  			</button>
  			<video id='movieVideo' playsinline='playsinline' controls src='<c:url value='/movieInfo/${movieVO.movieIdx}/${mainVideo.fileName}'/>' type='video/mp4'></video>
  		</div>
  	</c:if>
  	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
 	<!-- Bootstrap core JavaScript -->
  	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
  	<script src="<c:url value='/resources/js/admin/bootstrap.bundle.min.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
  	<script src="<c:url value='/resources/js/coming-soon.js'/>"></script>
  	<script src="<c:url value='/resources/js/jquery.raty.js'/>"></script>
  	<script src="<c:url value='/resources/js/labs.js'/>" type="text/javascript"></script>
  	<c:if test="${not empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<c:if test="${memberInfo == null}">
		<script>
			function check(){
				alert("로그인이 필요합니다.");
				var urlForm = $('<form></form>');
				
				urlForm.attr("name","urlForm");
				urlForm.attr("method","get");
				urlForm.attr("action","<c:url value='/member/login'/>");
				
				var movieUrl = window.location.href;
				
				urlForm.append($('<input/>', {type: 'hidden', name: 'movieUrl', value:movieUrl}));
				
				urlForm.appendTo('body');
				urlForm.submit();
			}
		</script>
	</c:if>
	<c:if test="${memberInfo != null}">
		<c:if test="${payInfo == null}">
			<script>
				function check(){
					alert("이용권 결제가 필요합니다.");
					var urlForm = $('<form></form>');
					
					urlForm.attr("name","urlForm");
					urlForm.attr("method","get");
					urlForm.attr("action","<c:url value='/payment/main'/>");
					
					var movieUrl = window.location.href;
					
					urlForm.append($('<input/>', {type: 'hidden', name: 'movieUrl', value:movieUrl}));
					
					urlForm.appendTo('body');
					urlForm.submit();
				}
			</script>	
		</c:if>
		<c:if test="${payInfo != null}">
			<script>
				var tVid = document.getElementById('mainVideo');
			
				function check(){
					tVid.pause();
					$.ajax({
						url:"<c:url value='/movie/addMovieView'/>",
						data:{
							movieIdx:"${movieVO.movieIdx}",
							memberIdx:"${memberInfo.memberIdx}"
						},
						type:"get",
						success:function(data){
							if(data != "success"){
								alert("에러가 발생했습니다.");
								return;
							}else{
								$(".mainMovieWrap").css("display","block");
							}
						}
					});
				}
				
				var vid = document.getElementById('movieVideo');
				
				function movieVisible(){
					$(".mainMovieWrap").css("display","none");
					vid.pause();
				}
				
				
				if(getCookie('${memberInfo.memberIdx}${movieVO.movieIdx}') != null){
					vid.src = '<c:url value="/movieInfo/${movieVO.movieIdx}/${mainVideo.fileName}"/>' + '#t=' + getCookie(${memberInfo.memberIdx}${movieVO.movieIdx});
				}
				
				vid.onplaying = function(){
					var timerId = setTimeout(saveTimeCookie,5000);
				}
				
				function saveTimeCookie(){
					setCookie('${memberInfo.memberIdx}${movieVO.movieIdx}',vid.currentTime,30);
				}
				
				function setCookie(cookie_name, value, days) {
					var exdate = new Date();
					exdate.setDate(exdate.getDate() + days);
					var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
					document.cookie = cookie_name + '=' + cookie_value;
				}
				
				function getCookie(cookie_name) {
					var x, y;
					var val = document.cookie.split(';');
					for (var i = 0; i < val.length; i++) {
						x = val[i].substr(0, val[i].indexOf('='));
						y = val[i].substr(val[i].indexOf('=') + 1);
						x = x.replace(/^s+|s+$/g, '');
						if (x == cookie_name) {return unescape(y);}
					}
				} 
			</script>
		</c:if>
	</c:if>
	<script>
		var wishSw = ${wishSw == null ? false : true};
		<c:if test="${memberInfo == null}">
			function wish(){				
				alert("로그인이 필요한 서비스입니다.");
			}
		</c:if>
		<c:if test="${memberInfo != null}">
			function wish(){
				if(wishSw){
					$.ajax({
						url:"<c:url value='/member/wishListDelete'/>",
						type:"get",
						data:{
							memberIdx: ${memberInfo.memberIdx},
							movieIdx: ${movieVO.movieIdx}
						},
						success:function(data){
							if(data = "success"){
								$("#btn_wish").html("");
								$("#btn_wish").html("<i class='far fa-heart'></i> 찜하기");
								wishSw = false;
							}
						}
					});
				}else{
					$.ajax({
						url:"<c:url value='/member/wishListAdd'/>",
						type:"get",
						data:{
							memberIdx: ${memberInfo.memberIdx},
							movieIdx: ${movieVO.movieIdx}
						},
						success:function(data){
							if(data = "success"){
								$("#btn_wish").html("");
								$("#btn_wish").html("<i class='fas fa-heart'></i> 찜하기");
								wishSw = true;
							}
						}
					});	
				}
			}
		</c:if>
		
		
		$.fn.raty.defaults.path = '<c:url value='/resources/images/lib/images'/>';

		$(function() {
			$('#star').raty({
				half   : true,
				score: ${empty movieRating ? 0 : movieRating},
				click: function(score, evt) {
					<c:if test='${empty memberInfo}'>
						alert("로그인이 필요합니다.")
						return;
					</c:if>
					<c:if test='${not empty memberInfo}'>
						$.ajax({
							url:"<c:url value='/member/rating'/>",
							type:"get",
							data:{
								memberIdx: ${memberInfo.memberIdx},
								movieIdx: ${movieVO.movieIdx},
								score:score
							},
							success:function(data){
								
							}
						});
					</c:if>
			  	}
			});
			
			$('#mouseover').raty({
		  		mouseover: function(score, evt) {
		    		alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
		  		}
			});

			$('#mouseout').raty({
		  		mouseout: function(score, evt) {
		    		alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
		  		}
			});
		});	
	</script>
</body>
</html>
