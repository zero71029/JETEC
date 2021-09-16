<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="zh-TW">

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

            <title>商城後台</title>
        </head>
        </head>
        <style>
            div {
                /* border: 2px solid black; */
            }

            body {
                /* background-color: #62A5A1; */
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

            #timeCenter {
                color: #ffffff;
                position: relative;
                top: 350px;
                margin: auto;
                width: 40px;
            }

            .accordion-item {
                text-align: center;
                background-color: #62A5A1;
                color: #0c4128;
            }

            .AAA {
                padding-left: 38%;
                text-align: center;
                background-color: #62A5A1;
                color: white;
            }

            .accordion-button {
                text-align: center;
            }

            .accordion-button:focus {
                text-align: center;
                background-color: #62A5A1;
                color: white;
            }

            .accordion-button:not(.collapsed) {
                text-align: center;
                background-color: #62A5A1;
                color: white;
            }

            .list-group-item {
                background-color: transparent;
                color: white;
            }

            .mainColor {
                background-color: #62A5A1;
            }

            .TTT:hover {
                background-color: #afe3d5;
            }

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
                height: 450px;
                z-index: 50;
                position: absolute;
                left: 0%;
                right: 0%;
                margin: auto;
                top: 150px;
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
        </style>

        <body>
            <!-- <%-- 彈窗--%> -->
            <div class="hazy"></div>
            <div class="cat">
                <button class="catReturn">X</button>
                <br>
                <div class="row">
                    <div class="input-group mb-3" style="width: 95%; padding-left: 50px;">
                        <input type="text" class="form-control" placeholder="ID or 名稱 or 貨號"
                            aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="selectProduct">搜索</button>
                    </div>
                </div>
            </div>
            <!-- <%-- 彈窗/////////////////////////////////////--%> -->




            <!-- <%-- 頁首--%> -->
            <header class="container-fluid mainColor headtop">
                <a href='${pageContext.request.contextPath}/backstage/shopBack.jsp' class='title'>商城後台</a>
            </header>
            <!-- <%-- 插入側邊欄--%> -->
            <jsp:include page="/backstage/Sidebar.jsp"></jsp:include>
            <!-- <%-- 中間主體--%> -->
            <div class="container-fluid">
                <div class="row justify-content-end">
                    <div class="col-md-10">
                        <!-- <%-- 抬頭按鈕--%> -->
                        <div class="row">
                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off"
                                    onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product/0'">
                                <label class="btn btn-outline-primary state1" for="btncheck1">新增商品</label>

                                <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                <label class="btn btn-outline-primary state2" for="btncheck2"
                                    onclick="sta()">搜索商品</label>

                                <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btncheck3"
                                    onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product?pag=1&state=2'">下架商品</label>
                            </div>
                        </div> <!-- <%-- 抬頭按鈕--%> -->
                        <!-- //中間表格 -->
                        <div class="row">
                            <table class="Table table-striped orderTable">
                                <tr>
                                    <td>商品編號</td>
                                    <td>名稱</td>
                                    <td>貨號</td>
                                    <td>庫存</td>
                                </tr>

                                <c:if test="${not empty productList}">
                                    <c:forEach varStatus="loop" begin="0" end="${productList.size()-1}"
                                        items="${productList}" var="s">
                                        <tr class="TTT"
                                            onclick="javascript:location.href='${pageContext.request.contextPath}/backstage/product/${s.id}'">
                                            <td class="col-lg-1">
                                                ${s.id}</td>
                                            <td class="col-lg-1 ">
                                                ${s.name}</td>
                                            <td class="col-lg-1 " style='color: black;'>
                                                ${s.model}</td>
                                            <td class="col-lg-1 " ${s.quantity>10 ? "style='color:
                                                black;'":"style='color: red;'"}>
                                                ${s.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </table>
                        </div><!-- //中間表格 -->
                    </div>
                </div>
            </div>

        </body>
        <script>
            // 關閉按紐
            $('.catReturn').click(function () {
                $(".hazy").css("visibility", "hidden");
                $(".cat").css("visibility", "hidden");
            });

            $("#selectProduct").on("click", function () {
                $(".form-control").val();
                window.location.href = "${pageContext.request.contextPath}/backstage/selectProduct/" + $(".form-control").val();
            })
            function sta() {
                $(".hazy").css("visibility", "visible");
                $(".cat").css("visibility", "visible");
            }
        </script>



        </html>