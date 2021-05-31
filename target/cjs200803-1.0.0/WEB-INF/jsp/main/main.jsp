<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="genre1" value="${genreRandom[0]}"/>
<c:set var="genre2" value="${genreRandom[1]}"/>
<c:set var="genre3" value="${genreRandom[2]}"/>
<c:set var="genre4" value="${genreRandom[3]}"/>
<!DOCTYPE html>
<html style="width: initial;">
<head>
	<meta charset="UTF-8">
	<title><spring:message code="title.main"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/mainContent.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/mainSlide.css'/>">
	<style>
		body{
			margin:0;
			background-color: black;
		}
		.example-slider .fnc-slide-1 .fnc-slide__inner,
		.example-slider .fnc-slide-1 .fnc-slide__mask-inner {
		  background-image: url("<c:url value='/resources/images/banner/banner1.jpg'/>");
		}
		.example-slider .fnc-slide-2 .fnc-slide__inner,
		.example-slider .fnc-slide-2 .fnc-slide__mask-inner {
		  background-image: url("<c:url value='/resources/images/banner/banner2.jpg'/>");
		}
		.example-slider .fnc-slide-3 .fnc-slide__inner,
		.example-slider .fnc-slide-3 .fnc-slide__mask-inner {
		  background-image: url("<c:url value='/resources/images/banner/banner3.jpg'/>");
		}
		.example-slider .fnc-slide-4 .fnc-slide__inner,
		.example-slider .fnc-slide-4 .fnc-slide__mask-inner {
		  background-image: url("<c:url value='/resources/images/banner/banner4.jpg'/>");
		}
		
		.rolling_box{
			float:right;
            width: 80%;
            height: 40px;
            text-align: center;
        }

        .rolling_box ul {
        	padding-left:0px;
        	list-style-type:none;
            width: 100%;
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        .rolling_box ul li {
            width: 100%;
            height: 100%;
            transition: .5s;
            position:absolute;
            transition: top .75s;
            top: 100%;
            z-index: 1;
            background-color:black;
        }

        .card_sliding{
            top: 0 !important;
            z-index: 100 !important;
        } 

        .card_sliding_after{
            top: -100% !important;
            z-index: 10 !important;
        }

        .rolling_box ul li p {
        	color:#a5a5a5;
            font-size: 20px;
            line-height: 40px;
            font-weight: bold;
        }
        
        .rolling_box ul{
        	text-align: initial;
        }

        .before_slide {
            transform: translateY(100%);
        }

        .after_slide {
            transform: translateY(0);
        }
        
        #notify{
        	color:#a5a5a5;
            font-size: 20px;
            line-height: 40px;
            font-weight: bold;
        }
        
		a:link {
			color: #a5a5a5;
			text-decoration: none;
		}
		a:visited { 
			color: #a5a5a5; 
			text-decoration: none;
		}
		a:hover { 
			color: #a5a5a5;
			text-decoration: none;
		}

	</style>
