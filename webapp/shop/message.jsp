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
            <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>


            <title>Message</title>
        </head>
        <style>
            div {
                /* border: 1px solid black; */
            }

            .main a {
                text-decoration: none;
                color: #ff703E;
            }

            .divBorder {
                border: 1px solid black;
                border-top: 0px;
            }

            form div {
                /* border: 1px solid black; */
            }

            form input {
                margin: 5px 0;               
            }

            input[type='radio']:checked:after {
                width: 15px;
                height: 15px;
                border-radius: 15px;
                top: -2px;
                left: -1px;
                position: relative;
                background-color: #ff703E;
                ;
                content: '';
                display: inline-block;
                visibility: visible;
                border: 1px solid #ff703E;
                ;
            }

            .yesBuyProduct {
                visibility: visible;
                position: relative;
            }

            .noBuyProduct {
                /* visibility: hidden; */
                position: absolute;
                bottom: 2500px;
            }

            #t1,
            #t2,
            #t3 {
                margin: 10px;
            }

            ${
                errors==null ? null:"input::placeholder{color: red;}"
            }
        </style>

        <body>
            <!-- 插入頭部 -->
            <jsp:include page="../shopTop.jsp"></jsp:include>
            <br><br>
            <!-- 中間身體 -->
            <div class="container-fluid main">
                <div class="row">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8" style="position: relative;">
                        <div class="row">
                            <div class="col-lg-6">
                                <h5 style="color: #ff703E;">請問您是否已經像我們購買了產品?</h5>
                            </div>
                            <div class="col-lg-6" style="text-align: right;">${sessionScope.user == null ? "Already have an account?<a  href='../login.jsp'>Login </a>":""}</a></div>
                        </div>

                        <input id="b1" name="job" type="radio" checked value="yyy" style="background-color: #ff703E;">
                        <label for="b1">Yes,我有產品技術上的問題想詢問</label><br>
                        <input id="b2" name="job" type="radio" value="nnn">
                        <label for="b2">No,我有產品選型上的困難,請協助我選擇適合的產品</label>

                    </div>
                </div>
                <!-- yesBuyProduct -->
                <div class="row yesBuyProduct">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8 ">
                        <br><br>
                        <div class="row" style="background-color: #ff703E;">
                            <div class="col-lg-1">基本資料</div>
                        </div>
                        <div class="row">
                            <form action="${pageContext.request.contextPath}/message" method="post">
                                <div class="row divBorder">
                                    <div class="row">
                                        <div class="col-lg-3">Contact Name:(必填)</div>
                                        <div class="col-lg-9 ">
                                            <input type="text" name="firstname"
                                                    style="width: 49%;" placeholder='${errors.firstname == null ? "First name":errors.firstname}' value="${sessionScope.user == null ?firstname:user.firstname}">
                                                    &nbsp;<input type="text" name="lastname"
                                                    style="width: 49%;" placeholder='${errors.lastname == null? "Last name":errors.lastname}' value="${sessionScope.user == null ?lastname:user.lastname}">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Organization:</div>
                                        <div class="col-lg-9"><input type="text" name="company" style="width: 99%;" placeholder='${errors.company}'
                                                value="${sessionScope.user == null ?company:user.company}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"> Contact Email:(必填)</div>
                                        <div class="col-lg-9"><input type="email" name="email" style="width: 99%;" placeholder='${errors.email}'
                                                value="${sessionScope.user == null ?email:user.email}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Contact Phone:</div>
                                        <div class="col-lg-9"><input type="text" name="phone" style="width: 99%;" placeholder='${errors.phone}'
                                                value="${sessionScope.user == null ?phone:user.phone}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Country</div>
                                        <div class="col-lg-9">
                                            <select id="country" name="country" class="form-control" style="width: 99%;">
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
                                                <option value="Armenia">Armenia</option>
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
                                                <option value="Taiwan" selected>Taiwan</option>
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
                                    </div>
                                </div>
                                <br>

                                <div class="row" style="background-color: #ff703E;">
                                    <span class="col-lg-10">您所購買的產品型號</span>
                                </div>
                                <div class="row divBorder">
                                    <div class="col-lg-3">Product model:</div>
                                    <div class="col-lg-9"><input type="text" name="product_model" style="width: 96%;"
                                            value="${product_model}">
                                    </div>
                                </div>

                                <br>


                                <div class="row" style="background-color: #ff703E;">
                                    <span class="col-lg-10">你所遇到的技術問題狀況</span>
                                </div>
                                <div class="row divBorder">
                                    <div class="col-lg-3">message:</div>
                                    <div class="col-lg-9"><br><textarea name="message" id="message"
                                            style="width: 96%; height: 150px;">${message}</textarea><br><br>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="g-recaptcha "
                                            data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                                            data-callback='verifyCallback' data-action='ubmit'>Submit </div>
                                        <br> <span class="error checkerror">${errors.recaptcha}</span>
                                    </div>
                                    <div class="col-lg-3">
                                        <br>
                                        <button type="submit" class="btn  btn-sm"
                                            style="width: 100px; color: white; background-color: #ff703E;">Send</button>
                                        <button type="button" class="btn btn-secondary btn-sm"
                                            style="width: 100px;">Clear</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

                <!-- noBuyProduct//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
                <div class="row noBuyProduct">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8 ">
                        <br><br>
                        <div class="row" style="background-color: #ff703E;">
                            <div class="col-lg-10">基本資料</div>
                        </div>
                        <div class="row">
                            <form action="${pageContext.request.contextPath}/message" method="post">
                                <div class="row divBorder">
                                    <div class="row">
                                        <div class="col-lg-3">Contact Name:(必填)</div>
                                        <div class="col-lg-9 ">
                                            <input type="text" name="firstname"
                                                    style="width: 49%;" placeholder='${errors.firstname == null ? "First name":errors.firstname}' value="${sessionScope.user == null ?firstname:user.firstname}">
                                            
                                                    &nbsp;<input type="text" name="lastname"
                                                    style="width: 49%;" placeholder='${errors.lastname == null? "Last name":errors.lastname}' value="${sessionScope.user == null ?lastname:user.lastname}">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Organization:</div>
                                        <div class="col-lg-9"><input type="text" name="company" style="width: 99%;" placeholder='${errors.company}'
                                                value="${sessionScope.user == null ?company:user.company}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"> Contact Email:(必填)</div>
                                        <div class="col-lg-9"><input type="email" name="email" style="width: 99%;" placeholder='${errors.email}'
                                                value="${sessionScope.user == null ?email:user.email}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Contact Phone:</div>
                                        <div class="col-lg-9"><input type="text" name="phone" style="width: 99%;" placeholder='${errors.phone}'
                                                value="${sessionScope.user == null ?phone:user.phone}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">Country</div>
                                        <div class="col-lg-9">
                                            <select id="country" name="country" class="form-control"style="width: 99%;>
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
                                                <option value="Armenia">Armenia</option>
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
                                                <option value="Taiwan" selected>Taiwan</option>
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
                                    </div>
                                </div>
                                <br>
                                <!--  -->
                                <div class="row" style="background-color: #ff703E;">
                                    <span class="col-lg-10">您想購買的種類</span>
                                </div>
                                <div class="row divBorder">
                                    <div>
                                        <input id="t1" name="productType" type="radio" checked value="感測器" >
                                        <label for="t1">感測器</label><br>
                                        <input id="t2" name="productType" type="radio" value="感測器">
                                        <label for="t2">儀器儀表</label><br>
                                        <input id="t3" name="productType" type="radio" value="otherQ">
                                        <label for="t3">其它問題</label>
                                        <select name="otherQ" id="">
                                            <option value="Sales inquiries" selected>Sales inquiries</option>
                                            <option value="Markwting/Distribution inquiries">Markwting/Distribution
                                                inquiries</option>
                                            <option value="Supplier/Prosurement inquiries">Supplier/Prosurement
                                                inquiries</option>
                                            <option value="Compary inquiries">Compary inquiries</option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <!--  -->
                                <div class="row" style="background-color: #ff703E;">
                                    <span class="col-lg-10">為了幫助我們選擇.....選擇您產品所應用的行業</span>
                                </div>
                                <div class="row divBorder">
                                    <div class="col-lg-3">
                                        <input id="industry1" name="industry" type="radio" value="製造業">
                                        <label for="industry1">製造業</label><br>
                                        <input id="industry2" name="industry" type="radio" checked value="工程顧問">
                                        <label for="industry2">工程顧問</label><br>
                                        <input id="industry3" name="industry" type="radio" value="貿易相關">
                                        <label for="industry3">貿易相關</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <input id="industry4" name="industry" type="radio" value="建築營造">
                                        <label for="industry4">建築營造</label><br>
                                        <input id="industry5" name="industry" type="radio" value="學校/研究/公家機關">
                                        <label for="industry5">學校/研究/公家機關</label><br>
                                        <input id="industry6" name="industry" type="radio" value="精密電子業">
                                        <label for="industry6">精密電子業</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <input id="industry7" name="industry" type="radio" value="輕/重工業">
                                        <label for="industry7">輕/重工業</label><br>
                                        <input id="industry8" name="industry" type="radio" value="畜牧農業">
                                        <label for="industry8">畜牧農業</label><br>
                                        <input id="industry9" name="industry" type="radio" value="石化行業">
                                        <label for="industry9">石化行業</label>
                                    </div>
                                    <div class="col-lg-3">
                                        <br>
                                        <input id="industry10" name="industry" type="radio" value="orderIndustry">
                                        <label for="industry10">其它</label>
                                        <textarea name="orderIndustry" id="message"
                                            style="width: 80%; height: 40px;"></textarea>

                                    </div>
                                </div>
                                <br>
                                <!--  -->


                                <div class="row" style="background-color: #ff703E;">
                                    <span class="col-lg-10">你所遇到的技術問題狀況</span>
                                </div>
                                <div class="row divBorder">
                                    <div class="col-lg-3">message:</div>
                                    <div class="col-lg-9"><br><textarea name="message" id="message"
                                            style="width: 100%; height: 150px;">${message} </textarea><br><br>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="g-recaptcha "
                                            data-sitekey="6LdUNRobAAAAAJJakDhDglshLFmwJP1P2c12MBdP"
                                            data-callback='verifyCallback' data-action='ubmit'>Submit </div>
                                        <br> <span class="error checkerror">${errors.recaptcha}</span>
                                    </div>
                                    <div class="col-lg-3">
                                        <br>
                                        <button type="submit" class="btn  btn-sm"
                                            style="width: 100px; color: white; background-color: #ff703E;">Send</button>
                                        <button type="button" class="btn btn-secondary btn-sm"
                                            style="width: 100px;">Clear</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 插入腳 -->
            <jsp:include page="../shopBottom.jsp"></jsp:include>
        </body>


        <script>
            $(document).ready(function () {
                $('input[type=radio][name=job]').change(function () {
                    if (this.value == 'yyy') {
                        // $(".noBuyProduct").css("visibility","hidden");
                        $(".noBuyProduct").css("position", "absolute");
                        $(".yesBuyProduct").css("visibility", "visible");
                        $(".yesBuyProduct").css("position", "relative");
                        $(".noBuyProduct").css("bottom", "2500px");
                    }
                    else if (this.value == 'nnn') {
                        $(".yesBuyProduct").css("visibility", "hidden");
                        $(".yesBuyProduct").css("position", "absolute");
                        $(".noBuyProduct").css("visibility", "visible");
                        $(".noBuyProduct").css("position", "relative");
                        $(".noBuyProduct").css("bottom", "0");
                    }
                });
            });
            // $('input[name*=radioName]:checked').val()
        </script>

        </html>