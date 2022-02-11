<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2/11/2022
  Time: 8:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="taglib.jsp" %>

<div class="address-section">
    <form action="${pageContext.request.contextPath}/update_address" method="post"
          onsubmit="return checkAddressForm()" accept-charset="utf-8">
        <div class="address-form-bd">
            <div class="address-form-left">
                <div class="mod-input mod-input-name">
                    <label for="name">Họ và tên</label>
                    <input type="text" class="full-name" name="full-name" id="name"
                           value="${address.fullName}" placeholder="Họ và tên"
                           onfocusout="checkName(this.id)" required>
                    <div class="require" id="require-name" style="display: none">
                        Tên không chứa ký tự đặc biệt hoặc số
                    </div>
                    <div class="require" id="require-name-length" style="display: none">
                        Tên phải có ít nhất 5 ký tự
                    </div>
                </div>
                <div class="mod-input mod-input-phone">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" class="phone-number" name="phone-number" id="phone"
                           value="${address.phone}" placeholder="Số điện thoại"
                           onfocusout="checkPhone(this.id)" required>
                    <div class="require" id="require-phone" style="display: none;">
                        Số điện thoại không hợp lệ
                    </div>
                </div>

            </div>
            <div class="address-form-right">
                <div class="mod-input mod-input-province">
                    <label for="ls_province">Tỉnh/ Thành phố</label>
                    <select name="ls_province" id="ls_province" required></select>
                </div>
                <div class="mod-input mod-input-district">
                    <label for="ls_district">Quận/ Huyện</label>
                    <select name="ls_district" id="ls_district" required>
                        <option value="${address.district}" selected>${address.district}</option>
                    </select>
                </div>
                <div class="mod-input mod-input-ward">
                    <label for="ls_ward">Phường/ Xã</label>
                    <select name="ls_ward" id="ls_ward" required>
                        <option value="${address.ward}" selected>${address.ward}</option>
                    </select>
                </div>
                <div class="mod-input mod-input-address-details">
                    <label for="address-detail">Địa chỉ chi tiết</label>
                    <input type="text" name="address-details" id="address-detail"
                           placeholder="Địa chỉ cụ thể"
                           value="${address.detail}" required>
                </div>

                <label>Loại địa chỉ:</label>
                <div class="type-address">
                    <input type="radio"
                           name="type-address" ${address.typeAddress=="home"?"checked":""}
                           value="home" required>
                    <label>Nhà riêng</label>
                    <input type="radio"
                           name="type-address" ${address.typeAddress=="company"?"checked":""}
                           value="company" required>
                    <label>Công ty</label>
                </div>

                <div class="btn-section">
                    <a href="${pageContext.request.contextPath}/address_deliver"
                       class="button btn btn-danger">Hủy</a>
                    <button type="submit" class="button btn btn-primary">Lưu</button>
                </div>
            </div>
        </div>
    </form>
</div>


