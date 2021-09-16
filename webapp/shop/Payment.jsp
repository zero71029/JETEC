<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

  
            <!-- <%-- 主要的CSS、JS放在這裡--%> -->
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- Ensures optimal rendering on mobile devices. -->
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />

            <title>Document</title>
        </head>
        <style>
            div {
                /* border: 2px solid black; */
                font-family: 'Kanit';
            }

            body {
                /* text-align: center; */

            }

            .insertData input {
                width: 97%;
                margin: 20px 0px;
            }

            .insertData2 input {
                width: 47%;
                margin: 10px;
            }
            /* 右半邊 */
            .rightDiv {
                background-color: rgb(238, 236, 236);
                color: #474747;

            }
            .rightDiv .col-lg-5{
                font-family: Microsoft JhengHei;
            }
            /* 左邊字體 */
            .TT{
                margin: 10px;
            }
            .TT h5{
                color: #231f20;
            }
            .TT a{
                background-color: #939393;
                color: white;
                text-decoration: none;
                padding: 1px 10px;
            }
            .mess a{
                color: #231f20;
                text-decoration: none;
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <div class="container-fluid main">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-5">
                        <br><br>
                        <div class="row">
                            <div class="mess">
                                <a href="${pageContext.request.contextPath}/shopCart">&nbsp; Cart &nbsp;</a>>
                                <a href="${pageContext.request.contextPath}/change"> &nbsp;Information &nbsp;</a>>
                                <span style="color: #ff703E;">&nbsp;Payment</span>
                            </div>
                        </div>
                        <br>
                        <div class="row" style="text-align:left; color:#7f7f7f;">
                            <div class="row TT"><div class="col-lg-10"> <h5>Contact Name</h5>${order.order_name} </div><div class="col-lg-2"><a href="${pageContext.request.contextPath}/change">change</a></div> </div><br><br><br><br>
                            <div class="row TT"><div class="col-lg-10"><h5>Shipping Address</h5> ${order.company}&nbsp;${order.order_address}&nbsp;${order.order_postalcode}&nbsp;&nbsp;</div><div class="col-lg-2"><a href="${pageContext.request.contextPath}/change">change</a></div> </div> <br><br><br><br>
                            <div class="row TT"><div class="col-lg-10"><h5>Total:</h5> $${total}</div><div class="col-lg-2"></div> </div>
                       </div>
                       <h1><a href="${pageContext.request.contextPath}/review" >測試跳過付款用</a></h1>
                       <br>
                        <div class="row paypal-button-container"> 
                            




                            
                            
                            <!-- PayPal Logo -->
                            <div id="smart-button-container">
                                <div style="text-align: center;width: 91%;">
                                  <div id="paypal-button-container"></div>
                                </div>
                            </div>
                            <script src="https://www.paypal.com/sdk/js?client-id=AXZPZ44AbU_fMn5_nYAh5GpwMGIPsyaJujvR0_eELR2LN87pJJe2xiXtmoh235S6Nf1ljZD2Idr_BxM5&enable-funding=venmo&currency=USD" data-sdk-integration-source="button-factory"></script>
                            <script defer>
                              function initPayPalButton() {
                                paypal.Buttons({
                                  style: {
                                    shape: 'rect',
                                    color: 'gold',
                                    layout: 'horizontal',
                                    label: 'paypal',                                    
                                  },
                          
                                  createOrder: function(data, actions) {
                                    return actions.order.create({
                                      purchase_units: [{"amount":{"currency_code":"USD","value":1}}]
                                    });
                                  },
                          
                                  onApprove: function(data, actions) {
                                    return actions.order.capture().then(function(orderData) {
                                      
                                      // Full available details
                                      console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                          
                                      // Show a success message within this page, e.g.
                                      const element = document.getElementById('paypal-button-container');
                                      element.innerHTML = '';
                                      element.innerHTML = '<h3>Thank you for your payment!</h3>';
                          
                                      // Or go to another URL:  actions.redirect('thank_you.html');
                                      
                                    });
                                  },
                          
                                  onError: function(err) {
                                    console.log(err);
                                  }
                                }).render('#paypal-button-container');
                              }
                              initPayPalButton();
                            </script>
                            <!-- PayPal Logo 結束 -->





      
                        </div>
                       
                    </div>


                    <!-- 右半邊 -->
                    <div class="col-lg-5 rightDiv">
                        <br><br>
                        <c:if test="${not empty productList}">
                            <c:forEach varStatus="loop" begin="0" end="${productList.size()-1}" items="${productList}"
                                var="p">
                                <div class="row">
                                    <div class="col-lg-3"><img
                                            src="${pageContext.request.contextPath}/images/product/${p.pictureurl}"
                                            alt="" width="100%"></div>
                                    <div class="col-lg-5" ><h4>${p.name}</h4>${p.product_type} <br>  ${p.product_option}<br> ${p.product_option2}<br> ${p.product_option3}</div>
                                    <div class="col-lg-2">x${p.num}</div>
                                    <div class="col-lg-2">$${p.num * p.sellprice }</div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <hr>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-5"></div>
                            <div class="col-lg-2">Total:</div>
                            <div class="col-lg-2">US$${total}</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-5"></div>
                            <div class="col-lg-2">運費</div>
                            <div class="col-lg-2">US$400</div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-5"></div>
                            <div class="col-lg-2">Total:</div>
                            <div class="col-lg-2" style="color: #666666;">US$${total+400}</div>
                        </div>
                        <br>
                    </div>
                    <div class="col-lg-1 rightDiv"></div>
                </div>                
            </div>

            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>

        </body>

        </html>