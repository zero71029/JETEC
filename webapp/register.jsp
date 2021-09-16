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

            .center {
                background: linear-gradient(to bottom, #88c8eb, white);
                background: -webkit-gradient(​linear, to bottom, #88c8eb, white);
            }

            .tex {
                position: relative;
                left: 10%;
            }

            #canvas {
                position: absolute;
            }

            .main {
                padding-top: 50px;
            }

            .main .grid-row {
                border: 1px solid black;
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
                    <div class="grid-row" style="height: 300px; width: 700px;">
                        <br>
                        <div class="loginTitle">註冊成功</div><br>

                        <div class="tex">很高興加入我們,請確認您的電子郵件</div><br>
                        <div class="tex">我們已寄送一封電子郵件給 <span> ${email} </span> ,內含電子郵件確認按鈕</div><br>
                        <div class="tex">您有收到電子郵件?如果沒有,請檢查垃圾郵件</div>
                    </div>
                </div>

            </div>
            <script>
                // 紀錄從哪裡來到登錄頁面
                // var come = document.referrer;
                // 一鍵登入
                $('#autologin').click(function () {
                    $('#e').val("AAA@AAA.com");
                    $('#p').val("AAA");
                })
                $(".phone").click(function () {
                    window.location.href = "/OceanCatHouse/views/phoneLogin";
                });
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
            </script>

        </body>

        </html>