<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		td{
			padding-top: 30px;
		}
		table{
			text-align: center;
		}
	</style>
	<script>
		<c:if test="${loginFailed != null}">
			alert("아이디나 비밀번호를 확인하세요.");
		</c:if>
	</script>
</head>
<!-- 유효성 체크 추가, 링크 추가 -->
<body style="overflow-x:hidden">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="member_wrap">
		<section class="container" style="margin-bottom: 40px;">
			<article class="half formopa" style="padding-top:20px;">
				<h1>로 그 인
				</h1>
				<div class="tabs">
					<span class="tab signin active"><a href="#signin">JPlay계정</a></span>
				</div>
				<div class="content">
					<div class="signin-cont cont">
						<form:form commandName="memberVO" action="${contextPath}/member/loginCheck" method="post" cssClass="needs-validation">
							<div class="form-group" style="height: 20%">
							    <label for="memberId">아이디</label>
							    <form:input path="memberId" cssClass="form-control" placeholder="아이디" cssStyle="color:white;" value="${cookie.userId.value}"/>
							    <div class="invalid-feedback" style="font-size: 0.5em">영어로 시작하는 6~11자 영어,숫자로 입력하세요.</div>
	    					</div>
							<div class="form-group" style="height: 20%">
							    <label for="memberPwd">비밀번호</label>
							    <form:password path="memberPwd" cssClass="form-control" placeholder="비밀번호" cssStyle="color:white;"/>
							    <div class="invalid-feedback" style="font-size: 0.5em">비밀번호를 입력하세요.</div>
	    					</div>
							<input type="checkbox" id="remember" name="remember" value="remember" ${cookie.userId.value != null ? 'checked' : ''} class="checkbox">
							<label for="remember">아이디 저장</label>
							<div class="submit-wrap">
								<input type="submit" value="로그인" class="submit" style="margin: 10px 0;"> 
								<input type="button" value="회원가입" class="submit" onclick="location.href='<c:url value="/member/addMemberView"/>'" style="margin: 10px 0;">
								<input type="button" value="아이디 찾기" class="submit" onclick="id_search()" style="margin: 10px 0;">
								<input type="button" value="비밀번호 찾기" class="submit" onclick="pwd_search()" style="margin: 10px 0;">
							</div>
							<input type="hidden" name="movieUrl" value="${movieUrl}" />
						</form:form>
					</div>
				</div>
			</article>
			<div class="half bg"></div>
		</section>
		<div id="idSearch" class="modal" style="overflow-y:hidden;">
		  	<!-- Modal content -->
		  	<div class="modal-content" style="background-color: black; color:darkgray; width: 45%">
			    <span class="close" onclick="id_close()" style="text-align: right;">&times;</span>
			    <div class="modal-header">
    				<h2>아이디 찾기</h2>
  				</div>
			    <table>
			    	<tr>
			    		<td>
					    	이메일주소
			    		</td>
			    		<td>
					    	<input type="text" id="email_id_memberEmail"/>
					    	<input type="button" value="인증하기" onclick="id_search_email()" class="btn btn-secondary btn-sm"/>			    		
			    		</td>
			    	</tr>
			    	<tr>
			    		<td style="padding-bottom: 30px;">
			    			인증번호			
			    		</td>
			    		<td style="padding-bottom: 30px;">
			    			<input type="text" id="id_check_num" disabled/>
			    			<input type="button" id="id_check_btn" value="입력하기" onclick="id_search_num_check()" class="btn btn-secondary btn-sm" disabled/>	
			    		</td>
			    	</tr>
			    	<tr id="search_id_tr" style="display: none;">
			    		<td>
			    			찾은 아이디
			    		</td>
			    		<td>
			    			<input type="text" id="search_id" readonly/>
			    		</td>
			    	</tr>
			    </table>			    	
			  </div>
		</div>
		<div id="pwdSearch" class="modal" style="overflow-y:hidden;">
		  	<!-- Modal content -->
		  	<div class="modal-content" style="background-color: black; color:darkgray; width: 45%">
			    <span class="close" onclick="pwd_close()" style="text-align: right;">&times;</span>
			    <div class="modal-header">
    				<h2>비밀번호 찾기</h2>
  				</div>
  				<table>
  					<tr>
  						<td>
  							아이디
  						</td>
  						<td>
  							<input type="text" id="email_pwd_memberId" style="width: 320px;"/>
  						</td>
  					</tr>
  					<tr>
  						<td>
  							이메일
  						</td>
  						<td>
  							<input type="text" id="email_pwd_memberEmail"/>
			    			<input type="button" value="인증하기" onclick="pwd_search_email()" class="btn btn-secondary btn-sm"/>
  						</td>
  					</tr>
  					<tr>
  						<td style="padding-bottom: 30px;">
  							인증번호
  						</td>
  						<td style="padding-bottom: 30px;">
  							<input type="text" id="pwd_check_num" disabled/>
			    			<input type="button" id="pwd_check_btn" value="입력하기" onclick="pwd_search_num_check()" class="btn btn-secondary btn-sm" disabled/>
  						</td>
  					</tr>
  					<tr id="search_pwd_tr" style="display: none;">
  						<td>
  							찾은 비밀번호
  						</td>
  						<td>
  							<input type="text" id="search_pwd" readonly/>
  						</td>
  					</tr>
  				</table>
			  </div>
		</div>
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
			
			$("#memberVO").attr("novalidate",true);
			$("#memberId").attr("required",true);
			$("#memberPwd").attr("required",true);
			$("#memberId").attr("pattern","^[a-zA-Z]{1}[a-zA-Z0-9]{5,10}$");
			
			function id_search(){
				$("#email_id_memberEmail").val("");
				$("#id_check_num").val("");
				
				var modal = document.getElementById("idSearch");
				modal.style.display = "block";
			}
			
			function pwd_search(){
				$("#email_pwd_memberId").val("");
				$("#email_pwd_memberEmail").val("");
				$("#pwd_check_num").val("");
				
				var modal = document.getElementById("pwdSearch");
				modal.style.display = "block";
			}
			
			function id_close(){
				var modal = document.getElementById("idSearch");
				modal.style.display = "none";
			}
			
			function pwd_close(){
				var modal = document.getElementById("pwdSearch");
				modal.style.display = "none";
			}
			
			var memberId;
			var memberPwd;
			var searchNum;
			function id_search_email(){
				var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var email = $("#email_id_memberEmail").val();
				
				if(!reg.test(email)){
					alert("이메일 형식을 확인하세요.");
					return false;
				}
				
				$.ajax({
					url:"<c:url value='/email/idSearch'/>",
					type:"post",
					data:{
						memberEmail:email
					},
					success:function(data){
						if(data.emailStatus == "success"){
							searchNum = data.emailRandNum;
							memberId = data.memberId;
							
							$("#id_check_num").attr("disabled",false);
							$("#id_check_btn").attr("disabled",false);
							
						}else if (data.emailStatus == "reCheck"){
							alert("없는 회원입니다.");
						}else{
							alert("에러가 발생했습니다.");
						}
					}
				});
			}
			
			function pwd_search_email(){
				var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var id = $("#email_pwd_memberId").val();
				var email = $("#email_pwd_memberEmail").val();
				
				if(!reg.test(email)){
					alert("이메일 형식을 확인하세요.");
					return false;
				}
				
				$.ajax({
					url:"<c:url value='/email/pwdSearch'/>",
					type:"post",
					data:{
						memberId:id,
						memberEmail:email
					},
					success:function(data){
						if(data.emailStatus == "success"){
							searchNum = data.emailRandNum;
							memberPwd = data.memberPwd;
							
							$("#pwd_check_num").attr("disabled",false);
							$("#pwd_check_btn").attr("disabled",false);
						}else if (data.emailStatus == "reCheck"){
							alert("없는 회원입니다.");
						}else{
							alert("에러가 발생했습니다.");
						}
					}
				});
			}
			
			function id_search_num_check(){
				if($("#id_check_num").val() == searchNum){
					$("#search_id_tr").css("display","contents");
					$("#search_id").val(memberId);
				}else{
					alert("인증번호를 확인하세요.");
				}
			}
			
			function pwd_search_num_check(){
				if($("#pwd_check_num").val() == searchNum){
					$("#search_pwd_tr").css("display","contents");
					$("#search_pwd").val(memberPwd);
				}else{
					alert("인증번호를 확인하세요.");
				}
			}
		</script>
	</div>
	<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
</body>
</html>