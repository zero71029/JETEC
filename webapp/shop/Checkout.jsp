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
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Ensures optimal rendering on mobile devices. -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />

      <title>checkout</title>
    </head>
    <style>
      div {
        /* border: 2px solid black; */
      }

      .main {
        /* text-align: center; */
        font-size: 14px;

      }

      /* 所有的a */
      .main a {
        color: #ff703E;
        text-decoration: none;

      }

      .insertData {
        margin-bottom: 30px;
        line-height: 1rem;
      }

      .insertData input {
        width: 97%;      
      }

      .insertData2 input {
        width: 48%;
        margin: 0px 2px 0px 0px; 
      }

      .rightDiv {
        /* background-color: rgb(238, 236, 236); */

      }

      /* 回購物車按鈕 */
      .reCart {
        width: 100px;
        color: #ff703E;
        background-color: white;
        border: 1px #ff703E solid;
      }

      /* 下一步 : 結帳 按鈕 */
      .submit {
        color: white;
        background-color: #ff703E;
        border: 1px #ff703E solid;
      }

      ${
        errors==null ? null:"input::placeholder{color: red;}"
      }
    </style>

    <body>

      <!-- 插入頭部 -->
      <jsp:include page="../shopTop.jsp"></jsp:include>
      <div class="container-fluid main">
        <div class="row">
          <div class="col-lg-3"></div>
          <!-- 左半邊 -->
          <div class="col-lg-6">
            <br><br>
            <div class="row">
              <div>
                <a href="${pageContext.request.contextPath}/shopCart"> Cart</a>>
                <a href="${pageContext.request.contextPath}/checkout"> Information</a>>
                Payment>
              </div>
            </div><br>
            <div class="row">
              <form action="${pageContext.request.contextPath}/Payment" method="POST">
                <div class="row">
                  <div class="col-lg-5">
                    <h3>聯絡資料</h3>
                  </div>

                  <div class="col-lg-7" style=" position: relative;"><span
                      style="position: absolute; bottom: 0px; width: 100%;text-align:right;">${sessionScope.user == null ? "Already have an account?<a  href='${pageContext.request.contextPath}/login.jsp'>Login </a>":""}</span></div>
                  <hr style="color: #ff703E; opacity: 1;">
                </div>
                <!--name  -->
                <div class="insertData2">
                  訂購者姓名
                  <hr>
                  <input type="text" placeholder='${errors.firstname == null ? "First name":errors.firstname}'
                    value='${user.firstname == null ? null:user.firstname}' name="firstname" id="firstname">
                  <input type="text" placeholder='${errors.lastname == null? "Last name":errors.lastname}'
                    value='${user.lastname == null ? null:user.lastname}' name="lastname" id="lastname">
                </div>
                <br><br>
                <!--company  -->
                <div class="insertData">
                  organization
                  <hr>
                  <input type="text" placeholder=' ' value='${user.company == null ? null:user.company}'
                    name="company" id="company">
                </div>
                <!--Email Address  -->

                <div class="insertData">
                  Email Address
                  <hr>
                  <input type="text" placeholder='${errors.email == null ? "Email":errors.email}'
                    value='${user.email == null ? null:user.email}' name="email" id="email">
                </div>
                <br>
                <!--Phone  -->
                <div class="insertData">
                  聯絡電話
                  <hr>
                  <input type="text" placeholder='${errors.phone == null ? "Phone":errors.phone}'
                    value='${user.phone == null ? null:user.phone}' name="phone" id="phone">
                </div>
                <!--帳單地址  -->

                <div class="insertData2">
                  帳單地址
                  <hr>
                  <input type="text" placeholder='帳單地址' name="address" value='${user.order_address == null ? null:user.order_address}' id='address'>
                  <input type="text" placeholder='${errors.postal == null ? "Postal Code":errors.postal}'
                    name="postalcode" value='${user.order_postalcode == null ? null:user.order_postalcode}' id="postalcode">
                </div>
                <!--  -->
                <br><br><br>
                <h3>收件地址</h3> <input type="checkbox" name="" id="copy"><label for="copy">同聯絡資料</label>
                <hr style="color: #ff703E; opacity: 1;">
                <br>
                <!--國家/地區  -->
                <div class="insertData">
                  國家/地區
                  <hr>
                  <select id="country" name="country" class="form-control">
                    <option value="Afghanistan">Afghanistan</option>
                    <option value="Åland Islands">Åland Islands</option>
                    <option value="Albania">Albania</option>
                    <option value="Algeria">Algeria</option>
                    <option value="American Samoa">American Samoa</option>
                    <option value="Andorra">Andorra</option>
                    <option value="Angola">Angola</option>
                    <option value="Anguilla">Anguilla</option>
                    <option value="Antarctica">Antarctica</option>
                    <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                    <option value="Argentina">Argentina</option>
                    <option value="Armenia" selected>Armenia</option>
                    <option value="Aruba">Aruba</option>
                    <option value="Australia">Australia</option>
                    <option value="Austria">Austria</option>
                    <option value="Azerbaijan">Azerbaijan</option>
                    <option value="Bahamas">Bahamas</option>
                    <option value="Bahrain">Bahrain</option>
                    <option value="Bangladesh">Bangladesh</option>
                    <option value="Barbados">Barbados</option>
                    <option value="Belarus">Belarus</option>
                    <option value="Belgium">Belgium</option>
                    <option value="Belize">Belize</option>
                    <option value="Benin">Benin</option>
                    <option value="Bermuda">Bermuda</option>
                    <option value="Bhutan">Bhutan</option>
                    <option value="Bolivia">Bolivia</option>
                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                    <option value="Botswana">Botswana</option>
                    <option value="Bouvet Island">Bouvet Island</option>
                    <option value="Brazil">Brazil</option>
                    <option value="British Indian Ocean Territory">British Indian Ocean
                        Territory</option>
                    <option value="Brunei Darussalam">Brunei Darussalam</option>
                    <option value="Bulgaria">Bulgaria</option>
                    <option value="Burkina Faso">Burkina Faso</option>
                    <option value="Burundi">Burundi</option>
                    <option value="Cambodia">Cambodia</option>
                    <option value="Cameroon">Cameroon</option>
                    <option value="Canada">Canada</option>
                    <option value="Cape Verde">Cape Verde</option>
                    <option value="Cayman Islands">Cayman Islands</option>
                    <option value="Central African Republic">Central African Republic
                    </option>
                    <option value="Chad">Chad</option>
                    <option value="Chile">Chile</option>
                    <option value="China">China</option>
                    <option value="Christmas Island">Christmas Island</option>
                    <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                    <option value="Colombia">Colombia</option>
                    <option value="Comoros">Comoros</option>
                    <option value="Congo">Congo</option>
                    <option value="Congo, The Democratic Republic of The">Congo, The
                        Democratic Republic of The</option>
                    <option value="Cook Islands">Cook Islands</option>
                    <option value="Costa Rica">Costa Rica</option>
                    <option value="Cote D'ivoire">Cote D'ivoire</option>
                    <option value="Croatia">Croatia</option>
                    <option value="Cuba">Cuba</option>
                    <option value="Cyprus">Cyprus</option>
                    <option value="Czech Republic">Czech Republic</option>
                    <option value="Denmark">Denmark</option>
                    <option value="Djibouti">Djibouti</option>
                    <option value="Dominica">Dominica</option>
                    <option value="Dominican Republic">Dominican Republic</option>
                    <option value="Ecuador">Ecuador</option>
                    <option value="Egypt">Egypt</option>
                    <option value="El Salvador">El Salvador</option>
                    <option value="Equatorial Guinea">Equatorial Guinea</option>
                    <option value="Eritrea">Eritrea</option>
                    <option value="Estonia">Estonia</option>
                    <option value="Ethiopia">Ethiopia</option>
                    <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)
                    </option>
                    <option value="Faroe Islands">Faroe Islands</option>
                    <option value="Fiji">Fiji</option>
                    <option value="Finland">Finland</option>
                    <option value="France">France</option>
                    <option value="French Guiana">French Guiana</option>
                    <option value="French Polynesia">French Polynesia</option>
                    <option value="French Southern Territories">French Southern Territories
                    </option>
                    <option value="Gabon">Gabon</option>
                    <option value="Gambia">Gambia</option>
                    <option value="Georgia">Georgia</option>
                    <option value="Germany">Germany</option>
                    <option value="Ghana">Ghana</option>
                    <option value="Gibraltar">Gibraltar</option>
                    <option value="Greece">Greece</option>
                    <option value="Greenland">Greenland</option>
                    <option value="Grenada">Grenada</option>
                    <option value="Guadeloupe">Guadeloupe</option>
                    <option value="Guam">Guam</option>
                    <option value="Guatemala">Guatemala</option>
                    <option value="Guernsey">Guernsey</option>
                    <option value="Guinea">Guinea</option>
                    <option value="Guinea-bissau">Guinea-bissau</option>
                    <option value="Guyana">Guyana</option>
                    <option value="Haiti">Haiti</option>
                    <option value="Heard Island and Mcdonald Islands">Heard Island and
                        Mcdonald Islands</option>
                    <option value="Holy See (Vatican City State)">Holy See (Vatican City
                        State)</option>
                    <option value="Honduras">Honduras</option>
                    <option value="Hong Kong">Hong Kong</option>
                    <option value="Hungary">Hungary</option>
                    <option value="Iceland">Iceland</option>
                    <option value="India">India</option>
                    <option value="Indonesia">Indonesia</option>
                    <option value="Iran, Islamic Republic of">Iran, Islamic Republic of
                    </option>
                    <option value="Iraq">Iraq</option>
                    <option value="Ireland">Ireland</option>
                    <option value="Isle of Man">Isle of Man</option>
                    <option value="Israel">Israel</option>
                    <option value="Italy">Italy</option>
                    <option value="Jamaica">Jamaica</option>
                    <option value="Japan">Japan</option>
                    <option value="Jersey">Jersey</option>
                    <option value="Jordan">Jordan</option>
                    <option value="Kazakhstan">Kazakhstan</option>
                    <option value="Kenya">Kenya</option>
                    <option value="Kiribati">Kiribati</option>
                    <option value="Korea, Democratic People's Republic of">Korea, Democratic
                        People's Republic of</option>
                    <option value="Korea, Republic of">Korea, Republic of</option>
                    <option value="Kuwait">Kuwait</option>
                    <option value="Kyrgyzstan">Kyrgyzstan</option>
                    <option value="Lao People's Democratic Republic">Lao People's Democratic
                        Republic</option>
                    <option value="Latvia">Latvia</option>
                    <option value="Lebanon">Lebanon</option>
                    <option value="Lesotho">Lesotho</option>
                    <option value="Liberia">Liberia</option>
                    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                    <option value="Liechtenstein">Liechtenstein</option>
                    <option value="Lithuania">Lithuania</option>
                    <option value="Luxembourg">Luxembourg</option>
                    <option value="Macao">Macao</option>
                    <option value="Macedonia, The Former Yugoslav Republic of">Macedonia,
                        The Former Yugoslav Republic of</option>
                    <option value="Madagascar">Madagascar</option>
                    <option value="Malawi">Malawi</option>
                    <option value="Malaysia">Malaysia</option>
                    <option value="Maldives">Maldives</option>
                    <option value="Mali">Mali</option>
                    <option value="Malta">Malta</option>
                    <option value="Marshall Islands">Marshall Islands</option>
                    <option value="Martinique">Martinique</option>
                    <option value="Mauritania">Mauritania</option>
                    <option value="Mauritius">Mauritius</option>
                    <option value="Mayotte">Mayotte</option>
                    <option value="Mexico">Mexico</option>
                    <option value="Micronesia, Federated States of">Micronesia, Federated
                        States of</option>
                    <option value="Moldova, Republic of">Moldova, Republic of</option>
                    <option value="Monaco">Monaco</option>
                    <option value="Mongolia">Mongolia</option>
                    <option value="Montenegro">Montenegro</option>
                    <option value="Montserrat">Montserrat</option>
                    <option value="Morocco">Morocco</option>
                    <option value="Mozambique">Mozambique</option>
                    <option value="Myanmar">Myanmar</option>
                    <option value="Namibia">Namibia</option>
                    <option value="Nauru">Nauru</option>
                    <option value="Nepal">Nepal</option>
                    <option value="Netherlands">Netherlands</option>
                    <option value="Netherlands Antilles">Netherlands Antilles</option>
                    <option value="New Caledonia">New Caledonia</option>
                    <option value="New Zealand">New Zealand</option>
                    <option value="Nicaragua">Nicaragua</option>
                    <option value="Niger">Niger</option>
                    <option value="Nigeria">Nigeria</option>
                    <option value="Niue">Niue</option>
                    <option value="Norfolk Island">Norfolk Island</option>
                    <option value="Northern Mariana Islands">Northern Mariana Islands
                    </option>
                    <option value="Norway">Norway</option>
                    <option value="Oman">Oman</option>
                    <option value="Pakistan">Pakistan</option>
                    <option value="Palau">Palau</option>
                    <option value="Palestinian Territory, Occupied">Palestinian Territory,
                        Occupied</option>
                    <option value="Panama">Panama</option>
                    <option value="Papua New Guinea">Papua New Guinea</option>
                    <option value="Paraguay">Paraguay</option>
                    <option value="Peru">Peru</option>
                    <option value="Philippines">Philippines</option>
                    <option value="Pitcairn">Pitcairn</option>
                    <option value="Poland">Poland</option>
                    <option value="Portugal">Portugal</option>
                    <option value="Puerto Rico">Puerto Rico</option>
                    <option value="Qatar">Qatar</option>
                    <option value="Reunion">Reunion</option>
                    <option value="Romania">Romania</option>
                    <option value="Russian Federation">Russian Federation</option>
                    <option value="Rwanda">Rwanda</option>
                    <option value="Saint Helena">Saint Helena</option>
                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                    <option value="Saint Lucia">Saint Lucia</option>
                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon
                    </option>
                    <option value="Saint Vincent and The Grenadines">Saint Vincent and The
                        Grenadines</option>
                    <option value="Samoa">Samoa</option>
                    <option value="San Marino">San Marino</option>
                    <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                    <option value="Saudi Arabia">Saudi Arabia</option>
                    <option value="Senegal">Senegal</option>
                    <option value="Serbia">Serbia</option>
                    <option value="Seychelles">Seychelles</option>
                    <option value="Sierra Leone">Sierra Leone</option>
                    <option value="Singapore">Singapore</option>
                    <option value="Slovakia">Slovakia</option>
                    <option value="Slovenia">Slovenia</option>
                    <option value="Solomon Islands">Solomon Islands</option>
                    <option value="Somalia">Somalia</option>
                    <option value="South Africa">South Africa</option>
                    <option value="South Georgia and The South Sandwich Islands">South
                        Georgia and The South Sandwich Islands</option>
                    <option value="Spain">Spain</option>
                    <option value="Sri Lanka">Sri Lanka</option>
                    <option value="Sudan">Sudan</option>
                    <option value="Suriname">Suriname</option>
                    <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                    <option value="Swaziland">Swaziland</option>
                    <option value="Sweden">Sweden</option>
                    <option value="Switzerland">Switzerland</option>
                    <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                    <option value="Taiwan" >Taiwan</option>
                    <option value="Tajikistan">Tajikistan</option>
                    <option value="Tanzania, United Republic of">Tanzania, United Republic
                        of</option>
                    <option value="Thailand">Thailand</option>
                    <option value="Timor-leste">Timor-leste</option>
                    <option value="Togo">Togo</option>
                    <option value="Tokelau">Tokelau</option>
                    <option value="Tonga">Tonga</option>
                    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                    <option value="Tunisia">Tunisia</option>
                    <option value="Turkey">Turkey</option>
                    <option value="Turkmenistan">Turkmenistan</option>
                    <option value="Turks and Caicos Islands">Turks and Caicos Islands
                    </option>
                    <option value="Tuvalu">Tuvalu</option>
                    <option value="Uganda">Uganda</option>
                    <option value="Ukraine">Ukraine</option>
                    <option value="United Arab Emirates">United Arab Emirates</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="United States">United States</option>
                    <option value="United States Minor Outlying Islands">United States Minor
                        Outlying Islands</option>
                    <option value="Uruguay">Uruguay</option>
                    <option value="Uzbekistan">Uzbekistan</option>
                    <option value="Vanuatu">Vanuatu</option>
                    <option value="Venezuela">Venezuela</option>
                    <option value="Viet Nam">Viet Nam</option>
                    <option value="Virgin Islands, British">Virgin Islands, British</option>
                    <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                    <option value="Wallis and Futuna">Wallis and Futuna</option>
                    <option value="Western Sahara">Western Sahara</option>
                    <option value="Yemen">Yemen</option>
                    <option value="Zambia">Zambia</option>
                    <option value="Zimbabwe">Zimbabwe</option>
                </select>
                </div>

                <!--收件者姓名  -->
                <div class="insertData">
                  收件者姓名
                  <hr>
                  <input type="text" placeholder='${errors.order_name == null ? null:errors.order_name}' value='${user.order_name == null ? null:user.order_name}'
                    name="order_name" id="order_name">
                </div>
                <!-- 收件者地址 -->
  
                <div class="insertData2">
                  收件者地址                  
                  <hr>
                  <input type="text" placeholder='${errors.order_address == null ? null:errors.order_address}'
                    name="order_address" value='${user.order_address == null ? null:user.order_address}' id="order_address">
                  <input type="text" placeholder='${errors.order_postalcode == null ? null:errors.order_postalcode}'
                    name="order_postalcode" value='${user.order_postalcode == null ? null:user.order_postalcode}'
                    id="order_postalcode">
                </div>
                <br><br>
                <div class="insertData">
                  Email Address
                  <hr>
                  <input type="text" placeholder='${errors.order_email == null ? "Email":errors.order_email}'
                    value='${user.order_email == null ? null:user.order_email}' name="order_email" id="order_email">
                </div>
                <!--  -->
                <div class="insertData">
                  聯絡電話
                  <hr>
                  <input type="text" placeholder='${errors.order_phone == null ? null:errors.order_phone}' value='${user.order_phone == null ? null:user.order_phone}'
                    name="order_phone" id="order_phone">
                </div>
                <!--  -->
                <div class="insertData">
                  其它說明
                  <hr>
                  <textarea name="message" id="message" style="width: 100%; height: 150px;"></textarea>
                </div>
                <h3>商品確認</h3>
                <hr style="color: #ff703E; opacity: 1;">
                <div class="row">
                  <div class="col-lg-3">PRODUCT</div>
                  <div class="col-lg-5"></div>
                  <div class="col-lg-2">Quantity</div>
                  <div class="col-lg-2">PRICE</div>
                </div>
                <hr>


                <div class="rightDiv">
                  <br><br>
                  <c:if test="${not empty productList}">
                    <c:forEach varStatus="loop" begin="0" end="${productList.size()-1}" items="${productList}" var="p">
                      <div class="row">
                        <div class="col-lg-3"><img
                            src="${pageContext.request.contextPath}/images/product/${p.pictureurl}" alt="" width="100%">
                        </div>
                        <div class="col-lg-5">
                           <h4>${p.name}</h4>
                           <h5>${p.model}</h5>
                          ${p.product_group == "1" ?"":p.product_group} ${p.product_option} <br>
                          ${p.product_group2} ${p.product_option2} <br>
                          ${p.product_group3} ${p.product_option3} <br>
                         </div>
                        <div class="col-lg-2">x${p.num}</div>
                        <div class="col-lg-2">$${p.num * p.sellprice }</div>
                      </div>
                    </c:forEach>
                  </c:if>
                </div>
                <h3>Grand total</h3>
                <hr style="color: #ff703E; opacity: 1;">
                <div class="row">
                  <div class="col-lg-3"></div>
                  <div class="col-lg-5"></div>
                  <div class="col-lg-2">小記</div>
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
                  <div class="col-lg-2">Grand total</div>
                  <div class="col-lg-2">US$${total+400}</div>
                </div>
                <br>
                <div class="row">
                  <div class="col-lg-2 "><button class="reCart" type="button"
                      onclick="window.location.href ='${pageContext.request.contextPath}/shopCart'">＜ 購物車</button></div>
                  <div class="col-lg-8 "></div>
                  <div class="col-lg-2 " style="text-align: right;"><button class="submit"
                      type="submit">下一步:結帳＞</button></div>
                </div>

                <!-- 載入上次地址 -->
                <!-- <div class="row">
                  <div class="col-lg-6">
                    
                    <c:if test="${not empty user}">
                      <c:if test="${not empty orderList}">
                        <select name="orderAddress" id="orderAddress" onchange="changeAddress()">
                          <option selected>載入上次地址</option>
                          <c:forEach varStatus="loop" begin="0" end="${orderList.size()-1}" items="${orderList}"
                            var="s">
                            <option value="${loop.index}">${s.address} </option>
                          </c:forEach>
                        </select>
                      </c:if>
                    </c:if>



                  </div>
                  <div class="col-lg-6" style="text-align: right;"><button type="submit">submit</button></div>
                </div> -->
              </form>
            </div>

          </div>
          <div class="col-lg-1 "></div>
        </div>
      </div>
      <!-- 插入腳 -->

    </body>
    <jsp:include page="../shopBottom.jsp"></jsp:include>

    <script>
      function changeAddress() {
        console.log($("#orderAddress").val());
      }
      $(document).ready(function () {
        $("#copy").click(function () {
          if ($("#copy").prop("checked")) {
            $("#order_name").val($("#firstname").val()+" " +$("#lastname").val());
            $("#order_address").val($("#address").val());
            $("#order_postalcode").val($("#postalcode").val());
            $("#order_email").val($("#email").val());
            $("#order_phone").val($("#phone").val());

          } else {
            $("#order_name").val("");
            $("#order_address").val("");
            $("#order_postalcode").val("");
            $("#order_email").val("");
            $("#order_phone").val("");
          }
        });




      });
    </script>

    </html>