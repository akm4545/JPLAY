<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		
		.btn_qna{
			background-color: #1351f9;
			font-size: 16px;
			border-radius: 100px;
			width:178px;
			height:44px;
			color:white;
			text-align:center;
			border:1px solid #1351f9;
			font-weight: bold;
			float: right;
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
		
		.accordion {
			background-color: #1351f9;
			color: white;
			font-size:20px;
			font-weight:bolder;
			cursor: pointer;
			padding: 18px;
			width: 100%;
			text-align: left;
			border: none;
			outline: none;
			transition: 0.4s;
			padding-left: 60px;
		}
		
		/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
		.qna_active, .accordion:hover {
		  	background-color: darkblue;
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
		
	</style>
</head>
<body style="overflow:hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="payWrap">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'qna')">1:1문의</button>
				</div>
				<div id="qna" class="tabcontent">
					<div class="row" style="padding: 0px;">
						<div class="col-sm-12" id="qnaInfo">
							<span id="serviceNum"><i class="fas fa-phone-volume"></i>1599-1111</span>
							<span class="serviceText">평일 09:00-18:00 *점심시간 12:00-13:00 | 주말 및 공휴일 휴무</span>
							<div style="padding-top: 30px; width: 90%">
								<input type="button" class="btn_qna" value="1:1문의하기" onclick="loginCheck()"/>
							</div>
							<p class="serviceText">
								서비스 이용 시 불편사항이나 문의사항을 1:1 문의로 보내주시면
								<br/>
								신속하고 친절하게 안내해 드리겠습니다!
							</p>
						</div>
					</div>
					<div class="row" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10" style="margin-top: 30px;	">
							<font color="white" size="4em">
								나의 문의 내역
							</font>
							<hr style="background-color: gray;"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<c:if test="${empty memberInfo}">
								<div class="login_warp">
									<div class="login_check">
										<i class="fas fa-exclamation-circle"></i>
									</div>
									<div class="login_check">
										로그인이 필요합니다.
									</div>
								</div>
							</c:if>
							<c:if test="${empty resultList and not empty memberInfo}">
								<div class="login_warp">
									<div class="login_check">
										<i class="fas fa-exclamation-circle"></i>
									</div>
									<div class="login_check">
										문의 내역이 없습니다.
									</div>
								</div>
							</c:if>
							<c:if test="${not empty resultList}">
								<c:forEach items="${resultList}" var="qna">
									<button class="accordion">
										<table>
											<tr>
												<td colspan="2">
													[${qna.qnaType}]
												</td>
												<td>
													질문 - 
												</td>
												<td>
													${qna.qnaTitle} 		
												</td>
												<td>
													답변일 -
												</td>
												<td>
													${fn:substring(qna.qnaQuestionsdate,0,11)}		
												</td>
												<td>
													답변여부
												</td>
												<td>
													<c:if test="${qna.qnaAnswer == 'Y'}">
														<i class="far fa-check-circle"></i>
													</c:if>
												</td>
											</tr>
										</table>
									</button>
									<div class="panel">
										<table style="width: 100%;">
											<colgroup>
												<col width="100px;"/>
												<col width="*"/>
											</colgroup>
											<tr>
												<th style="text-align: center;">
													질문 내용
												</th>
												<td>
													${qna.qnaContent}
												</td>
											</tr>
											<tr>
												<c:if test="${not empty qna.qnaAnswercontent}">
													<th>
														답변 내용
													</th>
													<td>
														${qna.qnaContent}
													</td>
						  						</c:if>
											</tr>
						  				</table>
									</div>		
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="col-sm-1"></div>
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
		/* function paging(pageNo){
			document.listForm.pageIndex.value = pageNo;
			var searchCondition = document.createElement('input');
			searchCondition.setAttribute("type", "hidden");
			searchCondition.setAttribute("name", "searchCondition"); 
			searchCondition.setAttribute("value", "1");
			
			document.listForm.appendChild(searchCondition);
			
			document.listForm.action = "<c:url value='/payment/main'/>";
		   	document.listForm.submit();
		} */
		document.getElementById("qna").style.display = "block";
		
		function openCity(evt, view) {
			var i, tabcontent, tablinks;

			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
		    	tabcontent[i].style.display = "none";
			}

		  	tablinks = document.getElementsByClassName("tablinks");
		  	for (i = 0; i < tablinks.length; i++) {
		    	tablinks[i].className = tablinks[i].className.replace(" active", "");
		  	}

		  	document.getElementById(view).style.display = "block";
		  	evt.currentTarget.className += " active";
		}
		
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
		    	this.classList.toggle("qna_active");

			    var panel = this.nextElementSibling;
			    if (panel.style.display === "block") {
			    	panel.style.display = "none";
		    	} else {
		      		panel.style.display = "block";
		    	}
		  	});
		}
		
		<c:if test="${empty memberInfo}">
			function loginCheck(){
				alert("로그인이 필요합니다.");				
			}
		</c:if>
		<c:if test="${not empty memberInfo}">
			function loginCheck(){
				location.href='<c:url value="/userService/questionView?memberIdx=${memberInfo.memberIdx}"/>';				
			}
		</c:if>
	</script>
</body>
</html>