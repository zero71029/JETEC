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

            <title>shopCart</title>
        </head>
        </head>
        <style>  
            div {
                /* border: 2px solid black; */
            }

            .shopCart {
                text-align: center;
            }
            .textCenter{
                text-align: center;
            }

            /* 數量按鈕 */
            .num {
                width: 50px;
                text-align: center;
                margin: -10px;
            }

            .leftButton {
                color: white;
                width: 33px;
                background-color: #666666;
            }

            .rightButton {
                color: white;
                width: 33px;
                background-color: #666666;
            }

            .cart {
                visibility: hidden;
            }
            /* 繼續購物 按鈕*/
            .continue {
                color: #ff703E;
                background-color: white;
                border: 1px #ff703E solid;
            }
            /*Check Out  按鈕*/
            .catSubmit{
                color: white;
                background-color: #ff703E;
                border: 1px #ff703E solid;
            }
            /* 商品名稱 */
            .con a{
                text-decoration: none;
                color: #474747;
            }
            /* 垃圾桶 */
            .garbage{
                width: 25px;
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <div class="container-fluid">

                <br>
                <!--  -->
               
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                            <h1 style="color:#231f20; font-weight:bold;">shopping cart</h1>
                            <hr style="color: #ff703E; opacity: 1;"><br>
                        </div>
                    </div>
                    <div class="row" style="color: #939393;"> 
                        <div class="col-lg-1"></div>
                        <div class="col-lg-2">PRODUCT</div>
                        <div class="col-lg-3"></div>
                        <div class="col-lg-3 textCenter">Quantity</div>
                        <div class="col-lg-1 textCenter">PRICE</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10"><hr></div>                   
                </div>


            </div>
            <c:forEach varStatus="loop" begin="0" end="${productList.size()-1}" items="${productList}" var="p">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2"><img src="${pageContext.request.contextPath}/images/product/${p.pictureurl}"
                            alt="" width="90%">
                    </div>
                    <div class="col-lg-3" style="position: relative;">
                        <div style="height: 10%;"></div>
                        <div class="con">
                            <h4><a href="${pageContext.request.contextPath}/product/${p.model}">${p.name}</a></h4>
                            <h4><a href="${pageContext.request.contextPath}/product/${p.model}">${p.model}</a></h4>
                            <p>${p.product_group == "1" ?null:p.product_group} ${p.product_option }</p>
                            <p>${p.product_group2} ${p.product_option2}</p>
                            <p>${p.product_group3} ${p.product_option3}</p>
                            <!-- <span>${p.specification}</span> -->
                        </div>
                    </div>
                    <div class="col-lg-3" style="position: relative;">
                        <div style="height: 10%;"></div>
                        <div class="con textCenter">
                            <button class="leftButton" type="button" onclick="cutCart(${p.id})">-</button>
                            <input type="text" name="num${p.id}" value="${p.num}" class="num num${p.id}"
                                onchange='change(${p.id})'>
                            <button class="rightButton" type="button" onclick="addCart(${p.id})">+</button>

                        </div>
                    </div>
                    <div class="col-lg-1 textCenter" style="position: relative;">
                        <div style="height: 10%;"></div>
                        <div class="con " id="total${p.id}" style="color: #474747;">US$${p.sellprice}</div>
                    </div>
                    <div class="col-lg-1" style="position: relative;">
                        <div style="height: 10%;"></div>
                        <div class="con"><a href="/JETEC/delCart/${p.id}"><img class="garbage" src="${pageContext.request.contextPath}/images/garbage.png" alt=""></a></div>
                    </div>
                </div>
            </c:forEach>

            <br>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-1 " ><button class="continue" >＜ 繼續購物</button></div>
                <div class="col-lg-7"></div>
                <div class="col-lg-1" style="position: relative;">
                    <div class="PPP">總價:</div>
                </div>
                <div class="col-lg-1" style="position: relative;"><button class="catSubmit">Check Out ＞</button></div>
            </div>
            <br><br>

            </div>
            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>
        </body>
        <script>
            var sell = [];//紀錄物品售價
            //要求購物車資料
            var CatProduct;
            var cartnum;//商品數量
            //要求購物車資料        
            $.ajax({
                url: "/JETEC/catData",
                type: "get",
                async: false,
                // dataType: "json",
                success: function (json) {
                    CatProduct = json;

                    var m = 0;
                    for (var k of CatProduct) {
                        //總價
                        console.log(k);
                        sell[k.id] = k.sellprice;
                        m += k['num'] * k['sellprice'];
                        //單項合計
                        $("#total" + k.id).text("US $"+k.sellprice * k.num);

                    }
                    $(".PPP").text("Total: US $" + m);
                },
                error: function (json) {
                    console.log("err " + json);
                }
            })


            //Checkout
            $(".catSubmit").click(function () {
                window.location.href = "${pageContext.request.contextPath}/checkout";
            })

            //購物車數量
            // 增加數量
            function addCart(id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/addCart/" + id,
                    type: "post",
                    contentType: "application/json",
                    dataType: "json",
                    success: function (json) {                      
                        //總價
                        var m = 0;
                        for (var k in json) {
                            m += json[k] * sell[k];
                        }
                        $(".PPP").text("Total: US $" + m);
                        $("#total" + id).text("US $ " + json[id] * sell[id]);//計算合計                     
                        $(".num" + id).val(json[id]);
                    },
                    error: function (json) {
                        console.log("addCat*****err " + json);
                    }
                })

            }
            // 減少數量
            function cutCart(id) {
                var i = $(".num" + id).val();
                if (i == 1) {
                    i = 1;
                    CatProduct[id] = 1;
                } else {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/cutCart/" + id,
                        type: "post",
                        contentType: "application/json",
                        dataType: "json",
                        success: function (json) {
                            //總價
                            var m = 0;
                            for (var k in json) {
                                m += json[k] * sell[k];
                            }
                            $(".PPP").text("Total: US $" + m);
                            $("#total" + id).text("US $ " + json[id] * sell[id]);//計算合計
                        },
                        error: function (json) {
                            console.log("cutCat*****err " + json);
                        }
                    });
                    i--;
                }
                $(".num" + id).val(i);
            }
            //手動修改數量
            function change(id) {
                var num = parseInt($(".num" + id).val());
                if (isNaN(num)) {
                    alert('請輸入數字');
                    window.location.href = "${pageContext.request.contextPath}/shopCart";
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/changeCart/" + id,
                    type: "post",
                    contentType: "application/json",
                    dataType: "json",
                    data: JSON.stringify(num),
                    success: function (json) {
                        console.log(json);
                        //總價
                        var m = 0;
                        for (var k in json) {
                            m += json[k] * sell[k];
                        }
                        $(".PPP").text("Total: US$" + m);
                        $("#total" + id).text("US$ " + json[id] * sell[id]);//計算合計
                        $(".num" + id).val(json[id]);
                    },
                    error: function (json) {
                        console.log("cutCat*****err " + json);
                    }
                });
            }
        </script>




        </html>