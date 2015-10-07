// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-route
//= require_tree .

$(function() {
  $('[data-explore]').click(function() {
    var link = $(this);
    link.button('loading');
    $('#display-json').load(link.attr('href'), function() {
      link.button('reset');
    });
    return false;
  });
});

app = angular.module("BTCJamClient", ['ngRoute']);

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