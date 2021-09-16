<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Order Details</title>
        </head>
        <style>
            div {
                /* border: 2px solid black; */
                font-family: 'Kanit';
            }

            .re button {
                position: absolute;
                right: 0%;
                width: 10%;
                border: 0px solid #ff703E;
                color: white;
                background-color: #ff703E;
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <!-- 中間身體 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <br><br>
                        <div class="row">
                            <h1>Order Details</h1>
                            <hr style="opacity: 1;height: 2px;">
                            訂單編號 :${orderId}
                        </div>
                        <br>
                        <table class="table table-striped detailTable">
                            <tr>
                                <td>PRODUCT</td>
                                <td></td>
                                <td>Quantity</td>
                                <td>PRICE</td>
                            </tr>
                            <c:if test="${not empty orderDetail}">
                                <c:forEach varStatus="loop" begin="0" end="${orderDetail.size()-1}"
                                    items="${orderDetail}" var="s">
                                    <tr>
                                        <td style="position: relative;"><img
                                                src="${pageContext.request.contextPath}/images/product/${s.PicUrl} "
                                                style="height: 100px;" alt="">

                                        </td>
                                        <td>
                                            <div style="height: 40px;"></div> 
                                            <h5>${s.name}</h5> 
                                            <h6>${s.type ==  null?s.model:s.type}</h6> 
                                             ${s.product_option}
                                            <br>${s.product_option2}
                                            <br>${s.product_option3}
                                        </td>
                                        <td>
                                            <div style="height: 40px;"></div>${s.quantity}
                                        </td>
                                        <td>
                                            <div style="height: 40px;"></div>NT$${s.sellingprice}
                                        </td>
                                    </tr>

                                </c:forEach>
                            </c:if>
                        </table>

                        <br><br>
                        <div style="border :1px solid #cecece;background-color: #f4f4f4;">
                            <br>
                            <div class="row">                                
                                <div class="col-lg-8"></div>
                                <div class="col-lg-2">小記</div>
                                <div class="col-lg-2">US$ ${total}</div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8"></div>
                                <div class="col-lg-2">運費</div>
                                <div class="col-lg-2">US $400</div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-lg-8"></div>
                                <div class="col-lg-2">Grand total</div>
                                <div class="col-lg-2">US$ ${total+400}</div>
                            </div>
                            <br>
                        </div>
                        <br><br>
                        <div class="row re" style="position: relative;">
                            <button onclick="javaScript=window.location.href='${pageContext.request.contextPath}/user/userHome'">上一頁</button>
                        </div>
                        <br><br>
                    </div>

                </div>
            </div>
            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>
        </body>

        </html>