<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="zh-TW">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>訂單管理</title>
            <!-- bootstrap的CSS、JS樣式放這裡  -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.rtl.min.css">
            <!-- <%-- jQuery放這裡 --%> -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
            <!-- <%-- Header的CSS、JS樣式放這裡    --%> -->
            <!-- <%-- footer的CSS、JS樣式放這裡    --%> -->
            <!-- <%-- 主要的CSS、JS放在這裡--%> -->
            <style>
                .table {
                    position: relative;
                    width: 95%;
                    left: 20px;
                    top: 10px;
                }

                .mainColor {
                    background-color: #62A5A1;
                }


                .headtop {
                    height: 80px;
                    position: sticky;
                    top: 0px;
                    z-index: 5;
                }

                .navfix {
                    position: fixed;
                    top: 80px;
                    height: 100vh;
                }

                .navfix li {
                    border: none;
                    cursor: pointer;
                }

                .navfix li:hover {
                    background-color: #afe3d5;
                    color: #0c4128;
                }

                .list-group-item {
                    background-color: transparent;
                    color: white;
                }

                .TTT:hover {
                    background-color: #afe3d5;
                }

                /* 彈窗 */
                .hazy {
                    visibility: hidden;
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 40;

                }

                .cat {
                    border: blue 1px solid;
                    background-color: white;
                    width: 830px;
                    height: 850px;
                    z-index: 50;
                    position: absolute;
                    left: 0%;
                    right: 0%;
                    margin: auto;
                    top: 50px;
                    border-radius: 15px;
                    visibility: hidden;

                }

                .cat p {
                    position: relative;
                    text-align: right;
                    right: 100px;
                }

                .cat form {
                    top: 10px;
                    position: relative;
                    left: 20px;
                }

                .cat input {
                    width: 95%;
                }

                .cat select {
                    width: 95%;
                }

                /* 購物車返回 */
                .catReturn {
                    top: -10px;
                    right: -10px;
                    position: absolute;
                    background-color: red;
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    z-index: 20;
                }

                .pciSubmit {
                    width: 95%;
                }

                /* 彈窗 ///////////////////////結束*/
            </style>
        </head>

        <body>


            <!-- <%-- // 訂單細節 彈窗///////////////////////////////////////////////////////////////////////////////////////////////--%> -->
            <div class="hazy"></div>
            <div class="cat">
                <button class="catReturn">X</button>
                <div class="row">
                    <table class="table table-striped detailTable">
                        <tr>
                            <td>訂單編號</td>
                            <td>商品名稱</td>
                            <td>數量</td>
                            <td>售價</td>
                        </tr>

                    </table>
                </div>
                <hr>
                <span class="address">地址</span><br>
                <span class="phone">電話</span><br>
                <span class="name">名稱</span><br><br>
                <span class="message">備註</span><br>

                <p>小記:1000</p><br>
                <form action="${pageContext.request.contextPath}/backstage/state" class="form" method="post">
                    <select class="form-select" aria-label="Default select example" id="orderStatus" name="orderStatus">
                        <option value="1">1 新訂單</option>
                        <option value="2">2 包裝完成</option>
                        <option value="3">3 出貨</option>
                        <option value="4">4 完成</option>
                    </select><br>
                    <button type="submit" class="btn btn-primary pciSubmit ">完成</button>
                </form>
            </div>
            <!-- <%-- // 訂單細節結束///////////////////////////////////////////////////////////////////////////////////////////////--%> -->
            <!-- <%-- 頁首--%> -->
            <header class="container-fluid mainColor headtop">
                <a href='${pageContext.request.contextPath}/backstage/shopBack.jsp' class='title'>商城後台</a>
                <!-- <%-- <button class="userIcon"></button>--%> -->
            </header>


            <!-- <%-- 插入側邊欄--%> -->
            <jsp:include page="/backstage/Sidebar.jsp"></jsp:include>
            <!-- <%-- 中間主體////////////////////////////////////////////////////////////////////////////////////////////////////--%> -->
            <div class="container-fluid">
                <div class="row justify-content-end">
                    <div class="col-md-10">
                        <!-- <%-- 抬頭按鈕--%> -->
                        <div class="row">
                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off"
                                    onclick="sta(1)">
                                <label class="btn btn-outline-primary state1" for="btncheck1">新訂單</label>

                                <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                <label class="btn btn-outline-primary state2" for="btncheck2"
                                    onclick="sta(2)">已包裝</label>

                                <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btncheck3" onclick="sta(3)">歷史訂單</label>
                            </div>
                        </div>












                        <!-- 搜索 -->

                        <div class="col-lg-3">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control selectOrder" placeholder="訂單編號"
                                    aria-label="Recipient's username" aria-describedby="button-addon2">
                                <button class="btn btn-outline-secondary" type="button" id="button-addon2">搜索</button>
                            </div>
                        </div>
                        <!-- 搜索 結束-->




                        <!-- //中間表格 -->
                        <div class="row">
                            <table class="Table table-striped orderTable">
                                <tr>
                                    <td>訂單編號</td>
                                    <td>顧客(ID)</td>
                                    <td>日期</td>
                                    <td>狀態</td>
                                </tr>

                                <c:if test="${not empty orderList}">

                                    <c:forEach varStatus="loop" begin="0" end="${orderList.size()-1}"
                                        items="${orderList}" var="s">
                                        <tr class="TTT"
                                            onclick="Detailed(${s.orderid},'${s.company} ${s.address} ${s.postalcode}   ${s.country}','${s.firstname} ${s.lastname}','${s.phone}','${s.message}')">
                                            <td class="col-lg-1">
                                                ${s.orderid}</td>
                                            <td class="col-lg-1 ">
                                                ${s.firstname} ${s.lastname}(${s.userid})</td>
                                            <td class="col-lg-1 ">
                                                ${s.createdate}</td>
                                            <td class="col-lg-1 ">
                                                ${s.orderStatusBean.content}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                        </div>

                        <div class="row">

                            <%-- 底層--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <%-- 中間主體結束////////////////////////////////////////////////////////////////////////////////////////////////////--%> -->

            <script>
                //取得列表


                function doError(json) {
                    console.log("error ajax");
                }

                // 訂單細節
                function Detailed(id, address, name, phone, message) {
                    $(".detailTTT").remove();
                    $(".hazy").css("visibility", "visible");
                    $(".cat").css("visibility", "visible");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/backstage/orderDetail/" + id,
                        type: "get",
                        success: function (J) {
                            console.log(J);
                            var sell = 0;
                            for (var A of J) {
                                sell += A.Unit * A.SellingPrice;
                                $(".detailTable").append('<tr class="detailTTT" ">' +
                                    '<td class="col-lg-1">' + A.orderId + '</td>' +
                                    '<td class="col-lg-2 ">' + A.productname + ' <br><br> ' + A.product_type + '</td>' +
                                    '<td class="col-lg-1 ">' + A.Unit + '</td>' +
                                    '<td class="col-lg-1 ">' + A.SellingPrice + '</td>' +
                                    '</tr>');
                                $("p").text("總價 : " + sell);
                                $(".address").text("地址 : " + address);
                                $(".phone").text("電話 : " + phone);
                                $(".name").text("顧客 : " + name);
                                $(".message").text("備註 : " + message);
                                $(".form").attr("action", "${pageContext.request.contextPath}/backstage/state/" + A.orderId);

                            }
                        },
                        error: doError
                    });
                }

                $(document).ready(function () {
                    $(".package").click(function () {
                        console.log("package");
                    })
                    // 關閉按紐
                    $('.catReturn').click(function () {
                        $(".hazy").css("visibility", "hidden");
                        $(".cat").css("visibility", "hidden");
                    });
                });

                function sta(state) {
                    window.location.href = "${pageContext.request.contextPath}/backstage/selectOrder?pag=1&state=" + state;
                }




                $("#button-addon2").on("click", function () {
                    if ($(".selectOrder").val() != "")
                        window.location.href = "${pageContext.request.contextPath}/backstage/findOrder/" + $(".selectOrder").val();
                })

            </script>
        </body>

        </html>