appMain.service('orderService', ['ajaxService', function (ajaxService) {
    this.searchOrder = function (data, successFunction, errorFunction) {
        ajaxService.AjaxPost(data, "api/order/searchorder", successFunction, errorFunction);
    };

    this.getPaymentMethods = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/order/getpaymentmethods", successFunction, errorFunction);
    };
    
    this.getCart = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/order/getcart", successFunction, errorFunction);
    };
    this.createShipping = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPost(model, "/api/order/createshipping", successFunction, errorFunction);
    };
    this.updateShipping = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPost(model, "/api/order/updateshipping", successFunction, errorFunction);
    };
    this.checkout = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPost(model, "/api/order/checkout", successFunction, errorFunction);
    };

    this.getProvinces = function (successFunction, errorFunction) {
        ajaxService.AjaxGet("/api/common/getprovinces", successFunction, errorFunction);
    };
    this.getDistricts = function (data, successFunction, errorFunction) {
        ajaxService.AjaxGetWithData(data, "/api/common/getdistricts", successFunction, errorFunction);
    };

    this.addToCard = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPost(model, "/api/order/addtocard", successFunction, errorFunction);
    };
    this.updateItemCart = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPut(model, "/api/order/updateitemcart", successFunction, errorFunction);
    };
    this.removeItemCart = function (id, successFunction, errorFunction) {
        ajaxService.AjaxPut(id, "/api/order/removeitemcart", successFunction, errorFunction);
    };
       
}]);









