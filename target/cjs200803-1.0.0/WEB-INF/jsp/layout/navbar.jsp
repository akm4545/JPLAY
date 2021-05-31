<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/nav.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/component.css'/>"/>
<link href="<c:url value='/resources/css/dropDown.css'/>" rel="stylesheet" type="text/css" />
<c:set var="url" value="${pageContext.request.requestURL}" />
<c:set var="menuSw" value="${fn:split(url, '/')}"/>
<c:set var="menuSw" value="${menuSw[5]}"/>
<div class="topnav fixed-top fixed" style="position: inherit;">
	<section class="section section--menu" id="Valentine">
		<span class="link-copy"></span>
		<nav class="menu menu--valentine">
			<ul class="menu__list dropDown">
				<c:if test="${menuSw == 'main'}">
					<li class="menu__item--current">
					</li>				
				</c:if>
				<li class="menu__item" onclick="location.href='<c:url value="/main"/>'">
					<img src="<c:url value='/resources/images/logo.png'/>" style="width: 100px; height: 50px;"/>
				</li>
				<c:if test="${menuSw == 'member' && memberInfo == null}">
					<li class="menu__item menu__item--current" onclick="location.href='<c:url value='/member/login'/>'"><a href="#" class="menu__link">로그인</a></li>				
				</c:if>
				<c:if test="${menuSw != 'member' && memberInfo == null}">
					<li class="menu__item" onclick="location.href='<c:url value='/member/login'/>'"><a href="#" class="menu__link">로그인</a></li>				
				</c:if>
				<c:if test="${memberInfo != null}">
					<li class="menu__item" onclick="location.href='<c:url value='/member/logout'/>'"><a href="#" class="menu__link">로그아웃</a></li>
				</c:if>
				<c:if test="${menuSw == 'movie'}">
					<li class="menu__item active menu__item--current" id="sub2">
						<a href="#s2" class="menu__link">카테고리</a>
	                 	<ul id="submenu_sw2" class="submenu">
	                    	<li><a href="<c:url value='/movie/movieList?movieGenre=action'/>">액션</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=comedy'/>">코미디</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=drama'/>">드라마</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=romance'/>">멜로</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=thriller'/>">스릴러</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=SF'/>">SF</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=fantasy'/>">판타지</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=horror'/>">공포</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=animation'/>">애니</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=history'/>">사극</a></li>
	                 	</ul>
		            </li>
				</c:if>
				<c:if test="${menuSw != 'movie'}">
					<li class="menu__item active" id="sub2">
						<a href="#s2" class="menu__link">카테고리</a>
	                 	<ul id="submenu_sw2" class="submenu">
	                    	<li><a href="<c:url value='/movie/movieList?movieGenre=action'/>">액션</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=comedy'/>">코미디</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=drama'/>">드라마</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=romance'/>">멜로</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=thriller'/>">스릴러</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=SF'/>">SF</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=fantasy'/>">판타지</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=horror'/>">공포</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=animation'/>">애니</a></li>
	                       	<li><a href="<c:url value='/movie/movieList?movieGenre=history'/>">사극</a></li>
	                 	</ul>
		            </li>
				</c:if>
				<c:if test="${memberInfo != null}">
					<c:if test="${menuSw == 'member' || menuSw == 'payment'}">
						<li class="menu__item active menu__item--current" id="sub3">
							<a href="#s2" class="menu__link">마이페이지</a>
		                 	<ul id="submenu_sw3" class="submenu">
		                    	<li><a href="<c:url value='/member/memberInfoCheck?memberIdx=${memberInfo.memberIdx}'/>">내정보</a></li>
		                       	<li><a href="<c:url value='/member/myMovie?memberIdx=${memberInfo.memberIdx}'/>">내 영화</a></li>
		                       	<li><a href="<c:url value='/payment/main?memberIdx=${memberInfo.memberIdx}'/>">이용권</a></li>
		                       	<li><a href="<c:url value='/member/memberDeleteView'/>">회원탈퇴</a></li>
		                 	</ul>
			            </li>
					</c:if>
					<c:if test="${menuSw != 'member' && menuSw != 'payment'}">
						<li class="menu__item active" id="sub3">
							<a href="#s2" class="menu__link">마이페이지</a>
		                 	<ul id="submenu_sw3" class="submenu">
		                    	<li><a href="<c:url value='/member/memberInfoCheck?memberIdx=${memberInfo.memberIdx}'/>">내정보</a></li>
		                       	<li><a href="<c:url value='/member/myMovie?memberIdx=${memberInfo.memberIdx}'/>">내 영화</a></li>
		                       	<li><a href="<c:url value='/payment/main?memberIdx=${memberInfo.memberIdx}'/>">이용권</a></li>
		                       	<li><a href="<c:url value='/member/memberDeleteView'/>">회원탈퇴</a></li>
		                 	</ul>
			            </li>
					</c:if>
	            </c:if>
	            <c:if test="${admin == true}">
					<c:if test="${menuSw == 'admin'}">
						<li class="menu__item menu__item--current active" id="sub1">
							<a href="#s2" class="menu__link">관리자</a>
		                  	<ul id="submenu_sw1" class="submenu">
		                      	<li><a href="<c:url value='/admin/member/main'/>">회원관리</a></li>
		                        <li><a href="<c:url value='/admin/movie/main'/>">영화관리</a></li>
		                        <li><a href="<c:url value='/admin/payment/main'/>">결제관리</a></li>
		                        <li><a href="<c:url value='/admin/userService/main'/>">고객센터</a></li>
		                  	</ul>
	                	</li>
					</c:if>
					<c:if test="${menuSw != 'admin'}">
						<li class="menu__item active" id="sub1">
							<a href="#s2" class="menu__link">관리자</a>
		                  	<ul id="submenu_sw1" class="submenu">
		                      	<li><a href="<c:url value='/admin/member/main'/>">회원관리</a></li>
		                        <li><a href="<c:url value='/admin/movie/main'/>">영화관리</a></li>
		                        <li><a href="<c:url value='/admin/payment/main'/>">결제관리</a></li>
		                        <li><a href="<c:url value='/admin/userService/main'/>">고객센터</a></li>
		                  	</ul>
	                	</li>				
					</c:if>
				</c:if>
			</ul>
			<div class="search-container">
    			<form action="<c:url value='/movie/movieSearch'/>">
      				<input id="main_search" type="text" placeholder="검색하기" name="searchKeyword" value="${searchVO.searchKeyword}">
      				<button type="submit"><i class="fa fa-search"></i></button>
    			</form>
		    </div>
		</nav>
	</section>
