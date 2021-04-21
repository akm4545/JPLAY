<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    
</head>
<body class="nav-md">
	<jsp:include page="/WEB-INF/jsp/layout/navbar.jsp"/>
    <div class="container body">
    	<jsp:include page="/WEB-INF/jsp/layout/adminSideMenu.jsp"/>
	</div>
	<!-- page content -->
	<div class="right_col" role="main" style="padding-bottom: 100px;">
    	<div class="">
        	<div class="page-title">
            	<div class="title_left">
                	<h3>회원 <small>수정</small></h3>
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
		                        		<form:form commandName="memberVO" action="${contextPath}/admin/member/memberUpdate">
		                    				<table id="datatable" class="table table-striped table-bordered" style="width:100%">
			                      				<tbody style="font-size: 0.7em;">
		                        					<tr>
								                    	<th>
								                    		아이디
								                    	</th>
								                    	<td>
								                    		<form:input path="memberId" cssClass="form-control" onchange="swFalse()"/>
								                    		<input type="button" value="중복체크" onclick="overlapped()" class="btn btn-dark btn-sm"/>
								                    		<div style="font-size: 0.9em;" id="errorId">
								                    			<form:errors path="memberId" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		비밀번호
								                    	</th>
								                    	<td>
								                    		<form:input path="memberPwd" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorPwd">
								                    			<form:errors path="memberPwd" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		이름
								                    	</th>
								                    	<td>
								                    		<form:input path="memberName" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorName">
								                    			<form:errors path="memberName" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		이메일
								                    	</th>
								                    	<td>
								                    		<form:input path="memberEmail" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorEmail">
								                    			<form:errors path="memberEmail" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		전화번호
								                    	</th>
								                    	<td>
								                    		<form:input path="memberTel" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorTel">
								                    			<form:errors path="memberTel" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		탈퇴여부
								                    	</th>
								                    	<td>
								                    			<form:radiobutton path="memberDel" value="Y"/>
								                    		Y
								                    			<form:radiobutton path="memberDel" value="N"/>
								                    		N
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<td colspan="2" style="text-align: center;">
								                    		<button type="button" class="btn btn-app" value="수정하기" onclick="joinSwCheck()">
								                    			<i class="fa fa-save"></i>
								                    			수정하기
								                    		</button>
						                    				<button type="reset" class="btn btn-app">
						                    					<i class="fa fa-repeat"></i>
						                    					다시쓰기
						                    				</button>
						                    				<button type="button" class="btn btn-app" onclick="location.href='<c:url value="/admin/member/memberList?pageIndex=${memberVO.pageIndex}&searchCondition=${memberVO.searchCondition}&searchKeyword=${memberVO.searchKeyword}"/>';">
						                    					<i class="fas fa-long-arrow-alt-left" style="display: block; height: 20px; font-size: 20px;"></i>
						                    					돌아가기
						                    				</button>	
								                    	</td>
								                    </tr>
                      							</tbody>
		                    				</table>
		                    				<form:hidden path="memberIdx"/>
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
	<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
	<script>
		var overlappedSw = false;
		function swFalse(){
			overlappedSw = true;
		}
		
		function overlapped(){
			var reg = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,10}$/;
			var id = $("#memberId").val();
			if(id == ""){
				alert("아이디를 입력하세요.");
				return;
			}else if(!reg.test(id)){
				alert("아이디 형식이 틀렸습니다.");
				return;
			}
			$.ajax({
				url:"<c:url value='/member/overlapped'/>",
				type:"get",
				data:{
					id:id
				},
				success:function(data){
					if(data == '0'){
						$("#memberId").attr("readonly",true);
						$("#btn_overlapped").attr("disabled",true);
						alert("사용 가능한 아이디 입니다.");
						overlappedSw = false;			
					}else{
						alert("사용중인 아이디 입니다.");
						return;
					}
				}
			});
		}
	
		function joinSwCheck(){
			var pwd = $("#memberPwd").val();
			var pwd_check = $("#member_pwd_check").val();
			if(overlappedSw){
				alert("아이디 중복 체크가 필요합니다.");
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
		
		jQuery(document).ready(function ($) {
		    $('input').iCheck({
		        checkboxClass: 'icheckbox_flat-grey',
		        radioClass: 'iradio_flat-grey'
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
</body>
</html>