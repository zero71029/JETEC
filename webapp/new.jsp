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

			<title>Document</title>
		</head>
		<style>
			div {
				border: 2px solid black;
			}
		</style>

		<body>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <!-- 中間身體 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2">xxx</div>
                    <div class="col-lg-8">xxx</div>
                </div>
            </div>
            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>
		</body>

		</html>