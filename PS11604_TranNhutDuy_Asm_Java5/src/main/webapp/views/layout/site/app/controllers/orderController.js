appMain.controller('orderController', function ($scope, $rootScope, $location, $window, orderService, alertsService) {
    $scope.initController = function () {
        $scope.initObject();
    }
    $scope.initObject = function () {
        $scope.Id = 0;
        $scope.AutoCode = "";
        $scope.Phone = "";
    }

    //Shopping Cart
    $scope.initOrderCartController = function () {
        orderService.getCart($scope.getOrderCartCompleted, $scope.getError);
    }
    $scope.updateItemCart = function (obj) {
        orderService.updateItemCart(obj, $scope.updateItemCartCompleted, $scope.getError);
    }
    $scope.removeItemCart = function (obj) {
        orderService.removeItemCart(obj, $scope.removeItemCartCompleted, $scope.getError);
    }
    $scope.updateItemCartCompleted = function (response) {
        $rootScope.myCart = response.Data;
        $scope.Amount = response.Data.Amount;
        $scope.DiscountAmount = response.Data.DiscountAmount;
        $scope.OrderDetails = response.Data.ModelSM_OrderDetail;
    }
    $scope.removeItemCartCompleted = function (response) {
        $rootScope.myCart = response.Data;
        $scope.Amount = response.Data.Amount;
        $scope.DiscountAmount = response.Data.DiscountAmount;
        $scope.OrderDetails = response.Data.ModelSM_OrderDetail;
    }
    $scope.getOrderCartCompleted = function (response) {
        console.log(response.Data);
        $rootScope.myCart = response.Data;
        $scope.Amount = response.Data.Amount;
        $scope.DiscountAmount = response.Data.DiscountAmount;
        $scope.OrderDetails = response.Data.ModelSM_OrderDetail;
    }

    //Checkout
    $scope.initCheckoutController = function () {
        $scope.initCheckoutObject();
        orderService.getPaymentMethods($scope.getPaymentMethodsCompleted, $scope.getError);
        orderService.getProvinces($scope.getProvincesCompleted, $scope.getError);
        orderService.getCart($scope.getCartCompleted, $scope.getError);
    }
    $scope.initCheckoutObject = function () {
    }
    $scope.getCartCompleted = function (response) {
        $scope.CustomerId = response.Data.CustomerId;
        $scope.CustomerName = response.Data.CustomerName;
        $scope.CustomerPhone = response.Data.CustomerPhone;
        $scope.CustomerEmail = response.Data.CustomerEmail;
        $scope.CustomerAddress = response.Data.CustomerAddress;
        $scope.CustomerProvinceId = response.Data.CustomerProvinceId;
        $scope.CustomerProvinceName = response.Data.CustomerProvinceName;
        $scope.CustomerDistrictId = response.Data.CustomerDistrictId;
        $scope.CustomerDistrictName = response.Data.CustomerDistrictName;

        $scope.DeliveryId = response.Data.DeliveryId;
        $scope.DeliveryName = response.Data.DeliveryName;
        $scope.DeliveryPhone = response.Data.DeliveryPhone;
        $scope.DeliveryEmail = response.Data.DeliveryEmail;
        $scope.DeliveryAddress = response.Data.DeliveryAddress;
        $scope.DeliveryProvinceId = response.Data.DeliveryProvinceId;
        $scope.DeliveryProvinceName = response.Data.DeliveryProvinceName;
        $scope.DeliveryDistrictId = response.Data.DeliveryDistrictId;
        $scope.DeliveryDistrictName = response.Data.DeliveryDistrictName;

        $scope.Description = response.Data.Description;
        $scope.Amount = response.Data.Amount;
        $scope.TotalAmount = response.Data.TotalAmount;
        $scope.ShippingAmount = response.Data.ShippingAmount;
        $scope.DiscountAmount = response.Data.DiscountAmount;
        $scope.CouponAmount = response.Data.CouponAmount;

        $scope.OrderDetails = response.Data.ModelSM_OrderDetail;

        $scope.createShipping();
        if ($scope.CustomerProvinceId > 0)
        {
            $scope.getDistricts();
        }
    }
    $scope.checkout = function () {
        var obj = {
            CustomerId: $scope.CustomerId,
            CustomerName: $scope.CustomerName,
            CustomerPhone: $scope.CustomerPhone,
            CustomerEmail: $scope.CustomerEmail,
            CustomerAddress: $scope.CustomerAddress,
            CustomerProvinceId: $scope.CustomerProvinceId,
            CustomerProvinceName: $scope.CustomerProvinceName,
            CustomerDistrictId: $scope.CustomerDistrictId,
            CustomerDistrictName: $scope.CustomerDistrictName,

            DeliveryId: $scope.DeliveryId,
            DeliveryName: $scope.DeliveryName,
            DeliveryPhone: $scope.DeliveryPhone,
            DeliveryEmail: $scope.DeliveryEmail,
            DeliveryAddress: $scope.DeliveryAddress,
            DeliveryProvinceId: $scope.DeliveryProvinceId,
            DeliveryProvinceName: $scope.DeliveryProvinceName,
            DeliveryDistrictId: $scope.DeliveryDistrictId,
            DeliveryDistrictName: $scope.DeliveryDistrictName,

            PaymentMethodId: $scope.PaymentMethodId,
            ShippingRateId: $scope.ShippingRateId,

            Description: $scope.Description,
            Amount: $scope.Amount,
            TotalAmount: $scope.TotalAmount,
            ShippingAmount: $scope.ShippingAmount,
            DiscountAmount: $scope.DiscountAmount,
            CouponAmount: $scope.CouponAmount,
        };
        if ($scope.OrderDetails.length <= 0)
        {
            alert("Chưa có hàng để thanh toán.");
            return;
        }
        if ($scope.CustomerProvinceId <= 0) {
            alert("Vui lòng chọn Tỉnh/Thành Phố.");
            return;
        }
        if ($scope.CustomerDistrictId <= 0) {
            alert("Vui lòng chọn Quận/Huyện.");
            return;
        }
        obj.ModelSM_OrderDetail = $scope.OrderDetails;
        $("#loading-mask").show();
        orderService.checkout(obj, $scope.checkoutCompleted, $scope.checkoutError);
    }
    $scope.checkoutCompleted = function (response) {
        $window.location.href = response.Data;
    }
    $scope.checkoutError = function (response) {
        $scope.IsError = true;
        $scope.Message = response.Message;
        $("#loading-mask").hide();
    }
    $scope.changePaymentMethod = function (paymentMethodId) {
        $scope.PaymentMethodId = paymentMethodId;
    }
    $scope.getPaymentMethodsCompleted = function (response) {
        $scope.PaymentMethods = response.Records;
        if (response.Records.length > 0) {
            $scope.PaymentMethodId = response.Records[0].Id;
        }
    }
    $scope.createShipping = function () {
        var obj = new Object();
        if ($scope.IsOtherAddress) {
            obj.provinceId = $scope.DeliveryProvinceId;
            obj.districtId = $scope.DeliveryDistrictId;
        }
        else {
            obj.provinceId = $scope.CustomerProvinceId;
            obj.districtId = $scope.CustomerDistrictId;
        }
        orderService.createShipping(obj, $scope.createShippingCompleted, $scope.getError);
    }
    $scope.createShippingCompleted = function (response) {
        $scope.ShippingRates = response.Records;
        $scope.ShippingAmount = response.Data.ShippingAmount;
        $scope.TotalAmount = response.Data.TotalAmount;
        if (response.Records.length > 0) {
            $scope.ShippingRateId = response.Records[0].Id;
        }
    }
    $scope.updateShipping = function () {
        var obj = new Object();
        obj.ShippingRateId =$scope.ShippingRateId;
        if ($scope.IsOtherAddress) {
            obj.provinceId = $scope.DeliveryProvinceId;
            obj.districtId = $scope.DeliveryDistrictId;
        }
        else {
            obj.provinceId = $scope.CustomerProvinceId;
            obj.districtId = $scope.CustomerDistrictId;
        }
        orderService.updateShipping(obj, $scope.updateShippingCompleted, $scope.getError);
    }
    $scope.updateShippingCompleted = function (response) {
        $scope.ShippingAmount = response.Data.ShippingAmount;
        $scope.TotalAmount = response.Data.TotalAmount;
    }

    $scope.getProvincesCompleted = function (response) {
        var sources = response.Records;
        var first = { Id: 0, Name: "Vui lòng chọn tỉnh/thành phố" };
        sources.unshift(first);
        $scope.Provinces = sources;
        $scope.ProvinceDeliverys = sources;
    }
    $scope.changeAddress = function () {
        $scope.createShipping();
    }
    $scope.changeShippingRate = function () {
        $scope.updateShipping();
    }
    $scope.changeCustomerProvince = function () {
        $scope.CustomerDistrictId = 0;
        $scope.getDistricts();
        $scope.createShipping();
    }
    $scope.changeCustomerDistrict = function () {
        $scope.createShipping();
    }
    $scope.changeDeliveryProvince = function () {
        $scope.DeliveryDistrictId = 0;
        $scope.getDistrictDeliverys();
        $scope.createShipping();
    }
    $scope.changeCustomerDistrict = function () {
        $scope.createShipping();
    }

    $scope.getDistricts = function () {
        var obj = new Object();
        obj.provinceId = $scope.CustomerProvinceId;
        orderService.getDistricts(obj, $scope.getDistrictsCompleted, $scope.getError);
    }
    $scope.getDistrictDeliverys = function () {
        var obj = new Object();
        obj.provinceId = $scope.DeliveryProvinceId;
        orderService.getDistricts(obj, $scope.getDistrictDeliverysCompleted, $scope.getError);
    }
    $scope.getDistrictsCompleted = function (response) {
        $scope.Districts = response.Records;
        if ($scope.Districts.length > 0) {
            var first = { Id: 0, Name: "Vui lòng chọn quận/huyện" };
            $scope.Districts.unshift(first);
        }
    }
    $scope.getDistrictDeliverysCompleted = function (response) {
        $scope.DistrictDeliverys = response.Records;
        if ($scope.DistrictDeliverys.length > 0) {
            var first = { Id: 0, Name: "Vui lòng chọn quận/huyện" };
            $scope.DistrictDeliverys.unshift(first);
        }
    }

    //Search Order
    $scope.searchOrder = function (response) {
        var obj = new Object();
        obj.AutoCode = $scope.AutoCode;
        obj.CustomerPhone = $scope.Phone;
        orderService.searchOrder(obj, $scope.searchOrderCompleted, $scope.getError);
    }
    $scope.searchOrderCompleted = function (response) {
        $scope.Id = response.Data.Id;
        $scope.AutoCode = response.Data.AutoCode;
        $scope.CustomerId = response.Data.CustomerId;
        $scope.CustomerDistrictId = response.Data.CustomerDistrictId;
        $scope.CustomerDistrictName = response.Data.CustomerDistrictName;
        $scope.CustomerProvinceId = response.Data.CustomerProvinceId;
        $scope.CustomerProvinceName = response.Data.CustomerProvinceName;
        $scope.DeliveryProvinceId = response.Data.DeliveryProvinceId;
        $scope.DeliveryProvinceName = response.Data.DeliveryProvinceName;
        $scope.DeliveryDistrictId = response.Data.DeliveryDistrictId;
        $scope.DeliveryDistrictName = response.Data.DeliveryDistrictName;
        $scope.DeliveryEmail = response.Data.DeliveryEmail;
        $scope.DeliveryName = response.Data.DeliveryName;

        $scope.Inactive = response.Data.Inactive;
        $scope.CreatedDate = response.Data.CreatedDate;
        $scope.CustomerAddress = response.Data.CustomerAddress;
        $scope.CustomerEmail = response.Data.CustomerEmail;
        $scope.CustomerName = response.Data.CustomerName;

        $scope.CustomerPhone = response.Data.CustomerPhone;
        $scope.DeliveryPhone = response.Data.DeliveryPhone;
        $scope.DeliveryAddress = response.Data.DeliveryAddress;
        $scope.Description = response.Data.Description;

        $scope.BillNo = response.Data.BillNo;
        $scope.Reason = response.Data.Reason;
        $scope.PaymentMethodId = response.Data.PaymentMethodId;
        $scope.PaymentMethodName = response.Data.PaymentMethodName;
        $scope.ShippingRateName = response.Data.ShippingRateName;
        $scope.ShipmentStateName = response.Data.ShipmentStateName;

        $scope.TotalAmount = response.Data.TotalAmount;
        $scope.Amount = response.Data.Amount;
        $scope.DiscountAmount = response.Data.DiscountAmount;
        $scope.ShippingAmount = response.Data.ShippingAmount;
        $scope.CODAmount = response.Data.TotalAmount;

        $scope.OrderDetails = response.Data.ModelSM_OrderDetail;
    }

    $scope.getError = function (response) {
        $scope.Id = -1;
    }
});