<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <!-- bootstrap的CSS、JS樣式放這裡  -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">


        </head>
        <style>
            div {
                /* border: black 1px solid; */
            }

            .floo a {
                color: #FFFFFF;
                text-decoration: none;
                font-size: 14pt;
                font-family: Microsoft JhengHei;
            }
        </style>

        <body>
            <div class="container-fluid" style="background-color: #554e4d;">
                <br>
                <div class="row floo" >
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5">
                        <div class="row" style="margin: 20px 0px;">
                            <div class="col-lg-5"><a href="${pageContext.request.contextPath}/shop.jsp">Home</a></div>
                            <div class="col-lg-5"><a href="${pageContext.request.contextPath}/shop/message.jsp">Contact
                                    us</a></div>
                        </div>

                        <div class="row" style="margin: 20px 0px;">
                            <div class="col-lg-5"><a href="${pageContext.request.contextPath}/shop/FAQ.jsp">Support</a>
                            </div>
                            <div class="col-lg-5"><a href="${pageContext.request.contextPath}/">Website Feedback</a>
                            </div>
                        </div>

                        <div class="row" style="margin: 20px 0px;">
                            <div class="col-lg-5"><a
                                    href="${pageContext.request.contextPath}/shop/AboutUs.jsp">About</a></div>
                            <div class="col-lg-5"><img src="${pageContext.request.contextPath}/images/PAYPAL.png"
                                    alt="PAYPAL" style="height :1.5rem"></div>
                        </div>

                        <div class="row" style="margin: 20px 0px;">
                            <div class="col-lg-5"><a href="${pageContext.request.contextPath}/">Sell with us</a></div>
                            <div class="col-lg-5"><a href=""></a></div>
                        </div>


                    </div>
                    <div class="col-lg-5" style="background-color: white;">
                        <div class="row" style="height: 2rem;">
                            <div class="col-lg-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-1"></div><span
                                style="font-size: 16pt;color: #2d2d2d; font-family: Microsoft JhengHei;">SUBSCRIBE</span>
                        </div><br>
                        <div class="row">
                            <div class="col-lg-1"></div><span
                                style="font-size: 12pt;color: #4c4c4c; font-family: Microsoft JhengHei;">Get moer
                                exclusive product news and special offers</span>
                        </div><br>
                        <div class="row">
                            <form action="" class="eee">
                                <div class="col-lg-1"></div>
                                <div class="input-group mb-3">
                                    <input type="email" class="form-control fff" placeholder="please enter email"
                                        aria-label="Recipient's username" aria-describedby="button-addon2" name="email">
                                    <button class="btn btn-outline-secondary mail" type="button" id="button-addon2"
                                        style="background-color: #ff703e;color: white;">Join</button>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                    
                </div>
                <br>
                <div class="row"
                    style="text-align: center; padding: 10px; background-color: #231f20; color:white;font-size: 12pt;">
                    <span>© 2021 YOTTA SENSE TECHNOLOGY</span>
                </div>
            </div>

        </body>

        <script>

            $(".mail").on("click", function () {

                var fff = $(".fff").val();
                var myreg = /^[^\[\]\(\)\\<>:;,@.]+[^\[\]\(\)\\<>:;,@]*@[a-z0-9A-Z]+(([.]?[a-z0-9A-Z]+)*[-]*)*[.]([a-z0-9A-Z]+[-]*)+$/g;
                console.log(fff.search(myreg));
                if (fff.search(myreg) != -1)
                 {
                    var fd = new FormData($(".eee")[0]); 
                    $.ajax({
                        url: "${pageContext.request.contextPath}/saveEmail",
                        type: 'POST',
                        data: fd,
                        async: false,//同步請求
                        cache: false,//不快取頁面
                        contentType: false,//當form以multipart/form-data方式上傳檔案時，需要設定為false
                        processData: false,//如果要傳送Dom樹資訊或其他不需要轉換的資訊，請設定為false

                        success: function (json) {
                            alert(json);
                        }
                    });
                }else{
                    alert('提示\n\n請輸入有效的E_mail！');
                }


            })
        </script>

        </html>