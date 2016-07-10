<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>會員文章</title>
	
	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="/css/member-post.css" type="text/css" media="all">
	<script type="text/javascript" src="/js/jquery.min.js"></script> 
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<style>
	#timelineDiv{
		width: 800px;
		margin: 0 auto;
		margin-top: 50px;
	}
</style>
</head>
<body>
<div id="timelineDiv">
<section id="cd-timeline">
	<c:forEach var="item" items="${articles}">
	<div class="cd-timeline-block">
		<div class="cd-timeline-img"></div>
		
		<div class="cd-timeline-content">
			<h2>${item.articleTitle}</h2>
			<small>${item.articleType}</small>
			<p>${item.article}</p>
			<a href="#" class="cd-info">觀看文章</a>  <!--連結到單篇文章 -->
            <a href="/articles/edit?articleId=${item.articleId}" class="cd-info">編輯文章</a>
			<span class="cd-date">${item.articleTime}</span>
		</div> <!-- cd-timeline-content -->
	</div> <!-- cd-timeline-block -->
	</c:forEach>
</section>
</div> <!-- timeline Div -->

<script>
$(function(){
	var timelineBlocks = $('.cd-timeline-block'),
		offset = 0.8;

	hideBlocks(timelineBlocks, offset);

	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
			console.log("show"+$(this));
		});
	}
}); //onload
</script>
</body>
</html>