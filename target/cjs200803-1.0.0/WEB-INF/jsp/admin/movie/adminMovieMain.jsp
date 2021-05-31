<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                  		<div class="x_content" style="display: flex; padding-bottom: 100px;">
							<div style="width:100%">
        						<canvas id="canvas"></canvas>
    						</div>
                  		</div>
                  		<div class="x_content">
                  			<div id="canvas-holder" style="width:100%">
        						<canvas id="chart-area"></canvas>
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
	    var config = {
	        type: 'radar',
	        data: {
	            labels: ["${topGenre[0].movieGenre}", "${topGenre[1].movieGenre}", "${topGenre[2].movieGenre}", "${topGenre[3].movieGenre}", "${topGenre[4].movieGenre}", "${topGenre[5].movieGenre}", "${topGenre[6].movieGenre}"],
	            datasets: [{
	                label: "시청수",
	                backgroundColor: "rgba(151,187,205,0.2)",
	                pointBackgroundColor: "rgba(151,187,205,1)",
	                hoverPointBackgroundColor: "#fff",
	                pointHighlightStroke: "rgba(151,187,205,1)",
	                fontSize:20,
	                data: [${topGenre[0].viewCount}, ${topGenre[1].viewCount}, ${topGenre[2].viewCount}, ${topGenre[3].viewCount}, ${topGenre[4].viewCount}, ${topGenre[5].viewCount}, ${topGenre[6].viewCount}]
	            }]
	        },
	        options: {
                title:{
                    display:true,
                    text:"인기있는 장르 시청 수",
                    fontSize:20 //제목글씨크기
                },
                scale:{
                    gridLines:{
                        color:"lightgray",
                        lineWidth:1
                    },
                    angleLines:{
                        display:true
                    },
                    ticks:{
                        beginAtZero:true,
                        stepSize:1
                    },
                    pointLabels:{
                        fontSize:18,
                        fontColor:"black"
                    }
                }
            }
	    };
	    
	    var PolarAreaconfig = {
	        data: {
	            datasets: [{
	                data: [
	                	${topMovie[0].viewCount},
	                	${topMovie[1].viewCount},
	                	${topMovie[2].viewCount},
	                	${topMovie[3].viewCount},
	                	${topMovie[4].viewCount},
	                ],
	                backgroundColor: [
	                    "#F7464A",
	                    "#46BFBD",
	                    "#FDB45C",
	                    "#949FB1",
	                    "#4D5360",
	                ],
	                label: 'My dataset' // for legend
	            }],
	            labels: [
	                "${topMovie[0].movieTitle}",
	                "${topMovie[1].movieTitle}",
	                "${topMovie[2].movieTitle}",
	                "${topMovie[3].movieTitle}",
	                "${topMovie[4].movieTitle}"
	            ]
	        },
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: true,
	                text: '가장 인기있는 영화',
	                fontSize:20
	            },
	            scale: {
	              ticks: {
	                beginAtZero: true
	              },
	              reverse: false
	            },
	            animation: {
	                animateRotate: true
	            }
	        }
	    };
	
	    window.onload = function() {
	        window.myRadar = new Chart(document.getElementById("canvas"), config);
	        var ctx = document.getElementById("chart-area");
	        window.myPolarArea = Chart.PolarArea(ctx, PolarAreaconfig);
	    };
	</script>
</body>
</html>