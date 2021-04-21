<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% pageContext.setAttribute("crcn", "\r\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title><spring:message code="title.memberPayment"/></title>
	<!-- Bootstrap core CSS -->
	<link href="<c:url value='/resources/css/admin/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
	<style>
		body{
			font-family: 'NotoSans', sans-serif;
			font-weight:bold;
			color: #a5a5a5;
			font-size: 0.8em;
		}
		
		#payWrap {
			background-color: #1b1b1b;
		}
		
		.row{
			padding-top: 40px;
			padding-bottom: 40px;
		}
		
		.tab {
			overflow: hidden;
			background-color: #252525;
		}
		
		.tablinks{
			color: white !important;
		}
		
		/* Style the buttons that are used to open the tab content */
		.tab button {
			background-color: inherit;
			float: left;
			border: none;
			outline: none;
			cursor: pointer;
			padding: 14px 16px;
			transition: 0.3s;
		}
		
		/* Change background color of buttons on hover */
		.tab button:hover {
			background-color: #444;
		}
		
		/* Create an active/current tablink class */
		.tab button.active {
			background-color: #444;
		}
		
		/* Style the tab content */
		.tabcontent {
			display: none;
			padding: 6px 12px;
			border-top: none;
		}
		
		#footer{
		 	background-color: #1b1b1b !important;
		 	font-size: 13px !important;
		}
		
		#payWrap ul{
			padding:0px;
			width: 100%;
			margin-top: 10px;
			list-style: none;
		}
		
		#payWrap li{
			margin-bottom: 10px;
			color: #a5a5a5;
			background-color: #2f2f2f;
			border-radius: 8px; 
		}
		
		#payWrap .payList{
			display:block;
			width: 100%;
			padding:28px 30px;
		}
		
		#qnaInfo{
			background-color : #252525;
			padding: 48px 150px;
		}
		
		.pay_sub_title{
			width: 100px;
		}
		
		#paymentList{
			min-height: 100%;
		}
		
		input{
			display: inline-block !important;
			padding: 3px !important;
		}
		
		.pay_method_subTitle{
			display: block;
			padding: 20px 0;
		}
		
		.form-control{
			display: initial;
			font-size: 15px !important;
		}
		
		#pay_card, #pay_phone, #pay_kakao{
			display: none;
		}
		
		.btn-primary{
			background-color: #1351f9 !important;
			width: 200px !important;
			height: 70px !important;
		}
		
		#use_pay{
			cursor: initial;
		}
		
		#serviceNum{
			color: #3887ff;
			font-size: 3em;
		}
		
		.serviceText{
			color: white;
		}
		
		.login_check{
			text-align: center;
			color: white;
			font-size: 30px;
		}
		
		.login_warp{
			padding-top: 200px;
			padding-bottom: 200px;
		}
		
		/* Style the accordion panel. Note: hidden by default */
		.panel {
		  	padding: 40px 25px;
		  	background-color: #252525;
		  	color:white;
		  	display: none;
		  	overflow: hidden;
		  	font-size: 15px;
		}
		.notifyList{
			text-align:center;
			width: 100%;
		}
		
		.notifyHead{
			border-top: 1px solid gray;
			border-bottom: 1px solid gray;
		}
		
		th, td{
			padding: 15px 0;
		}
		
		.notifyTitle{
			text-align: left;
		}
		
		.notify_Type_btn{
			background-color: #1b1b1b;
			border: none;
		}
		
		.notifyContent{
			text-align: left;
			padding: 28px 45px;
		}
		
		.notifyMoveTitle{
			color: white;
			display: block;
			width: 100%;
			margin-bottom: 20px;
		}
		
		.notifyPN{
			font-size: 22px;
			font-weight: 400;
			display: block;
			width: 100%;
		}
		
		.notifyDate{
			font-size: 14px;
		}
		
		td{
			font-weight: normal;
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
<body style="overflow:hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="payWrap">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="tab">
					<button class="tablinks">공지사항</button>
				</div>
				<div id="noti" class="tabcontent">
					<div class="row" style="padding: 0px;">
						<div class="col-sm-12" style="margin-top: 30px; padding-bottom: 20px;">
							<c:if test="${empty notify.searchCondition}">
								<button class="notify_Type_btn" onclick="location.href='<c:url value="/userService/notifyList"/>';">
									<font color="white" size="3em">
										전체
									</font>
								</button>
							</c:if>
							<c:if test="${not empty notify.searchCondition}">
								<button class="notify_Type_btn" onclick="location.href='<c:url value="/userService/notifyList"/>';">
									<font color="#a5a5a5" size="3em">
										전체
									</font>
								</button>
							</c:if>
							<font color="gray" size="3em">
								 |
							</font>
							<c:if test="${notify.searchCondition == 'S'}">
								<button class="notify_Type_btn">
									<font color="white" size="3em" onclick="location.href='<c:url value="/userService/notifyList?searchKeyword=service"/>';">
										서비스공지
									</font>
								</button>							
							</c:if>
							<c:if test="${notify.searchCondition != 'S'}">
								<button class="notify_Type_btn">
									<font color="#a5a5a5" size="3em" onclick="location.href='<c:url value="/userService/notifyList?searchKeyword=service"/>';">
										서비스공지
									</font>
								</button>							
							</c:if>
							<font color="gray" size="3em">
								 |
							</font>
							<c:if test="${notify.searchCondition == 'C'}">
								<button class="notify_Type_btn">
									<font color="white" size="3em" onclick="location.href='<c:url value="/userService/notifyList?searchKeyword=content"/>';">
										콘텐츠공지
									</font>
								</button>
							</c:if>
							<c:if test="${notify.searchCondition != 'C'}">
								<button class="notify_Type_btn">
									<font color="#a5a5a5" size="3em" onclick="location.href='<c:url value="/userService/notifyList?searchKeyword=content"/>';">
										콘텐츠공지
									</font>
								</button>
							</c:if>
						</div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-12">							
							<table class="notifyList">
								<colgroup>
									<col width="160px">
									<col width="*">
									<col width="160px">
								</colgroup>
								<tr class="notifyHead">
									<th>
										구분
									</th>
									<th>
										제목
									</th>
									<th>
										등록일
									</th>
								</tr>
								<tr>
									<td>
										${notify.notifyType}
									</td>
									<td class="notifyTitle">
										${notify.notifyTitle}
									</td>
									<td>
										${fn:substring(notify.notifyDate,0,11)}
									</td>
								</tr>
								<tr>
									<td class="notifyContent" colspan="3">
										<div>
											${fn:replace(notify.notifyContent,crcn, "<br/>")}
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="row" style="border-bottom: 1px solid gray;">
								<div class="col-sm-6">
									<c:if test="${not empty preNotify}">
										<a href="<c:url value='/userService/notifyInfo?notifyIdx=${preNotify.notifyIdx}'/>">
											<span class="notifyMoveTitle">이전글</span>
											<strong class="notifyPN">${preNotify.notifyTitle}</strong>
											<span class="notifyDate">${fn:substring(preNotify.notifyDate,0,11)}</span>
										</a>
									</c:if>
									<c:if test="${empty preNotify}">
											<span class="notifyMoveTitle">이전글</span>
											<strong class="notifyPN">이전글이 없습니다.</strong>
									</c:if>
								</div>
								<div class="col-sm-6">
									<c:if test="${not empty nextNotify}">
										<a href="<c:url value='/userService/notifyInfo?notifyIdx=${nextNotify.notifyIdx}'/>">
											<span class="notifyMoveTitle">다음글</span>
											<strong class="notifyPN">${nextNotify.notifyTitle}</strong>
											<span class="notifyDate">${fn:substring(preNotify.notifyDate,0,11)}</span>
										</a>
									</c:if>
									<c:if test="${empty nextNotify}">
											<span class="notifyMoveTitle">다음글</span>
											<strong class="notifyPN">다음글이 없습니다.</strong>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="padding: 0px;">
						<div class="col-sm-12" style="text-align: center; font-size: 25px;">
							<a href="<c:url value='/userService/notifyList?pageIndex=${notify.pageIndex}&searchCondition=${notify.searchCondition}&searchKeyword=${notify.searchKeyword}'/>">
								<i class="fas fa-bars"></i>목록
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
 	<!-- Bootstrap core JavaScript -->
  	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
  	<script src="<c:url value='/resources/js/admin/bootstrap.bundle.min.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
  	<script src="<c:url value='/resources/js/coming-soon.js'/>"></script>
	<script>
		document.getElementById("noti").style.display = "block";
		
	</script>
</body>
</html>