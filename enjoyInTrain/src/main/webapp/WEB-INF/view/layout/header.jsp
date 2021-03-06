<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<!-- Header -->
		<div id="header">
		<div class="loginForm">
			<c:if test="${empty sessionScope.crew}">
				<a href="<%=cp%>/crew/login">&nbsp;Login</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=cp%>/crew/crew"><i class="fas fa-user-plus"></i>&nbsp;Join</a>
			</c:if>
			<c:if test="${not empty sessionScope.crew && sessionScope.crew.crewId != 'a'}">
				<a href="<%=cp%>/crew/mypage"><i class="fas fa-user-shield"></i>&nbsp;MyPage</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=cp%>/crew/logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Logout</a>
			</c:if>
		 	<c:if test="${sessionScope.crew.crewId=='a'}">
				<a href="<%=cp%>/admin/trainsales/list"><i class="fas fa-user-cog"></i>&nbsp;AdminPage</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=cp%>/crew/logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Logout</a>
            </c:if>
		</div>
				
			<div class="container1">
				<!-- Nav -->
				<div class="menu">
						<ul class="nav">
							<li class="navbar" style="margin-left: 0px;"><a href="#">Reservation</a>
								<ul class="navbar1">
									<li><a href="<%=cp%>/reservation/main">예약 하기</a></li>
									<li><a href="<%=cp%>/reservation/${empty sessionScope.crew?'uncrew2':'detail'}">예약 조회</a></li>
									
								</ul>
							</li>
							<li class="navbar"><a href="#">Board</a>
								<ul class="navbar2">
									<li><a href="<%=cp%>/notice/list">공지사항</a></li>
									<li><a href="<%=cp%>/faq/list">FAQ</a></li>
								</ul>
							</li>
							
							<li>	
								<a href="<%=cp%>/main">
									<img src="<%=cp%>/resource/images/mainlogo.png" width="150px;" height="100px;"
										style="padding-top: 10px;">
								</a>
							</li>
							
							<li class="navbar"><a href="<%=cp%>/travel/main">Promotion&nbsp;&nbsp;</a>
								<ul class="navbar3">
									<li><a href="<%=cp%>/travel/travel">프로모션 리스트</a></li>
									<li><a href="<%=cp%>/booking/detail">프로모션 예약 조회</a></li>
								</ul>
							</li>
							
							<li class="navbar"><a href="#">Customer</a>
								<ul class="navbar4">
									<li><a href="<%=cp%>/qna/main">Q&#38;A</a></li>
									<li><a href="<%=cp%>/lostBoard/list">유실물</a></li>
									<li><a href="<%=cp%>/freeBoard/list">자유게시판</a></li>
									<li><a href="<%=cp%>/suggest/list">고객의 소리</a></li>
									<li><a href="<%=cp%>/chat/main">채 팅</a></li>
								</ul>
							</li>
						</ul>
					</div>

			</div>
		</div>
	<!-- Header -->
