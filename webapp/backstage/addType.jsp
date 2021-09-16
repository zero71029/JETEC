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
            body {}
            .mainColor {
                background-color: #62A5A1;
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
                    <div class="col-md-10">
                       <h1>${mess}</h1> 
                        <!-- <%-- 中間主體--%> -->
                        <c:if test="${not empty love1}">
                            <c:if test="${not empty love2}">
                                <div class="">
                                    <c:forEach varStatus="loop" begin="0" end="${love1.size()-1}"
                                        items="${love1}" var="l">
                                        <!-- Default dropend button love1-->
                                        <div class=" ">
                                            <span class="" >${l}
                                            <ul class="">
                                                <!-- Dropdown menu links -->
                                                <c:forEach varStatus="loop" begin="0"
                                                    end="${love2.size()-1}" items="${love2}" var="s">
                                                    <c:if test="${l==s.love1}">
                                                        <li>${s.love2} &nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/backstage/delLove2/${s.type}">remove</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <li><form action="${pageContext.request.contextPath}/backstage/saveLove2/${l}" method="post">
                                                    <input type="text" name="love2">
                                                    <input type="submit" value="新增子類">
                                                </form></li>
                                            </ul>
                                        </div>
                                    </c:forEach>
                                    <form action="${pageContext.request.contextPath}/backstage/saveLove1" method="post">
                                        <input type="text" name="love1">
                                        <input type="submit" value="新增主類">
                                    </form>
                                </div>
                            </c:if>
                        </c:if>
                    </div>




                    </div>
                </div>
            </div>


        </body>

        </html>