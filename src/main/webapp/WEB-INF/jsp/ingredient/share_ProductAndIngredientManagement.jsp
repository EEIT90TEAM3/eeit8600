<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>後台管理系統</title> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/fms/style.css">
    <link rel="stylesheet" href="/css/fms/fms-customize.css">

		<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="/js/fms/swipe.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery-scrolltofixed-min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.min.js"></script>
	<script type="text/javascript" src="/js/fms/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/fms/jflickrfeed.js"></script>
	<script type="text/javascript" src="/js/fms/fms-main.js"></script>

<script>
$(function(){
	$('#searchIngerdinet').click(function (){
		var prodName=$("#prodName").val();

		$.ajax({
		'url':'/prodIngreList/get',
		'data':{"prodName":prodName},
		'type' : 'POST',
		beforeSend:function(){
			$("<div class='icon1'><i class='fa fa-spinner fa-1x fa-spin'></i>&nbsp;&nbsp;搜尋中...</div>")
			.appendTo($('<div class="modal-backdrop fade in"></div>').appendTo(document.body));
			},
		'success': function (data){
			$(".modal-backdrop").remove();
			$('#productList').empty();
		for(var i=0;i<data.products.length;i++){
			$("#productList").append(					
					"<tr><td><img src='/products/show?prodImg="+data.products[i].prodImg+"'/></td><td>"
					+data.products[i].prodName+"</td><td>"
					+data.categorys[i].categoryName+"</td>"
					+"<td><input type='submit' class='checkIngredient btn btn-primary'"+ 
					"data-toggle='modal'  data-target='#myModal' name='"
					+data.products[i].prodId+"' value=查看成份>"
					+"</td></tr>")
		}//end of for
 //----------------------------------------------
 		$(".checkIngredient").click(function(e){
			var proIdStr=e.target.name;
			document.location.href="/prodIngreList/share_editIngredient?proIdStr="+proIdStr;

			
		});//end of $(".checkIngredient").click
//-----------------------------------------------		
		}//end success function

		});	
		
		})//end search click
			
	})//end function

</script>
<style >
body {
	font-family: Microsoft JhengHei, "Open Sans",Helvetica,Arial,sans-serif;	
}
#productList img{width:100px;
height: 100px;
}
#mainSpace tr td{
text-align: center;}
#mainSpace{
width:500px;
margin: auto auto;}
#buttonTd{
width: 80px;
padding-left: 20px;}
.grey_bg{
min-height: 650px;
/* background-image: url("/images/IngredientBackground.jpg"); */
-moz-background-size:cover;
-webkit-background-size:cover;
-o-background-size:cover;
background-size:cover;
}
#searchIngerdinet{
color:white;}
.icon1 {
	 color:white;
	 opacity: 1;
	 font-size: 5em;
	 text-align:center;
	 margin-top: 300px;
}
</style>
</head>
<body>
<!--加入header&nav -->
<c:import url="/WEB-INF/jsp/fms_header_nav.jsp" />
			
			<!-- **每頁不同的內容從這裡開始** -->
<!-- ////////////////////////////////////////////////////////////////////-->
<div class="grey_bg row ">

<br><br><br><br><br><br>
<table id="mainSpace" >
<tr><td><h3>請輸入產品名/部分產品名，決定產品</h3><br></td><td></td></tr>
<form action="">

<tr>
<td><input type="text" name="prodName" id="prodName" class="form-control" style="border-radius:20px;"></td> 

<td id="buttonTd"><input type="button" id="searchIngerdinet" value="Search" class="btn btn-default" style="margin-bottom: 10px;"></td>
</tr>
</form>
</table>	
<table id="productList" class="table  table-hover"></table>
<div id="showArea"></div>

</div>
	<!-- ////////////////////////////////////////////////////////////////////-->
            <!-- **每頁不同的內容結束** -->

<!--加入footer -->
<c:import url="/WEB-INF/jsp/fms_footer.jsp" />
			

</body>
</html>