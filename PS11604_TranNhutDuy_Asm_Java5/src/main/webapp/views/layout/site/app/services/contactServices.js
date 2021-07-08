appMain.service('contactService', ['ajaxService', function (ajaxService) {
    this.sendContact = function (model, successFunction, errorFunction) {
        ajaxService.AjaxPost(model, "/api/contact/sendcontact", successFunction, errorFunction);
    };
}]);









