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
    	#chartjs-tooltip {
			opacity: 1;
			position: absolute;
			background: rgba(0, 0, 0, .7);
			color: white;
			border-radius: 3px;
			-webkit-transition: all .1s ease;
			transition: all .1s ease;
			pointer-events: none;
			-webkit-transform: translate(-50%, 0);
			transform: translate(-50%, 0);
    	}

    	.chartjs-tooltip-key {
      		display: inline-block;
      		width: 10px;
      		height: 10px;
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
							<div id="canvas-holder1" style="width:100%;">
    							<canvas id="chart1"/>
  							</div>
                  		</div>
                  		<div class="x_content">
                  			<div style="width: 100%">
        						<canvas id="canvas"></canvas>
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

	    var barChartData = {
	        labels: ["${totalDelDate[0].Date}", "${totalDelDate[1].Date}", "${totalDelDate[2].Date}", "${totalDelDate[3].Date}", "${totalDelDate[4].Date}", "${totalDelDate[5].Date}", "${totalDelDate[6].Date}"],
	        datasets: [{
	            label: '탈퇴 신청자 수',
	            backgroundColor:"#ff5500",
	            yAxisID: "y-axis-1",
	            data: [${totalDelDate[0].totalDel}, ${totalDelDate[1].totalDel}, ${totalDelDate[2].totalDel}, ${totalDelDate[3].totalDel}, ${totalDelDate[4].totalDel}, ${totalDelDate[5].totalDel}, ${totalDelDate[6].totalDel}]
	        }]
	    };
	
		window.count = 0;
    	Chart.defaults.global.pointHitDetectionRadius = 1;
    	var customTooltips = function(tooltip) {

	      	// Tooltip Element
	      	var tooltipEl = $('#chartjs-tooltip');
	
	      	if (!tooltipEl[0]) {
	        	$('body').append('<div id="chartjs-tooltip"></div>');
	        	tooltipEl = $('#chartjs-tooltip');
	      	}

	      	// Hide if no tooltip
	      	if (!tooltip.opacity) {
	        	tooltipEl.css({
	          		opacity: 0
	        	});
	        	$('.chartjs-wrap canvas')
	          		.each(function(index, el) {
	            		$(el).css('cursor', 'default');
	          		});
	        	return;
	      	}

	      	$(this._chart.canvas).css('cursor', 'pointer');
	
	      	// Set caret Position
	      	tooltipEl.removeClass('above below no-transform');
	      	if (tooltip.yAlign) {
		        tooltipEl.addClass(tooltip.yAlign);
	      	} else {
	        	tooltipEl.addClass('no-transform');
	      	}

	      	// Set Text
	      	if (tooltip.body) {
	        	var innerHtml = [
	          		(tooltip.beforeTitle || []).join('\n'), (tooltip.title || []).join('\n'), (tooltip.afterTitle || []).join('\n'), (tooltip.beforeBody || []).join('\n'), (tooltip.body || []).join('\n'), (tooltip.afterBody || []).join('\n'), (tooltip.beforeFooter || [])
	          		.join('\n'), (tooltip.footer || []).join('\n'), (tooltip.afterFooter || []).join('\n')
	        	];
	        	tooltipEl.html(innerHtml.join('\n'));
	      	}

	      	// Find Y Location on page
	      	var top = 0;
	      	if (tooltip.yAlign) {
	        	if (tooltip.yAlign == 'above') {
	          		top = tooltip.y - tooltip.caretHeight - tooltip.caretPadding;
	        	} else {
	          		top = tooltip.y + tooltip.caretHeight + tooltip.caretPadding;
	        	}
	      	}

      		var position = $(this._chart.canvas)[0].getBoundingClientRect();

		    // Display, position, and set styles for font
	      	tooltipEl.css({
		        opacity: 1,
	    	    width: tooltip.width ? (tooltip.width + 'px') : 'auto',
	        	left: position.left + tooltip.x + 'px',
	        	top: position.top + top + 'px',
	        	fontFamily: tooltip._fontFamily,
	        	fontSize: tooltip.fontSize,
	        	fontStyle: tooltip._fontStyle,
	        	padding: tooltip.yPadding + 'px ' + tooltip.xPadding + 'px',
      		});
	    };
	    
	    var randomScalingFactor = function() {
	    	return Math.round(Math.random() * 100);
	    };
	    
	    var lineChartData = {
	    	labels: ["${totalJoinDate[0].Date}", "${totalJoinDate[1].Date}", "${totalJoinDate[2].Date}", "${totalJoinDate[3].Date}", "${totalJoinDate[4].Date}", "${totalJoinDate[5].Date}", "${totalJoinDate[6].Date}"],
	      	datasets: [{
		        label: "My First dataset",
		        data: [${totalJoinDate[0].totalJoin}, ${totalJoinDate[1].totalJoin}, ${totalJoinDate[2].totalJoin}, ${totalJoinDate[3].totalJoin}, ${totalJoinDate[4].totalJoin}, ${totalJoinDate[5].totalJoin}, ${totalJoinDate[6].totalJoin}]
	      	}]
	    };
	
	    window.onload = function() {
	    	var chartEl = document.getElementById("chart1");
	      	window.myLine = new Chart(chartEl, {
	        	type: 'line',
	        	data: lineChartData,
	        	options: {
	          		title:{
	            		display:true,
	            		text:'날짜별 가입자 수 현황',
	            		fontSize:20
	          		},
	          		tooltips: {
	            		enabled: false,
	            		custom: customTooltips
	          		},
	          		scales: {
	    				xAxes: [{
	    					ticks:{
	    						fontSize : 20
	    					},
	    				}],
	    				yAxes: [{
	    			        ticks: {
	    			            min: 0,
	    			            max: 20,
	    			            stepSize: 2
	    			        }
	    			    }]
	    			}
	        	}
	      	});
	      	var ctx = document.getElementById("canvas").getContext("2d");
	        window.myBar = Chart.Bar(ctx, {
	            data: barChartData, 
	            options: {
	                responsive: true,
	                hoverMode: 'label',
	                hoverAnimationDuration: 400,
	                stacked: false,
	                title:{
	                    display:true,
	                    text:"날짜별 탈퇴 현황",
	                    fontSize:20
	                },
	                scales: {
	                    yAxes: [{
	                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
	                        display: true,
	                        position: "left",
	                        id: "y-axis-1",
	                    }, {
	                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
	                        display: true,
	                        position: "right",
	                        id: "y-axis-2",
	                        ticks:{
	    						fontSize : 20
	    					},
	                        gridLines: {
	                            drawOnChartArea: false
	                        }
	                    }],
	                    xAxes: [{
	    					ticks:{
	    						fontSize : 20
	    					},
	    				}]
	                }
	            }
	        });
	    };
	</script>
</body>
</html>