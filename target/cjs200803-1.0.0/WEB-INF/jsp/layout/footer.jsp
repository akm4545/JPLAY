<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/footer.css'/>">
<div id="footer">
	<hr id="footer_hr"/>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-6">
			<ul>
				<li class="footer_li" style="padding-top: 10px;">
					<ul style="padding-left: 0px;">
						<li class="footer_li">
							<a href='<c:url value='/userService/main?memberIdx=${memberInfo.memberIdx == null ? 0 : memberInfo.memberIdx}'/>'>
								<font size="1.5em" color="white">
									고객센터	
								</font>
							</a>
						</li>
					</ul>
				</li>
				<li class="footer_li" style="padding-top: 10px;">JPLAY 대한민국</li>
				<li class="footer_li" style="padding-top: 10px;">제이플레이서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: 00-308-321-0058</li>
				<li class="footer_li" style="padding-top: 10px;">대표: 레지널드 숀 톰프슨</li>
				<li class="footer_li" style="padding-top: 10px;">이메일 주소: korea@netflix.com</li>
				<li class="footer_li" style="padding-top: 10px;">주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161</li>
				<li class="footer_li" style="padding-top: 10px;">클라우드 호스팅: Amazon Web Services Inc.</li>
				<li class="footer_li" style="padding-top: 10px;">공정거래위원회 웹사이트 링크</li>
			</ul>
		</div>
		<div class="col-sm-4"></div>
	</div>
</div>