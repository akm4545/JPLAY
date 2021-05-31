<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <!-- Custom styling plus plugins -->
    <link href="<c:url value='/resources/css/admin/custom.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/page/com.css' />" rel="stylesheet" type="text/css">
	<link href="<c:url value='/resources/css/page/button.css' />" rel="stylesheet" type="text/css">
	<script>
		<c:if test="${update != null}">
			alert("${update}");
		</c:if>
	</script>
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
                	<h3>미답변 <small>목록</small></h3>
              	</div>
              	<div class="title_right" style="text-align: right;">
                	<form:form commandName="searchVO" action="${contextPath}/admin/userService/questionList" method="get">
              			검색조건
	           			<form:select path="searchCondition" items="${searchConditionMap}" cssClass="form-control input-sm" cssStyle="width:25%; display: inline-block; margin-top: 10px;"/>
	                	<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
	                  		<div class="input-group">
	                  			<form:input path="searchKeyword" cssClass="form-control"/>
	                    		<span class="input-group-btn">
	                      			<button class="btn btn-secondary" type="submit">검색</button>
	                    		</span>
	                  		</div>
	                	</div>
                	</form:form>
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
		                    			<table id="datatable" class="table table-striped table-bordered" style="width:100%">
		                      				<thead style="font-size: 0.7em;">
		                        				<tr>
		                          					<th>고유번호</th>
		                          					<th>회원아이디</th>
								                    <th>질문구분</th>
								                    <th>질문제목</th>
								                    <th>질문일</th>
								                    <th>상세보기</th>
		                        				</tr>
		                      				</thead>
		                      				<tbody style="font-size: 0.7em;">
		                      					<c:forEach var="question" items="${resultList}" varStatus="formNum">
			                        				<tr>
			                          					<td>
			                          						${question.qnaIdx}
			                          					</td>
			                          					<td>
			                          						${question.memberId}
			                          					</td>
							                          	<td>
							                          		${question.qnaType}
							                          	</td>
							                          	<td>
							                          		${question.qnaTitle}
							                          	</td>
							                          	<td>
							                          		${fn:substring(question.qnaQuestionsdate,0,11)}
							                          	</td>
								                        <td><button class="btn btn-secondary btn-sm" type="button" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${question.qnaIdx}&pageIndex=${searchVO.pageIndex}&searchCondition=${searchVO.searchCondition}&searchKeyword=${searchVO.searchKeyword}"/>';">상세보기</button></td>
			                        				</tr>		                      					
		                      					</c:forEach>
		                      				</tbody>
		                    			</table>
		                  			</div>
		                  		</div>
		              		</div>
		            	</div>
					</div>
				</div>
    			<!-- /page content -->
			</div>
		</div>
		<form:form commandName="searchVO" name="listForm" id="listForm" method="get">
			<div id="paging" style="text-align: center;">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="link_page"/>
			</div>
			<form:hidden path="pageIndex"/>
			<form:hidden path="searchCondition"/>
			<form:hidden path="searchKeyword"/>
		</form:form>
	</div>
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
    	$(document).ready(function(){
	    	$("#datatable_wrapper").children().first().attr("style","display:none;");
	    	$("#datatable_wrapper").children().last().attr("style","display:none;");   
    	});
    	
    	function link_page(pageNo){
    		document.getElementById("listForm").pageIndex.value = pageNo;
    		document.getElementById("listForm").action = "<c:url value='/admin/userService/questionList'/>";
    	   	document.getElementById("listForm").submit();
    	}
    </script>
</body>
</html>