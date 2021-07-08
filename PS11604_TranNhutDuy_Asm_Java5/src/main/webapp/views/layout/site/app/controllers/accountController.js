appMain.controller('accountController', function ($scope, $rootScope, $location, $window, accountService, alertsService) {
    $scope.initController = function () {
        $scope.initObject();
    }

    $scope.initRegisterController = function () {
        $scope.IsSuccess = false;
        $scope.IsError = false;
        $scope.InValid = false;

        var numberOfYears = (new Date()).getYear() - 10;
        var years = $.map($(Array(numberOfYears)), function (val, i) { return i + 1900; });
        var months = $.map($(Array(12)), function (val, i) { return i + 1; });
        var days = $.map($(Array(31)), function (val, i) { return i + 1; });

        var isLeapYear = function () {
            var year = $scope.SelectedYear || 0;
            return ((year % 400 === 0 || year % 100 !== 0) && (year % 4 === 0)) ? 1 : 0;
        }

        var getNumberOfDaysInMonth = function () {
            var selectedMonth = $scope.SelectedMonth || 0;
            return 31 - ((selectedMonth === 2) ? (3 - isLeapYear()) : ((selectedMonth - 1) % 7 % 2));
        }

        $scope.UpdateNumberOfDays = function () {
            $scope.NumberOfDays = getNumberOfDaysInMonth();
        }
        $scope.NumberOfDays = 31;
        $scope.Years = years;
        $scope.Days = days;
        $scope.Months = months;

        $scope.SelectedMonth = 1;
        $scope.SelectedYear = 1997;
        $scope.SelectedDay = 1;
        $scope.GenderId = 0;

        $scope.Genders = [{ Id: 0, Name: "Nữ" }, { Id: 1, Name: "Nam" }];
        accountService.getProvinces($scope.getProvincesCompleted, $scope.getError);
    }
    $scope.initPersonalController = function () {
        $scope.IsSuccess = false;
        $scope.IsError = false;
        $scope.InValid = false;

        var numberOfYears = (new Date()).getYear() - 10;
        var years = $.map($(Array(numberOfYears)), function (val, i) { return i + 1900; });
        var months = $.map($(Array(12)), function (val, i) { return i + 1; });
        var days = $.map($(Array(31)), function (val, i) { return i + 1; });

        var isLeapYear = function () {
            var year = $scope.SelectedYear || 0;
            return ((year % 400 === 0 || year % 100 !== 0) && (year % 4 === 0)) ? 1 : 0;
        }

        var getNumberOfDaysInMonth = function () {
            var selectedMonth = $scope.SelectedMonth || 0;
            return 31 - ((selectedMonth === 2) ? (3 - isLeapYear()) : ((selectedMonth - 1) % 7 % 2));
        }

        $scope.UpdateNumberOfDays = function () {
            $scope.NumberOfDays = getNumberOfDaysInMonth();
        }
        $scope.NumberOfDays = 31;
        $scope.Years = years;
        $scope.Days = days;
        $scope.Months = months;

        $scope.Genders = [{ Id: 0, Name: "Nữ" }, { Id: 1, Name: "Nam" }];
        accountService.getProvinces($scope.getProvinceUpdateCompleted, $scope.getError);
        accountService.getAccount($scope.getAccountCompleted, $scope.getError);
    }
    $scope.getAccountCompleted = function (response) {

        $scope.Id = response.Data.Id;
        $scope.Address = response.Data.Address;
        $scope.CreatedDate = response.Data.CreatedDate;
        $scope.DateOfBirth = response.Data.DateOfBirth;
        $scope.DistrictId = response.Data.DistrictId;
        $scope.Email = response.Data.Email;
        $scope.Gender = response.Data.Gender;
        $scope.GenderId = response.Data.GenderId;
        $scope.Month = response.Data.Month;
        $scope.Year = response.Data.Year;
        $scope.Day = response.Data.Day;
        $scope.Inactive = response.Data.Inactive;
        $scope.Name = response.Data.Name;
        $scope.Password = response.Data.Password;
        $scope.RePassword = response.Data.RePassword;
        $scope.Phone = response.Data.Phone;
        $scope.ProvinceId = response.Data.ProvinceId;
        $scope.Avatar = response.Data.Avatar;
        $scope.Code = response.Data.Code;
        $scope.IsNewsLetter = response.Data.IsNewsLetter;
        $scope.getDistrictUpdate($scope.ProvinceId);

        $scope.SelectedMonth = $scope.Month;
        $scope.SelectedYear = $scope.Year;
        $scope.SelectedDay = $scope.Day;
    }
    $scope.getProvincesCompleted = function (response) {
        if (response.Records.length > 0) {
            $scope.ProvinceId = response.Records[0].Id;
            $scope.getDistricts(response.Records[0].Id);
        }
        $scope.Provinces = response.Records;
    }
    $scope.getProvinceUpdateCompleted = function (response) {
        $scope.Provinces = response.Records;
    }

    $scope.getDistricts = function (provinceId) {
        var obj = new Object();
        obj.provinceId = provinceId;
        accountService.getDistricts(obj, $scope.getDistrictsCompleted, $scope.getError);
    }
    $scope.getDistrictsCompleted = function (response) {
        if (response.Records.length > 0)
            $scope.DistrictId = response.Records[0].Id;
        $scope.Districts = response.Records;
    }
    $scope.getDistrictUpdate = function (provinceId) {
        var obj = new Object();
        obj.provinceId = provinceId;
        accountService.getDistricts(obj, $scope.getDistrictUpdateCompleted, $scope.getError);
    }
    $scope.getDistrictUpdateCompleted = function (response) {
        $scope.Districts = response.Records;
    }

    $scope.initObject = function () {
        $scope.IsSuccess = false;
        $scope.IsError = false;
        $scope.InValid = false;
    }
    $scope.login = function (response) {
        var obj = new Object();
        obj.Email = $scope.Email;
        obj.Password = $scope.Password;
        accountService.login(obj, $scope.loginCompleted, $scope.loginError);
    }
    $scope.loginCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $window.location.href = "/thong-tin-tai-khoan.html";
    }
    $scope.loginError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }

    $scope.changePassword = function (response) {
        var obj = new Object();
        obj.PasswordOld = $scope.PasswordOld;
        obj.Password = $scope.Password;
        obj.RePassword = $scope.RePassword;
        accountService.changePassword(obj, $scope.changePasswordCompleted, $scope.changePasswordError);
    }
    $scope.changePasswordCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
    }
    $scope.changePasswordError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }

    $scope.forgetPassword = function (response) {
        var obj = new Object();
        obj.Email = $scope.Email;
        obj.Captcha = $scope.Captcha;
        accountService.forgetPassword(obj, $scope.forgetPasswordCompleted, $scope.forgetPasswordError);
    }
    $scope.forgetPasswordCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
    }
    $scope.forgetPasswordError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }

    $scope.signOut = function (response) {
        accountService.signOut($scope.signOutCompleted, $scope.signOutError);
    }
    $scope.signOutCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $window.location.href = "/trang-chu.html";
    }
    $scope.signOutError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }

    $scope.register = function (response) {
        var obj = {
            Id: $scope.Id,
            Address: $scope.Address,
            CreatedDate: $scope.CreatedDate,
            DateOfBirth: new Date($scope.SelectedYear, $scope.SelectedMonth - 1, $scope.SelectedDay + 1),
            DistrictId: $scope.DistrictId,
            Email: $scope.Email,
            Gender: $scope.Gender,
            GenderId: $scope.GenderId,
            Inactive: $scope.Inactive,
            Name: $scope.Name,
            Password: $scope.Password,
            RePassword: $scope.RePassword,
            Phone: $scope.Phone,
            ProvinceId: $scope.ProvinceId,
            Avatar: $scope.Avatar,
            Code: $scope.Code,
            IsNewsLetter: $scope.IsNewsLetter,
        };
        accountService.register(obj, $scope.registerCompleted, $scope.registerError);
    }
    $scope.registerCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $window.location.href = "/trang-chu.html";
    }
    $scope.registerError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }

    $scope.update = function (response) {
        var obj = {
            Id: $scope.Id,
            Address: $scope.Address,
            CreatedDate: $scope.CreatedDate,
            DateOfBirth: new Date($scope.SelectedYear, $scope.SelectedMonth - 1, $scope.SelectedDay + 1),
            DistrictId: $scope.DistrictId,
            Email: $scope.Email,
            Gender: $scope.Gender,
            GenderId: $scope.GenderId,
            Inactive: $scope.Inactive,
            Name: $scope.Name,
            Password: $scope.Password,
            RePassword: $scope.RePassword,
            Phone: $scope.Phone,
            ProvinceId: $scope.ProvinceId,
            Avatar: $scope.Avatar,
            Code: $scope.Code,
            IsNewsLetter: $scope.IsNewsLetter,
        };
        accountService.update(obj, $scope.updateCompleted, $scope.updateError);
    }
    $scope.updateCompleted = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
    }
    $scope.updateError = function (response) {
        $scope.IsSuccess = response.IsSuccess;
        $scope.IsError = response.IsError;
        $scope.InValid = response.InValid;
        $scope.Message = alertsService.FormatMessage(response.ReturnMessage);
    }
});