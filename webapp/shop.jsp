<%@ page contentType="text/html;charset=UTF-8" language="java"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- <%-- 主要的CSS、JS放在這裡--%> -->

<title>YOTTA SENSE</title>
</head>
    <style>
        div {
            /* border: black 1px solid; */
        }
        .main {
            width: 100%;
            overflow: hidden;
        }
        .main .Product {
            margin: 20px 0px 20px 0px;
            position: relative;
            left: -2%;            
        }

        .main .Product a img {      
            width: 105%;
        } 

    </style>
</head>

<body>

    <!-- 插入頭部 -->
    <jsp:include page="/shopTop.jsp"></jsp:include>
    <!-- 網頁中間內文 -->
    <div class="container-fluid main">
        <!-- 中間部分 -->
        <!-- 分類按鈕 -->
        <div class="row Product">
            <a href="${pageContext.request.contextPath}/searchProduct/FS"><img src="${pageContext.request.contextPath}/images/Manifold BAnner.jpg" alt=""></a>
        </div>
        <!-- <div class="row Product">
            <a href="/JETEC/shopSort"><img src="${pageContext.request.contextPath}/images/banner_2.png" alt=""></a>
        </div>
        <div class="row Product">
            <a href="/JETEC/shopSort"><img src="${pageContext.request.contextPath}/images/banner_3.png" alt=""></a>
        </div> -->


    </div>

    

    <!-- 插入腳 -->
    <jsp:include page="/shopBottom.jsp"></jsp:include>


</body>

</html>