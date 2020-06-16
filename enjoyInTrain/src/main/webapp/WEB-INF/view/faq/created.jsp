<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.homepage #main{
   margin-top: 0em;
    padding-top: 0em;
}   

.ui-widget-header {
	background: none;
	border: none;
	height:35px;
	line-height:35px;
	border-bottom: 1px solid #cccccc;
	border-radius: 0px;
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



.btn{
	width: 100px; 
	height: 30px; 
	background-color: white; 
	border-color: #cccccc;
	border-radius: 10px;
	margin: 20px 10px;
}

table td{
	padding-top: 6px;
}

.title{
	text-align: center;

}
</style>

<script type="text/javascript">




function sendOk() {
	var f = document.boardForm;

	if(! f.categoryNum.value) {
		alert("분류 명을 선택하세요. ");
		f.categoryNum.focus();
		return;
	}
        
	if(! f.faqTitle.value) {
		alert("제목을 입력하세요. ");
		f.subject.focus();
		return;
	}

	if(! f.faqContent.value) {
		alert("내용을 입력하세요. ");
		f.content.focus();
		return;
	}
	
	var group = f.categoryNum.value;
	
	f.action="<%=cp%>/faq/${mode}?group="+group;

	f.submit(); 
}


</script>


<!-- Banner -->
	<div id="banner">
		<div class="container">
		</div>
		</div>
	<!-- /Banner -->

	<!-- Main -->
	<div id="page">
				
		<!-- Main -->
		<div id="main" class="container">
			<div class="row">

				<div class="3u">
					<section class="sidebar">
						<header>
							<h2>F&nbsp;A&nbsp;Q</h2>
						</header>
						<ul class="style1">
							<li><a href="#">승차권구매</a></li>
							<li><a href="#">승차권이용</a></li>
							<li><a href="#">승차권환불</a></li>
							<li><a href="#">코레일멤버십</a></li>
							<li><a href="#">결제</a></li>
							<li><a href="#">기타</a></li>
						</ul>
					</section>
				</div>
				
				<div class="9u skel-cell-important">
					<section>
						<header>
							<h2>자주 묻는 질문 </h2>
							<span class="byline">Frequently asked questions</span>
						</header>
						<div>
								
						<form name="boardForm" method="post">
						  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
						  <tr align="left" height="40" style="border-top: 1px solid #cccccc;  border-bottom:1px solid #cccccc;"> 
						      <td class="title" width="100" bgcolor="#eeeeee" style="text-align: center;">분&nbsp;&nbsp;&nbsp;&nbsp;류</td>
						      <td style="padding-left:10px;"> 
						        <select class="selectField" name="categoryNum" style="width: 150px;">
						        	<option value="${dto.category}">:: 분류 선택 ::</option>
						        	<c:forEach var="vo" items="${groupList}">
						        		<option  value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.category}</option>
						        	</c:forEach>
						        </select>
			
								<c:if test="${sessionScope.member.userId=='admin'}">
									<button type="button" class="btn" id="btnCategoryUpdate"> 변경 </button>
								</c:if>			        
						    </td>
						  </tr>
						  
						  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
						     <td class="title" width="100" bgcolor="#eeeeee" style="text-align: center;">질&nbsp;&nbsp;&nbsp;&nbsp;문</td>
						     <td style="padding-left:10px;"> 
						       <input type="text" name="faqTitle" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.faqTitle}">
						     </td>
						  </tr>
						
						  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
						     <td class="title" width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
						     <td style="padding-left:10px;"> 
						         ${sessionScope.member.userName}
						     </td>
						  </tr>
						
						  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
						     <td class="title" width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						     <td valign="top" style="padding:5px 0px 5px 10px;"> 
						        <textarea name="faqContent" rows="12" class="boxTA" style="width: 95%;">${dto.faqContent}</textarea>
						     </td>
						  </tr>
			
						 </table>
						
						 <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
						     <tr height="45"> 
						      <td align="center" >
						        	<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
						        	<button type="reset" class="btn">다시입력</button>
						        	<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/faq/list';">${mode=='update'?'수정취소':'등록취소'}</button>
						       <c:if test="${mode=='update'}">
						        	<input type="hidden" name="faqNum" value="${dto.faqNum}">
						        	<input type="hidden" name="group" value="${group}">
						       </c:if>
						     </td>
						   </tr>
						</table>
					</form>
							
				</div>
							
				</section>
			</div>
					
		</div>
	</div>
	<!-- Main -->

</div>
<!-- /Main -->