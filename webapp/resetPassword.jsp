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
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
            <title>Document</title>
        </head>
        <style>
            /* div {
                border: 2px solid black;
            } */
            .tex {
                position: relative;
                left: 10%;
            }

            .main .grid-row span {
                color: blue;
            }

            .main .grid-row {
                top: 100px;

                right: 0%;
                left: 0%;
                margin: auto;
            }

            /* .main .grid-row a{
                color: blue;
            } */
        </style>

        <body>
            <!-- 中間部分 -->
            <div class="center">
                <canvas id="canvas"></canvas>

                <!-- 網頁中間內文 -->
                <div class="main">
                    <div class="grid-row" style="height: 500px; width: 700px;">
                        <div class="loginTitle">${param.email} :密碼重設</div>                       
                        <form action='/JETEC/resetPassword' method="post">
                            <input class="formCSS" type="hidden" placeholder='Email' name="email" value="${param.email}"
                                id="e">
                            <input class="formCSS pass" type="password" placeholder="密碼" name="password" value="${password}"
                                id="p">
                            <input class="formCSS verify" type="password" placeholder="密碼確認" name="verifypassword">
                            <span class="error verifypassword"></span>
                           
                            <span class="error">${errors.userpassword}</span>

                            <br> <span class="error checkerror">${errors.recaptcha}</span>
                            <br>
                            <input class="formSubmit" type="button" value="Login">

                        </form>


                    </div>
                </div>

            </div>
            <script>

                var x = [];
                var y = [];
                var d = [];//下落速度
                var size = [];
                var canvas = document.getElementById("canvas");
                var w = canvas.width = window.innerWidth;
                var h = canvas.height = window.innerHeight;
                var ctx = canvas.getContext("2d");


                for (var s = 0; s < 350; s++) {

                    x[s] = window.innerWidth * Math.random();
                    y[s] = window.innerHeight * Math.random();
                    d[s] = Math.random() * 3 + 1;
                    size[s] = Math.floor(Math.random() * 3 + 1);

                }
                setInterval(() => {
                    ctx.clearRect(0, 0, w, h);
                    for (var i = 0; i < 350; i++) {
                        if (i % 3 === 0) {
                            ctx.fillStyle = "#0063c7";
                        } else if (i % 3 === 2) {
                            ctx.fillStyle = "#33b5ac";
                        } else {
                            ctx.fillStyle = "#3340b5";
                        }
                        x[i] = x[i] + Math.random() * 3;
                        y[i] = y[i] + d[i];
                        ctx.fillRect(x[i], y[i], 3, 3);
                        if (y[i] > h) y[i] = 0;
                        if (x[i] > w) x[i] = 0;
                    }
                }, 100);
                // 密碼確認
                $(".verify").on("keyup", function () {
                    if ($(".verify").val() == $(".pass").val()) {
                        $(".verifypassword").html("密碼正確");
                        $(".verifypassword").css("color","blue");
                    } else {
                        $(".verifypassword").html("密碼確認錯誤"); 
                        $(".verifypassword").css("color","red");                       
                    }
                })
                $(".pass").on("keyup", function () {
                    if ($(".verify").val() == $(".pass").val()) {
                        $(".verifypassword").html("密碼正確");
                        $(".verifypassword").css("color","blue");
                    } else {
                        $(".verifypassword").html("密碼確認錯誤"); 
                        $(".verifypassword").css("color","red");                        
                    }
                })
                // 送出按鈕
                $(".formSubmit").click(function () {
                    // 密碼確認
                    if ($(".verify").val() == $(".pass").val() && $(".verify").val() != "") {
                        $("form").submit();
                    } else {
                        $(".verifypassword").html("密碼確認錯誤");
                    }
                })



            </script>

        </body>

        </html>