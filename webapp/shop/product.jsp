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

            <title>${product.model}</title>
        </head>

        </head>
        <style>
            div {
                /* border: 2px solid black; */
            }

            .bimg {
                width: 80%;
            }

            /* 數量按鈕 */
            .num {
                width: 50px;
                text-align: center;
                margin: -10px;
            }

            .leftButton {
                color: white;
                background-color: #474444;
                width: 33px;
            }

            .rightButton {
                color: white;
                background-color: #474444;
                width: 30px;
            }

            /* 至頂按鈕 */
            .toUP {

                position: fixed;
                /* display: none; */
                right: 5%;
                bottom: 50px;
                z-index: 100;
                border-radius: 100%;
            }

            .hyLink {
                height: 40px;
                cursor: pointer;

            }

            /* 動畫小點 */
            .sss {
                position: absolute;
                border-radius: 100%;
                width: 30px;
                text-align: center;
                background-color: #ff703E;
                z-index: 100;
                top: 0px;
                left: 0px;

            }



            /* 至頂按鈕/////////////////////// */
        </style>

        <body>
            <div class="sss">1</div>
            <!-- 右邊至頂 -->
            <div class="toUP">
                <img src="${pageContext.request.contextPath}/images/toUp.png" alt="toUp" class="fontIcon hyLink" id="toUp">
            </div>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <!-- 中間身體 -->
            <br>
            <div class="container">
                <!-- .. -->
                <div class="row"><span style="line-height: 100px; font-size: 1rem;">Producr &nbsp;&nbsp;>
                        &nbsp;&nbsp;${product.productTypeBean.love1}&nbsp;&nbsp;> &nbsp;&nbsp; <a
                            href="${pageContext.request.contextPath}/shopSort?ptype=${product.productTypeBean.type}&pag=1">${product.productTypeBean.love2}</a>
                        &nbsp;&nbsp;> &nbsp;&nbsp;${product.name}</span> </div>
                <div class="row">
                    <div class="col-lg-6"><img class="bimg"
                            src="${pageContext.request.contextPath}/images/product/${product.pictureurl}" alt=""></div>

                    <div class="col-lg-6">
                        <!--名稱  -->
                        <h1 style="color: #ff703E;">${product.name}</h1>
                        <h3>${product.model}</h3>
                        <!-- <h3 style="color: #474444;" class="US">US$ ${product.sellprice}</h3> -->
                        <hr>

                        <form id="myFormId"
                            action="${pageContext.request.contextPath}/cart/${product.productOptionBean[0].id}"
                            method="POST">
                            <input type="hidden" name="productid" value="${product.id}">
                            <input type="hidden" name="product_group" value="${group}">
                            <!-- <span>規格</span> -->
                            <div class="AAAgroud">
                            </div>
                            <span>Quantity</span>
                            <!--加入購物車  -->
                            <div style="position: relative;">

                                <button class="leftButton" type="button" onclick="leftButton()">-</button>
                                <input type="text" name="num" value="1" class="num" onchange="change()">
                                <button class="rightButton" type="button" onclick="rightButton()">+</button><br><br>
                                <button type="button" value="加入購物車" class="btn btn-primary btn-sm btnsss"
                                    onclick="SSS()"
                                    style="background-color: #ff703E ;border-color: #ff703E; width: 105px;">Add to cart
                                </button> &nbsp;&nbsp;&nbsp;<span
                                    class="productQuantity">庫存:${product.productOptionBean[0].product_quantity}</span>

                            </div>
                        </form>
                        <hr>
                        <!--  規格-->
                        <!-- 描述 -->
                        <span>${product.producttext}</span><br><br>
                        <ul>
                            <c:if test="${not empty product.psb}">
                                <c:forEach varStatus="loop" begin="0" end="${product.psb.size()-1}"
                                    items="${product.psb}" var="s">
                                    <li>${s.sptext}</li> <br>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <br>
                        <c:if test="${not empty product.pdfurl}">
                            <c:forEach varStatus="loop" begin="0" end="${product.pdfurl.size()-1}"
                                items="${product.pdfurl}" var="s">
                                <li><a href="${pageContext.request.contextPath}/PDF/${s.url}"
                                        target="_blank">${s.url}</a> &nbsp;&nbsp;&nbsp; </li> <br>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <hr>
                <!--加購商品  -->
                <!-- <div class="row">
            <p>加購商品</p>
          
            <div class="col-sm-6 col-md-6 col-lg-3 Product">
                <a href=" + '">
                    <figure><img src="${pageContext.request.contextPath}/images/index2013-2.gif" alt="">
                        <h2>XXXXXXXX</h2>
                    </figure>
                </a>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-6 " style="position: relative; text-align: center;">
                <a href=" + '"> 商品描述 </a>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-3 ">
                <form action="${pageContext.request.contextPath}/cat/${id}">
                    <button class="leftButton" type="button" onclick="leftButton()">-</button>
                    <input type="text" name="num" value="1" class="num">
                    <button class="rightButton" type="button" onclick="rightButton()">+</button>
                    <button type="submit" value="加入購物車" class="btn btn-outline-dark btn-lg bs">加入購物車
                    </button>
                </form>
            </div> 

        </div> -->


                ＿

            </div>
            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>

        </body>



        <script>
            // 加入購物車動化
            $(".sss").hide();
            var bleft = $(".btnsss").offset().left;
            var btop = $(".btnsss").offset().top;
            var a = ($(".cart").offset().left - bleft) / 10
            var b = ($(".cart").offset().top - btop) / 10
            $(".sss").offset({ top: btop, left: bleft });

            function SSS() {
                $(".sss").text($(".num").val());
                $(".sss").show();
                for (var i = 1; i < 12; i++)
                    setTimeout(function () {
                        $(".sss").offset({ top: btop, left: bleft });
                        btop += b;
                        bleft += a;
                    }, 60 * i)
                setTimeout(function () {
                    $("#myFormId").submit();
                    $(".sss").hide();
                }, 600)

            }
            var quantity = parseInt('${product.quantity}');
            // 數量按鈕
            function rightButton() {
                var i = $(".num").val();
                if (i >= quantity) {
                    i = quantity;
                } else {
                    i++;
                    $(".num").val(i);
                }
            }
            function leftButton() {
                var i = $(".num").val();
                if (i == 1) {
                    i = 1;
                } else {
                    i--;
                }
                $(".num").val(i);
            }

            function change() {
                var num = $(".num").val();

                if (isNaN(num)) {
                    alert('請輸入數字');
                    $(".num").val(1);
                }

                if (parseInt(num) >= quantity) {
                    alert('只剩' + quantity + '個');
                    $(".num").val(quantity);
                }

            }
            // 至頂按鈕
            $(function () {
                $('.toUP').click(function () {
                    $('html, body').stop().animate({
                        scrollTop: 0
                    }, 100)
                });
            });





            var priced = new Map();
            //規格
            var option;
            $.ajax({
                url: '${pageContext.request.contextPath}/shop/findOption/${product.id}',//接受請求的Servlet地址
                type: 'get',
                async: false,//同步請求
                dataType: "json",
                contentType: 'application/json; charset=UTF-8',
                success: function (json) {
                    option = json;
                    //添加群組
                    if (option[0].product_group != "1") {
                        var aset = new Set();
                        $(".AAAgroud").append('<label for="type1">${group}</label><br>' +
                            '<select name="product_option" id="type1" class="" aria-label="Default select example"' +
                            'style="width: 50%;">' +
                            '</select><br><br>');
                        //價格修改
                        $(".US").text("US$" + option[0].product_price);
                        //庫存修改
                        $(".productQuantity").text("庫存:" + option[0].product_quantity);
                        quantity = option[0].product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + option[0].id);
                    }
                    //添加群組2
                    if (option[0].product_group2 != null && option[0].product_group2 != "") {
                        var aset = new Set();
                        $(".AAAgroud").append('<label for="type2">${group2}</label><br>' +
                            '<select name="product_option2" id="type2" class="" aria-label="Default select example"' +
                            'style="width: 50%;">' +
                            '</select><br><br>');
                    } else {
                        $(".AAAgroud").append('<select  id="type2" value="" ></select>');
                        $("#type2").hide();
                    }
                    //添加群組3
                    if (option[0].product_group3 != null && option[0].product_group2 != "") {
                        var aset = new Set();
                        $(".AAAgroud").append('<label for="type3">${group3}</label><br>' +
                            '<select name="product_option2" id="type3" class="" aria-label="Default select example"' +
                            'style="width: 50%;">' +
                            '</select><br><br>');
                    } else {
                        $(".AAAgroud").append('<select  id="type3" value="" ></select>');
                        $("#type3").hide();
                    }
                    var op1 = new Set();
                    var op2 = new Set();
                    var op3 = new Set();
                    for (op of option) {
                        //過濾重複
                        op1.add(op.product_option);
                        op2.add(op.product_option2);
                        op3.add(op.product_option3);
                        priced.set(op.product_model, op.product_price);
                    }
                    for (op of op1) {
                        //添加子項
                        $("#type1").append('<option value="' + op + '">' + op + '</option>');
                    }
                    for (op of op2) {
                        //添加子項
                        $("#type2").append('<option value="' + op + '">' + op + '</option>');
                    }
                    for (op of op3) {
                        //添加子項
                        $("#type3").append('<option value="' + op + '">' + op + '</option>');
                    }
                },
                error: function (returndata) {
                    console.log("error");

                }

            });
            for (op of option) {
                console.log(op);
            }
            $("#type1").change(function () {
                console.log($("#type1").val() + "-" + $("#type2").val() + "-" + $("#type3").val());
                for (op of option) {
                    if (op.product_model == ($("#type1").val() + "-" + $("#type2").val() + "-" + $("#type3").val())) {

                        $(".btnsss").show();
                        //價格修改                        
                        $(".US").text("US$" + op.product_price);
                        console.log("US$" + op.product_price);
                        //庫存修改
                        $(".productQuantity").text("庫存:" + op.product_quantity);
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        break;

                    } else {
                        //價格修改
                        $(".US").text("缺貨");
                        //庫存修改
                        $(".productQuantity").text("庫存:0");
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        $(".btnsss").hide();
                    }
                }
            })
            $("#type2").change(function () {
                for (op of option) {
                    if (op.product_model == ($("#type1").val() + "-" + $("#type2").val() + "-" + $("#type3").val())) {
                        //價格修改
                        $(".US").text("US$" + op.product_price);
                        //庫存修改
                        $(".productQuantity").text("庫存:" + op.product_quantity);
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        $(".btnsss").show();
                        break;
                    } else {
                        //價格修改
                        $(".US").text("缺貨");
                        //庫存修改
                        $(".productQuantity").text("庫存:0");
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        $(".btnsss").hide();
                    }
                }
            })
            $("#type3").change(function () {
                for (op of option) {
                    if (op.product_model == ($("#type1").val() + "-" + $("#type2").val() + "-" + $("#type3").val())) {
                        //價格修改                        
                        $(".US").text("US$" + op.product_price);
                        //庫存修改
                        $(".productQuantity").text("庫存:" + op.product_quantity);
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        $(".btnsss").show();
                        break;
                    } else {
                        //價格修改
                        $(".US").text("缺貨");
                        //庫存修改
                        $(".productQuantity").text("庫存:0");
                        quantity = op.product_quantity;
                        //位址修改           
                        $("#myFormId").attr("action", "${pageContext.request.contextPath}/cart/" + op.id);
                        $(".btnsss").hide();
                    }
                }
            })



        </script>

        </html>