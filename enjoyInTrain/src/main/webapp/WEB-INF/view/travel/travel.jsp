<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<style type="text/css">

.homepage #main{
   margin-top: 5em;
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

.\36 u {width: 70%;}

</style>

<script type="text/javascript">
$(function(){
	$("#tab-0").addClass("active");
	list(0);
});

function ajaxJSON(url, type, query, fn) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxHTML(url, type, query, selector) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			if($.trim(data)=="error") {
				listPage(1);
				return false;
			}	
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function list(group){
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="<%=cp%>/travel/list";
	var query="group="+ group;
	var selector = "#tab-content";
	
	ajaxHTML(url, "get", query, selector);
}



</script>


<!-- Banner2 -->
		<div id="banner2">
			<div class="container">
			</div>
		</div>
	<!-- /Banner -->

	<!-- Main -->
		<div id="page">

			<!-- 여행 상품 순위 -->
			<div id="marketing" class="container" >
			
				<div class="6u" style="">
						<section>
							<header>
								<h2 style="font-weight: bold;">BEST 여행 상품</h2>
								<br>
							</header>
						</section>
				</div>
				
				<div class="row">
					
					<div class="3u">
						<section>
							<header>
								<h3><img src="<%=cp%>/resource/images/one.png" style="width: 50px;"></h3>
							</header>
							<p class="subtitle">In posuere eleifend odio. Quisque semper augue mattis maecenas ligula.</p>
							<p><a href="#"><img src="<%=cp%>/resource/images/pics13.jpg" alt=""></a></p>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2><img src="<%=cp%>/resource/images/two.png" style="width: 50px;"></h2>
							</header>
							<p class="subtitle">In posuere eleifend odio. Quisque semper augue mattis maecenas ligula.</p>
							<p><a href="#"><img src="<%=cp%>/resource/images/pics14.jpg" alt=""></a></p>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2><img src="<%=cp%>/resource/images/three.png" style="width: 50px;"></h2>
							</header>
							<p class="subtitle">In posuere eleifend odio. Quisque semper augue mattis maecenas ligula.</p>
							<p><a href="#"><img src="<%=cp%>/resource/images/pics15.jpg" alt=""></a></p>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2><img src="<%=cp%>/resource/images/recommend.png" style="width: 50px;"></h2>
							</header>
							<p class="subtitle">In posuere eleifend odio. Quisque semper augue mattis maecenas ligula.</p>
							<p><a href="#"><img src="<%=cp%>/resource/images/pics16.jpg" alt=""></a></p>
						</section>
					</div>
				</div>
			</div>
			<!-- 여행상품 순위 -->
				
			<!-- tab키를 이용한 여행 리스트 -->
			<div id="main" class="container">
				<div class="row">
					<div class="6u">
						<section>
							<header>
								<h3 style="font-weight: bold; font-size: 25px;">여행 상품 리스트</h3>
							</header>
							
							<div id ="tab-content" style="clear: both; padding: 10px 0px 0px; width: 800px;"></div>
							
						</section>
					</div>
					
					
					<!-- 세일 -->
					<div class="3u">
						<section class="sidebar">
							<header>
								<h2 style="font-weight: bold;">특별 할인 상품</h2>
							</header>
							<ul class="style2">
								<li>
									<a href="#"><img src="<%=cp%>/resource/images/pics07.jpg" alt=""></a>
									<p>Donec leo, vivamus fermentum augue praesent a lacus at urna rutrum.</p>
								</li>
								<li>
									<a href="#"><img src="<%=cp%>/resource/images/pics08.jpg" alt=""></a>
									<p>Donec leo, vivamus fermentum augue praesent a lacus at urna rutrum.</p>
								</li>
								<li>
									<a href="#"><img src="<%=cp%>/resource/images/pics09.jpg" alt=""></a>
									<p>Donec leo, vivamus fermentum augue praesent a lacus at urna rutrum.</p>
								</li>
								<li>
									<a href="#"><img src="<%=cp%>/resource/images/pics10.jpg" alt=""></a>
									<p>Donec leo, vivamus fermentum augue praesent a lacus at urna rutrum.</p>
								</li>
							</ul>						
						</section>
					</div>
				</div>
			</div>
			<!-- Main -->

		</div>
	<!-- /Main -->

	<!-- Featured -->
		<div id="featured">
			<div class="container">
				<div class="row">
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="<%=cp%>/resource/images/pics04.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="<%=cp%>/resource/images/pics05.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
					<section class="4u">
						<div class="box">
							<a href="#" class="image left"><img src="<%=cp%>/resource/images/pics06.jpg" alt=""></a>
							<h3>Etiam posuere augue</h3>
							<p>Donec nonummy magna quis risus eleifend. </p>
							<a href="#" class="button">More</a>
						</div>
					</section>
				</div>
				<div class="divider"></div>
			</div>
		</div>
	<!-- /Featured -->
