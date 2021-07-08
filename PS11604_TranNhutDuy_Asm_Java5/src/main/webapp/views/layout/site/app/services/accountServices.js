appMain.service('accountService', ['ajaxService', function (ajaxService) {
    this.getAccount = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/account/getaccount", successFunction, errorFunction);
    };

    this.getProvinces = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/common/getprovinces", successFunction, errorFunction);
    };
    this.getDistricts = function (data, successFunction, errorFunction) {
        ajaxService.AjaxGetWithData(data, "/api/common/getdistricts", successFunction, errorFunction);
    };

    this.login = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPost(data, "api/account/login", successFunction, errorFunction);
    };
    this.changePassword = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPost(data, "api/account/changepassword", successFunction, errorFunction);
    };
    this.forgetPassword = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPost(data, "api/account/forgetpassword", successFunction, errorFunction);
    };
    this.register = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPost(data, "api/account/register", successFunction, errorFunction);
    };
    this.update = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPut(data, "api/account/update", successFunction, errorFunction);
    };
    this.signOut = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/account/signout", successFunction, errorFunction);
    };
}]);









