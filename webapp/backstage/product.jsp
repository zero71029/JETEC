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

            .AAA {
                padding-left: 38%;
                text-align: center;
                background-color: #62A5A1;
                color: white;
            }

            .accordion-item {
                text-align: center;
                background-color: #62A5A1;
                color: #0c4128;
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

            input,
            select {
                margin: 10px 0px;
                width: 90%;
            }

            .Picture {
                visibility: hidden;
            }

            .errmodel {
                color: red;
            }

            $ {
                errors==null ? null:".err::placeholder{color: red;}"
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
            <!-- <%-- 中間主體--%> -->
            <div class="container-fluid">
                <div class="row justify-content-end">
                    <div class="col-md-10">
                        <br>
                        <form
                            action="${pageContext.request.contextPath}/backstage/updataProduct/${product.id ==null ?0: product.id}"
                            method="POST">
                            <div class="row">
                                <div class="col-md-4">
                                    品號&nbsp;${product.id} <br>
                                    貨號&nbsp;<input type="text" name="model" id="" value="${product.model}"
                                        placeholder="${errors.model}" class="err"><br>
                                    名稱&nbsp;<input type="text" name="name" id="" value="${product.name}"
                                        placeholder="${errors.name}" class="err"><br>
                                    類別&nbsp;<select name="type" id="">
                                        <c:forEach varStatus="loop" begin="0" end="${love1.size()-1}" items="${love1}"
                                            var="l">
                                            <optgroup label="${l}"></optgroup>
                                            <c:forEach varStatus="loop" begin="0" end="${love2.size()-1}"
                                                items="${love2}" var="s">
                                                <c:if test="${l==s.love1}">
                                                    <c:if test="${s.love2 != null}">
                                                        <option value="${s.type}" ${product.type==s.type? "selected" :
                                                            null}> ${s.love2}
                                                        </option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>


                                    </select> <br><a
                                        href="${pageContext.request.contextPath}/backstage/addType">+新增類別</a><br>

                                    <span class="errmodel">${errors.model2}</span>點擊數:${product.count}
                                </div>
                                <div class="col-md-4">
                                    廠商&nbsp;<input type="text" name="" id="" value="${product.vendorid}"
                                        placeholder="目前還沒用"><br>
                                    XX&nbsp;<input type="text" name="" id="" value="" placeholder="目前還沒用"><br>
                                    XX&nbsp;<input type="text" name="" id="" value="" placeholder="目前還沒用"><br>
                                    XX&nbsp;<input type="text" name="" id="" value="" placeholder="目前還沒用"><br>

                                </div>

                                <div class="col-md-4">
                                    <c:if test="${product.psb == null}">
                                    庫存&nbsp;<input type="number" name="quantity" id="" value="${product.quantity}"
                                        class="err" placeholder="${errors.quantity}"><br>
                                    進價&nbsp;<input type="number" name="purchaseprice" id=""
                                        value="${product.purchaseprice}" class="err"
                                        placeholder="${errors.purchaseprice}"><br>
                                    售價&nbsp;<input type="number" name="sellprice" id="" value="${product.sellprice}"
                                        class="err" placeholder="${errors.sellprice}"><br>
                                    </select><br>
                                </c:if>
                                    狀態&nbsp;<select class="" name="productstatus">
                                        <option value="1" ${product.productstatus==1 ?"selected":null}>正常</option>
                                        <option value="2" ${product.productstatus==2 ?"selected":null}>下架</option>
                                        <option value="3" ${product.productstatus==3 ?"selected":null}>無庫存</option>
                                     

                                </div>

                                <c:if test="${product.psb != null}">
                                    <div class="col-md-4">
                                        <input type="hidden" name="quantity" value="${product.quantity}">
                                        <input type="hidden" name="purchaseprice" value="${product.purchaseprice}">
                                        <input type="hidden" name="sellprice" value="${product.sellprice}">
                                    </div>
                                </c:if>
                            </div>

                            <!-- 中間按鈕 -->
                            <div class="row">

                                <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off"
                                        onclick="detail()">
                                    <label class="btn btn-outline-primary " for="btncheck1">細節</label>

                                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                    <label class="btn btn-outline-primary " for="btncheck2"
                                        onclick="Picture()">圖片</label>
                                    <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off"
                                        onclick="uppdf()">
                                    <label class="btn btn-outline-primary " for="btncheck4">PDF 上傳</label>

                                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck3" onclick="group()">規格</label>

                                    <input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
                                    <label class="btn btn-outline-primary " for="btncheck5" onclick="AAA()">XXX</label>

                                    <input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck6" onclick="sta(3)">XXX</label>
                                </div>


                            </div>
                            <!-- 中間按鈕////////////////////////////////////////////// -->
                            <!-- 下面 -->
                            <!-- 細節區域 -->
                            <div class="row detail" style="position: relative;">
                                <div class="psb">
                                    <div class="input-group" style="height: 200px;" name="producttext">
                                        <span class="input-group-text">描述</span>
                                        <textarea class="form-control err" aria-label="With textarea" name="producttext"
                                            placeholder="${errors.producttext}">${product.producttext}</textarea>
                                    </div>
                                    <c:if test="${product.psb != null}">
                                        <c:forEach varStatus="loop" begin="0" end="${product.psb.size()-1}"
                                            items="${product.psb}" var="p">
                                            <input type="hidden" name="psb[${loop.index}].specification"
                                                value="${p.specification}">
                                            <input type="hidden" name="psb[${loop.index}].id" value="${product.id}">
                                            特點${loop.index}&nbsp;<input type="text" name="psb[${loop.index}].sptext"
                                                id="" value="${p.sptext}" placeholder=""><br>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${product.psb == null}">
                                        <input type="hidden" name="psb[0].specification"
                                            value="${product.psb[0].specification}">
                                        <input type="hidden" name="psb[1].specification"
                                            value="${product.psb[1].specification}">
                                        <input type="hidden" name="psb[2].specification"
                                            value="${product.psb[2].specification}">
                                        <input type="hidden" name="psb[3].specification"
                                            value="${product.psb[3].specification}">
                                        <input type="hidden" name="psb[4].specification"
                                            value="${product.psb[4].specification}">
                                        <input type="hidden" name="psb[5].specification"
                                            value="${product.psb[5].specification}">
                                        <input type="hidden" name="psb[6].specification"
                                            value="${product.psb[6].specification}">
                                        <input type="hidden" name="psb[7].specification"
                                            value="${product.psb[7].specification}">
                                        <input type="hidden" name="psb[0].id" value="${product.id}">
                                        <input type="hidden" name="psb[1].id" value="${product.id}">
                                        <input type="hidden" name="psb[2].id" value="${product.id}">
                                        <input type="hidden" name="psb[3].id" value="${product.id}">
                                        <input type="hidden" name="psb[4].id" value="${product.id}">
                                        <input type="hidden" name="psb[5].id" value="${product.id}">
                                        <input type="hidden" name="psb[6].id" value="${product.id}">
                                        <input type="hidden" name="psb[7].id" value="${product.id}">
                                        特點0&nbsp;<input type="text" name="psb[0].sptext" id=""
                                            value="${product.psb[0].sptext}" placeholder=""><br>
                                        特點1&nbsp;<input type="text" name="psb[1].sptext" id=""
                                            value="${product.psb[1].sptext}" placeholder=""><br>
                                        特點2&nbsp;<input type="text" name="psb[2].sptext" id=""
                                            value="${product.psb[2].sptext}" placeholder=""><br>
                                        特點3&nbsp;<input type="text" name="psb[3].sptext" id=""
                                            value="${product.psb[3].sptext}" placeholder=""><br>
                                        特點4&nbsp;<input type="text" name="psb[4].sptext" id=""
                                            value="${product.psb[4].sptext}" placeholder=""><br>
                                        特點5&nbsp;<input type="text" name="psb[5].sptext" id=""
                                            value="${product.psb[5].sptext}" placeholder=""><br>
                                        特點6&nbsp;<input type="text" name="psb[6].sptext" id=""
                                            value="${product.psb[6].sptext}" placeholder=""><br>
                                        特點7&nbsp;<input type="text" name="psb[7].sptext" id=""
                                            value="${product.psb[7].sptext}" placeholder=""><br>
                                    </c:if>
                                    <button type="button" class="newPSB" onclick="newPSB()">++</button><br>
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="新增/修改">
                            </div>

                            <div class="row"></div>
                            <div class="row"></div>

                        </form>
                        <!-- 圖片區域 -->
                        <div class="row Picture">
                            <form class="row picmain" action="${pageContext.request.contextPath}/backstage/addPic"
                                method="post" enctype='multipart/form-data'>
                                <div style="width: 350px;height: 280px; ">
                                    <img src='${pageContext.request.contextPath}/images/product/${product.pictureurl == null ? "uploadstep.png":product.pictureurl}'
                                        id="img0" class="img-thumbnail" />
                                    <input type="file" accept="image/*" id="file0" name="file" onchange="upload(0);"
                                        class="fileInput" value="" />
                                </div>
                            </form>
                        </div>
                        <!-- 圖片////////////////////////////////// -->
                        <!-- 規格區域 -->
                        <style>
                            .group .row div {
                                border: 1px solid black;
                            }
                        </style>
                        <div class="row group">
                            <div class="row">
                                <table class="Table table-striped orderTable ">
                                    <tr>
                                        <td>商品編號${group}</td>
                                        <td>第1群</td>
                                        <td>第2群</td>
                                        <td>第3群</td>
                                        <td>進價</td>
                                        <td>價格</td>
                                        <td>庫存</td>
                                        <td>確認</td>
                                        <td>移除</td>
                                    </tr>
                                    <tr>
                                        <form action="" method="post" class="upgroup">
                                            <td>類別名稱</td>
                                            <td><input type="text" name="product_group" id="" value="${group}">
                                            <td><input type="text" name="product_group2" id="" value="${group2}">
                                            <td><input type="text" name="product_group3" id="" value="${group3}">
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><button type="button" onclick="saveGroup(${product.id})">儲存</button>
                                            <td></td>
                                            </td>
                                        </form>
                                    </tr>


                                    <c:if test="${not empty group}">
                                        <c:forEach varStatus="loop" begin="0"
                                            end="${product.productOptionBean.size()-1}"
                                            items="${product.productOptionBean}" var="p">
                                            <tr>
                                                <form class="option${p.id}" action="" method="post">
                                                    <input type="hidden" name="id" value="${p.id}">
                                                    <input type="hidden" name="product_group" value="${group}">
                                                    <input type="hidden" name="product_group2" value="${group2}">
                                                    <input type="hidden" name="product_group3" value="${group3}">
                                                    <td> <input type="text" name="product_type" id=""
                                                            value="${p.product_type}" placeholder="編號"></td>
                                                    <td><input type="text" name="product_option"
                                                            value="${p.product_option}"
                                                            placeholder="${p.product_option}"></td>
                                                    <td><input type="text" name="product_option2"
                                                            value="${p.product_option2}"
                                                            placeholder="${p.product_option2}"></td>
                                                    <td><input type="text" name="product_option3"
                                                            value="${p.product_option3}"
                                                            placeholder="${p.product_option3}"></td>
                                                    <td><input type="number" name="purchase_price"
                                                            value="${p.purchase_price}"
                                                            placeholder="${p.purchase_price}"></td>
                                                    <td><input type="number" name="product_price"
                                                            value="${p.product_price}" placeholder=""></td>
                                                    <td><input type="number" name="product_quantity"
                                                            value="${p.product_quantity}"
                                                            placeholder="${p.product_quantity}"></td>
                                                    <td><button type="button" onclick="saveOption(${p.id})">儲存</button>
                                                    </td>
                                                    <td><a href="${pageContext.request.contextPath}/backstage/removeOption/${p.id}/${product.id}">移除</a> </td>
                                                </form>
                                            </tr>

                                        </c:forEach>
                                    </c:if>
                                    <tr>
                                        <form class="newGroup" action="" method="post">
                                            <td><input type="text" name="product_type" id="" placeholder="編號"></td>
                                            <input type="hidden" name="product_group" value="${group}">
                                            <input type="hidden" name="product_group2" value="${group2}">
                                            <input type="hidden" name="product_group3" value="${group3}">
                                            <td><input type="text" name="product_option" id="" placeholder="選項名稱"></td>
                                            <td><input type="text" name="product_option2" id="" placeholder="選項名稱"></td>
                                            <td><input type="text" name="product_option3" id="" placeholder="選項名稱"></td>
                                            <td><input type="number" name="purchase_price" id="" placeholder="進價"></td>
                                            <td><input type="number" name="product_price" id="" placeholder="售價"></td>
                                            <td><input type="number" name="product_quantity" id="" placeholder="庫存">
                                            </td>
                                            <td><button type="button" onclick="saveOption(0)">新增</button></td>
                                        </form>
                                    </tr>
                                </table>

                            </div>
                        </div>
                        <!-- 規格區域////////////////////////////s -->
                        <!-- 上傳 pdf -->
                        <div class="row pdf">
                            <c:if test="${not empty product.pdfurl}">
                                <c:forEach varStatus="loop" begin="0" end="${product.pdfurl.size()-1}"
                                    items="${product.pdfurl}" var="s">
                                    <br>
                                    <li><a href="${pageContext.request.contextPath}/PDF/${s.url}"
                                            target="_blank">${s.url}</a> &nbsp;&nbsp;&nbsp; <a
                                            href="${pageContext.request.contextPath}/backstage/removePDF/${s.url}/${product.id}">remove</a>
                                    </li> <br>
                                </c:forEach>
                            </c:if>
                            <br>
                            <form class="row uppdf" action="" method="post" enctype='multipart/form-data'>
                                <input type="file" id="" name="file1" onchange="upfile(0);" class="fileInput"
                                    value="" />
                            </form>
                        </div>
                        <!-- 上傳 pdf////////////////////////////s -->

                    </div>

                </div>
            </div>
            </div>
            </div>

        </body>
        <script>
            $(".group").css("visibility", "hidden");
            $(".pdf").css("visibility", "hidden");
            //切換
            function detail() {
                $(".detail").css("visibility", "visible");
                $(".detail").css("position", "relative");

                $(".Picture").css("visibility", "hidden");
                $(".Picture").css("position", "absolute");
                $(".group").css("position", "absolute");
                $(".group").css("visibility", "hidden");
                $(".pdf").css("visibility", "hidden");
                $(".pdf").css("position", "absolute");
            }
            function Picture() {
                $(".Picture").css("visibility", "visible");
                $(".Picture").css("position", "relative");

                $(".detail").css("position", "absolute");
                $(".detail").css("visibility", "hidden");
                $(".group").css("position", "absolute");
                $(".group").css("visibility", "hidden");
                $(".pdf").css("visibility", "hidden");
                $(".pdf").css("position", "absolute");
            }
            function group() {
                $(".group").css("visibility", "visible");
                $(".group").css("position", "relative");

                $(".detail").css("position", "absolute");
                $(".detail").css("visibility", "hidden");
                $(".Picture").css("visibility", "hidden");
                $(".Picture").css("position", "absolute");
                $(".pdf").css("visibility", "hidden");
                $(".pdf").css("position", "absolute");
            }
            function uppdf() {
                $(".pdf").css("visibility", "visible");
                $(".pdf").css("position", "relative");

                $(".detail").css("position", "absolute");
                $(".detail").css("visibility", "hidden");
                $(".Picture").css("visibility", "hidden");
                $(".Picture").css("position", "absolute");
                $(".group").css("visibility", "hidden");
                $(".group").css("position", "absolute");
            }


            //上傳型錄
            upfile = function (i) {

                var formData = new FormData($(".uppdf")[0]);
                console.log(formData);
                $.ajax({
                    url: '${pageContext.request.contextPath}/backstage/upFile/${product.id ==null ?0: product.id}',//接受請求的Servlet地址
                    type: 'POST',
                    data: formData,
                    async: false,//同步請求
                    cache: false,//不快取頁面
                    contentType: false,//當form以multipart/form-data方式上傳檔案時，需要設定為false
                    processData: false,//如果要傳送Dom樹資訊或其他不需要轉換的資訊，請設定為false
                    success: function (url) {
                        alert(url);
                        window.location.href = "${pageContext.request.contextPath}/backstage/product/${product.id}";
                    },
                    error: function (returndata) {
                        console.log(returndata);

                    }

                });
            }


            ///////////////////////////////////////////////////
            //圖片按鈕
            // 換圖片 .
            upload = function (i) {
                var f = document.querySelector("#file" + i);
                var d = document.querySelector("#img" + i);
                $("#file" + i).attr("name", "file" + i);
                var reader = new FileReader();
                reader.readAsDataURL(f.files[0]);
                reader.onload = function (e) {
                    d.setAttribute("src", e.target.result);
                };
                var formData = new FormData($(".picmain")[0]);
                $.ajax({
                    url: '${pageContext.request.contextPath}/backstage/addPic/${product.id ==null ?0: product.id}',//接受請求的Servlet地址
                    type: 'POST',
                    data: formData,
                    async: false,//同步請求
                    cache: false,//不快取頁面
                    contentType: false,//當form以multipart/form-data方式上傳檔案時，需要設定為false
                    processData: false,//如果要傳送Dom樹資訊或其他不需要轉換的資訊，請設定為false
                    success: function (url) {
                        console.log(" img  ok")
                        $("#img_test").attr('src', url);//上傳成功後，把伺服器獲取到的圖片路徑繫結到img標籤是src屬性上
                    },
                    error: function (returndata) {
                        console.log(returndata);
                        alert(returndata);
                    }

                });

            };
            $(".btn").on("click", function () {
                $(".btn").css("background-color", "white");
                $(".btn").css("color", "#0d6efd");
            })

            // $("#picmain").on('submit', (function (e) {
            //     e.preventDefault();
            //     $.ajax({
            //         url: "${pageContext.request.contextPath}/backstage/addPic",
            //         type: "POST",
            //         data: new FormData(this),
            //         contentType: false,
            //         cache: false,
            //         processData: false,
            //         success: function (data) {

            //         },
            //         error: function () {
            //         }
            //     });
            // }));
            // 儲存子項 
            function saveOption(groupid) {
                console.log(groupid);
                if (groupid == 0) {
                    var formData = new FormData($(".newGroup")[0]);


                } else {
                    var formData = new FormData($(".option" + groupid)[0]);
                }
                $.ajax({
                    url: '${pageContext.request.contextPath}/backstage/saveOption/${product.id}',//接受請求的Servlet地址
                    type: 'POST',
                    data: formData,
                    async: false,//同步請求
                    cache: false,//不快取頁面
                    contentType: false,//當form以multipart/form-data方式上傳檔案時，需要設定為false
                    processData: false,//如果要傳送Dom樹資訊或其他不需要轉換的資訊，請設定為false

                    success: function (json) {
                        console.log(json)
                        alert(json);
                        if (json == "save ok")
                            window.location.href = "${pageContext.request.contextPath}/backstage/product/${product.id}";

                    },
                    error: function (returndata) {
                        console.log(returndata);

                    }
                });
            }
            function saveGroup(productid) {
                var formData = new FormData($(".upgroup")[0]);
                $.ajax({
                    url: '${pageContext.request.contextPath}/backstage/saveGroup/${product.id}',//接受請求的Servlet地址
                    type: 'POST',
                    data: formData,
                    async: false,//同步請求
                    cache: false,//不快取頁面
                    contentType: false,//當form以multipart/form-data方式上傳檔案時，需要設定為false
                    processData: false,//如果要傳送Dom樹資訊或其他不需要轉換的資訊，請設定為false

                    success: function (json) {
                        alert(json);
                        window.location.href = "${pageContext.request.contextPath}/backstage/product/${product.id}";
                    },
                    error: function (returndata) {
                        console.log(returndata);

                    }
                });

            }
            var i = 7;
            function newPSB() {
                console.log(i);
                i++;
                var s = i + 1;
                $(".psb").append('特點' + s + '&nbsp;<input type="text" name="psb[' + i + '].sptext" id="" value="" placeholder=""><br>');
            }

            var j = {
                "": {},
                "": "",
                "": "ddddd"
            }




        </script>

        </html>