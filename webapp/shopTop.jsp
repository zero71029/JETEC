<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<base target="_parent" />
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- google字體 -->
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Kanit" rel="stylesheet">



			<!-- bootstrap的CSS、JS樣式放這裡  -->

			<script src="${pageContext.request.contextPath}/bootstrap-5.0.1-dist/js/bootstrap.min.js"></script>
			<!-- <%-- jQuery放這裡 --%> -->
			<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
			<!-- <%-- Header的CSS、JS樣式放這裡    --%> -->
			<!-- <%-- footer的CSS、JS樣式放這裡    --%> -->
			<!-- <%-- 主要的CSS、JS放在這裡--%> -->
		</head>

		<style>
			div {
				/* border: red 1px solid; */

			}

			.menu {
				/* color: white; */
				line-height: 2rem;
				margin: auto;
				padding: 10px 0;
			}

			.log {
				line-height: 2rem;
				margin: auto;
				padding: 20px 0;
				position: relative;
				background-color: #231F20;
				text-align: center;
			}

			.log a {
				color: #ff703E;
				font-size: 19pt;
				font-family: kanit;
				text-decoration: none;

			}

			.menu a {
				color: #ff703E;
				font-size: 16pt;
				text-decoration: none;
				cursor: pointer;
				padding: 20px 0;
			}

			.menu a:hover {
				color: white;
			}



			.login {
				color: black;
			}

			.menuProduct ul {
				text-align: left;

			}



			.cart img {
				width: 30px;
			}

			.card {
				width: 200%;
			}

			/* 分類列表 */
			.ProductLove2 {
				text-align: left;
				color: #ff703E;
			}

			.ProductLove2 a {
				color: #ff703E;
			}

			.ProductType {
				text-align: center;
				position: relative;

			}

			.ProductType p:hover {
				color: #ff703E;

			}


			.ProductSort {
				position: relative;
				/* max-height: 150px; */

			}

			.ProductSort .love1 {
				margin: 30px 0 0px 0;
			}

			.love2 a {
				color: #000;
				text-decoration: none;
				line-height: 2rem;
			}

			.love2 a:hover {
				color: #ff703E;

			}
			.SupportLevel{
				text-decoration: none;
				text-align :center;
			}
			.SupportLevel a{
				text-decoration: none;
				color: #000;
			} 
			.SupportLevel a:hover {
				color: #ff703E;

			}
			/* 分類列表 結束*/
		</style>


		<body>
			<div class="container-fluid">
				<!-- 公司log層 -->
				<div class="row  log">
					<div class="col-lg-2">
						<a href="${pageContext.request.contextPath}/shop.jsp" class=""
							style="width: 300px; color: white;"><img
								src="${pageContext.request.contextPath}/images/YOTTASENSE LOGO.png" alt="YOTTA SENSE"
								style=" width: 250px;"></a>
					</div>
					<div class="col-lg-1"></div>
					<!-- search -->
					<div class="col-lg-6 search">
						<div class="input-group mb-3">
							<input type="text" class="form-control searchProduct" placeholder="商品搜索"
								aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2"
								style="background-color: #ff703E;color: white;"
								onclick="searchProduct()">search</button>
						</div>
					</div>
					<!-- search 結束-->
					<div class="col-lg-2">
						<div class="login">
							<a href="${pageContext.request.contextPath}/signup.jsp" class="Signup">Sign up</a>

							&nbsp;&nbsp;<span style="color: white;">|</span>
							&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/login.jsp" class="log">login</a>
						</div>
					</div>
					<div class="col-lg-1">
						<div class="col-lg-12 cart">
							<a href="${pageContext.request.contextPath}/shopCart" style="color: #ff703E;"><img
									src="${pageContext.request.contextPath}/images/cart.png" alt="Cart">${cartNum}</a>
						</div>
					</div>
				</div>
				<!-- 目錄層 -->
				<div class="row menu" style="background-color: #554e40; text-align: center;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8 ">
						<div class="row">
							<div class="col-lg-3">
								<a href="${pageContext.request.contextPath}/shop.jsp">Home</a>
							</div>

							<!-- 商品 分類列表 -->
							<div class="col-lg-3 menuProduct" style="position: relative;">
								<a class="ProductList">
									Product
								</a>
							</div>
							<div class="col-lg-3 FAQ">
								<a class="Support">Support</a>
							</div>
							<div class="col-lg-3 message">
								<a href="${pageContext.request.contextPath}/shop/AboutUs.jsp">About
									us</a>
							</div>
						</div>

					</div>

					<div class="col-lg-1"></div>
				</div>
				<!-- 分類列表層-->

				<div class="row ProductType" id="">
					<div class="col-lg-2"></div>
					<div class="col-lg-8 ">
						<div class="row ProductSort">
							<!-- 這裡有分類列表 ajax-->
							<!-- <div class="col-lg-6 ProductLove2"></div> -->
						</div>
					</div>
					<div class=""></div>
				</div>
				<div class="row ProductLove2" id="">
					<div class="col-lg-2"></div>
					<div class="col-lg-8 ">
						<br>
						<div class="row bal1 " style="cursor: pointer;">
							<div class="col-lg-11 l1"><img src="${pageContext.request.contextPath}/images/mainmenu.png" alt="SSS" style="height: 21px;"> Main Menu</div>
						</div>
						<hr style="color: #ff703E;opacity: 1;">
						<div class="row l2">
							<!-- 這裡有分類列表l2 ajax-->
						</div>
					</div>
					<div class=""></div>
				</div>
				<div class="row SupportLevel" id="">
					<div class="col-lg-2"></div>
					<div class="col-lg-8 ">
						<br>
						<div class="row" >
							<div class="col-lg-6"><a href="${pageContext.request.contextPath}/shop/FAQ.jsp">Q&A</a></div>
							<div class="col-lg-6"><a href="${pageContext.request.contextPath}/shop/message.jsp">Contact us</a></div>
						</div>
					</div>
					<div class=""></div>
				</div>

			</div>
		</body>
		<script>
			//判斷有無登入
			var name = "${sessionScope.user.firstname}";
			if (name == "") {

			} else {

				$(".login").empty();
				$(".login")
					.append(
						"<a href='${pageContext.request.contextPath}/user/userHome'>${sessionScope.user.firstname}</a>  &nbsp;<a href='${pageContext.request.contextPath}/Signout'>登出</a>");
			}
			//判斷在哪個分頁
			var urlPath = "${pageContext.request.servletPath}";
			if (urlPath == "/shop/shopSort.jsp" || urlPath == "/shop/product.jsp") {
				$(".menuProduct a").css("color", "white");
			}
			if (urlPath == "/shop/FAQ.jsp") {
				$(".FAQ a").css("color", "white");
			}
			if (urlPath == "/shop/message.jsp") {
				$(".message a").css("color", "white");
			}
			if (urlPath == "/signup.jsp") {
				$(".Signup").css("color", "white");
			}
			if (urlPath == "/login.jsp") {
				$(".log").css("color", "white");
			}
			$(".dropdown-menu  a").css("color", "black");


			// 分類列表
			$(".ProductType").hide();
			$(".ProductLove2").hide();
			$(".SupportLevel").hide();
			$(".bal1").click(function () {
				$(".ProductType").show();
				$(".ProductLove2").hide();
				$(".SupportLevel").hide();
			})
			$(".Support").click(function(){
				$(".SupportLevel").toggle();
				$(".ProductType").hide();
				$(".ProductLove2").hide();
			})




			$(".ProductList").on("click", function () {
				$(".ProductType").toggle();
				$(".ProductLove2").hide();
				$(".SupportLevel").hide();
				$.ajax({
					url: '${pageContext.request.contextPath}/shop/love1',//接受請求的Servlet地址
					type: 'POST',
					// async: false,
					success: function (json) {
						$(".ProductSort").empty();
						for (var love1 of json)
							$(".ProductSort").append('<div class="col-lg-4 love1">' +
								'<p type="button" class=""  onclick="love2(`' + love1 + '`)">' + love1 + '</p>');
					},
					error: function (returndata) {
					}
				});
			})
			function love2(love1) {
				$(".ProductLove2").toggle();
				$(".ProductType").hide();
				$(".l2").empty();
				$.ajax({
					url: '${pageContext.request.contextPath}/shop/love2',//接受請求的Servlet地址
					type: 'POST',
					async: false,//同步請求
					success: function (json) {						
						for (var bean of json) {
							if (bean.love1 == love1) {

								$(".l2").append('<div class="col-lg-3 love2">' +
									'<a	href="${pageContext.request.contextPath}/shopSort?ptype=' + bean.type + '&pag=1">' + bean.love2 + '</a><br></div>');
							}
						}
					},
					error: function (returndata) {
					}
				});
			}
			//搜索
			function searchProduct() {
				window.location.href = "${pageContext.request.contextPath}/searchProduct/" + $(".searchProduct").val();
			}

			$(".search").keydown(function(e){				
				if(e.keyCode== 13)window.location.href = "${pageContext.request.contextPath}/searchProduct/" + $(".searchProduct").val();
				
			})

		</script>

		</html>