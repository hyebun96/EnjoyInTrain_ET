<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<style type="text/css">
.homepage #main{
   margin-top: 0em;
    padding-top: 0em;
}   

.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}

tr.over {
	background: #f5fffa;
	cursor: pointer;
}

ul.tabs {
	margin: 5px 0px;
	padding: 0;
	float: left;
	list-style: none;
	height: 35px;
	border-bottom: 1px solid #dddddd;
	width: 100%;
}
ul.tabs li {
	float: left;
	margin: 0;
	cursor: pointer;
	padding: 0px 21px ;
	height: 35px;
	line-height: 35px;
	overflow: hidden;
	position: relative;
	background: #ffffff;
}
ul.tabs li:hover {
	background: #e7e7e7;
}	
ul.tabs li.active{
	font-weight: 700;
	border: 1px solid #dddddd;
	border-bottom-color:  transparent;
}

#btn{
	width: 100px; 
	height: 30px; 
	margin-top: 20px; 
	background-color: white; 
	border-color: #cccccc;
}

#updatebtn{
	width: 50px; 
	height: 30px;  
	background-color: white; 
	border-color: #cccccc;
	float: right;
	border-radius: 10px;
	margin-right: 5px;
}

#deletebtn{
	width: 50px; 
	height: 30px;  
	background-color: white; 
	border-color: #cccccc;
	float: right;
	border-radius: 10px;
	margin-right: 5px;
}

.qu:hover{
	background: #f5fffa;
}

</style>
	
		<table style="width: 100%; border-spacing: 0px; margin: 0px auto; border-collapse: collapse;">
			<tbody class="board-list">
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td></td>
					<td style="padding-left: 20px;">Question<span style="float: right; padding-right: 30px;">Answer</span><span style="float: right; padding-right: 30px;">Crew</span></td>
				</tr>
								
			<c:forEach var="dto" items="${list}">
				<tr id="question-${dto.categoryNum}" class="qu" data-num="${dto.qnaNum}" height="35" style="border-bottom: 1px solid #cccccc;" onclick="javascript:articleQnA('${dto.qnaNum}', '${dto.qnaSecret}', '${dto.crewId}');">
					<td><input type="hidden" class="num" value="${dto.category}"></td>
					<td><i class="fas fa-question-circle"></i>&nbsp;&nbsp;${dto.qnaTitle}&nbsp;&nbsp;<c:if test="${dto.qnaSecret==1}"><i class="fas fa-lock"></i></c:if>
						<c:if test="${dto.qnaContent != null}">
							<span style="float: right;">답변완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</c:if>
						<c:if test="${dto.qnaContent == null}">
							<span style="float: right;">답변준비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</c:if>
						<span style="float: right;">${dto.crewId}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
								
		<table style="width: 100%; border-spacing: 0px;">
			<tr height="35">
				<td align="right">
					<c:if test="${sessionScope.crew.crewId != null}">
						<button style="border-radius: 10px;" type="button" id="btn" class="btn" onclick="insertForm();">qna올리기</button>
					</c:if>
				</td>
			 </tr>
		</table>
							