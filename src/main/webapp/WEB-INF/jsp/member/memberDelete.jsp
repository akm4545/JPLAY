<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="title.login"/></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/mamberAddModal.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/memberLogin.css'/>">
	<style>
		body {
			background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url(<c:url value='/resources/images/background.jpg'/>);
		}
		#member_wrap .container .half.bg {
			background-image: url("<c:url value='/resources/images/member.png'/>");
		}
	</style>
	<script>
		<c:if test="${deleteFailed != null}">
			alert("아이디나 비밀번호를 확인하세요.");
		</c:if>
	</script>
</head>
<!-- 유효성 체크 추가, 링크 추가 -->
<body>
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="member_wrap" style="margin-bottom: 40px;">
		<section class="container">
			<article class="half formopa" style="padding-top:20px;">
				<h1>회 원 탈 퇴
				</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="#signin">JPlay계정</a></span>
				</div>
				<div class="content">
					<div class="signin-cont cont">
						<form:form commandName="memberVO" action="${contextPath}/member/memberDelete" method="post" cssClass="needs-validation">
							<div class="form-group" style="height: 20%">
							    <label for="memberId">아이디</label>
							    <form:input path="memberId" cssClass="form-control" placeholder="아이디" cssStyle="color:white;"/>
							    <div class="invalid-feedback" style="font-size: 0.5em">영어로 시작하는 6~11자 영어,숫자로 입력하세요.</div>
	    					</div>
							<div class="form-group" style="height: 20%">
							    <label for="memberPwd">비밀번호</label>
							    <form:password path="memberPwd" cssClass="form-control" placeholder="비밀번호" cssStyle="color:white;"/>
							    <div class="invalid-feedback" style="font-size: 0.5em">비밀번호를 입력하세요.</div>
	    					</div>
							<div class="submit-wrap">
								<input type="submit" value="탈퇴신청" class="submit" style="margin: 10px 0;"> 
								<input type="button" value="돌아가기" class="submit" onclick="location.href='<c:url value="/main"/>'" style="margin: 10px 0;">
							</div>
						</form:form>
					</div>
				</div>
			</article>
			<div class="half bg"></div>
		</section>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
</body>
</html>