</head>
<body style="overflow: hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div class="row" style="z-index: -1;">
		<div class="col-sm-12">
			<div class="demo-cont">
  				<!-- slider start -->
  				<div class="fnc-slider example-slider">
    				<div class="fnc-slider__slides">
      					<!-- slide start -->
      					<div class="fnc-slide m--blend-green m--active-slide">
        					<div class="fnc-slide__inner">
          						<div class="fnc-slide__mask">
            						<div class="fnc-slide__mask-inner"></div>
          						</div>
          						<div class="fnc-slide__content">
            						<h2 class="fnc-slide__heading">
              							<div class="fnc-slide__heading-line">
                							<span>DUNKIRK</span>
              							</div>
            						</h2>
            						<button type="button" class="fnc-slide__action-btn">
              							Credits
              							<span data-text="Credits">Credits</span>
            						</button>
          						</div>
        					</div>
      					</div>
      					<!-- slide end -->
      					<!-- slide start -->
      					<div class="fnc-slide m--blend-dark">
        					<div class="fnc-slide__inner">
          						<div class="fnc-slide__mask">
            						<div class="fnc-slide__mask-inner"></div>
          						</div>
          						<div class="fnc-slide__content">
            						<h2 class="fnc-slide__heading">
              							<div class="fnc-slide__heading-line">
                							<span>TAKEN</span>
              							</div>
            						</h2>
            						<button type="button" class="fnc-slide__action-btn">
              							Credits
              							<span data-text="Credits">Credits</span>
            						</button>
          						</div>
        					</div>
      					</div>
      					<!-- slide end -->
      					<!-- slide start -->
      					<div class="fnc-slide m--blend-red">
        					<div class="fnc-slide__inner">
          						<div class="fnc-slide__mask">
            						<div class="fnc-slide__mask-inner"></div>
          						</div>
          						<div class="fnc-slide__content">
            						<h2 class="fnc-slide__heading">
              							<div class="fnc-slide__heading-line">
                							<span>JOKER</span>
              							</div>
            						</h2>
            						<button type="button" class="fnc-slide__action-btn">
              							Credits
              							<span data-text="Credits">Credits</span>
            						</button>
          						</div>
        					</div>
      					</div>
      					<!-- slide end -->
      					<!-- slide start -->
      					<div class="fnc-slide m--blend-blue">
        					<div class="fnc-slide__inner">
          						<div class="fnc-slide__mask">
            						<div class="fnc-slide__mask-inner"></div>
          						</div>
          						<div class="fnc-slide__content">
            						<h2 class="fnc-slide__heading">
              							<div class="fnc-slide__heading-line">
                							<span>INTERSTELLAR</span>
              							</div>
            						</h2>
            						<button type="button" class="fnc-slide__action-btn">
              							Credits
              							<span data-text="Credits">Credits</span>
            						</button>
          						</div>
        					</div>
      					</div>
      					<!-- slide end -->
    				</div>
    				<nav class="fnc-nav">
      					<div class="fnc-nav__bgs">
        					<div class="fnc-nav__bg m--navbg-green m--active-nav-bg"></div>
        					<div class="fnc-nav__bg m--navbg-dark"></div>
        					<div class="fnc-nav__bg m--navbg-red"></div>
        					<div class="fnc-nav__bg m--navbg-blue"></div>
      					</div>
      					<div class="fnc-nav__controls">
        					<button class="fnc-nav__control">
          						<span class="fnc-nav__control-progress"></span>
        					</button>
        					<button class="fnc-nav__control">
          						<span class="fnc-nav__control-progress"></span>
        					</button>
        					<button class="fnc-nav__control">
          						<span class="fnc-nav__control-progress"></span>
        					</button>
        					<button class="fnc-nav__control">
          						<span class="fnc-nav__control-progress"></span>
        					</button>
      					</div>
    				</nav>
  				</div>
			</div>
		</div>
	</div>
	<hr color="#a5a5a5" style="margin-top: 20px; margin-bottom: 0px;">
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<button type="button" style="border: none; padding: 0px;" class="btn btn-outline-secondary" onclick="location.href='<c:url value="/userService/notifyList"/>';">
				<span id="notify">공지사항</span>
			</button>
			<div class="rolling_box">
  				<ul id ="rolling_box">
				    <li class="card_sliding" id ="first"><p></p></li>
				    <li class="" id ="second"><p></p></li>
				    <li class="" id ="third"><p></p></li>
  				</ul>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<hr color="#a5a5a5" style="margin:0px;">
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<a href="<c:url value='/movie/movieList?searchKeyword=${genre1}'/>">
					<font color="#fff">${genre1}</font>
				</a>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-0 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
			<section class="movieContent">
				<c:forEach items="${mainImages}" var="movieImage">
					<c:if test="${movieImage.key ==  genre1}">
						<c:forEach items="${movieImage.value}" var="image">
							<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${image.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
								<div class="img">
									<img width="100%" height="100%" 
							    		src="<c:url value='/mainImage?movieIdx=${image.movieIdx}&fileName=${image.fileName}'/>">
								</div>
								<div class="border"><h1>▶</h1></div>
							</div>							
						</c:forEach>
					</c:if>
				</c:forEach>				
			</section>
		</div>
		<div class="col-sm-0 col-md-1 col-lg-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<a href="<c:url value='/movie/movieList?searchKeyword=${genre2}'/>">
					<font color="#fff">${genre2}</font>
				</a>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-0 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
			<section class="movieContent">
				<c:forEach items="${mainImages}" var="movieImage">
					<c:if test="${movieImage.key ==  genre2}">
						<c:forEach items="${movieImage.value}" var="image">
							<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${image.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
								<div class="img">
									<img width="100%" height="100%" 
							    		src="<c:url value='/mainImage?movieIdx=${image.movieIdx}&fileName=${image.fileName}'/>">
								</div>
								<div class="border"><h1>▶</h1></div>
							</div>							
						</c:forEach>
					</c:if>
				</c:forEach>				
			</section>
		</div>
		<div class="col-sm-0 col-md-1 col-lg-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<a href="<c:url value='/movie/movieList?searchKeyword=${genre3}'/>">				
					<font color="#fff">${genre3}</font>
				</a>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-0 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
			<section class="movieContent">
				<c:forEach items="${mainImages}" var="movieImage">
					<c:if test="${movieImage.key ==  genre3}">
						<c:forEach items="${movieImage.value}" var="image">
							<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${image.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
								<div class="img">
									<img width="100%" height="100%" 
							    		src="<c:url value='/mainImage?movieIdx=${image.movieIdx}&fileName=${image.fileName}'/>">
								</div>
								<div class="border"><h1>▶</h1></div>
							</div>							
						</c:forEach>
					</c:if>
				</c:forEach>				
			</section>
		</div>
		<div class="col-sm-0 col-md-1 col-lg-1"></div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<img src="<c:url value='/resources/images/pay_banner.jpg'/>" style="width: 100%; padding-top: 60px;">
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<a href="<c:url value='/movie/movieList?searchKeyword=${genre4}'/>">
					<font color="#fff">${genre4}</font>
				</a>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="row" style="padding-bottom: 200px;">
		<div class="col-sm-0 col-md-1 col-lg-1">
		</div>
		<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
			<section class="movieContent">
				<c:forEach items="${mainImages}" var="movieImage">
					<c:if test="${movieImage.key ==  genre4}">
						<c:forEach items="${movieImage.value}" var="image">
							<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${image.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
								<div class="img">
									<img width="100%" height="100%" 
							    		src="<c:url value='/mainImage?movieIdx=${image.movieIdx}&fileName=${image.fileName}'/>">
								</div>
								<div class="border"><h1>▶</h1></div>
							</div>							
						</c:forEach>
					</c:if>
				</c:forEach>				
			</section>
		</div>
		<div class="col-sm-0 col-md-1 col-lg-1"></div>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
	<c:if test="${not empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<script>
		var rollingData = [
			<c:forEach items="${notifyList}" var="notify" varStatus="index">
				<c:if test="${!index.last}">
					"${notify.notifyIdx}|${notify.notifyTitle}",
				</c:if>
				<c:if test="${index.last}">
					"${notify.notifyIdx}|${notify.notifyTitle}"
				</c:if>
			</c:forEach>
      	]    // 롤링할 데이터를 넣으면 됩니다 갯수 제한 없어요
      	
      	
		var timer = 4000 // 롤링되는 주기 입니다 (1000 => 1초)
		
		var first = document.getElementById('first'),
		second = document.getElementById('second'),
		third = document.getElementById('third')
		var move = 2
		var dataCnt = 1
		var listCnt = 1
		
		var notiArr = rollingData[0].split("|");
		//위 선언은 따로 완전히 수정하지 않는 한 조정할 필요는 없습니다.
		
		first.children[0].innerHTML = "<a clsaa='rollingNotify' href='<c:url value="/userService/notifyInfo?notifyIdx="/>" + notiArr[0] + "'>" + notiArr[1] + "</a>";
		
		setInterval(() => {
			if(move == 2){
				first.classList.remove('card_sliding')
				first.classList.add('card_sliding_after')
				
				second.classList.remove('card_sliding_after')
				second.classList.add('card_sliding')
				
				third.classList.remove('card_sliding_after')
				third.classList.remove('card_sliding')
				
				move = 0
			}else if(move == 1){
				first.classList.remove('card_sliding_after')
				first.classList.add('card_sliding')
				
				second.classList.remove('card_sliding_after')
				second.classList.remove('card_sliding')
				
				third.classList.remove('card_sliding')
				third.classList.add('card_sliding_after')
				
				move = 2
			}else if(move == 0) {
				first.classList.remove('card_sliding_after')
				first.classList.remove('card_sliding')
				
				second.classList.remove('card_sliding')
				second.classList.add('card_sliding_after')
				
				third.classList.remove('card_sliding_after')
				third.classList.add('card_sliding')
				
				move = 1
			}
			
			if(dataCnt < (rollingData.length - 1)) {
				notiArr = rollingData[dataCnt].split("|");
				document.getElementById('rolling_box').children[listCnt].children[0].innerHTML = "<a clsaa='rollingNotify' href='<c:url value="/userService/notifyInfo?notifyIdx="/>" + notiArr[0] + "'>" + notiArr[1] + "</a>";
				dataCnt++
			}else if(dataCnt == rollingData.length - 1) {
				notiArr = rollingData[dataCnt].split("|");
				document.getElementById('rolling_box').children[listCnt].children[0].innerHTML = "<a clsaa='rollingNotify' href='<c:url value="/userService/notifyInfo?notifyIdx="/>" + notiArr[0] + "'>" + notiArr[1] + "</a>";
				dataCnt = 0
			}
			
			if(listCnt < 2) {
				listCnt++
			} else if (listCnt == 2) {
				listCnt = 0
			}
			
		}, timer);
	</script>
	<script src="<c:url value='/resources/js/mainSlide.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>