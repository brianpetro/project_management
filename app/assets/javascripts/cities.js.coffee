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

app.factory "Seal", ["$resource", ($resource) ->
	$resource("/cities/:city_id/seals/:id", {city_id: "@city_id", id: "@id"}, {update: {method: "PUT"}})
]

@SealCtrl = ["$scope", "Seal", ($scope, Seal) ->
	$scope.seals = Seal.query()
	
	$scope.addSeal = ->
		seal = Seal.save($scope.newSeal)
		$scope.seals.push(seal)
		$scope.newSeal = {}
]
