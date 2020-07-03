<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style type="text/css">
#btn{
	border-radius: 150px; 
	border: 1px solid black; 
	width: 120px;
	height: 120px;
	margin: 0;
}
#btn:hover{
	background: #21373F;
	color: white;
}
</style>

<table
	style="width: 100%; border-spacing: 0px; margin: 0px auto; border-collapse: collapse;">
	<tbody class="board-list">
		<tr>
			<td></td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr id="question-${dto.categoryNum}" class="qu"
				data-num="${dto.pmCode}" height="35"
				style="border-bottom: 1px solid #cccccc;"
				onclick="location.href='<%=cp%>/travel/travel?pmCode=${dto.pmCode}'">
				<td style="width: 300px;">
					<img src="<%=cp%>/uploads/travel/${dto.saveFileName}" width="254px" height="150px" style="margin: 15px 15px;">
				</td>
				<td style="width: 720px; font-weight: bold; ">
					${dto.pmTitle}<br>  
					<p style="color:orange;"><fmt:formatNumber value="${dto.pmPrice}" pattern="#,###" />&#126;</p>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<table style="width: 100%; border-spacing: 0px;">
	<tr height="35">
		<td align="right"><c:if test="${sessionScope.crew.crewId == 'a'}">
				<button style="border-radius: 10px;" type="button" id="btn"
					class="btn" onclick="insertForm();">프로모션 추가</button>
		</c:if></td>
	</tr>
</table>