</div>
<div id="response-search-container">
	<form action="<c:url value='/movie/movieSearch'/>">
		<div style="display: inline-flex;">
			<input id="response-main_search" style="border: none;" type="text" placeholder="검색하기" name="searchKeyword" value="${searchVO.searchKeyword}">
			<button type="submit" style="border: none;"><i class="fa fa-search"></i></button>
		</div>		
	</form>
</div>
<script src="<c:url value='/resources/js/classie.js'/>"></script>
<script src="<c:url value='/resources/js/clipboard.min.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	(function() {
		[].slice.call(document.querySelectorAll('.menu')).forEach(function(menu) {
			var menuItems = menu.querySelectorAll('.menu__link'),
				setCurrent = function(ev) {
					ev.preventDefault();
	
					var item = ev.target.parentNode; // li
	
					// return if already current
					if (classie.has(item, 'menu__item--current')) {
						return false;
					}
					// remove current
					classie.remove(menu.querySelector('.menu__item--current'), 'menu__item--current');
					// set current
					classie.add(item, 'menu__item--current');
				};
	
			[].slice.call(menuItems).forEach(function(el) {
				el.addEventListener('click', setCurrent);
			});
		});
	
		[].slice.call(document.querySelectorAll('.link-copy')).forEach(function(link) {
			link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
			new Clipboard(link);
			link.addEventListener('click', function() {
				classie.add(link, 'link-copy--animate');
				setTimeout(function() {
					classie.remove(link, 'link-copy--animate');
				}, 300);
			});
		});
	})(window);
		
	var sub1DisplaySw = false;
	var sub2DisplaySw = false;
	var sub3DisplaySw = false;
	
	$(document).ready(function() {
		var checkMenu = "";
		$('#sub1').click(function() {
			checkMenu = $('#submenu_sw1').attr('class')
			if(checkMenu.indexOf("submenuTest") != -1){
				$('#submenu_sw1').removeClass('submenuTest');
			}else{
				$('#submenu_sw1').addClass('submenuTest');				
			}
			$('#submenu_sw2').removeClass('submenuTest');
			$('#submenu_sw3').removeClass('submenuTest');
		});
		$('#sub2').click(function() {
			checkMenu = $('#submenu_sw2').attr('class')
			if(checkMenu.indexOf("submenuTest") != -1){
				$('#submenu_sw2').removeClass('submenuTest');
			}else{
				$('#submenu_sw2').addClass('submenuTest');				
			}
			$('#submenu_sw1').removeClass('submenuTest');
			$('#submenu_sw3').removeClass('submenuTest');
		});
		$('#sub3').click(function() {
			checkMenu = $('#submenu_sw3').attr('class')
			if(checkMenu.indexOf("submenuTest") != -1){
				$('#submenu_sw3').removeClass('submenuTest');
			}else{
				$('#submenu_sw3').addClass('submenuTest');				
			}
			$('#submenu_sw1').removeClass('submenuTest');
			$('#submenu_sw2').removeClass('submenuTest');
		});
	});
	
	$(window).on('scroll', function(){
		scrollTop = $(window).scrollTop();
		if(scrollTop >= 90){
			/* $('.topnav').addClass('scroll'); */
			$('.topnav').stop(true).css({'position' : 'fixed'});
			$('.topnav').addClass('topnav_fix');
		}else{
/* 			$('.topnav').removeClass('scroll'); */
			$('.topnav').stop(true).css({'position' : 'inherit'});
			$('.topnav').removeClass('topnav_fix');
		}
	});
	
	$("#response-search-container input").focus(function(){
		$("#response-search-container input").animate(
			{ "width": "200px" },
			300,
			function() {}
			); 
	});
	
	$("#response-search-container input").blur(function(){
		$("#response-search-container input").animate(
			{ "width": "60px" }, 
			300, 
			function() {}
		);
	});
	
	$("#response-search-container form").click(function(){ 
		$("#response-search-container input").focus(); 
	});
</script>