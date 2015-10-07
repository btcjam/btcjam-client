app = angular.module("MultiPaymentApp", []);

app.factory("MultiPaymentsFactory", function($http){
	var factory = {};
	factory.getMultiPayments = function(){
		return $http.get('/authenticated_calls/multi_payments').success(function(data){
			return data;
		});
	};
	
	return factory;
}).controller("MultiPaymentsController", function ($scope, $http, MultiPaymentsFactory) {

	$scope.pay = function(id){
		
		$http.get('/multi_payment_calls?multi_payment_id=' + id).success(function(data){
			console.log(data);
			
		});
		$scope.refresh();
	}

	$scope.refresh = function(){
		MultiPaymentsFactory.getMultiPayments().then(function(response){
		$scope.multi_payments = response.data;
		});
	};

	$scope.refresh();
	
});