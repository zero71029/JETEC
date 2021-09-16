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
            <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"> -->
            <title>Document</title>
        </head>
        <style>
           div {
                /* border: 2px solid black; */
            }


            .tex {
                position: relative;
                left: 10%;
            }
            .main {
                padding-top: 50px;
                text-align: center;
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

            .main .grid-row a {
                color: #ff703E;;
            }

            .main .grid-row {
                top: 100px;

                right: 0%;
                left: 0%;
                margin: auto;
            }
            .tex {
                position: relative;
                left: 10%;
            }

            .main .grid-row {
                top: 100px;

                right: 0%;
                left: 0%;
                margin: auto;
            }

        </style>

        <body>
            <!-- 中間部分 -->
            <div class="center">          

                <!-- 網頁中間內文 -->
                <div class="main">
                    <div class="grid-row" style="height: 500px; width: 700px;">
                        <div class="loginTitle"><img src="${pageContext.request.contextPath}/images/review.png" alt="" style="height: 170px;"></div>
                        <div class="loginTitle">Thank you for your order</div><br><br>

                        <div>訂單邊號 : ${id}</div><br>
                        <div >系統收到你付款狀態後立即會幫你處理<br>
                            你可以至 <a href="${pageContext.request.contextPath}/user/userHome">會員中心</a>查看狀態 <br> <br>
                            或返回<a href="${pageContext.request.contextPath}/">首頁</a> </div>
                    </div>
                </div>

            </div>
       

        </body>

        </html>