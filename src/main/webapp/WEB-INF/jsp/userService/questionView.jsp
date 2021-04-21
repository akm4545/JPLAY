<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
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
		 *:focus { outline:none; }
	
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
		
		.form-control{
			display: initial;
			font-size: 15px !important;
		}
		
		.qnaTitle{
			text-align: center;
			font-size: 40px;
			padding-top: 100px;
		}
		
		.qnaText{
			font-size: 20px;
			text-align: center;
		}
		
		.btn_exit{
			width: 250px;
			height: 52px;
			border-radius: 32.5px;
			font-size:25px;
			color:#fff;
			background-color:#5e5e5e;
			border:1px solid #5e5e5e;
			font-weight: bold;
		}
		
		.btn_submit{
			width: 250px;
			height: 52px;
			border-radius: 32.5px;
			font-size:25px;
			color:#fff;
			background-color:#1351f9;
			border:1px solid #1351f9;
			font-weight: bold;
		}
		
		.qna_input_table{
			margin: 0 auto;
			width: 80%;
		}
		
		.qna_input_head{
			font-size: 25px;
			width: 30%;
		}
		
		th,td{
			padding-bottom:20px;
			padding-top:20px; 
		}
		
		.qna_input{
			border-radius: 10px;
			color:white;
			background-color: #252525;
			width: 100%;
			font-size: 25px;
			border:1px solid #252525;
			padding: 10px 20px;	
		}
		
		.btn_div{
			text-align: center;
			padding: 30px 0;
		}
	</style>
</head>
<body style="overflow:hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="payWrap">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="qnaTitle">1:1 문의하기</div>
			</div>
			<div class="col-sm-1"></div>	
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="qnaText">
					서비스 이용 시 불편사항이나 문의사항을 보내주시면 신속하고 친절하게 안내해 드리겠습니다!
					<br/>
					사용환경 및 상세사항을 적어주시면 정확하고 빠른 답변이 가능합니다.
				</div>
			</div>
			<div class="col-sm-1"></div>	
		</div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<form:form commandName="qnaVO" action="${contextPath}/userService/addQna" method="post">
					<table class="qna_input_table">
						<tr>
							<th class="qna_input_head">문의 제목</th>
							<td>
								<form:input path="qnaTitle" cssClass="qna_input" placeholder="문의 제목을 입력하세요."/>
								<div style="font-size: 0.9em;" id="errorTitle">
									<form:errors path="qnaTitle" delimiter=" "/>
								</div>
							</td>
						</tr>
						<tr>
							<th class="qna_input_head">질문 구분</th>
							<td>
								<form:select items="${type}" path="qnaType" cssClass="qna_input"/>
								<div style="font-size: 0.9em;" id="errorType">
									<form:errors path="qnaType" delimiter=" "/>
								</div>
							</td>
						</tr>
						<tr>
							<th class="qna_input_head" style="padding-top: 0">질문 내용</th>
							<td>
								<form:textarea path="qnaContent" cssClass="qna_input" placeholder="문의 내용을 입력하세요." rows="5" cssStyle="resize: none;"/>
								<div style="font-size: 0.9em;" id="errorContent">
									<form:errors path="qnaContent" delimiter=" "/>
								</div>
							</td>
						</tr>
					</table>
					<div class="btn_div">
						<input type="button" class="btn_exit" onclick="location.href='<c:url value="/userService/main?memberIdx=${memberInfo.memberIdx}"/>'" value="취소"/>
						<input type="button" onclick="qnaAddCheck()" class="btn_submit" value="등록"/>
					</div>
					<form:hidden path="memberIdx"/>
					<!-- 검증 타입체크 통과용 쓰레기값 -->
					<form:hidden path="qnaAnswercontent" value="a"/>
				</form:form>
			</div>
			<div class="col-sm-1"></div>	
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
  	<script type="text/javascript" src="<c:url value='/validator'/>" ></script>
	<validator:javascript formName="qnaVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<script>
		var vailMode = "qna";
		function qnaAddCheck(){
			var qnaForm = document.getElementById("qnaVO");
			if(!validateQnaVO(qnaForm)){
				return false;
			}else{
				qnaForm.submit();
			}		
		};
	
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
		};
	</script>
</body>
</html>