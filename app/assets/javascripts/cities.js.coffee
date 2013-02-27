# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

app = angular.module("aehalo", ['rails'])

app.factory "Seal", ["railsResourceFactory", "$http", ($resource, $http) ->
  $resource url: "/cities/{{city_id}}/seals/{{id}}", name: 'seal'
]

@SealCtrl = ["$scope", "Seal", ($scope, Seal) ->
  $scope.city_id = get_city()

  $scope.seals = Seal.query(city_id: $scope.city_id)

  $scope.addSeal = ->
    $scope.newSeal.city_id = $scope.city_id
    seal = new Seal($scope.newSeal).create()
    $scope.newSeal = {}
]
