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

                /* 彈窗 ///////////////////////*/
            </style>
        </head>

        <body>
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
                        <!-- <%-- 抬頭--%> -->
                        <div class="row">
                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off"
                                    onclick="sta(1)">
                                <label class="btn btn-outline-primary state1" for="btncheck1">新增員工</label>

                                <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                <label class="btn btn-outline-primary state2" for="btncheck2"
                                    onclick="sta(2)">XXX</label>

                                <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btncheck3" onclick="sta(3)">XXX</label>
                            </div>
                        </div>
                        <!-- //中間表格 -->
                        <div class="row">
                            <table class="Table table-striped orderTable">
                                <tr>
                                    <td>員工編號</td>
                                    <td>名稱</td>
                                    <td>電話</td>
                                    <td>狀態</td>
                                </tr>
                                <c:if test="${not empty admin}">

                                    <c:forEach varStatus="loop" begin="0" end="${admin.size()-1}" items="${admin}"
                                        var="s">
                                        <tr class="TTT" onclick="Detailed(${s.id})">
                                            <td class="col-lg-1">
                                                ${s.id}</td>
                                            <td class="col-lg-1 ">
                                                ${s.name}</td>
                                            <td class="col-lg-1 ">
                                                ${s.phone}</td>
                                            <td class="col-lg-1 ">
                                                ${s.state}</td>
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
                $(".hazy").hide();
                $(".cat").hide();
                function doError(json) {
                    console.log("error ajax");
                }
                function sta(state) {
                    window.location.href="${pageContext.request.contextPath}/backstage/admin/0";
                }
                function Detailed(adminId){
                    window.location.href="${pageContext.request.contextPath}/backstage/admin/"+adminId;
                }
  

            </script>
        </body>

        </html>