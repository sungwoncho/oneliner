'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', '$location', 'onelineFactory', 'flash', '$routeParams', function($scope, $location, onelineFactory, flash, $routeParams) {
    $scope.onelines = onelineFactory.query();

    $scope.search = function(keyword) {
      $scope.onelines = onelineFactory.query({keyword: keyword})
    };

    $scope.newOneline = function() {
      $location.path("/onelines/new")
    };

    $scope.cancel = function() {
      $location.path("/")
    };

    $scope.back = function() {
      $location.path("/")
    };

    $scope.view = function(onelineId) {
      $location.path("/onelines/" + onelineId)
    };

    $scope.save = function() {
      onelineFactory.save($scope.oneline, function(newOneline) {
        // On success, redirect to the oneline
        $location.path('/onelines/' + newOneline.id);
      }, function(response) {
        // On failure, display flash
        flash.error = response.data.error;
      });
    };

    $scope.delete = function() {
      $scope.oneline.$delete();
      $scope.back();
    }

    // For show
    if ($routeParams.onelineId) {
      onelineFactory.get({ onelineId: $routeParams.onelineId }, function(oneline) {
        $scope.oneline = oneline;
      })
    }

  }]);
