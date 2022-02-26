<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2/26/2022
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="taglib.jsp" %>

<div id="wrap-address">
    <c:if test="${sessionScope.address==null}">
        <div class="new-address" id="new-address">
            <button onclick="newAddress()" type="button"><i class="fas fa-plus"></i> Thêm địa chỉ
            </button>
        </div>
    </c:if>
    <c:if test="${sessionScope.address!=null}">
        <div class="show-address" id="show-address">
            <div class="infor">
                <div class="name">Tên: <span
                        class="black-color"> ${sessionScope.address.fullName}</span>
                </div>
                <div class="address">
                    <span>Địa chỉ: </span>
                    <span class="black-color"> ${sessionScope.address.detail}, ${sessionScope.address.ward}, ${sessionScope.address.district}, ${sessionScope.address.province}</span>
                </div>
                <div class="phone">
                    <span>Điện thoại: </span>
                    <span class="black-color"> ${sessionScope.address.phone}</span>
                </div>
            </div>
            <div class="action">
                <button onclick="editAddress()" class="text-blue">Chỉnh sửa</button>
            </div>
        </div>
    </c:if>
</div>
<div class="edit-address" id="edit-address" style="display: none;">
    <div class="address-section">
        <form action="${pageContext.request.contextPath}/update_address_checkout" method="post"
              onsubmit="return checkAddressForm()" accept-charset="utf-8" id="form-address">
            <div class="address-form-bd">
                <div class="address-form-left">
                    <div class="mod-input mod-input-name">
                        <label for="name">Họ và tên</label>
                        <input type="text" class="full-name" name="full-name" id="name"
                               value="${sessionScope.address.fullName}" placeholder="Họ và tên"
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
                               value="${sessionScope.address.phone}" placeholder="Số điện thoại"
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
                            <option value="${sessionScope.address.district}"
                                    selected>${sessionScope.address.district}</option>
                        </select>
                    </div>
                    <div class="mod-input mod-input-ward">
                        <label for="ls_ward">Phường/ Xã</label>
                        <select name="ls_ward" id="ls_ward" required>
                            <option value="${sessionScope.address.ward}"
                                    selected>${sessionScope.address.ward}</option>
                        </select>
                    </div>
                    <div class="mod-input mod-input-address-details">
                        <label for="address-detail">Địa chỉ chi tiết</label>
                        <input type="text" name="address-details" id="address-detail"
                               placeholder="Địa chỉ cụ thể"
                               value="${sessionScope.address.detail}" required>
                    </div>

                    <label>Loại địa chỉ:</label>
                    <div class="type-address">
                        <input type="radio"
                               name="type-address" ${sessionScope.address.typeAddress=="home"?"checked":""}
                               value="home" required>
                        <label>Nhà riêng</label>
                        <input type="radio"
                               name="type-address" ${sessionScope.address.typeAddress=="company"?"checked":""}
                               value="company" required>
                        <label>Công ty</label>
                    </div>

                    <div class="btn-section">
                        <button onclick="closeEdit(${sessionScope.address==null})" type="button"
                                class="button btn btn-danger">Hủy
                        </button>
                        <button type="submit" class="button btn btn-primary">Lưu</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
