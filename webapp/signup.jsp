<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<link rel="preconnect" href="https://fonts.gstatic.com">
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">


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
			<script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
			<script src="https://apis.google.com/js/platform.js" async defer></script>
			<meta name="google-signin-client_id"
				content="849367464998-0c4najofsqmh3rteejq2dc3va9iqdps2.apps.googleusercontent.com">
			<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"> -->
			<title>Register</title>
		</head>
		<style>
			div {
				/* border: 2px solid black; */
			}

			/*  */
			.main {
				padding-top: 50px;
			}

			.main .grid-row {

				position: relative;
				background-color: white;
				border-radius: 5px;
			}

			.main .grid-row .loginTitle {
				font-size: 30px;
				margin: 0 auto 0 auto;
				text-align: center;
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

			.main .grid-row span {
				width: 75%;
				margin: 0 0 30px 10%;
				line-height: 35px;
				height: 35px;
				text-indent: 0.5rem;
				color: #000;
			}


			.main .grid-row .formSubmit {
				margin: 0 0 30px 10%;
				padding: 3px 25px;
				font-size: 18px;
				background: #ff703e;
				border: 1px solid #ff703e;
				border-radius: 5px;
				position: relative;
				display: block;
				color: white;

			}

			/*  */
			.verifyBox {
				position: absolute;
				right: 0%;
				left: 0%;
				text-align: center;
			}

			.verifyBox span {
				background-color: #D3D3D3;
				padding: 10px 100px 10px 100px;
			}

			.g-recaptcha {
				margin: 0 0 30px 10%;
				/* width: 50%;
				margin: 0px auto;
				display: block; */
			}

			.PrivacyPolicy a {
				color: #ff703e;
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
				<!-- <canvas id="canvas"></canvas> -->
				<!-- 網頁中間內文 -->
				<div class="main row">
					<div class="col-lg-4"></div>
					<div class="grid-row col-lg-4">
						<div class="loginTitle">Create accout</div>
						<!-- <button class="loginReturn" onclick=window.location.href="/OceanCatHouse">X</button> -->
						<br><br>
						<form action="${pageContext.request.contextPath}/signup/signup" method="POST" class="accout">
							<div><span>Email Address</span><span style="color: red; ">${errors.emails}</span>
								<input class="formCSS" type="email" placeholder="${errors.email}" name="email"
									value="${email}">
							</div>
							<span>First name</span>
							<input class="formCSS" type="text" placeholder='${errors.firstname}' name="firstname"
								value="${userfirstname}">
							<br>
							<span>Last name</span>
							<input class="formCSS" type="text" placeholder='${errors.lastname}' name="lastname"
								value="${userlastname}">


							<span>Company name(optional)</span>
							<input class="formCSS" type="text" placeholder="" name="company" value="${company}">
							<span>phone</span>
							<input class="formCSS" type="text" placeholder="${errors.userphone}" name="phone"
								value="${userphone}">

							<span>Password</span>
							<input class="formCSS pass" type="password" placeholder="${errors.userpassword}"
								name="password" value="${userpassword}">
							<span>Password Confirmation</span><span class="verifypassword"></span>
							<input class="formCSS verify" type="password" placeholder="" name="verifypassword">
							<br>
							<span style="color: red; ">${errors.recaptcha}</span>
							<div class="g-recaptcha" data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
								data-callback='verifyCallback' data-action='submit'>Submit
							</div><br>

							<span class="PrivacyPolicy">
								<input type="checkbox" value="1" name="signBox" class="signBox"> &nbsp;&nbsp;&nbsp;Yes,I
								read the <a href="">Privacy Policy </a> and explicity agree <br><span
									class="readPrivacy" style="color: red;"></span><br><br>
							</span>

							<input class="formSubmit" type="button" value='Submit'><br>
						</form>

					</div>
				</div>


			</div>

			<script src="${pageContext.request.contextPath}/js/recaptcha.js"></script>
			<script src="${pageContext.request.contextPath}/js/oauth.js"></script>
			<script>
				// 密碼確認
				$(".verify").on("keyup", function () {
					if ($(".verify").val() == $(".pass").val()) {
						$(".verifypassword").html("密碼確認正確");
						$(".verifypassword").css("color", "blue");
					} else {
						$(".verifypassword").html("密碼確認錯誤");
						$(".verifypassword").css("color", "red");
					}
				})
				$(".pass").on("keyup", function () {
					if ($(".verify").val() == $(".pass").val()) {
						$(".verifypassword").html("密碼確認正確");
						$(".verifypassword").css("color", "blue");
					} else {
						$(".verifypassword").html("密碼確認錯誤");
						$(".verifypassword").css("color", "red");
					}
				})
				// 送出按鈕
				$(".formSubmit").click(function () {
					if ($(".signBox").prop("checked")) {
						console.log($(".signBox").prop("checked"));
						// 密碼確認
						if ($(".verify").val() == $(".pass").val()) {
							$(".accout").submit();
						} else {
							$(".verifypassword").html("密碼確認錯誤");
						}
					} else {
						$(".readPrivacy").html("須要閱讀 Privacy Policy");
					}
				})

			</script>
			<!-- 插入腳 -->
			<jsp:include page="/shopBottom.jsp"></jsp:include>


		</body>

		</html>