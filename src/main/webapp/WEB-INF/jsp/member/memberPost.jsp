<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Member Posted</title>

	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/fms/style.css">
	<link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
	<!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
    
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script src="https://use.typekit.net/riz5mva.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
<style>
h2, h4{
	margin: 0;
}
#member-header{
	border-bottom: 0px;
}
.nav-tabs{
	border-bottom: 1px solid #000;
}
.nav-tabs li a{
	display: block;
	padding: 13px 50px;
	border: 0px;
	background: #fff;
}
.nav-tabs li, .nav-tabs li:hover{
	margin: 0 5px 0 0;
}
.nav-tabs li.active, .nav-tabs li.active a, .nav-tabs li.active a:hover,
.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus,
.nav-tabs li a:hover{
    background: #000;
    color: #fff;
    font-weight: 600;
	border: 0px;
}
.tab-content{
 	border: 0px; 
}
.reviews{
	padding: 33px 0 40px 0;
	border-bottom: 1px solid #E0E0E0;
}
.prod{
	color:#000;
	font-weight: 400;
	font-size: 14px;
	display:inline-block;
	padding-bottom: 5px;
}
.reviewTime{
	position:relative;
	display: block;
	float: left;
	text-align: right;
	font-size: 12px;
	line-height: 24px;
	letter-spacing: 0.1em;
	color:#666;
	margin-right: 30px;
	margin-bottom: 20px;
	width: 90px;
	top:2px;
	border-top: 2px solid #727CB6;
	
}
.reviewTime>span{
	font-size: 18px;
	font-family: FranklinGothic,Helvetica,sans-serif;
}
.reviewImg{
	display: table-cell;
	position: relative;
	width: 200px;
}
.reviewImg img{
	width: 100%;
}

