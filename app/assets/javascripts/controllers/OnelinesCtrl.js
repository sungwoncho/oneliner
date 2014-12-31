'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', '$location', 'onelineFactory', function($scope, $location, onelineFactory) {
    $scope.onelines = onelineFactory.query();

    $scope.search = function(keyword) {
      $scope.onelines = onelineFactory.query({keyword: keyword})
    };

    $scope.newOneline = function() {
      $location.path("/onelines/new")
    };

    $scope.cancel = function() {
      $location.path("/")
    }

    $scope.save = function() {
      onelineFactory.save($scope.oneline, function(newOneline) {
        $location.path('/onelines/' + newOneline.id);
      });
    }

  }]);
