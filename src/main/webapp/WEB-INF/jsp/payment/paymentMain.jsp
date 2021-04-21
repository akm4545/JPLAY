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
			min-height: 500px;
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
		
		#payTitle{
			text-align: center;
			vertical-align:middle;
			background-color: #1351f9;
			height: 80px;
			font-size: 1.5em;
			font-weight: bolder;
			color: white;
			line-height: 80px;
		}
		
		.pay_sub_title{
			width: 100px;
		}
		
		.btn-group button {
			padding: 10px 24px; /* Some padding */
			cursor: pointer; /* Pointer/hand icon */
		  	float: left; /* Float the buttons side by side */
		}

		.btn-group button:not(:last-child) {
			border-right: none; /* Prevent double borders */
		}

		/* Clear floats (clearfix hack) */
		.btn-group:after {
			content: "";
			clear: both;
			display: table;
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
	</style>
</head>
<body style="overflow: hidden; overflow-y:auto;">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
	<div id="payWrap">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="tab">
					<button class="tablinks" onclick="openView(event, 'payment')">이용권 결제</button>
				    <button class="tablinks" onclick="openView(event, 'paymentList')">이용권 결제 내역</button>
				    <c:if test="${resultList[0].paymentEnddate >= beginDate}">
						<button class="tablinks" id="use_pay" style="float: right;" disabled>현재 이용권 사용중입니다.(${fn:substring(resultList[0].paymentDate,0,11)} ~ ${fn:substring(resultList[0].paymentEnddate,0,11)})</button>
					</c:if>
				</div>
				<div id="payment" class="tabcontent">
					<div class="row" style="padding: 0px;">
						<div class="col-sm-12" id="payTitle">
							JPALY 상품 구매
						</div>
					</div>
					<div class="row" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font color="white" size="4em">
								결제내용
							</font>
							<hr style="background-color: gray;"/>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font size="4em">
								Basic
							</font>
							<br/>
							Mobile,PC 3회선
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<span class="pay_sub_title">
								이용기간
							</span>
							${beginDate}~${endDate}(30일)
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<span class="pay_sub_title">
								금액
							</span>
							<font color="white" size="4em">
								8,900원
							</font>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px; margin-bottom: 15px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font color="white" size="4em">
								결제수단 선택
							</font>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10" style="text-align: center;">
							<div class="btn-group" style="height: 100px;">
								<button class="btn btn-outline-secondary" onclick="pay_method('pay_card')"><i class="far fa-credit-card"></i>신용카드</button>
								<button class="btn btn-outline-secondary" onclick="pay_method('pay_phone')"><i class="fas fa-mobile-alt"></i>핸드폰</button>
								<button class="btn btn-outline-secondary" onclick="pay_method('pay_kakao')"><i class="fas fa-comment-dollar"></i>카카오페이</button>
							</div>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row pay_method_view" id="pay_card" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font color="white" size="4em">
								신용카드
							</font>
							<span class="pay_method_subTitle">
								카드번호
								<input type="text" id="card_num1" class="form-control" style="width: 55px; height: 25px;" maxlength="4" onkeypress='return checkNumber(event)'/>-<input type="password" class="form-control" id="card_num2" style="width: 55px; height: 25px;" maxlength="4" onkeypress='return checkNumber(event)'/>-<input type="password" class="form-control" id="card_num3" style="width: 55px; height: 25px;" maxlength="4" onkeypress='return checkNumber(event)'/>-<input type="text" class="form-control" id="card_num4" style="width: 55px; height: 25px;" maxlength="4" onkeypress='return checkNumber(event)'/>
							</span>
							<span class="pay_method_subTitle">
								유효기간 
								<select class="form-control" id="card_month" style="width: 70px; height: 25px; padding: 0px;">
									<option value="MM" selected>MM</option>
									<c:forEach items="${monthList}" var="month">
										<option value="${month}">${month}</option>
									</c:forEach>
								</select>월
								<select class="form-control" id="card_year" style="width: 100px; height: 25px; padding: 0px;">
									<option value="YYYY" selected>YYYY</option>									
									<c:forEach items="${yearList}" var="year">
										<option value="${year}">${year}</option>
									</c:forEach>
								</select>년
							</span>
							<span class="pay_method_subTitle">
								생년월일
								<input type="text" id="card_birth" placeholder="YYMMDD" class="form-control" style="width: 110px; height: 25px;" maxlength="6" onkeypress='return checkNumber(event)'/>
							</span>
							<span class="pay_method_subTitle">
								비밀번호
								<input type="password" id="card_password" placeholder="앞 2자리" class="form-control" style="width: 70px; height: 25px;" maxlength="2" onkeypress='return checkNumber(event)'/>
							</span>
							<hr style="background-color: gray;"/>
							<span class="pay_method_subTitle" style="text-align: center;">
								<input type="button" value="결제하기" onclick="pay_submit('pay_card')" class="btn btn-primary btn-lg"/>
							</span>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row pay_method_view" id="pay_phone" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font color="white" size="4em">
								핸드폰
								<span id="select_phone"></span>
							</font>
							<span class="pay_method_subTitle">
								<button class="btn btn-outline-secondary" onclick="phone_com('SKT')">SKT</button>
								<button class="btn btn-outline-secondary" onclick="phone_com('KT')">KT</button>
								<button class="btn btn-outline-secondary" onclick="phone_com('LGU+')">LGU+</button>
								<select class="form-control" onchange="phone_com('other')" id="phone_com" style="width: 130px; height: 45px; font-size: 15px !important; padding: 0px;">
									<option value="알뜰폰 선택">알뜰폰 선택</option>
									<option value="헬로모바일">헬로 모바일</option>
									<option value="SK7mobile">SK 7mobile</option>
									<option value="KCT">KCT</option>
									<option value="KT알뜰폰">KT 알뜰폰</option>
									<option value="LGU+알뜰폰">LGU+ 알뜰폰</option>
								</select>
							</span>
							<span class="pay_method_subTitle">
								<input type="text" placeholder="-없이 휴대번호 입력" id="phone_num" class="form-control" style="width: 200px; height: 25px;" maxlength="11" onkeypress='return checkNumber(event)'/>
							</span>
							<span class="pay_method_subTitle">
								*법정 생년월일을 입력해 주세요 (예시 : 900101-1******)
								<input type="text" placeholder="YYMMDD" id="phone_birth1" class="form-control" style="width: 80px; height: 25px;" maxlength="6" onkeypress='return checkNumber(event)'/>
								-
								<input type="password" class="form-control" id="phone_birth2" style="width: 30px; height: 25px;" maxlength="1" onkeypress='return checkNumber(event)'/>******
							</span>
							<hr style="background-color: gray;"/>
							<span class="pay_method_subTitle" style="text-align: center;">
								<input type="button" value="결제하기" onclick="pay_submit('pay_phone')" class="btn btn-primary btn-lg"/>
							</span>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row pay_method_view" id="pay_kakao" style="padding: 0px;">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<font color="white" size="4em">
								카카오톡
							</font>
							<span class="pay_method_subTitle">
								결제요청 메시지 전송을 위해
								아래 정보를 입력해주세요.
							</span>
							<span class="pay_method_subTitle">
								<input type="text" placeholder="-없이 휴대번호 입력" id="kakao_phone" class="form-control" style="width: 200px; height: 25px;" maxlength="11" onkeypress='return checkNumber(event)'/>
							</span>
							<span class="pay_method_subTitle">
								<input type="text" placeholder="YYMMDD" id="kakao_birth" class="form-control" style="width: 200px; height: 25px;" maxlength="6" onkeypress='return checkNumber(event)'/>
							</span>
							<hr style="background-color: gray;"/>
							<span class="pay_method_subTitle" style="text-align: center;">
								<input type="button" value="결제하기" onclick="pay_submit('pay_kakao')" class="btn btn-primary btn-lg"/>
							</span>
						</div>
						<div class="col-sm-1"></div>
					</div>
				</div>
				<div id="paymentList" class="tabcontent">
					<h5>이용권 결제 내역</h5>
					<ul>
						<c:if test="${empty resultList}">
							<li>
								<span class="payList">
									<font color="white">결제내역이 없습니다.</font>
								</span>
							</li>
						</c:if>
						<c:if test="${resultList != null}">
							<c:forEach items="${resultList}" var="paymentVO">
								<li>
									<span class="payList">
										<font color="white">결제일</font> ${fn:substring(paymentVO.paymentDate,0,11)} <font color="white">결제금액</font> ${paymentVO.paymentAmount} 
										<font color="white">결제방법</font> ${paymentVO.paymentMethod} <%-- <font color="white">결제정보</font> ${paymentVO.paymentInfo} --%>
									</span>
								</li>
							</c:forEach>					
						</c:if>
					</ul>
					<form:form commandName="searchVO" name="listForm" id="listForm" method="post">
						<div id="paging" style="text-align: center;">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="paging"/>
							<form:hidden path="pageIndex"/>
						</div>
					</form:form>
				</div>
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
	<script>
		function paging(pageNo){
			document.listForm.pageIndex.value = pageNo;
			var searchCondition = document.createElement('input');
			searchCondition.setAttribute("type", "hidden");
			searchCondition.setAttribute("name", "searchCondition"); 
			searchCondition.setAttribute("value", "1");
			
			document.listForm.appendChild(searchCondition);
			
			document.listForm.action = "<c:url value='/payment/main'/>";
		   	document.listForm.submit();
		}
		<c:if test="${searchVO.searchCondition == 1}">
			document.getElementById("payment").style.display = "none";
			document.getElementById("paymentList").style.display = "block";
		</c:if>
		<c:if test="${searchVO.searchCondition != 1}">
			document.getElementById("payment").style.display = "block";
		</c:if>
		<c:if test="${resultList[0].paymentEnddate >= beginDate}">
			$(".btn-outline-secondary").attr("disabled", true);
		</c:if>
		
		function openView(evt, view) {
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
		function pay_method(view){
			pay_method_view = document.getElementsByClassName("pay_method_view");
			
			for (i = 0; i < pay_method_view.length; i++) {
				pay_method_view[i].style.display = "none";
			}
			
			document.getElementById(view).style.display = "flex";
		}
		
		function checkNumber(event) {
			if(event.key >= 0 && event.key <= 9) {
			    return true;
			}
			return false;
		}
		
		function pay_submit(pay_method){
			var phoneCheck = /^01(?:0|1|[6-9])(\d{3}|\d{4})(\d{4})$/g
			var birthCheck = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
			var payForm = $('<form></form>');			
			
			payForm.attr("name","paymentVO");
			payForm.attr("method","post");
			payForm.attr("action","<c:url value='/payment/addPayment?memberIdx=${memberIdx}'/>");

			if(pay_method == "pay_card"){
				var payment_method = "신용카드";
				
				var payment_info = "카드번호 ";
				payment_info += $("#card_num1").val();
				payment_info += "-";
				payment_info += $("#card_num2").val();
				payment_info += "-";
				payment_info += $("#card_num3").val();
				payment_info += "-";
				payment_info += $("#card_num4").val();
				
				if(payment_info.length != 24){
					alert("신용카드 번호를 확인하세요.");
					return;
				}
				
				if($("#card_month option:selected").val() == "MM"){
					alert("월을 선택하세요.");
					return;
				}else if($("#card_year option:selected").val() == "YYYY"){
					alert("년을 선택하세요.");
					return;
				}else if(!birthCheck.test($("#card_birth").val())){
					alert("생년월일을 확인하세요.");
					return;
				}else if($("#card_password").val().length != 2){
					alert("비밀번호를 확인하세요.");
					return;
				}
				
				payment_info += " 유효기간 ";
				payment_info += $("#card_month option:selected").val();
				payment_info += "월";
				payment_info += $("#card_year option:selected").val();
				payment_info += "년";
				
				payment_info += " 생년월일 ";
				payment_info += $("#card_birth").val();
				
				payment_info += " 비밀번호 ";
				payment_info += $("#card_password").val();
				
			}else if(pay_method == "pay_phone"){
				if(!(KT || SKT || LGU) && (other == "알뜰폰 선택" || other == null)){
					alert("통신사를 선택하세요");
					return;
				}else if(!phoneCheck.test($("#phone_num").val())){
					alert("핸드폰 번호를 확인하세요.");
					return;
				}else if(!birthCheck.test($("#phone_birth1").val())){
					alert("주민등록번호 앞자리를 확인하세요.");
					return;
				}else if($("#phone_birth2").val().length != 1){
					alert("주민등록번호 뒷자리를 확인하세요.");
					return;
				}
				
				var payment_method = "핸드폰";
				
				var payment_info = "통신사 ";
				if(KT){
					payment_info += "KT";
				}else if(SKT){
					payment_info += "SKT";
				}else if(LGU){
					payment_info += "LGU+";
				}else{
					payment_info += other;
				}
				
				payment_info += " 핸드폰 ";
				payment_info += $("#phone_num").val();
				
				payment_info += " 주민등록번호 ";
				payment_info += $("#phone_birth1").val();
				payment_info += " 뒷자리 ";
				payment_info += $("#phone_birth2").val();
				
			}else if(pay_method == "pay_kakao"){
				if(!phoneCheck.test($("#kakao_phone").val())){
					alert("핸드폰 번호를 확인하세요.");
					return;
				}else if(!birthCheck.test($("#kakao_birth").val())){
					alert("생년월일을 확인하세요.");
					return;
				} 
				
				var payment_method = "카카오";
				
				payment_info = "핸드폰 ";
				payment_info += $("#kakao_phone").val();
				payment_info += " 생년월일 ";
				payment_info += $("#kakao_birth").val();
			}
			payForm.append($('<input/>', {type: 'hidden', name: 'paymentMethod', value:payment_method}));
			payForm.append($('<input/>', {type: 'hidden', name: 'paymentInfo', value:payment_info}));
			<c:if test="${movieUrl != null}">
				payForm.append($('<input/>', {type: 'hidden', name: 'movieUrl', value:"${movieUrl}"}));
			</c:if>
			
			payForm.appendTo('body');
			payForm.submit();
		}
		
		var KT;
		var SKT;
		var LGU;
		var other;
		function phone_com(company){
			if(company == "KT"){
				KT = true;
				SKT = false;
				LGU = false;
				$("#phone_com option:eq(0)").prop("selected", true);
				$("#select_phone").text(company);
			}else if(company == "SKT"){
				KT = false;
				SKT = true;
				LGU = false;
				$("#phone_com option:eq(0)").prop("selected", true);
				$("#select_phone").text(company);
			}else if(company == "LGU+"){
				KT = false;
				SKT = false;
				LGU = true;
				$("#phone_com option:eq(0)").prop("selected", true);
				$("#select_phone").text(company);
			}else if(company == "other"){
				KT = false;
				SKT = false;
				LGU = false;
				other = $("#phone_com option:selected").val();
				$("#select_phone").text($("#phone_com option:selected").val());
			}
		}
	</script>
</body>
</html>