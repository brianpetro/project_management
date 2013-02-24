# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

app = angular.module("CityAngular", ["ngResource"])
app.factory "City", ["$resource", ($resource) ->
	$resource("/cities/:id", {id: "@id"}, {update: {method: "PUT"}})
]
	
@CityCtrl = ["$scope", "City", ($scope, City) ->
	$scope.cities = City.query()
	
	$scope.addCity = ->
		city = City.save($scope.newCity)
		$scope.cities.push(city)
		$scope.newCity = {}
]
