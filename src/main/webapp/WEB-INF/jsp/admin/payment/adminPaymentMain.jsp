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
							<div style="width: 100%">
        						<canvas id="canvas"></canvas>
    						</div>
                  		</div>
                  		<div class="x_content" style="text-align: center;">
                  			<div id="canvas-holder">
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
	        type: 'doughnut',
	        data: {
	            datasets: [{
	                data: [
	                	${groupPayMethod[0].methodCount == null ? 1 : groupPayMethod[0].methodCount},
	                	${groupPayMethod[1].methodCount == null ? 1 : groupPayMethod[0].methodCount},
	                	${groupPayMethod[2].methodCount == null ? 1 : groupPayMethod[0].methodCount}
	                ],
	                backgroundColor: [
	                    "#F7464A",
	                    "#46BFBD",
	                    "#FDB45C"
	                ],
	                label: 'Dataset 1'
	            }],
	            labels: [
	            	"${groupPayMethod[0].methodType == null ? '자료 없음' : groupPayMethod[0].methodType}",
	                "${groupPayMethod[1].methodType == null ? '자료 없음' : groupPayMethod[0].methodType}",
	                "${groupPayMethod[2].methodType == null ? '자료 없음' : groupPayMethod[0].methodType}"
	            ]
	        },
	        options: {
	            responsive: true,
	            legend: {
	                position: 'top',
	            },
	            title: {
	                display: true,
	                text: '결제 방법 별 이용자수',
	                fontSize:20
	            },
	            animation: {
	                animateScale: true,
	                animateRotate: true
	            }
	        }
	    };
	
	   var barChartData = {
	       labels: ["${groupPayDate[0].date}", "${groupPayDate[1].date}", "${groupPayDate[2].date}", "${groupPayDate[3].date}", "${groupPayDate[4].date}", "${groupPayDate[5].date}", "${groupPayDate[6].date}"],
	       datasets: [{
	           type: 'bar',
	           label: '매출액',
	           backgroundColor: "rgba(151,187,205,0.5)",
	           data: [${groupPayDate[0].totalPay}, ${groupPayDate[1].totalPay}, ${groupPayDate[2].totalPay}, ${groupPayDate[3].totalPay}, ${groupPayDate[4].totalPay}, ${groupPayDate[5].totalPay}, ${groupPayDate[6].totalPay}],
	           borderColor: 'white',
	           borderWidth: 2
	       }, {
	           type: 'line',
	           label: '매출액',
	           backgroundColor: "rgba(151,187,205,0.5)",
	           data: [${groupPayDate[0].totalPay}, ${groupPayDate[1].totalPay}, ${groupPayDate[2].totalPay}, ${groupPayDate[3].totalPay}, ${groupPayDate[4].totalPay}, ${groupPayDate[5].totalPay}, ${groupPayDate[6].totalPay}],
	           borderColor: 'white',
	           borderWidth: 2
	       }]
	   };
	   window.onload = function() {
		   var ctx2 = document.getElementById("chart-area").getContext("2d");
	       window.myDoughnut = new Chart(ctx2, config);
	       var ctx = document.getElementById("canvas").getContext("2d");
	       window.myBar = new Chart(ctx, {
	           type: 'bar',
	           data: barChartData,
	           options: {
	               responsive: true,
	               title: {
	                   display: true,
	                   text: '일별 매출액',
	                   fontSize:20
	               },scales: {
	    				xAxes: [{
	    					ticks:{
	    						fontSize : 20
	    					},
	    				}],
	    				yAxes: [{
	    			        ticks: {
	    			            min: 0
	    			        }
	    			    }]
	    			},
	               animation: {
	                   onComplete: function () {
	                       var chartInstance = this.chart;
	                       var ctx = chartInstance.ctx;
	                       ctx.textAlign = "center";
	
	                       Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
	                           var meta = chartInstance.controller.getDatasetMeta(i);
	                           Chart.helpers.each(meta.data.forEach(function (bar, index) {
	                               ctx.fillText(dataset.data[index], bar._model.x, bar._model.y - 10);
	                           }),this)
	                       }),this);
	                   }
	               }
	           }
	       });
	   };
	</script>
</body>
</html>