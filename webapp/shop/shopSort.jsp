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
            <title>Sort</title>
        </head>
        <style>
            div {
                /* border: black 1px solid; */
            }

            .barNav {
                position: absolute;
                top: 350px;
                width: 100px;
                height: 100vh;
                font-size: 35px;
                background-color: transparent;
                text-align: center;
                left: 5%;
            }

            .barNav ul {
                list-style: none;
                position: sticky;
                top: 200px;
                width: 50px;
                height: 50px;
                
                padding: 0;
                z-index: 130;
            }

            .barNav ul li {
                color: #E9C573;
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 50px;
                height: 50px;
                font-size: 40px;
                z-index: 1;
                cursor: pointer;
            }

            .barNav ul li:hover {
                color: #e3985f;
            }

            .main {
                /* margin: 7% 0; */
            }

            /* 商品 */
            .main .Product {
                padding: 0;
                margin: 20px 5px;

            }

            .main .Product a {
                text-decoration: none;
            }

            .main .Product hr {
                color: #5E5e5e;
            }


            .main .Product a img {
                /* border: black 1px solid; */
                height: 280px;
                width: 100%;
                margin: 5% auto 0 auto;
                display: block;
            }

            .main .Product a h2 {
                color: #5E5e5e;
                font-size: 12pt;
                text-align: center;
                font-family: Microsoft JhengHei;
                 color: #3a3a3a;
            }
            .main .Product a .us {

                 color: #3a3a3a;
            }


            .main .Product:hover {
                border: 5px ridge #E6E6E5;
            }

            .main .Product:hover a h2 {
                color: #ff703E;
                text-shadow: 1px 1px 2px #f0e38b;
            }
            .main .Product:hover a hr {
                color: #ff703E;
             
            }


            .pagination {
                position: absolute;
                left: 0%;
                right: 0%;
                margin: 10px auto;
                width: 230px;

            }

            .pagination {
                margin-bottom: 70px;
                position: relative;

            }

            .pagination a {
                color: #198754;
            }

            #canvas {
                position: fixed;
                z-index: -1;
            }

            #f1 {
                position: absolute;
                right: -20px;
                top: -10px;
                font-size: 16px;
                font-weight: 400;
                color: #222;
                border: 2px solid #eee;
                box-shadow: 0px 0px 2px #DDF5D5;
                border-radius: 15px;
                width: 25px;
                height: 25px;
                line-height: 20px;
                background: tomato;
            }

            hr {
                color: #000;
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
        </style>


        <title>商城</title>
        </head>

        <body>
            <!-- 動態背景 -->
            <canvas id="canvas"></canvas>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <!-- 網頁中間內文 -->
            <div class="container">
                <div class="row"><span style="line-height: 100px; font-size: 1rem;">Producr &nbsp;&nbsp;>
                        &nbsp;&nbsp;${maxPage[0].productTypeBean.love1}&nbsp;&nbsp;>
                        &nbsp;&nbsp;${maxPage[0].productTypeBean.love2}</span> </div>

                <!-- 中間部分 -->
                <div class="row">
                    <div class="main col-lg-12">
                        <div class="row AAA ">
                            <!-- 顯示商品 -->
                            <c:if test="${not empty maxPage}">
                                <c:forEach varStatus="loop" begin="0" end="${maxPage.size()-1}" items="${maxPage}"
                                    var="s">
                                    <div class="col-lg-3 col-sm-6 col-md-6">
                                        <div class="  Product">
                                            <a href="${pageContext.request.contextPath}/product/${s.model}">
                                                <img src="${pageContext.request.contextPath}/images/product/${s.pictureurl}"
                                                    alt=""><br>
                                                <h2>${s.name}</h2>
                                                <h2>${s.model}</h2>
                                                <!-- <hr> -->
                                                <!-- <h2 class="us"> US&nbsp;$${s.productOptionBean[0].product_price}</h2> -->
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${ empty maxPage}">
                                <div class="col-lg-3 col-sm-6 col-md-6">
                                    <div class="  Product">
                                        <a href="${pageContext.request.contextPath}/shop.jsp">沒有商品</a>

                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container-fluid">
                <!-- 右邊至頂 -->
                <div class="toUP">
                    <img src="${pageContext.request.contextPath}/images/toUp.png" alt="toUp" class="fontIcon hyLink" id="toUp">
                    
                </div>
            </div>
            <!-- 分頁表 -->
            <c:if test="${TotalPages >1}">
                <div class="row">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link"
                                    href='${pageContext.request.contextPath}/shopSort?ptype=${param.ptype}&pag=${param.pag==1?1:param.pag-1}'
                                    aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <script>
                    
                </script>

            </c:if>
            <!-- <%--        //最多頁數--%> -->




            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>
        </body>
        <script>
            $(document).ready(function () {
                var TotalPages = ${ TotalPages };
                var url = new URL(location.href);
                // 分頁列表
                for (var i = 1; i <= TotalPages; i++) {
                    $(".pagination").append('<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/shopSort?ptype=' + url.searchParams.get('ptype') + '&pag=' + i + '">' + i + '</a></li>');
                }
                $(".pagination").append('<li class="page-item"> <a class="page-link" href="${pageContext.request.contextPath}/shopSort?ptype=${param.ptype}&pag=${param.pag==TotalPages?TotalPages:param.pag+1}" aria-label="Next">  <span aria-hidden="true">&raquo;</span></a></li>');

            });
            $(function () {
                $('.toUP').click(function () {
                    $('html, body').stop().animate({
                        scrollTop: 0
                    }, 100)
                });
                // $(window).scroll(function () {
                //     if ($(document).scrollTop() >= 450) {
                //         $('.toUP').fadeIn(300);
                //     }

                //     if ($(document).scrollTop() < 450) {
                //         $('.toUP').fadeOut(300);
                //     }
                // });
            });
        </script>

        </html>