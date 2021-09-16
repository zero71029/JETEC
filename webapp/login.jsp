<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">


			<!-- bootstrap的CSS、JS樣式放這裡  -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">
			<!-- <%-- jQuery放這裡 --%> -->
			<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
			<!-- <%-- Header的CSS、JS樣式放這裡    --%> -->
			<!-- <%-- footer的CSS、JS樣式放這裡    --%> -->
			<!-- <%-- 主要的CSS、JS放在這裡--%> -->
			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
			<script src="https://apis.google.com/js/platform.js" async defer></script>
			<meta name="google-signin-client_id"
				content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">
			<!-- <script src="https://www.google.com/recaptcha/enterprise.js?render=6LeXNhobAAAAALNu0-Dr6ALnwTk8WLYsEsS8NNam"async defer></script> -->
			<script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>


			<title>Login</title>
		</head>
		<style>
			div {
				/* border: 2px solid black; */
			}

			.main {}


			.main .grid-row {
				/* border: 1px #aaa solid; */
				position: relative;
				margin: 0px auto 50px auto;
				background-color: white;

				border-radius: 5px;
			}



			/* â¿æµ·è²é£å±â¿ */
			.main .grid-row .loginTitle {
				font-size: 30px;
				margin: 40px auto 20px auto;
				text-align: center;
			}

			/* åæ¶ */
			.main .grid-row .loginReturn {
				position: absolute;
				background-color: #eb4034;
				border: 1px solid rgba(0, 0, 0, .3);
				width: 35px;
				height: 35px;
				right: -10px;
				top: -10px;
				border-radius: 50%;
				font-size: 1.3rem;
			}

			.main .grid-row .loginReturn:hover {
				background: tomato;
			}

			.main .grid-row form {
				position: relative;
			}

			.main .grid-row .formCSS {
				width: 75%;
				margin: 0 0 30px 10%;
				border-radius: 5px;
				line-height: 35px;
				height: 35px;
				text-indent: 0.5rem;
				border: 1px solid #ddd;
			}

			.main .grid-row .spanCSS {
				width: 75%;
				margin: 0 0 30px 10%;
				line-height: 35px;
				height: 35px;
				text-indent: 0.5rem;
				color: #000;
			}

			.main .grid-row .formSubmit {
				margin: 0 0 30px 10%;
				padding: 1px 25px;
				font-size: 18px;
				background: #ff703e;
				border: 1px solid #ff703e;
				border-radius: 5px;
				position: relative;
				display: block;
				color: white;
			}


			.main .grid-row a {
				display: inline-block;
				color: #ff703e;
				text-decoration: none;

			}

			.main .grid-row hr {
				display: inline-block;
				width: 45%;
				vertical-align: middle;
				margin: 20px auto;
				background: #666;
			}



			.main .grid-row .orblock {
				line-height: 40px;
				height: 40px;
				margin: 35px auto;
				width: 80%;
			}

			.g-recaptcha {
				width: 50%;
				margin: 0 auto;
				display: block;
				/* transform:scale(1.55); */
			}

			/* é¯èª¤è¨æ¯ */
			.main .grid-row .error {
				color: red;
			}

			.checkerror {
				display: block;
				margin: 0 auto;
				text-align: center;
			}

			.main .grid-row .forOtherLog {
				height: 60px;
				margin: 0 50px;
				display: inline-flex;
				justify-content: space-around;
			}

			/* googleç»å¥ */
			.g-signin2 {
				display: inline-block;
			}
			${
				errors==null ? null:".formCSS::placeholder{color: red;}"
			}
		</style>

		<body>
			<!-- 插入頭部 -->
			<jsp:include page="/shopTop.jsp"></jsp:include>
			<!-- 中間部分 -->
			<div class="center">

				<!-- 網頁中間內文 -->
				<div class="main">
					<div class="col-lg-4"></div>
					<div class="grid-row col-lg-4">
						<div class="loginTitle">Login</div>
						<!-- <button class="loginReturn" onclick=window.location.href="/OceanCatHouse">X</button> -->

						<form action="/JETEC/signup/login" method="POST">
							<span class="spanCSS">Email Address</span>
							<input class="formCSS" type="email" placeholder='${errors.email}' name="email"
								value="${email}" id="e">
							<span class="spanCSS">Password</span>
							<input class="formCSS" type="password" placeholder="${errors.userpassword}" name="password"
								value="${password}" id="p">
							<button type="button" id="autologin" style="width: 5px; height: 3px"></button>

							<div class="g-recaptcha" data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
								data-callback='verifyCallback' data-action='ubmit'>Submit</div>
							<span class="error checkerror">${errors.recaptcha}</span><br>
							<span class="spanCSS"><a href="${pageContext.request.contextPath}/forget.jsp">Forgot your
									password?</a></span><br><br>
							<input class="formSubmit" type="submit" value="Login">

						</form>

						<div class='orblock'>
							<hr>
							<span> 或是 </span>
							<hr>
						</div>
					</div>
				</div>

			</div>


			<!-- 插入腳 -->
			<jsp:include page="/shopBottom.jsp"></jsp:include>
		</body>
		<script>
			    // 一鍵登入
				$('#autologin').click(function (){
        $('#e').val("AAA@AAA.com");
        $('#p').val("AAA");
    })
		</script>

		</html>