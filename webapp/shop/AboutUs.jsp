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
                /* border: 2px solid black; */
            }

            .rigthBox {
                padding-top: 7px;
                padding-bottom: 7px;
                background-color: #EDEDED;
                border: 1px solid #8E8E8E;
            }

            .rigthBox a {
                line-height: 2rem;
                color: #ff703e;
                text-decoration: none;
            }

            .AAA hr {
                color: #ff703e;
                opacity: 1;

            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="/shopTop.jsp"></jsp:include>

            <!-- 中間身體 -->
            <div class="container">
                <div class="row">

                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <br>
                        <div class="AAA">
                            <br><br>
                            <h1>About us</h1>
                            <hr>
                            <br><br>
                            <div class="row">
                                <div class="col-lg-7">
                                    <p style="width: 100%; word-wrap: break-word; word-break: normal;">Yotta Sense
                                        Technology was founded in 2010, organized by a group of professional technicians
                                        and experienced engineers. <br>
                                        R & D, production and provide customers with the best solutions are our core
                                        competitiveness. <br><br>

                                        In 2013, we introduced SYS series, which is high-quality and cost-effective; it
                                        combines carbon dioxide, relative humidity and temperature measurement. <br>
                                        We offer a wide range of products, including pressure transmitters, Digital LED
                                        Display, Humidity & Temperature data logger as well as non-contact temperature
                                        measurement.</p>
                                </div>
                                <div class="col-lg-5" style="text-align: center;">
                                    <div class="rigthBox"><span><a href="${pageContext.request.contextPath}/shop/message.jsp">Ask a Question ></a><br>Pre-sales
                                            ser/technical issues</span></div><br>
                                    <div class="rigthBox"><a href="mailto: sales@yotta-sense.com">Email us ></a><br>sales@yotta-sense.com</div><br>
                                    <div class="rigthBox"><a href="">Sell with us ></a><br>Commodity on the shelf
                                        negotiation <br> Marketing cross-industry cooperation</div>
                                </div>




                            </div>
                            <br><br><br><br><br>
                            <br><br><br><br><br>
                        </div>
                    </div>
                </div>


            </div>
            <!-- 插入腳 -->
            <jsp:include page="/shopBottom.jsp"></jsp:include>
        </body>

        </html>