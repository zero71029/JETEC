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

            div h4 {
                color: #ff703E;
                opacity: 1;
            }
            .Qmen{
                text-align: center;
               width: 200%;
               padding: 8px 0;
                background-color: #efefef;
                
            }
            .Qmen:hover{
               color: white;
                background-color: #ff703E;
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="/shopTop.jsp"></jsp:include>

            <!-- 中間身體 -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-1 ">

                    </div>
                    <div class="col-lg-10">
                        <br><br>
                        <h1>Q&A</h1>
                        <hr style="color: #ff703E; opacity: 1;">
                        <br>
                        <div class="row order">
                            <div>
                                <h4> Q1、我如何下訂單或收到報價？？</h4>
                                在美國以外，請 留言 購買我們的產品。我們的業務會聯繫你

                                在美國境內，購買我們產品的最簡單方法是通過我們的美國 網上商店。

                                如需電話技術銷售支持，請在...............辦公時間內致電 (XXX) XXX-XXX。
                            </div>
                            <hr>
                            <div>
                                <h4>Q2、如何查詢我的訂單資料呢？</h4>
                                請至本站「顧客中心」的「查訂單」功能，查詢購物資料
                            </div>
                            <hr>
                            <div>
                                <h4>Q3、為什麼在「訂單查詢」專區裡查詢不到我的訂單呢？？</h4>
                                敬請確認輸入的訂購E-mail及密碼是否正確？！我們常發現訂購和查詢Mail address不同而致使查詢不到。當輸入正確時卻未出現資料...可能為以下三種情況之─：<br>
                                1. 訂購時所填寫的資料有誤或與查詢mail不同<br>
                                2. 未訂購成功<br>
                                3. 非本站訂購<br>
                            </div>
                            <hr>
                            <div>
                                <h4>Q4、如果我在網上訂購，我怎麼知道你們收到了我的訂單？</h4>
                                在您提交購買後不久，將向您發送一封自動電子郵件確認。如果未收到此電子郵件，請通知我們。
                            </div>
                            <hr>
                            <div>
                                <h4>Q5、如何取消訂單？訂單數量有誤如何更改？</h4>
                                由於受限營運、認證中心和銀行規範，無法變更訂單付款方式、內容、金額或是退補差額方式換購其它商品，因此尚無法提供線上網路直接由顧客取消訂單或修改，如有需要變更............................。
                            </div>
                            <hr>
                            <div>
                                <h4>Q6、訂購之後E-mail信箱可以改嗎？</h4>
                                本站是以訂購的E-mail
                                信箱為主要元件，它具有相當的法律效力，且在本站所有訂購紀錄都會留為存查，若強制變更則資料全部消失，因此我們無法提供這方面變更，若訂購時輸入有誤，請以有誤方式繼續查詢，在此建議下次訂購時，再以慣用且正確的E-mail
                                訂購即可。
                            </div>
                            <hr>
                            <div>
                                <h4>Q7、請問可以到店面看貨購買嗎？可以親自取貨嗎？</h4>
                                因為PChome線上購物為網路購物網站，沒有實體商店可以提供客戶現場購買付款和親自取貨。
                            </div>
                            <hr>
                            <div>
                                <h4>Q8、如何付款？</h4>
                                我們使用paypal付款
                            </div>
                            <hr>
                            <div>
                                <h4>Q9、我如何索取書面報價或形式發票？</h4>
                                .............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q10、你們的退貨政策是什麼？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、你們接受國際訂單嗎？</h4>
                                是的。我們鼓勵我們的國際客戶通過 他們國家的經銷商訂購
                                。您可以聯繫我們訂購。對於所有國際網絡銷售和報價，購物車或報價中可能不包含關稅和稅費，但仍需要買方在收到時支付。客戶未能支付進口關稅可能會導致產品被退回，向客戶收取額外運費和/或產品被運輸公司丟棄。
                                由於關稅、關稅、運費、稅費和/或價格中已包含的其他費用，國際分銷商報價/價格可能高於 直接提供的報價或網絡價格。
                            </div>商品放入購物車後，價格與網頁不一
                            <hr>
                            <div>
                                <h4>Q、商品放入購物車後，價格與網頁不一？</h4>
                                可能是您選的規格不同,造成價格變動
                            </div>
                            <hr>
                            <br><br><br><br>
                        </div>
                        <div class="row transfer">
                            <div>
                                <h4>Q、請問出貨會通知嗎？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、我該如何查詢出貨日？</h4>
                                請至本站「顧客中心」的「查訂單」功能，查詢購物資料
                            </div>
                            <hr>
                            <div>
                                <h4>Q、你多久可以發貨？</h4>
                                庫存商品通常在 1-2 天內發貨，發貨條件為 CPT 目的地。沒有庫存的物品將在 2-3 週內發貨。大批量或定制訂單通常在 2-3
                                週內發貨。如有關於庫存水平或緊急訂單的任何問題，請在營業時間直接致電我們。我們的電話號碼是 + 1.435.792.4700。
                            </div>
                            <hr>
                            <div>
                                <h4>Q、何時送達？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、如何查詢配送進度？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、運費計算？</h4>
                                ..............................................
                            </div>
                            <div>
                                <h4>Q、可以指定時段、夜間或週日送達嗎？</h4>
                                ..............................................
                            </div>
                            <hr>   
                        </div>
                        <div class="row product">
                             <div>
                                <h4>Q、收到商品不符、破損、瑕疵怎麼辦？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、商品不滿意如何辦理退貨？</h4>
                                ..............................................
                            </div>
                            <hr>
                            <div>
                                <h4>Q、商品保固期多久？</h4>
                                ..............................................
                            </div>
                            <div>
                                <h4>Q、商品如何保固、維修？</h4>
                                ..............................................
                            </div>
                            <hr>   
                            <div>
                                <h4>Q、收到商品需要更換其他尺寸、顏色、大小、規格如何處理？</h4>
                                ..............................................
                            </div>
                            <hr>  
                            <div>
                                <h4>Q、商品維修時間約多久？</h4>
                                ..............................................
                            </div>
                            <hr>  
                            <div>
                                <h4>Q、維修費如何計算?？</h4>
                                ..............................................
                            </div>
                            <hr>  
                            <div>
                                <h4>Q、</h4>
                                ..............................................
                            </div>
                            <hr> 
                        </div>
                    </div>
                    <div class="col-lg-1">
                        <div class="row" style="height: 200px;"></div>
                        <div class="Qmen" type="button" onclick="order()" style="border-bottom: 1px solid #c4c4c4;">訂購問題</div>
                        <div class="Qmen" type="button" onclick="transfer()" style="border-bottom: 1px solid #c4c4c4;">寄送問題</div>
                        <div class="Qmen" type="button" onclick="product()">商品問題</div>
                    </div>
                </div>
            </div>
            <!-- 插入腳 -->
            <jsp:include page="/shopBottom.jsp"></jsp:include>
        </body>
        <script>
            $(".transfer").hide();
            $(".product").hide();
            function order() {              
                $(".order").show(); 
                $(".transfer").hide(); 
                $(".product").hide();           
            }
            function transfer() { 
                $(".transfer").show();             
                $(".order").hide();  
                $(".product").hide();          
            }
            function product() { 
                $(".product").show();             
                $(".order").hide();
                $(".transfer").hide();         
            }

        </script>

        </html>