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
            <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"> -->
            <title>Document</title>
        </head>
        <style>
            .main {
                padding-top: 50px;
            }

            .main .grid-row {
                border: 1px #aaa solid;
                position: relative;
                margin: 0px auto 50px auto;
                background-color: white;
                height: 720px;
                width: 620px;
                border-radius: 5px;
            }

            #canvas {
                position: absolute;


            }

            /* ✿海貓食屋✿ */
            .main .grid-row .loginTitle {
                font-size: 30px;
                margin: 40px auto;
                text-align: center;
            }

            /* 取消 */
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
                width: 65%;
                margin: 0 0 0px 10%;
                border-radius: 5px;
                line-height: 35px;
                height: 35px;
                text-indent: 0.5rem;
                border: 1px solid #ddd;

            }
            .main .grid-row span {                
                margin: 0 0 -310px 10%;                

            }

            .main .grid-row a {
                display: inline-block;
                color: black;
                text-decoration: underline;
                margin-left: 50px;
            }

            .main .grid-row hr {
                display: inline-block;
                width: 45%;
                vertical-align: middle;
                margin: 20px auto;
                background: #666;

            }

            .main .grid-row span {
                line-height: 40px;
                color: #666;

            }

            .main .grid-row .orblock {
                line-height: 40px;
                height: 40px;
                margin: 35px auto;
                width: 80%;

            }

            .g-recaptcha {
                margin: 0 0 0px 10%;
                width: 50%;

            }

            /* 錯誤訊息 */
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
            .main .grid-row .formSubmit {
				margin: 0 0 0px 10%;
				padding: 1px 5px;
				font-size: 18px;
				background: #ff703e;
				border: 1px solid #ff703e;
				border-radius: 5px;
				position: relative;
				display: block;
				color: white;
                width: 100px;
			}
            .main .grid-row .formSubmit:hover {
                background: #ff703e;
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="/shopTop.jsp"></jsp:include>
            <canvas id="canvas"></canvas>
            <!-- 中間部分 -->
            <div class="center">
                <!-- 網頁中間內文 -->
                <div class="main">
                    <div class="grid-row" style='height:650px;'>
                        <div class="loginTitle">忘記密碼</div><br>
                        <p style='margin-left:70px;font-size:20px;line-height:30px;'>寄發密碼重設信</p>
                        <!-- <button class="loginReturn" onclick=window.location.href="/OceanCatHouse">X</button> -->

                        <form action="${pageContext.request.contextPath}/forget" method="POST">
                            <input style='height:45px;' class="formCSS" type="email" placeholder="Email" name="email"
                                value="${email}"><br>
                            <span class="error">${errors.email}</span><br><br>
                            <div class="g-recaptcha" data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                                data-callback='verifyCallback' data-action='ubmit'>google</div>
                            <span class="error">${errors.recaptcha}</span> <br>
                            <br><input class="formSubmit" type="submit"><br>
                        </form>
                        <br>
                        <a style='display:block;font-size:18px;text-align:center;margin:0;'
                            href="${pageContext.request.contextPath}/login.jsp"> 返回登入</a>
                    </div>
                </div>

                <!-- 右邊至頂 -->

            </div>

            <!-- 插入腳 -->
            <jsp:include page="/shopBottom.jsp"></jsp:include>

        </body>

        </html>