<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
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
                	<h3>영화 <small>등록</small></h3>
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
		                        		<form:form commandName="adminMovieVO" action="${contextPath}/admin/movie/movieAdd">
		                    				<table id="datatable" class="table table-striped table-bordered" style="width:100%">
			                      				<tbody style="font-size: 0.7em;">
			                      					<tr>
								                    	<th>
								                    		영화 제목
								                    	</th>
								                    	<td>
								                    		<form:input path="movieTitle" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorTitle">
								                    			<form:errors path="movieTitle" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		영화 개봉일
								                    	</th>
								                    	<td>
								                    		<form:input type="date" path="movieOpeningdate" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorOpeningdate">
								                    			<form:errors path="movieOpeningdate" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		시놉시스
								                    	</th>
								                    	<td>
								                    		<form:textarea path="movieSynopsis" cssStyle="resize: none; width:100%; height:100px;" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorSynopsis">
								                    			<form:errors path="movieSynopsis" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
		                        					<tr>
								                    	<th>
								                    		장르
								                    	</th>
								                    	<td>
								                    		<form:checkboxes path="movieGenre" items="${genre}"/>
								                    		<div style="font-size: 0.9em;" id="errorGenre">
								                    			<form:errors path="movieGenre" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		이용가
								                    	</th>
								                    	<td>
								                    		<form:radiobuttons path="movieAge" items="${age}"/>
								                    		<div style="font-size: 0.9em;" id="errorAge">
								                    			<form:errors path="movieAge" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		감독
								                    	</th>
								                    	<td>
								                    		<form:input path="movieDirector" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorDirector">
								                    			<form:errors path="movieDirector" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		배우
								                    	</th>
								                    	<td>
								                    		<form:input path="movieActor" cssClass="form-control"/>
								                    		<div style="font-size: 0.9em;" id="errorActor">
								                    			<form:errors path="movieActor" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<th>
								                    		이미지,동영상
								                    	</th>
								                    	<td style="height: 700px;">
								                    		<form:textarea path="fileName"/>
								                    		<div style="font-size: 0.9em;" id="errorFileName">
								                    			<form:errors path="fileName" delimiter=" "/>
								                    		</div>
								                    	</td>
								                    </tr>
								                    <tr>
								                    	<td colspan="2" style="text-align: center;">
								                    		<button type="button" onclick="movieAdd()" class="btn btn-app">
								                    			<i class="fa fa-save"></i>
								                    			등록하기
								                    		</button>
		                    								<button type="reset" class="btn btn-app">
		                    									<i class="fa fa-repeat"></i>
						                    					다시쓰기
		                    								</button>
								                    	</td>
								                    </tr>
                      							</tbody>
		                    				</table>
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
	<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
	<script src="<c:url value='/resources/js/admin/icheck.min.js'/>"></script>
	<script>
		CKEDITOR.replace( 'fileName', {
		     toolbar: [
				{ name: 'basicstyles', items: [ 'Image','Html5video'] }
			 ]
		});
	
		var vailMode = "movie";
		function movieAdd(){
			var content = CKEDITOR.instances.fileName.getData();
			
			var mat = /img alt=/g;
			
			var result = content.match(mat);
			
			if(result == null || result.length != 1){
				alert("이미지 파일의 개수를 확인하세요. 1개여야 합니다.");
				return false;
			}
			
			var mat = /ckeditor-html5-video/g;
			
			var result = content.match(mat);
			
			if(result == null || result.length != 2){
				alert("동영상 파일의 개수를 확인하세요. 2개여야 합니다.");
				return false;
			}
			
			var mat = /mainmovie=/g;
			
			var result = content.match(mat);
			
			if(result == null || result.length != 1){
				alert("원본 영상 파일이 한개가 필요합니다.");
				return false;
			}
			
			var movieForm = document.getElementById("adminMovieVO");
			if(!validateAdminMovieVO(movieForm)){
				return false;
			}else{
				movieForm.submit();
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