.info{
	position:relative;
	display: block;
	float: left;
	clear: both;
	margin-left: 5px;
	margin-top: 50px;
	font-size: 12px;
	color: #000;
}
.reviewContent{
	display: table-cell;
	padding-left: 30px;
	vertical-align: top;
}
.reviewContent h2, .reviewContent p, .reviewContent h4{
	font-family: Microsoft YaHei;
}
.reviewContent h2.reviewTitle{
	color: #000;
	font-size: 28px;
	font-weight: normal;
	letter-spacing: 0.05em;
}
.reviewContent h2.reviewTitle>span{
	display: inline-block;
	vertical-align: middle;
	font-size: 10px;
	padding: 0 10px 0 4px;
	background: #727CB6;
}
.reviewContent h2>span>a{
	color: #fff;
	line-height: 20px;
}
.prereview{
	overflow: hidden; 
	display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    text-align: justify;
    line-height: 20px;
    font-size: 18px;
    font-weight: 300;
    color: #333;
}
.singlepage{
    font-family: Savoy,Georgia,serif;
    font-size: 16px;
    text-decoration: underline;
    color: #000;
}
.singlepage:hover{
	text-decoration: underline;
}
.blog_single .post_date{
	float: right;
	padding-top: 5px;
}
.blog_single .day{
	font-size: 16px;
	padding: 5px;
}
.blog_single .month{
	padding: 2px 8px 4px;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />

			<!-- **每頁不同的內容從這裡開始** -->
				<div class="grey_bg row">
<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		
<div id="tabnav">
	<div id="maintab">
		<ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#review">Review</a></li>
            <li class=""><a data-toggle="tab" href="#article">Article</a></li>
        </ul>
	</div> <!-- maintab -->
	<div id="subtab">
		
	</div> <!-- subtab -->
</div> <!-- tabnav -->

<div id="container">
	<div class="tab-content clearfix">
	    <div id="review" class="tab-pane fade active in">
	        <c:forEach var="item" items="${reviews}" varStatus="vs">
	        <div class="reviews col-lg-12">
	        	<div class="reviewTime">
	        		<c:set var="index"  value="${vs.index}"/>
	        		<c:set var="reviewTime"  value="${dates[index]}"/>
	        		<c:set var="time"  value="${fn:split(reviewTime,',')}"/>
	        		<span>${time[2]}</span>
	        		<div class="blog_single">
		        		<article class="post">
			        		<div class="post_date">
								<span class="day">${time[1]}</span>
								<span class="month">${time[0]}</span>
							</div>
						</article>
					</div>
	        		<div class="info"><i class="fa fa-heart"></i> ${item.rewCollect}
	        		&nbsp;&nbsp;<i class="fa fa-comments"></i> ${item.rewCollect}</div>
	        	</div>
		        <div class="reviewImg"><a href="/products/view?prodId=${item.product.prodId}"><img src="/products/show?prodImg=${item.product.prodImg}"/></a></div>
		        <div class="reviewContent">
		        	<h2 class="reviewTitle">${item.reviewTitle} <span><a href="#"><i class="fa fa-pencil"></i>edit</a></span></h2>
		        	<h4 class="prod">${item.product.prodName} | ${item.product.brand.brandName} </h4>
		        	<p class="prereview">${item.review}</p>
		        	<a class="singlepage" href="/reviews/reviewjQueryRain?reviewId=${item.reviewId}">read more</a>
		        	<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
		        </div>
	        </div> <!-- reviews -->
	        </c:forEach>
	        <input type="hidden" id="reviewsPageNum" value="${reviewsPageNum}">
			<input type="hidden" id="reviewsTotalPages" value="${reviewsTotalPages}">
	    </div>
	    
	    <div id="article" class="tab-pane fade">
        	
    	</div>
	</div>
</div> <!-- tabContent -->



	</div> <!-- col-lg -->
	
	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />
	
</div> <!-- row -->
					
				</div>        
            
<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />

<script id="reviewTemplate" type="text/template">
<div class="reviews col-lg-12">
	<div class="reviewTime">
		<span>_year</span>
	    <div class="blog_single">
	    <article class="post">
	    	<div class="post_date">
			<span class="day">_day</span>
			<span class="month">_month</span>
			</div>
		</article>
		</div>
		<div class="reviewBtn"></div>
		<div class="info"><i class="fa fa-heart"></i> _rewCollect
			&nbsp;&nbsp;<i class="fa fa-comments"></i> _rewCollect</div>
	</div>
	<div class="reviewImg"><a href="/products/view?prodId=_prodId">
		<img src="/products/show?prodImg=_prodImg"/></a></div>
	<div class="reviewContent">
		<h2 class="reviewTitle">_reviewTitle <span><a href="#"><i class="fa fa-pencil"></i>edit</a></span></h2>
		<h4 class="prod">_prodName | _brandName </h4>		
		<p class="prereview">_review</p>
		<a class="singlepage" href="/reviews/reviewjQueryRain?reviewId=_reviewId">read more</a>
		<i class="fa fa-angle-right" style="color:#a60505;padding-left:5px;"></i>
	</div>
</div>
</script>
<script>
$(function(){
	$(window).scroll(function(){
	    if($(window).scrollTop() + $(window).height() >= $(document).height()){	
	    	var totalPages = $('#reviewsTotalPages').val();
	    	var loadedPageNum = $('#reviewsPageNum').val();
	    	var pageNum = parseInt(loadedPageNum)+1;
// 	    	console.log("totalPages: "+totalPages);
// 	    	console.log("loadedPageNum: "+loadedPageNum);
// 	    	console.log("pageNum: "+pageNum);
	    	if(loadedPageNum < totalPages){
	    	$.ajax({
	    		url: '/members/post/review/'+pageNum,
				type: 'POST',
				dataType: 'json',
				contextType: 'application/json; charset=utf-8;',
				success: function(response){
					var result = response[0];
					console.log("result: "+result);
					var reviews = result.reviews;
					var reviewsPageNum = result.reviewsPageNum;
					var products = result.products;
					var member = result.member;
					var dates = result.dates;
					
					$('#reviewsPageNum').val(reviewsPageNum);
					
					for(var i=0; i<reviews.length; i++){
						console.log("prodId: "+reviews[i].prodId);
						var month = dates[i].substring(0,3);
						var day = dates[i].substring(4,5);
						var year = dates[i].substring(7);
						console.log(year+" "+day+" "+month);
						$($('#reviewTemplate').html()
							.replace('_year', year)
							.replace('_day', day)
							.replace('_month', month)
							.replace('_reviewTime', reviews[i].reviewTime)
							.replace('_rewCollect', reviews[i].rewCollect)
							.replace('_rewCollect', reviews[i].rewCollect)
							.replace('_prodId', reviews[i].prodId)
							.replace('_prodImg', products[i].prodImg)
							.replace('_reviewTitle', reviews[i].reviewTitle)
							.replace('_prodName', products[i].prodName)
							.replace('_brandName', products[i].brandName)
							.replace('_review', reviews[i].review)
							.replace('_reviewId', reviews[i].reviewId))
							.appendTo($('#review'));
					}
				} /* success */
	    	});} /* ajax */
	    }
	}); /* onScroll */
	
	
	  /*============ BUTTON UP ===========*/
    
	var btnUp = $('<div/>', {'class':'btntoTop'});
	btnUp.appendTo('body');
	$(document).on('click', '.btntoTop', function() {
	    $('html, body').animate({scrollTop: 0}, 700);
    });
	
	$(window).on('scroll', function() {
        if ($(this).scrollTop() > 200)
            $('.btntoTop').addClass('active');
        else
            $('.btntoTop').removeClass('active');
   });

});
</script>
</body>
</html>