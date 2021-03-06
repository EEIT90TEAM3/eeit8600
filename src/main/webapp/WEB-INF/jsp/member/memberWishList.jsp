<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>${nickname}'s 慾望清單</title>
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">
    <link rel="stylesheet" href="/css/animate.css">
    <!-- customize -->
    <link rel="stylesheet" href="/css/member/member-customize.css">
    
    <script src="/js/jquery.min.js"></script>
</head>
<style>
#prodDiv{
	margin-top: 50px;
}
i{
	color: #727CB6;
}
.portfolio-item{
	margin-bottom: 30px;
	padding: 0 5px 0 5px;
	
}
.prodContent{
 	padding: 10px 10px 30px 10px;
	overflow: hidden;
	border-top: 3px solid #000;
    border-radius: 1px;
    background: #fff;
    text-align: center;
    box-shadow: -1px 0 2px 0 rgba(0,0,0,0.12) , 1px 0 2px 0 rgba(0,0,0,0.12) , 0 1px 1px 0 rgba(0,0,0,0.24);
	height: 430px;
}
.prodImg{
	text-align: center;
	margin-top: 5px; 
}
.prodImg img{
	width: 100%;
	
}
.prodInfo{
	margin-bottom: 5px;
}
.prodInfo .brand{
	color: #000;
    display: block;
    font-size: 20px;
    line-height: 24px;
    font-weight: bold;
    letter-spacing: 1px;
}
.prodInfo h2, .prodInfo h2 a{
	font-size: 20px;
    line-height: 24px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
    max-height: 102px;
    font-family: brandon-text-wired,brandon-text,brandon-grotesque-1,brandon-grotesque-2,BrandonText-Bold,Gill Sans,HelveticaNeue-Bold,'Helvetica Neue Bold','Helvetica Neue',Helvetica,Arial,'Lucida Grande',sans-serif, Microsoft JhengHei;
    font-style: normal;
    font-weight: 600;
    margin-top: 10px;
    color: #000;
    letter-spacing: 0.5px;
    margin-top: 5px;
}
.prodInfo p{
	margin-bottom: 5px;
}
.prodContent a:hover{
	color: rgba(0,0,0,0.6);
}
.btn-delete{
	margin-top: 10px;
	background: #000;
	border-radius: 0px;
	padding: 3px 8px 3px 8px;
}
.hvr-float {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.hvr-float:hover, .hvr-float:focus, .hvr-float:active {
  -webkit-transform: translateY(-8px);
  transform: translateY(-8px);
}
.modal-content{
	text-align: center;
	padding: 30px 0 20px 0;
}
.modal-content h2{
	font-weight: 400;
}
.modal {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
</style>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
				<div class="grey_bg row">

<div class="row detail-div">
	<div class="col-lg-10 col-sm-6 wow fadeInLeft delay-05s memberDiv">
		<c:import url="/WEB-INF/jsp/member/memberPages-header.jsp" />
		<div class="subject">
			<p id="count-review"><i class="fa fa-heart"></i> WISH LIST (${fn:length(products)})</p>
		</div>
<div id="prodDiv" class="row">
	<c:forEach var="item" items="${products}">
    <div class="col-md-4 portfolio-item hvr-float" dataId="${item.prodId}">
        <div class="prodContent">
	        <div class="prodInfo">
	        	<span class="brand">${item.brandName}</span>
	        	<span class="category">${item.categoryName}</span>
	        </div>
	        <div class="prodImg">
	         	<a href="<%=request.getContextPath() %>/products/view/${item.prodId}">
	         		<img src="/products/show?prodImg=${item.prodImg}"/></a>
	        </div>        
	        <div class="prodInfo">
	         	<h2><a href="<%=request.getContextPath() %>/products/view/${item.prodId}">${item.prodName}</a></h2>
	         	<c:if test="${item.score>0}">
	         	<p>
		         	<c:forEach begin="1" end="${item.score}"><i class="fa fa-diamond"></i></c:forEach>
	         	</p>
	         	<span>(${item.score})</span>
	         	</c:if>
	         	<c:if test="${item.score<=0}">
	         	<p>
					<i class="fa fa-diamond" style="color: transparent;"></i>
	         	</p>
	         	<span>(尚未有心得評分)</span>
	         	</c:if>
	         </div>
	         <div>
	         	<button class="btn btn-default btn-delete" value="${item.prodId}"
	         		 data-toggle="modal" data-target="#myModal">刪除</button>
	         </div>
         </div>
    </div> <!-- portfolio-item -->
    </c:forEach>
</div> <!-- #prodDiv -->


</div> <!-- memberDiv -->

<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
    	<h2>刪除  ${product.prodName} ?</h2>
    	<br>
    	<button id="del-confirm" class="btn btn-default">確認</button>
    </div>
  </div>
</div>

	<c:import url="/WEB-INF/jsp/member/memberPages-nav.jsp" />

	</div> <!-- detail-div -->
	
</div> <!-- grey_bg -->
					
				</div>        

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

	<!-- Scripts -->
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>
	
	<script src="/js/member/member.js"></script>
<script>
$(function(){
	var btn1;
	var prodId;
	
	$('.btn-delete').click(function(e){
		btn1 = e.target;
		prodId = btn1.getAttribute('value');
		console.log(btn1);
		console.log(prodId);	
	});//btn-delete onClick
		
	$('#del-confirm').click(function(){		
		$.ajax({
			url:"/members/like/product/delete",
			data:{"prodId": prodId},
			type:'get',
			success:function(result){
				console.log(result);
				if(result){
					$(".portfolio-item[dataId*="+prodId+"]").remove();
					
					$('#count-review').html('<i class="fa fa-heart"></i> WISH LIST ('+result+')');
				}
				$('#myModal').modal('toggle');
			}
		}); //ajax
	});
	
	
	var timelineBlocks = $('.portfolio-item'),
	offset = 0.8;
	
	hideBlocks(timelineBlocks, offset);
	
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.prodContent').addClass('is-hidden');
			console.log("hide");
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.prodContent').hasClass('is-hidden') ) && $(this).find('.prodContent').removeClass('is-hidden').addClass('animated fadeInDown');
			console.log("show"+$(this));
		});
	}
	
});
</script>
</body>
</html>