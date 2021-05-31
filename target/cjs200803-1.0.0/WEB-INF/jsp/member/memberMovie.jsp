<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html style="width: initial;">
<head>
	<meta charset="UTF-8">
	<title><spring:message code="title.main"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/mainContent.css'/>">
	<style>
		body{
			margin:0;
			background-color: black;
		}
		
		.no_click{
			cursor: inherit !important;
		}
	</style>
</head>
<body style="overflow: hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<font color="#fff">찜한 영화</font>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<c:if test="${not empty wishMovieList}">
		<c:forEach items="${wishMovieList}" var="movieImage" varStatus="index">
			<c:if test="${index.index % 4 == 0}">
				<c:set var="indexNum" value="${index.index + 3}"/>
				<div class="row" style="padding-bottom: 40px;">
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
						<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">			
							<section class="movieContent">
			</c:if>
			<c:if test="${index.index != fn:length(wishMovieList) - 1}">
				<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${movieImage.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
					<div class="img">
						<img width="100%" height="100%" 
    						src="<c:url value='/mainImage?movieIdx=${movieImage.movieIdx}&fileName=${movieImage.fileName}'/>">
					</div>
					<div class="border"><h1>▶</h1></div>
				</div>
			</c:if>
			<c:if test="${index.index == fn:length(wishMovieList) - 1}">
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
			<c:if test="${index.index == fn:length(wishMovieList) - 1}">
						</section>
					</div>
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
				</div>
			</c:if>
			<c:if test="${index.index != fn:length(wishMovieList)}">
				<c:if test="${index.index == indexNum}">
								</section>
							</div>
						<div class="col-sm-0 col-md-1 col-lg-1"></div>
					</div>
				</c:if>					
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty wishMovieList}">
		<div class="row" style="padding-bottom: 150px;">
			<div class="col-sm-0 col-md-1 col-lg-1">
			</div>
			<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
					찜한 영화가 없습니다.
			</div>
			<div class="col-sm-0 col-md-1 col-lg-1"></div>
		</div>
	</c:if>
	<div class="row">
		<div class="col-sm-12">
			<c:if test="${not empty wishMovieList}">
				<form:form commandName="searchVO" name="listForm" id="listForm" method="get">
					<div id="paging" style="text-align: center;">
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="link_page"/>
					</div>
					<form:hidden path="pageIndex"/>
					<form:hidden path="memberIdx"/>
				</form:form>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="col-sm-10">
			<h5 style="margin-top: 130px;">
				<font color="#fff">최근 본 영화</font>
			</h5>
		</div>
		<div class="col-sm-1"></div>
	</div>
	<c:if test="${not empty recentlyList}">
		<c:forEach items="${recentlyList}" var="movieImage" varStatus="index">
			<c:if test="${index.index % 4 == 0}">
				<c:set var="indexNum" value="${index.index + 3}"/>
				<div class="row" style="padding-bottom: 40px;">
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
						<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">			
							<section class="movieContent">
			</c:if>
			<c:if test="${index.index != fn:length(recentlyList) - 1}">
				<div class="frame" style="margin-left: 0px;" onclick="location.href='<c:url value="/movie/movieInfo?movieIdx=${movieImage.movieIdx}&memberIdx=${memberInfo.memberIdx}"/>';">
					<div class="img">
						<img width="100%" height="100%" 
    						src="<c:url value='/mainImage?movieIdx=${movieImage.movieIdx}&fileName=${movieImage.fileName}'/>">
					</div>
					<div class="border"><h1>▶</h1></div>
				</div>
			</c:if>
			<c:if test="${index.index == fn:length(recentlyList) - 1}">
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
			<c:if test="${index.index == fn:length(recentlyList) - 1}">
						</section>
					</div>
					<div class="col-sm-0 col-md-1 col-lg-1"></div>
				</div>
			</c:if>
			<c:if test="${index.index != fn:length(recentlyList)}">
				<c:if test="${index.index == indexNum}">
								</section>
							</div>
						<div class="col-sm-0 col-md-1 col-lg-1"></div>
					</div>
				</c:if>					
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty recentlyList}">
		<div class="row" style="padding-bottom: 150px;">
			<div class="col-sm-0 col-md-1 col-lg-1">
			</div>
			<div class="col-sm-12 col-md-10 col-lg-10 frame-sm" style="height: 350px;">
					최근 본 영화가 없습니다.
			</div>
			<div class="col-sm-0 col-md-1 col-lg-1"></div>
		</div>
	</c:if>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
	<script src="<c:url value='/resources/js/mainSlide.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function link_page(pageNo){
			document.getElementById("listForm").pageIndex.value = pageNo;
			document.getElementById("listForm").action = "<c:url value='/member/myMovie'/>";
		   	document.getElementById("listForm").submit();
		}
	</script>
</body>
</html>