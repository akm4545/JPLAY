<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="title.addMember"/></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/memberLogin.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/mamberAddModal.css'/>">
	<style>
		body {
			background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url(<c:url value='/resources/images/background.jpg'/>);
		}
		#member_wrap .container .half.bg {
			background-image: url("<c:url value='/resources/images/member.png'/>");
		}
		td{
			padding-top: 30px;
		}
		table{
			text-align: center;
		}
	</style>
</head>
<!-- 유효성 체크 추가, 링크 추가 -->
<body style="overflow-x:hidden">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="member_wrap">
		<section class="container" style="overflow: inherit; height: 600px; margin-bottom: 40px; padding:0 60px;">
			<article style="padding-top:20px;">
				<h1>회 원 정 보</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="#signin">회 원 정 보</a></span>
				</div>
				<div class="content">
					<div class="signin-cont cont">
						<div style="color:darkgray; font-size: 1em; margin-bottom: 20px;">
							회원님의 회원정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인해주세요.			
						</div>
						<form:form commandName="memberVO" name="memberVO" action="${contextPath}/member/memberInfo" cssClass="needs-validation" method="post">
							<div class="form-group" style="height: 28%">
							    <label for="memberPwd">비밀번호</label>
							    <form:password path="memberPwd" cssClass="form-control" placeholder="비밀번호" cssStyle="color:white;"/>
	    					</div>
							<div class="submit-wrap">
								<input type="submit" value="확인" class="submit" style="margin: 10px 0;"> 
								<input type="button" value="돌아가기" class="submit" onclick="location.href='<c:url value="/main"/>'" style="margin: 10px 0;">
							</div>
							<form:hidden path="memberIdx"/>
						</form:form>
					</div>
				</div>
			</article>
		</section>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="<c:url value='/resources/js/memberAddModal.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/validator'/>" ></script>
		<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>
		<script type="text/javascript">
			
			$('.tabs .tab').click(function() {
				if ($(this).hasClass('signin')) {
					$('.tabs .tab').removeClass('active');
					$(this).addClass('active');
					$('.cont').hide();
					$('.signin-cont').show();
				}
				if ($(this).hasClass('signup')) {
					$('.tabs .tab').removeClass('active');
					$(this).addClass('active');
					$('.cont').hide();
					$('.signup-cont').show();
				}
			});
			$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',amountMovedX + 'px ' + amountMovedY + 'px');
			});
			(function() {
				'use strict';
				window.addEventListener('load', function() {
					// Get the forms we want to add validation styles to
					var forms = document.getElementsByClassName('needs-validation');
					// Loop over them and prevent submission
					var validation = Array.prototype.filter.call(forms, function(form) {
						form.addEventListener('submit', function(event) {
							if (form.checkValidity() === false) {
								event.preventDefault();
					    		event.stopPropagation();
					    		form.classList.add("was-validated");
							}
					    }, false);
					});
				}, false);
			})();
		</script>
		<c:if test="${not empty msg}">
			<script>
				alert("${msg}");
			</script>
		</c:if>
		<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
	</div>
</body>
</html>