<%-- 
    Document   : UserProfile
    Created on : Jun 13, 2023, 11:54:34 AM
    Author     : dell
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="../../css/account.css" rel="stylesheet" type="text/css"/>
        <script src="script.js"></script>
    </head>
    <%@ include file="../../includes/header.jsp" %>
    <body>
        <div class="row container-home"
             style="padding-left: 12%;padding-right: 64px; padding-top: 60px; padding-bottom: 60px; width: 100%;">
            <div class="col-lg-3 px-2">
                <!-- Left section -->
                <div class="nav group__left__account mb-3" style="display: block;" role="tablist">
                    <h4 style="font-weight: 200;">
                        TRANG TÀI KHOẢN
                    </h4>
                    <h6 style="font-weight: bold;">Xin chào, ${sessionScope.account.fullName}!</h6>
                    <div class="mt-4 mb-2 active left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-accounts" type="button" role="tab">
                        Thông tin tài khoản
                    </div>
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-carts" type="button" role="tab">
                        Đơn hàng của bạn
                    </div>
                    <div class="mb-2 left__account" style="font-size: 17px;" data-bs-toggle="pill"
                         data-bs-target="#pills-password" type="button" role="tab">
                        Đổi mật khẩu
                    </div>
                    <!--                     Not do in this phase  
                                        <div class="mb-2 left__account" style="font-size: 17px;">Sổ địa chỉ</div>-->
                    <!-- Action to sign out  -->
                    <div class="mb-2 left__account" style="font-size: 17px;">Đăng xuất</div>
                </div>
            </div>
            <div class="col-lg-9 px-2">
                <!-- Right Section  -->
                <div class="tab-content mb-3">
                    <!-- This section is use for account tab  -->
                    <section class="tab-pane fade show active" id="pills-accounts">
                        <h3 style="font-weight: 300;">
                            TRANG TÀI KHOẢN
                        </h3>
                        <p class="mt-4"><span style="font-weight: bold;">Họ tên: </span>${sessionScope.account.fullName}</p>
                        <p><span style="font-weight: bold;">Email:</span> ${sessionScope.account.email}</p>
                        <p><span style="font-weight: bold;">Phone:</span> ${sessionScope.account.phone}</p>
                        <p><span style="font-weight: bold;">Address:</span> ${sessionScope.account.address}</p>
                    </section>

                    <!-- This section is use for see cart tab  -->
                    <section class="tab-pane fade show" id="pills-carts">
                        <h3 style="font-weight: 300;">
                            Đơn hàng của bạn
                        </h3>
                        <div class="mt-4">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Đơn hàng</th>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Địa chỉ</th>
                                        <th scope="col">Giá trị đơn hàng</th>
                                        <th scope="col">TT thanh toán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${sessionScope.orders.size() != 0}">
                                        <c:set value="${sessionScope.orders.size()}" var="orderSize"></c:set>
                                        <c:forEach begin="0" step="1" end="${orderSize-1}" var="i">
                                            <tr>
                                                <th scope="row">${i+1}</th>
                                                <td>${sessionScope.orders.get(i).dateTime}</td>
                                                <td>${sessionScope.orders.get(i).customerAddress}</td>
                                                <fmt:formatNumber value="${sessionScope.orders.get(i).totalOrder}" pattern="#,##0.000" var="formattedNumber" />
                                                <td> ${formattedNumber}đ</td>
                                                <td>${sessionScope.orders.get(i).paymentMethod.paymentMethod}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <!-- This section is use for change password  -->
                    <section class="tab-pane fade show" id="pills-password">
                        <h3 style="font-weight: 300;">
                            ĐỔI MẬT KHẨU
                        </h3>
                        <p class="mt-4">Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự
                        </p>
                        <form class="mt-2" id="frm-changePass" action="chagePassword" method="post">
                            <h6>MẬT KHẨU <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Mật khẩu cũ"
                                   aria-label="Username" oninput="validateOldPass(this)" name="oldPass">
                            <h6 class="mt-3">MẬT KHẨU MỚI <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" id="newPass" placeholder="Mật khẩu mới"
                                   aria-label="Username" oninput="validateNewPass(this)" name="newPass">
                            <h6 class="mt-3">XÁC NHẬN LẠI MẬT KHẨU <span class="text-danger">*</span></h6>
                            <input type="password" class="form-control mb-2" placeholder="Xác nhận lại mật khẩu"
                                   aria-label="Username" oninput="validateCfPass(this)">
                            <span id="error-cfPass" style="color: red; display: none;"></span>
                            <button type="button" class="btn btn-dark mt-4" onclick="changePass()">Đặt lại mật khẩu</button>
                        </form>
                    </section>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
        <script>
                                var checkOldPass = false;
                                var checkNewPass = false;
                                var confirmPass = false;
                                function changePass() {
                                    if (confirmPass && newPass && checkOldPass) {
                                        document.getElementById('frm-changePass').submit();
                                    } else {
                                        alert("Kiem tra lai thong tin!");
                                    }
                                }
                                function validateOldPass(input) {
                                    var value = input.value;
                                    if (value.trim() !== '') {
                                        checkOldPass = true;
                                    } else {
                                        checkOldPass = false;
                                    }
                                }

                                function validateNewPass(input) {
                                    var value = input.value;
                                    if (value.trim() !== '') {
                                        checkNewPass = true;
                                    } else {
                                        checkNewPass = false;
                                    }
                                }
                                function validateCfPass(input) {
                                    var value = input.value;
                                    var newPass = document.getElementById('newPass').value;
                                    if (value !== newPass) {
                                        document.getElementById('error-cfPass').textContent = "Mật khẩu xác nhận không giống mật khẩu mới!";
                                        document.getElementById('error-cfPass').style.display = "block";
                                        confirmPass = false;
                                    } else {
                                        document.getElementById('error-cfPass').textContent = "";
                                        document.getElementById('error-cfPass').style.display = "none";
                                        confirmPass = true;
                                    }
                                }


        </script>
    </body>
    <%@ include file="../../includes/footer.jsp" %>
</html>
