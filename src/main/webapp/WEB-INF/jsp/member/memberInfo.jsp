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
			background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),url(<c:url value='/resources/images/login-the-crown_2-1500x1000.jpg'/>);
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
		.container{
			background-color: inherit !important;
		}
	</style>
</head>
<!-- 유효성 체크 추가, 링크 추가 -->
<body style="overflow-x:hidden">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="member_wrap">
		<section class="container" style="overflow: inherit; height: 1000px; margin-bottom: 20px; padding:0 60px;">
			<article style="padding-top:20px;">
				<h1>회 원 정 보</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="#signin">정 보 수 정</a></span>
				</div>
				<div class="content">
					<div class="signin-cont cont">
						<form:form commandName="memberVO" name="memberVO" action="${contextPath}/member/memberUpdate" cssClass="needs-validation" method="post">
							<div class="form-group" style="height: 28%">
							    <label for="memberId">아이디</label>
							    <form:input path="memberId" cssClass="form-control" cssStyle="width: 80%; display: inline-block; color:white;" placeholder="아이디" readonly="true"/>
							    <div style="color:darkgray; font-size: 0.8em;" id="errorId"><form:errors path="memberId" delimiter=" "/></div>
	    					</div>
							<div class="form-group" style="height: 28%">
							    <label for="memberPwd">비밀번호</label>
							    <form:password path="memberPwd" cssClass="form-control" placeholder="비밀번호" cssStyle="color:white;"/>
							    <div style="color:darkgray; font-size: 0.8em;">시작하는 8~11자리 영어는 필수 포함입니다.</div>
							    <div style="color:darkgray; font-size: 0.8em;" id="errorPwd"><form:errors path="memberPwd" delimiter=" "/></div>
	    					</div>
	    					<div class="form-group" style="height: 28%">
							    <label for="member_pwd_check">비밀번호 확인</label>
							    <input type="password" class="form-control" id="member_pwd_check" placeholder="비밀번호 확인" name="member_pwd_check" style="color:white;">
							    <div style="color:darkgray; font-size: 0.8em;"></div>
	    					</div>
	    					<div class="form-group" style="height: 28%">
							    <label for="memberName">성명</label>
							    <form:input path="memberName" cssClass="form-control" placeholder="성명" cssStyle="color:white;"/>
							    <div style="color:darkgray; font-size: 0.8em;" id="errorName"><form:errors path="memberName" delimiter=" "/></div>
	    					</div>
	    					<div class="form-group" style="height: 28%">
							    <label for="memberEmail">이메일</label>
							    <form:input path="memberEmail" cssClass="form-control" onchange="mailSw()" cssStyle="width: 80%; display: inline-block; color:white;" placeholder="이메일"/>
							    <input type="button" value="인증하기" id="btn_sendMail" onclick="updateMailSend()" class="btn btn-secondary"/>
							    <div style="color:darkgray; font-size: 0.8em;" id="errorEmail"><form:errors path="memberEmail" delimiter=" "/></div>
	    					</div>
	    					<div class="form-group" style="height: 28%">
							    <label for="memberTel">휴대전화</label>
							    <form:input path="memberTel" cssClass="form-control" placeholder="휴대전화" cssStyle="color:white;"/>
							    <div style="color:darkgray; font-size: 0.8em;">'-'를 제외하고 입력하세요.</div>
							    <div style="color:darkgray; font-size: 0.8em;" id="errorTel"><form:errors path="memberTel" delimiter=" "/></div>
	    					</div>
							<div class="submit-wrap">
								<input type="button" value="수정하기" class="submit" onclick="updateSwCheck()" style="margin: 10px 0;"> 
								<input type="button" value="돌아가기" class="submit" onclick="location.href='<c:url value="/main"/>'" style="margin: 10px 0;">
							</div>
							<form:hidden path="memberIdx"/>
						</form:form>
					</div>
				</div>
			</article>
		</section>
		<!-- The Modal -->
		<div id="myModal" class="modal">
		  	<!-- Modal content -->
		  	<div class="modal-content" style="background-color: black; color:darkgray; width: 45%">
			    <span class="close" style="text-align: right;">&times;</span>
			     <div class="modal-header">
    				<h2>이메일 인증하기</h2>
  				</div>
  				<table>
			    	<tr>
			    		<td>
					    	인증번호 입력
			    		</td>
			    		<td>
					    	<input type="text" id="joinNum" />
			    			<input type="button" value="인증하기" onclick="updateNum_check()" class="btn btn-secondary btn-sm"/>			    		
			    		</td>
			    	</tr>
			    </table>
		  	</div>
		</div>
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
			
			var mail_checkSw = true;
			function mailSw(){
				mail_checkSw = false;
			}
						
			var output_updateNum;
			function updateMailSend(){
				var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var email = $("#memberEmail").val();
				
				if(!reg.test(email)){
					alert("이메일 형식을 확인하세요.");
					return false;
				}
				
				modal.style.display = "block";
				$.ajax({
					url:"<c:url value='/email/updateSend'/>",
					type:"get",
					data:{
						email:email
					},
					success:function(data){
						if(data != ""){
							output_updateNum = data;
						}else{
							alert("에러가 발생했습니다.");
						}
					}
				});
			}
			
			function updateNum_check(){
				var input_updateNum = $("#joinNum").val();
				if(input_updateNum == output_updateNum){
					alert("확인되셨습니다.");
					mail_checkSw = true;
					$("#memberEmail").attr("readonly",true);
					$("#btn_sendMail").attr("disabled",true);
					modal.style.display = "none";
				}else{
					alert("인증번호가 틀립니다.");
					return;
				}
			}
			
			var vailMode = "member";
			function updateSwCheck(){
				var pwd = $("#memberPwd").val();
				var pwd_check = $("#member_pwd_check").val();
				
				if(pwd != pwd_check){
					alert("비밀번호 확인란이 다릅니다.");
					return false;
				}else if(!mail_checkSw){
					alert("이메일을 인증하세요.");
					return false;
				}else{ 
					var memberForm = document.getElementById("memberVO");
					if(!validateMemberVO(memberForm)){
						return false;
					}else{
						memberForm.submit();
					}					
				}
			}
		</script>
		<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
	</div>
</body>
</html>