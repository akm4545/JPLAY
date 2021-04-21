<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${pageContext.request.requestURL}" />
<c:set var="menuSw" value="${fn:split(url, '/')}"/>
<c:set var="menuSw" value="${menuSw[6]}"/>
<div class="main_container">
        	<div class="col-md-3 left_col">
          		<div class="left_col scroll-view">
            		<div class="navbar nav_title" style="border: 0;">
              			<a href="#" class="site_title">
              				<i class="fa fa-cogs"></i>
              				<span>JPLAY 관리자</span>
              			</a>
            		</div>
            		<div class="clearfix"></div>
            		<!-- menu profile quick info -->
            		<div class="profile clearfix">
              			<div class="profile_info">
                			<span>횐영합니다.</span>
                			<h2>관 리 자</h2>
              			</div>
            		</div>
            		<!-- /menu profile quick info -->
            		<br/>
            		<!-- sidebar menu -->
            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              			<div class="menu_section">
                			<h3>관리자 메뉴</h3>
                			<c:if test="${menuSw == 'member' }">
	                			<ul class="nav side-menu">
	                  				<li>
	                  					<a>
	                  						<i class="fa fa-home"></i>
	                  						 회원관리
	                  						 <span class="fa fa-chevron-down"></span>
	                  					</a>
	                    				<ul class="nav child_menu">
	                      					<li>
	                      						<a href="<c:url value='/admin/member/memberList'/>">회원 조회</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/member/memberDeleteList'/>">회원 탈퇴</a>
	                      					</li>
	                    				</ul>
	                  				</li>
	                			</ul>
                			</c:if>
                			<c:if test="${menuSw == 'movie' }">
	                			<ul class="nav side-menu">
	                  				<li>
	                  					<a>
	                  						<i class="fa fa-home"></i>
	                  						 영화관리
	                  						 <span class="fa fa-chevron-down"></span>
	                  					</a>
	                    				<ul class="nav child_menu">
	                    					<li>
	                      						<a href="<c:url value='/admin/movie/movieAddView'/>">영화 등록</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/movie/movieList'/>">영화 조회</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/movie/movieDeleteList'/>">영화 삭제</a>
	                      					</li>
	                    				</ul>
	                  				</li>
	                			</ul>
                			</c:if>
                			<c:if test="${menuSw == 'payment' }">
	                			<ul class="nav side-menu">
	                  				<li>
	                  					<a>
	                  						<i class="fa fa-home"></i>
	                  						결제관리
	                  						 <span class="fa fa-chevron-down"></span>
	                  					</a>
	                    				<ul class="nav child_menu">
	                    					<li>
	                      						<a href="<c:url value='/admin/payment/paymentList'/>">결제 내역</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/payment/paymentDeleteList'/>">결제 내역 삭제</a>
	                      					</li>
	                    				</ul>
	                  				</li>
	                			</ul>
                			</c:if>
                			<c:if test="${menuSw == 'userService'}">
	                			<ul class="nav side-menu">
	                  				<li>
	                  					<a>
	                  						<i class="fa fa-home"></i>
	                  						1:1문의
	                  						 <span class="fa fa-chevron-down"></span>
	                  					</a>
	                    				<ul class="nav child_menu">
	                    					<li>
	                      						<a href="<c:url value='/admin/userService/questionList'/>">미답변 질문</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/userService/answerList'/>">답변 질문</a>
	                      					</li>
	                    				</ul>
	                  				</li>
	                			</ul>
	                			<ul class="nav side-menu">
	                  				<li>
	                  					<a>
	                  						<i class="fa fa-home"></i>
	                  						공지사항
	                  						 <span class="fa fa-chevron-down"></span>
	                  					</a>
	                    				<ul class="nav child_menu">
	                    					<li>
	                      						<a href="<c:url value='/admin/userService/notifyAddView'/>">공지사항 작성</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/userService/notifyList'/>">공지사항 목록</a>
	                      					</li>
	                      					<li>
	                      						<a href="<c:url value='/admin/userService/notifyDeleteList'/>">공지사항 삭제</a>
	                      					</li>
	                    				</ul>
	                  				</li>
	                			</ul>
                			</c:if>
              			</div>                  
              		</div>
            	</div>
          	</div>
        </div>
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                	<a id="menu_toggle">
                		<i class="fa fa-bars"></i>
                	</a>
                </div>
                <nav class="nav navbar-nav">
                <ul class=" navbar-right">
                	<li class="nav-item dropdown open" style="padding-left: 15px;">
                  	</li>
                  	<li role="presentation" class="nav-item dropdown open">
                    	<ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">
                      		<li class="nav-item">
                        		<a class="dropdown-item">
                          			<span class="image">
                          				<!-- <img src="images/img.jpg" alt="Profile Image" /> -->이미지
                          			</span>
                          			<span>
	                            		<span>
	                            			John Smith
	                            		</span>
	                            		<span class="time">
	                            			3 mins ago
	                            		</span>
                          			</span>
                          			<span class="message">
                            			Film festivals used to be do-or-die moments for movie makers. They were where...
                          			</span>
                        		</a>
                      		</li>
                      		<li class="nav-item">
                        		<a class="dropdown-item">
                          			<span class="image">
                          				<!-- <img src="images/img.jpg" alt="Profile Image" /> -->이미지
                          			</span>
                          			<span>
                            			<span>
                            				John Smith
                            			</span>
                            			<span class="time">
                            				3 mins ago
                            			</span>
                          			</span>
                          			<span class="message">
                            			Film festivals used to be do-or-die moments for movie makers. They were where...
                          			</span>
                        		</a>
                      		</li>
                      		<li class="nav-item">
                        		<a class="dropdown-item">
                          			<span class="image">
                          				<!-- <img src="images/img.jpg" alt="Profile Image" /> -->이미지
                          			</span>
                          			<span>
                            			<span>
                            				John Smith
                            			</span>
                            			<span class="time">
                            				3 mins ago
                            			</span>
                          			</span>
                          			<span class="message">
                            			Film festivals used to be do-or-die moments for movie makers. They were where...
                          			</span>
                        		</a>
                      		</li>
                      		<li class="nav-item">
                        		<a class="dropdown-item">
                          			<span class="image">
                          				<!-- <img src="images/img.jpg" alt="Profile Image" /> -->이미지
                          			</span>
                          			<span>
                            			<span>
                            				John Smith
                            			</span>
                            			<span class="time">
                            				3 mins ago
                            			</span>
                          			</span>
                          			<span class="message">
                            			Film festivals used to be do-or-die moments for movie makers. They were where...
                          			</span>
                        		</a>
                      		</li>
                      		<li class="nav-item">
                        		<div class="text-center">
                          			<a class="dropdown-item">
                            			<strong>
                            				See All Alerts
                            			</strong>
                            			<i class="fa fa-angle-right"></i>
                          			</a>
                        		</div>
                      		</li>
                    	</ul>
                  	</li>
				</ul>
			</nav>
		</div>