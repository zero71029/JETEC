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
                /* background-color: #222; */
            }

            .mainColor {
                background-color: #62A5A1;
            }

            .item:hover {
                background-color: #afe3d5;
            }
        </style>

        <body>
            <!-- <%-- 頁首--%> -->
            <header class="container-fluid mainColor headtop">
                <a href='${pageContext.request.contextPath}/backstage/shopBack.jsp' class='title'>商城後台</a>
                <%-- <button class="userIcon"></button>--%>
            </header>


            <!-- <%-- 插入側邊欄--%> -->
            <jsp:include page="/backstage/Sidebar.jsp"></jsp:include>
            <!-- <%-- 中間主體///////////////////////////////////////////////////////////////////////////////////////--%> -->
            <div class="container-fluid">
                <div class="row justify-content-end">
                    <div class="col-md-10" style="position: relative;">
                        <!-- <%-- 中間主體--%> -->

                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-6">
                                <h1>${susses}</h1>
                                <table class="Table table-bordered table-striped" style="width: 100%;">                                    
                                    <tr>
                                        <td>留言編號:${mess.id}</td> <td>購買商品:${mess.product_model}</td>
                                    </tr>
                                    <tr>
                                        <td>名子:${mess.firstname} ${mess.lastname}</td> <td>購買商品:${mess.product_model}</td>
                                    </tr>
                                    <tr>
                                        <td>公司:${mess.company}</td><td>購買的種類 :${mess.productType}</td>
                                    </tr>
                                    <tr>
                                        <td>電話:${mess.phone}</td><td>行業 :${mess.industry}</td>
                                    </tr>
                                    <tr>
                                        <td>Email:${mess.email}</td><td></td>
                                    </tr>
                                    <tr>
                                        <td>日期:${mess.create_date}</td><td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <label for="exampleFormControlTextarea1" class="form-label">留言:</label>
                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                                name="reply">${mess.message}</textarea>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <form action="${pageContext.request.contextPath}/backstage/reply"
                                                method="post">
                                                <input type="hidden" name="id" value="${mess.id}">
                                                <label for="exampleFormControlTextarea1" class="form-label">回覆</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                                                    name="reply">${mess.reply}</textarea>
                                                <input type="submit" value="題交">
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        <script>
            function mess(messid) {
                window.location.href = "${pageContext.request.contextPath}/backstage/mess/" + messid;
            }
        </script>

        </html>