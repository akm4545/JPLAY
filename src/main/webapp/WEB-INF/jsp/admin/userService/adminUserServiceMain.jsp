<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
   	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<title><spring:message code="title.adminMain"/></title>
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/css/admin/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<c:url value='/resources/css/admin/font-awesome.min.css'/>" rel="stylesheet">
    <!-- NProgress -->
    <link href="<c:url value='/resources/css/admin/nprogress.css'/>" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="<c:url value='/resources/css/admin/fullcalendar.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/admin/fullcalendar.print.css'/>" rel="stylesheet" media="print">
    <!-- Custom styling plus plugins -->
    <link href="<c:url value='/resources/css/admin/custom.min.css'/>" rel="stylesheet">
    <style type="text/css">
		canvas{
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
    	}
    	
    	.x_content{
    		height: 300px !important;
    	}
    	.no_over{
    		height: 300px !important;
    		overflow: auto !important;
    	}
    	
    	.answer_btn{
    		float: right;
    		font-size: 15px;
    	}
    	
    	.answer_btn_wrap{
    		display: flow-root;
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
            	<div class="title_left"></div>
				<div class="title_right"></div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
            	<div class="col-md-12">
                	<div class="x_panel">
                  		<div class="x_title">
                    		<div class="clearfix"></div>
                  		</div>
                  		<div class="x_content">
							<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						작동오류 
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                    					<c:forEach items="${newQuestionMap.error}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
              				<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						결제/요금 
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                      					<c:forEach items="${newQuestionMap.pay}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
                  		</div>
                  		<div class="x_content">
                  			<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						이용불편사항
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                      					<c:forEach items="${newQuestionMap.inconvenience}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
              				<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						콘텐츠요청
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                      					<c:forEach items="${newQuestionMap.content}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
    					</div>
    					<div class="x_content">
                  			<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						회원정보
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                      					<c:forEach items="${newQuestionMap.info}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
              				<div class="col-md-6 col-sm-6">
                				<div class="x_panel no_over">
                  					<div class="x_title">
                    					<h2>
                    						<i class="fa fa-align-left"></i>
                    						기타 
                    						<small>미답변 질문</small>
                    					</h2>
                    					<ul class="nav navbar-right panel_toolbox">
                      						<li>
                      							<a class="collapse-link">
                      								<i class="fa fa-chevron-up"></i>
                      							</a>
                      						</li>
                    					</ul>
                    					<div class="clearfix"></div>
                  					</div>
                  					<div class="x_content">
	                    				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
	                      					<c:forEach items="${newQuestionMap.other}" var="QNA">
	                    						<div class="panel">
		                        					<a class="panel-heading collapsed" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#qna${QNA.qnaIdx}" aria-expanded="false" aria-controls="collapseThree">
		                          						<h4 class="panel-title">
		                          							${QNA.qnaTitle} - 질문일 ${fn:substring(QNA.qnaQuestionsdate,0,11)}
		                          						</h4>
		                        					</a>
		                        					<div id="qna${QNA.qnaIdx}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		                          						<div class="panel-body">
		                            						<p>
		                            							<div class="answer_btn_wrap">
		                            								<input class="answer_btn btn btn-round btn-info btn-sm" type="button" value="답변하기" onclick="location.href='<c:url value="/admin/userService/questionInfo?qnaIdx=${QNA.qnaIdx}"/>'"/>
		                            							</div>
		                            							<strong>
		                            								${QNA.qnaContent}
		                            							</strong>
		                            						</p>
		                          						</div>
		                        					</div>
		                      					</div>
	                    					</c:forEach>
	                    				</div>
                  					</div>
                				</div>
              				</div>
    					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- /page content -->
	<!-- footer content -->
	<footer>
	</footer>
	<!-- /footer content -->
	<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
	<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
	<!-- /calendar modal -->
        
	<!-- jQuery -->
	<script src="<c:url value='/resources/js/admin/jquery.min.js'/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value='/resources/js/admin/bootstrap.bundle.min.js'/>"></script>
	<!-- FastClick -->
	<script src="<c:url value='/resources/js/admin/fastclick.js'/>"></script>
    <!-- FullCalendar -->
    <script src="<c:url value='/resources/js/admin/moment.min.js'/>"></script>
    <script src="<c:url value='/resources/js/admin/fullcalendar.min.js'/>"></script>
	<!-- NProgress -->
	<script src="<c:url value='/resources/js/admin/nprogress.js'/>"></script>
	<!-- Custom Theme Scripts -->
	<script src="<c:url value='/resources/js/admin/custom.min.js'/>"></script>
	<script src="<c:url value='/resources/js/admin/Chart.bundle.js'/>"></script>
	<script>
	
	</script>
</body>
</html>