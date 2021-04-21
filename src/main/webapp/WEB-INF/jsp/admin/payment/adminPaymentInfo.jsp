<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
   	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   	<title><spring:message code="title.adminMain"/></title>

    <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link href="<c:url value='/resources/css/admin/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value='/resources/css/admin/font-awesome.min.css'/>" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value='/resources/css/admin/nprogress.css'/>" rel="stylesheet">
	<!-- iCheck -->
    <link href="<c:url value='/resources/css/admin/green.css'/>" rel="stylesheet">
    <!-- Datatables -->
    <link href="<c:url value='/resources/css/admin/dataTables.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/buttons.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/fixedHeader.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/responsive.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/scroller.bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/grey.css'/>" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b494d45b9b.js" crossorigin="anonymous"></script>
    <!-- Custom styling plus plugins -->
    <link href="<c:url value='/resources/css/admin/custom.min.css'/>" rel="stylesheet">
     <style>
    	#cke_1_contents{
    		height: 500px !important;
    	}
    </style>
</head>
<body class="nav-md">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
    <div class="container body">
    	<jsp:include page="/WEB-INF/jsp/layout/adminSideMenu.jsp"/>
	</div>
	<!-- page content -->
	<div class="right_col" role="main">
    	<div class="">
        	<div class="page-title">
            	<div class="title_left">
                	<h3>결제 <small>정보</small></h3>
              	</div>
              	<div class="title_right">
                	<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  		<div class="input-group">
                  		</div>
                	</div>
              	</div>
            </div>
            <div class="clearfix"></div>
			<div class="row">
    			<div class="col-md-12 col-sm-12 ">			
					<div class="x_panel">
		            	<div class="x_title">
		                  	<div class="clearfix"></div>
						</div>
		                <div class="x_content">
		               		<div class="row">
		                    	<div class="col-sm-12">
		                        	<div class="card-box table-responsive">
		                        		<form:form commandName="paymentVO" action="${contextPath}/admin/payment/paymentUpdate">
		                    				<table id="datatable" class="table table-striped table-bordered" style="width:100%">
			                      				<tbody style="font-size: 0.7em;">
			                      					<tr>
								                    	<th>
								                    		회원 아이디
								                    	</th>
								                    	<td>
								                    		<form:input path="memberId" readonly="true" cssClass="form-control"/>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		회원 이름
								                    	</th>
								                    	<td>
								                    		<form:input path="memberName" readonly="true" cssClass="form-control"/>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		결제일
								                    	</th>
								                    	<td>
								                    		<form:input type="date" path="paymentDate" readonly="true" cssClass="form-control"/>
								                    	</td>
								                    </tr>
		                        					<tr>
								                    	<th>
								                    		결제금액
								                    	</th>
								                    	<td>
								                    		<form:input path="paymentAmount" readonly="true" cssClass="form-control"/>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		결제방법
								                    	</th>
								                    	<td>
								                    		<form:radiobuttons path="paymentMethod" items="${payMethod}" onclick="readOn(event)"/>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th colspan="2" style="text-align: center;">
								                    		<font size="3px">결제정보</font>
								                    	</th>
								                    </tr>
								                    <c:forEach begin="0" end="${fn:length(payInfo) - 1}" step="2" varStatus="index">
								                    	<tr>
								                    		<th class="payInfoTitle">
								                    			${payInfo[index.index]}
								                    		</th>
								                    		<td>
								                    			<input type="text" value="${payInfo[index.index + 1]}" class="form-control payInfo" readonly/>
								                    		</td>
								                    	</tr>
								                    </c:forEach>
								                    <tr>
								                    	<th>
								                    		정액제 종료일
								                    	</th>
								                    	<td>
								                    		<form:input type="date" path="paymentEnddate" readonly="true" cssClass="form-control"/>
								                    	</td>
								                    </tr>
								                     <tr>
								                    	<td colspan="2" style="text-align: center;">
								                    		<button type="button" class="btn btn-app" onclick="paymentUpdate()" id="submitBtn" disabled>
								                    			<i class="fa fa-save"></i>
								                    			등록하기
								                    		</button>
						                    				<button type="button" class="btn btn-app" onclick="formChange()">
						                    					<i class="fa fa-edit"></i>
						                    					수정하기
						                    				</button>
						                    				<button class="btn btn-app" type="reset">
						                    					<i class="fa fa-repeat"></i>
						                    					다시쓰기
						                    				</button>  
						                    				<button type="button" class="btn btn-app" onclick="location.href='<c:url value="/admin/payment/paymentList?pageIndex=${paymentVO.pageIndex}&searchCondition=${paymentVO.searchCondition}&searchKeyword=${paymentVO.searchKeyword}"/>';">
						                    					<i class="fas fa-long-arrow-alt-left" style="display: block; height: 20px; font-size: 20px;"></i>
						                    					돌아가기
						                    				</button>		
								                    	</td>
								                    </tr>
                      							</tbody>
		                    				</table>
		                    				<form:hidden path="paymentInfo"/>
		                    				<form:hidden path="paymentIdx"/>
		                    				<form:hidden path="pageIndex"/>
		                    				<form:hidden path="searchCondition"/>
		                    				<form:hidden path="searchKeyword"/>
		                    			</form:form>
		                  			</div>
		                  		</div>
		              		</div>
		            	</div>
					</div>
				</div>
    			<!-- /page content -->
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/validator'/>" ></script>
	<validator:javascript formName="adminMovieVO" staticJavascript="false" xhtml="true" cdata="false"/>
    <script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
    <script>
	    jQuery(document).ready(function ($) {
		    $('input').iCheck({
		        checkboxClass: 'icheckbox_flat-grey',
		        radioClass: 'iradio_flat-grey'
		    });
		    
		    $('input').on("ifClicked",function(event){
		    	if(!readSw){
		    		var icheck = $(this);
	    	        setTimeout(function() {
	    	        	alert("수정 버튼을 눌러서 수정하세요.");
	    	            $(icheck).iCheck('uncheck');
	    	            return false;
	    	        }, 100);
	    		}
		    });
	
		    $('input.all').on('ifToggled', function (event) {
		        var chkToggle;
		        $(this).is(':checked') ? chkToggle = "check" : chkToggle = "uncheck";
		        $('input.selector:not(.all)').iCheck(chkToggle);
		    });
		});
    </script>
	<!-- jQuery -->
	<script src="<c:url value='/resources/js/admin/jquery.min.js'/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/admin/bootstrap.bundle.min.js'/>"></script>
	<!-- FastClick -->
	<script src="<c:url value='/resources/js/admin/fastclick.js'/>"></script>
	<!-- NProgress -->
	<script src="<c:url value='/resources/js/admin/nprogress.js'/>"></script>
	<!-- Custom Theme Scripts -->
	<script src="<c:url value='/resources/js/admin/custom.min.js'/>"></script>
    <!-- iCheck -->
    <script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
    <!-- Datatables -->
    <script src="<c:url value='/resources/js/admin/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.buttons.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.flash.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.html5.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/buttons.print.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.fixedHeader.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.keyTable.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.responsive.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/responsive.bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/dataTables.scroller.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/jszip.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/pdfmake.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/vfs_fonts.js'/>"></script>
    <script>
    	var readSw = false;
    	
    	function paymentUpdate(){
    		var payInfoArr = $(".payInfo");
    		
    		<c:if test="${paymentVO.paymentMethod == '신용카드'}">
    			var regExp = /^\d{4}-\d{4}-\d{4}-\d{4}$/;
    			if(!regExp.test(payInfoArr[0].value)){
    				alert("신용카드 번호를 확인하세요. ex 1111-1111-1111-1111");
    				return;
    			}
    			regExp = /^([1-9]|1[1-2])월20\d{2}년$/;
    			if(!regExp.test(payInfoArr[1].value)){
    				alert("유효기간을 확인하세요. ex 12월 2020년");
    				return;
    			}
    			regExp = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
    			if(!regExp.test(payInfoArr[2].value)){
    				alert("생년월일을 확인하세요. ex 921212");
    				return;
    			}
    			regExp = /^\d{2}$/;
    			if(!regExp.test(payInfoArr[3].value)){
    				alert("비밀번호를 확인하세요. ex 12");
    				return;
    			}
    		</c:if>
    		<c:if test="${paymentVO.paymentMethod == '핸드폰'}">    		
    			regExp = "SKT KT LGU+ 헬로모바일 SK7mobile KCT KT알뜰폰 LGU+알뜰폰";
    			if(!regExp.match(payInfoArr[0].value) || payInfoArr[0].value.trim() == ""){
    				alert("통신사를 확인하세요.");
    				return;
    			}
    			
	    		regExp = /^01(?:0|1|[6-9])(\d{3}|\d{4})(\d{4})$/;
				if(!regExp.test(payInfoArr[1].value)){
					alert("핸드폰 번호를 확인하세요. ex 01012345678");
					return;
				}
				regExp = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
    			if(!regExp.test(payInfoArr[2].value)){
    				alert("주민등록번호 앞자리를 확인하세요. ex 921212");
    				return;
    			}
    			regExp = /^\d{1}$/;
    			if(!regExp.test(payInfoArr[3].value)){
    				alert("주민등록번호 뒷자리를 확인하세요. ex 1");
    				return;
    			}
    		</c:if>
    		<c:if test="${paymentVO.paymentMethod == '카카오'}">
	    		var regExp = /^01(?:0|1|[6-9])(\d{3}|\d{4})(\d{4})$/;
				if(!regExp.test(payInfoArr[0].value)){
					alert("핸드폰 번호를 확인하세요. ex 01012345678");
					return;
				}
				regExp = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])$/;
    			if(!regExp.test(payInfoArr[1].value)){
    				alert("생년월일을 확인하세요. ex 921212");
    				return;
    			}
    		</c:if>
    		var payInfoTitleArr = $(".payInfoTitle");
    		var totalPayInfo = "";
    		for(var i=0; i<payInfoArr.length; i++){
    			totalPayInfo += payInfoTitleArr[i].innerText + " "; 
    			totalPayInfo += payInfoArr[i].value + " ";
    		}
			$("#paymentInfo").val(totalPayInfo);
			
			var paymentForm = document.getElementById("paymentVO");
			paymentForm.submit();
		}
    	
    	function readOn(event){
    		if(!readSw){
    			alert("수정 버튼을 눌러서 수정하세요.");
    			event.preventDefault();
    			return false;
    		}
    	}
    	
		function formChange(){
			$("#paymentDate").attr("readonly", false);
			$("#paymentMethod").attr("readonly", false);
			$(".payInfo").attr("readonly", false);
			$("#paymentEnddate").attr("readonly", false);
			$("#submitBtn").attr("disabled", false);
			readSw = true;
		}
		
	</script>
</body>
</html>