function vali_isEmail(text) {
    const regex = /^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
    return regex.test(text);
}

function vali_Password(password) {
    const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return regex.test(password)
}

function removeAscent(str) {
    if (str === null || str === undefined) return str;
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    return str;
}

function vali_FullName(name) {
    const regex = /^[a-zA-Z ]{2,}$/g;
    return regex.test(removeAscent(name));
}

function vali_Code(code) {
    const regex = /^[0-9]+$/;
    return regex.test(code);
}

function vali_PhoneNumber(phoneNumber) {
    const regex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    return regex.test(phoneNumber);
}

var ckeckEmailkk = false;

function checkEmail(id) {
    const s = document.getElementById(id).value;
    if (!vali_isEmail(s)) {
        document.getElementById("require-email").style.display = "block";
        ckeckEmailkk = false;
    }
    if (vali_isEmail(s)) {
        document.getElementById("require-email").style.display = "none";
        ckeckEmailkk = true;
    }
}


function checkSendEmail() {
    return ckeckEmailkk;
}


var isValidConform = false;
var isValidPassword = false;
var isValidName = false;
var isValidCode = false;
var isValidPhone = false;

function checkPasswordConfirm(id) {
    const pass = document.getElementById("password").value;
    const pass_confirm = document.getElementById(id).value;
    if (!(pass === pass_confirm)) {
        document.getElementById("require-password-confirm").style.display = "block";
        isValidConform = false;
    } else {
        document.getElementById("require-password-confirm").style.display = "none";
        isValidConform = true;
    }
}

function checkPassword(id) {
    const pass = document.getElementById(id).value;
    if (!vali_Password(pass)) {
        document.getElementById("require-password").style.display = "block";
        isValidPassword = false;
    } else {
        document.getElementById("require-password").style.display = "none";
        isValidPassword = true;
    }
}

function checkName(id) {
    let name = document.getElementById(id).value;
    name = name.trim();
    if (name.length < 5) {
        document.getElementById("require-name-length").style.display = "block";
        isValidName = false;
    } else {
        document.getElementById("require-name-length").style.display = "none";
        if (!vali_FullName(name)) {
            document.getElementById("require-name").style.display = "block";
        } else {
            document.getElementById("require-name").style.display = "none";
            isValidName = true;
        }
    }

}

function checkCode(id) {
    const code = document.getElementById(id).value;
    if (!vali_Code(code)) {
        document.getElementById("require-code").style.display = "block";
        isValidCode = false;
    } else {
        document.getElementById("require-code").style.display = "none";
        if (code.trim().length !== 6) {
            document.getElementById("require-code-length").style.display = "block";
        } else {
            document.getElementById("require-code-length").style.display = "none";
            isValidCode = true;
        }
    }
}

function checkPhone(id) {
    const phone = document.getElementById(id).value;
    if (!vali_PhoneNumber(phone)) {
        document.getElementById("require-phone").style.display = "block";
        isValidPhone = false;
    } else {
        document.getElementById("require-phone").style.display = "none";
        isValidPhone = true;
    }
}

function checkUpdateProfile() {
    return isValidName;
}

function checkResetPassword() {
    return isValidPassword && isValidConform;
}
function checkCodeForgot(){
    return isValidCode;
}

function checkRegister() {
    return isValidCode && isValidPassword && isValidName && isValidConform;
}

function checkAddressForm(){
    return isValidPhone && isValidName;
}
